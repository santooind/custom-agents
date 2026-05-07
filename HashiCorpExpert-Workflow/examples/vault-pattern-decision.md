# Vault Pattern Decision

## Executive Decision

Rank 1 recommendation: **Kubernetes Auth + Vault Agent Injector + KV v2**

Rank 2 fallback: **Kubernetes Auth + Vault CSI + KV v2**

Decision confidence: **0.82**

This decision is based on the sample Vault discovery report. No secret values are included.

## Input Reports Used

- `reports/vault-discovery-report.json`
- `reports/vault-discovery-report.md`

## Decision Summary

The application appears to run on Kubernetes and currently uses configuration and Kubernetes Secret based injection. The lowest-risk target pattern is Vault Agent Injector because it preserves the existing configuration consumption model while moving secret material to Vault-backed runtime delivery.

## Ranked Pattern Recommendation

| Rank | Pattern | Decision | Confidence |
|---|---|---|---|
| 1 | Kubernetes Auth + Vault Agent Injector + KV v2 | Recommended | 0.82 |
| 2 | Kubernetes Auth + Vault CSI + KV v2 | Viable fallback | 0.74 |
| 3 | External Secrets Operator + KV v2 | Conditional | 0.66 |
| 4 | SDK integration | Not recommended for initial migration | 0.58 |
| 5 | Direct Vault API integration | Not recommended for initial migration | 0.52 |

## Rank 1 Target Pattern

Delivery Pattern: **Vault Agent Injector**

Auth Method: **Kubernetes Auth**

Secret Engine: **KV v2, Dynamic Database Secrets optional in a later phase**

Composed Pattern: **Kubernetes Auth + Vault Agent Injector + KV v2**

Why:

- Kubernetes deployment evidence exists.
- Existing config can likely be preserved through rendered templates.
- Application code changes appear avoidable for the initial migration.
- Rollback can preserve prior Kubernetes Secret or config source during phased rollout.

Expected changes:

- Add Vault Kubernetes Auth role.
- Add Vault policies for app paths.
- Add injector annotations through manifest or Helm values.
- Render config values into the application-compatible location.
- Validate startup and logging redaction.

## Rank 2 Fallback Pattern

Delivery Pattern: **Vault CSI**

Auth Method: **Kubernetes Auth**

Secret Engine: **KV v2, Dynamic Database Secrets optional in a later phase**

Composed Pattern: **Kubernetes Auth + Vault CSI + KV v2**

Why it is second:

- Also fits Kubernetes workloads.
- Provides file-mounted secret delivery.
- May be preferable where injection annotations are not allowed or CSI is the platform standard.

Tradeoffs:

- Requires CSI driver platform readiness.
- Secret refresh and mount behavior must be tested.
- Application must be able to read mounted files or compatible projected paths.

## Pattern Scorecard

| Rank | Pattern | Fit | Code Change | Runtime Risk | Rotation | Ops Complexity | Confidence |
|---|---|---:|---:|---:|---:|---:|---:|
| 1 | Kubernetes Auth + Vault Agent Injector + KV v2 | 5 | 4 | 4 | 3 | 3 | 0.82 |
| 2 | Kubernetes Auth + Vault CSI + KV v2 | 4 | 3 | 4 | 3 | 3 | 0.74 |
| 3 | External Secrets Operator + KV v2 | 4 | 4 | 3 | 2 | 3 | 0.66 |
| 4 | SDK integration | 3 | 2 | 3 | 5 | 2 | 0.58 |
| 5 | Direct Vault API integration | 3 | 1 | 2 | 5 | 1 | 0.52 |

## Evidence-Based Rationale

- Discovery identified Kubernetes deployment indicators.
- Discovery identified secret-like Spring configuration keys.
- Discovery identified Kubernetes Secret references.
- Code impact analysis estimated mostly configuration and manifest changes for the initial migration.
- Runtime-sensitive database rotation should be handled later after pool behavior is tested.

## Code And Configuration Impact

| Area | File/Component | Impact | Confidence |
|---|---|---|---|
| config-only | `src/main/resources/application.yml` | Preserve keys and source values from Vault-rendered config | 0.85 |
| infrastructure | `deploy/app.yaml` | Add Vault injection annotations or CSI volume/mount | 0.82 |
| database | datasource configuration | Test rotation and pool refresh before dynamic credentials | 0.68 |

## Infrastructure Impact

- Configure Vault Kubernetes Auth.
- Create app-specific Vault policy.
- Add service-account-to-role mapping.
- Add injector annotations or CSI resources.
- Define KV path and ownership model.

## CI/CD Impact

- Deployment pipeline must apply manifest or Helm changes.
- CI/CD Vault access should use OIDC/JWT if pipeline reads or writes Vault metadata.
- Long-lived Vault tokens should not be stored as pipeline secrets.

## Runtime And Operational Risks

- Vault availability can affect pod startup.
- Kubernetes Auth role mismatch can block injection.
- Rendered config timing can affect startup.
- Database rotation may require restart or pool eviction.

## Migration Sequence

1. Create Vault paths, policy, and Kubernetes Auth role in non-production.
2. Render non-critical static config values using Vault Agent Injector.
3. Add manifest or Helm injection changes behind environment-specific rollout controls.
4. Validate application startup, redaction, and rollback.
5. Migrate database credentials after connection pool rotation tests.
6. Evaluate Dynamic Database Secrets as a later enhancement.

## Rejected Patterns

| Pattern | Reason |
|---|---|
| SDK integration | Adds code changes, lease handling, cache behavior, and failure-mode ownership not required for initial config migration. |
| Direct Vault API integration | Higher operational burden than Agent-based delivery and requires custom token renewal, retries, and outage behavior. |
| AppRole | Better fit for VM or bare-metal workloads than Kubernetes service-account workloads. |
| Terraform-managed static secrets | Long-lived secret payloads must not be stored in Terraform state. |

## Assumptions

- Kubernetes or OpenShift is the actual runtime platform.
- Application can consume config from rendered files or compatible environment mappings.
- Vault Kubernetes Auth is available or can be enabled.

## Open Decisions

- Confirm whether platform standard is Agent Injector, CSI, or External Secrets Operator.
- Confirm namespace, service account, and Vault auth mount ownership.
- Confirm whether database dynamic secrets are in scope for the first migration wave.

## Final Recommendation

Use **Kubernetes Auth + Vault Agent Injector + KV v2** for the initial migration. Use **Kubernetes Auth + Vault CSI + KV v2** as the fallback if Injector is not the platform standard or annotation-based injection is not permitted.
