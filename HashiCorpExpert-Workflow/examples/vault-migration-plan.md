# Vault Migration Plan

## 1. Executive Summary

Selected pattern: **Kubernetes Auth + Vault Agent Injector + KV v2**.

Expected change size: **Medium**.

Risk level: **Medium**.

This sample plan migrates configuration-backed application secrets to Vault-backed runtime injection while preserving existing application configuration keys where possible. Runtime-sensitive database credential rotation is deferred until connection pool behavior is validated.

No secret values are included.

## 2. Inputs Reviewed

| Input | Status | Notes |
|---|---|---|
| `reports/vault-discovery-report.md` | Reviewed | Discovery narrative reviewed. |
| `reports/vault-discovery-report.json` | Reviewed | Structured findings and impact matrix reviewed. |
| `reports/vault-pattern-decision.md` | Reviewed | Rank 1 pattern used as target pattern. |

## 3. Selected Vault Pattern

- Selected pattern: Kubernetes Auth + Vault Agent Injector + KV v2
- Delivery pattern: Vault Agent Injector
- Auth method: Kubernetes Auth
- Secret engine: KV v2, Dynamic Database Secrets optional in a later phase
- Why selected: Kubernetes deployment evidence exists and the application can likely preserve existing config keys through rendered templates.
- Rejected alternatives: SDK integration, direct Vault API integration, AppRole for Kubernetes workloads, Terraform-managed static secrets.
- Prerequisites: Vault Kubernetes Auth enabled, service account confirmed, Vault policy approved, Vault KV path standard confirmed.

## 4. Migration Scope

In scope:

- Application configuration secret migration.
- Kubernetes deployment integration with Vault Agent Injector.
- Vault policy and Kubernetes Auth role planning.
- CI/CD deployment validation.
- Rollback and minimum test plan.

Out of scope:

- Application source code modification until approved.
- Production secret value migration.
- Dynamic database credentials in the first phase unless explicitly approved.

Assumptions:

- Kubernetes is the runtime platform.
- Existing configuration keys can be preserved.
- Target Vault paths are proposed and require owner confirmation.

Dependencies:

- Vault platform team approval.
- Application owner validation.
- Kubernetes namespace and service account confirmation.
- CI/CD owner support.

## 5. Secret Mapping Plan

| Current Secret | Current Location | Usage | Target Vault Path | Target Key | Owner | Rotation Need | Notes |
|---|---|---|---|---|---|---|---|
| database password | `src/main/resources/application.yml` | Datasource authentication | `kv/<bu>/<app>/<env>/database` | `password` | Application and database owners | High | Proposed path; value not included. |
| API key | environment or Kubernetes Secret reference | External service authentication | `kv/<bu>/<app>/<env>/external-api` | `api_key` | Application owner | Medium | Preserve current env/config key name where possible. |
| TLS private key | Kubernetes Secret or mounted certificate | mTLS or TLS identity | `kv/<bu>/<app>/<env>/tls` or `pki/issue/<role>` | `private_key` | Platform/security owner | High | Evaluate Vault PKI separately if certificate lifecycle is in scope. |

## 6. Code Change Plan

| File/Component | Current Pattern | Required Change | Complexity | Risk | Confidence |
|---|---|---|---|---|---|
| `src/main/resources/application.yml` | Spring configuration contains secret-like keys | Preserve keys and source values from Vault Agent rendered config | Medium | Medium | 0.85 |
| `deploy/app.yaml` | Kubernetes `secretKeyRef` environment injection | Add Vault Agent Injector annotations and template configuration | Medium | Medium | 0.82 |
| datasource configuration | Startup datasource pool initialization | Validate pool behavior before dynamic database credentials | High | High | 0.68 |
| `.github/workflows/*` | Probable platform secret references | Add deployment validation and remove unneeded secret references after cutover | Medium | Medium | 0.60 |

## 7. Infrastructure Change Plan

- Create or confirm Vault KV path.
- Create Vault policy for application read access.
- Configure Kubernetes Auth role bound to namespace and service account.
- Add Vault Agent Injector annotations to Deployment or Helm templates.
- Confirm network path from workload namespace to Vault.
- Confirm whether Terraform manages Vault metadata only; do not manage static secret payloads in Terraform state.

## 8. CI/CD Change Plan

- Keep deployment variables that do not contain secret values.
- Remove obsolete secret variables only after successful cutover and rollback window.
- Add deployment validation that confirms Vault injection annotations are present.
- Use OIDC/JWT for CI/CD Vault access if pipeline must read or write Vault metadata.
- Ensure logs mask all secret-like values.

## 9. Implementation Sequence

1. Prepare Vault path and policy. Owner: Vault platform team. Rollback checkpoint: no application impact.
2. Configure Kubernetes Auth method and app role. Owner: Vault and platform teams. Rollback checkpoint: remove or disable role mapping.
3. Update deployment/config in lower environment. Owner: platform/app team. Rollback checkpoint: revert manifest or Helm values.
4. Update code only if rendered config cannot preserve current keys. Owner: application team. Rollback checkpoint: revert branch changes.
5. Run local/unit tests. Owner: application team. Rollback checkpoint: block deployment if config loading fails.
6. Deploy to lower environment. Owner: release team. Rollback checkpoint: restore prior Kubernetes Secret/config source.
7. Validate runtime secret access. Owner: app/platform team. Rollback checkpoint: disable injection and redeploy previous manifest.
8. Promote to higher environments after sign-off. Owner: release manager. Rollback checkpoint: execute production rollback plan.

## 10. Minimum Test Plan

- Unit tests: validate config binding paths still resolve.
- Config loading tests: start with Vault-rendered config present and missing.
- Startup tests: verify application starts when Vault injection succeeds.
- DB connectivity tests: validate datasource connection and pool behavior.
- API smoke tests: validate main authenticated application flows.
- Failure scenario tests: test Vault unavailable, auth role mismatch, missing path, and denied policy.
- Rollback validation: redeploy with previous secret source and verify recovery.
- Redaction/logging tests: ensure secret-like values are not logged.

## 11. Rollback Plan

- Revert deployment manifest or Helm values to the previous secret source.
- Keep prior Kubernetes Secret or external secret source available through the rollback window.
- Disable Vault Agent Injector annotations for the workload.
- Redeploy previous version or previous manifest.
- Verify pod startup, health checks, DB connectivity, and API smoke tests.
- Remove failed Vault role/policy changes only after recovery is confirmed.

## 12. Cutover Plan

- Lower environment rollout: deploy Vault integration in dev/test first.
- Production rollout: use controlled release window with rollback owner available.
- Monitoring: pod startup, Vault auth failures, application errors, DB connectivity, latency, and logs.
- Success criteria: application starts, retrieves all required secrets, passes smoke tests, and logs remain redacted.
- Failure criteria: Vault auth failure, missing secret path, startup failure, DB connection failure, or secret exposure in logs.
- Abort criteria: unresolved production owner decision, missing rollback source, or failed lower environment test.

## 13. Risk Register

| Risk | Impact | Likelihood | Mitigation | Owner |
|---|---|---|---|---|
| Vault injection fails at startup | High | Medium | Validate service account, Vault role, path, and policy in lower environment. | Platform team |
| Datasource pool does not tolerate rotation | High | Medium | Defer dynamic DB credentials until rotation test passes. | Application/database owners |
| Secret values exposed in logs | Critical | Low | Add redaction tests and review startup logging. | Application/security owners |
| Rollback source removed too early | High | Medium | Keep previous secret source through rollback window. | Release manager |

## 14. Open Questions

| Question | Why It Matters | Suggested Owner |
|---|---|---|
| What is the approved Vault path standard? | Secret mapping cannot be finalized without path ownership. | Vault platform owner |
| Which service account will authenticate to Vault? | Kubernetes Auth role binding depends on it. | Platform owner |
| Are dynamic database secrets in phase 1? | Determines DB testing and rollout complexity. | Database/application owners |

## 15. Implementation Readiness

Classification: **Ready with assumptions**.

Rationale: The selected pattern and likely change areas are clear enough for lower-environment planning, but Vault path ownership, service account binding, and dynamic database scope require confirmation before production implementation.

Minimum decisions required to reach Ready:

- Confirm target Vault path standard.
- Confirm namespace and service account.
- Confirm rollback window and owner.
- Confirm whether database dynamic secrets are in phase 1.

