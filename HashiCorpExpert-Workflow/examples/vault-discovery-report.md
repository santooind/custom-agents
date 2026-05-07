# Vault Discovery Report

## Executive Summary

Sample Application appears to be a Java Spring application with Docker and Kubernetes deployment indicators. Secret handling is currently mixed across environment variables, Spring configuration, Kubernetes Secret references, and CI/CD secret injection.

Recommended primary pattern: **Kubernetes Auth with Vault Agent Injector**.

Migration complexity: **Medium**, score **54/100**.

No secret values are included in this sample.

## Repository Details

| Field | Value |
|---|---|
| Application | Sample Application |
| Repository Type | Application repository |
| Monorepo | No |
| Partial Repository | Unknown |

## Technology Stack

| Category | Detected |
|---|---|
| Languages | Java, YAML |
| Frameworks | Spring Boot, Hibernate |
| Runtime | JVM |
| Build Tools | Maven |
| Package Managers | Maven |

## Deployment Model

Detected models:

- Kubernetes
- Docker
- CI/CD pipeline

Confidence: 0.82

## Secret Inventory

| ID | Type | Location Type | Sensitivity | Vault Candidate |
|---|---|---|---|---|
| secret-001 | database credential | application config | High | Dynamic database secrets or KV v2 |
| secret-002 | API key | environment variable | High | KV v2 rendered by Agent |
| secret-003 | TLS material | Kubernetes Secret | Critical | Vault PKI or KV v2 |

## Current Secret Handling

- Spring configuration reads secret-like keys from application config.
- Kubernetes manifests reference Secrets through environment variables.
- CI/CD uses platform secret references.

## Risk Findings

| Severity | Finding | Impact |
|---|---|---|
| High | Config file secret keys | Requires migration to Vault-backed runtime injection. |
| Medium | Kubernetes Secret references | Existing manifests require Vault integration changes. |
| Medium | Datasource pooling | Rotation must account for connection pool behavior. |

## Code Change Impact Matrix

| Area | File/Component | Current Pattern | Recommended Change | Complexity | Risk | Confidence |
|---|---|---|---|---|---|---|
| config-only | `src/main/resources/application.yml` | Spring property containing secret-like datasource key | Replace value source with Vault Agent rendered config or injected file reference | Medium | Medium | 0.85 |
| infrastructure | `deploy/app.yaml` | Kubernetes `secretKeyRef` environment injection | Replace Secret reference with Vault Agent Injector template or CSI mount | Medium | Medium | 0.82 |
| database | `DataSource configuration` | Startup datasource pool initialization | Test dynamic database credential rotation and pool refresh behavior | High | High | 0.68 |
| cicd | `.github/workflows/*` | Platform secret references likely used during deploy | Move Vault access to OIDC/JWT auth and avoid long-lived Vault tokens | Medium | Medium | 0.60 |

Impact summary:

- Likely files impacted: `3-6`
- Likely services/modules impacted: `1`
- Startup/runtime impact likelihood: `Medium`
- Refactoring likelihood: `Medium`
- Backward compatibility concerns: existing environment variable names, datasource startup timing, rollback to Kubernetes Secret source

Migration inventory:

- Config-only changes: Spring application configuration keys.
- Code-level changes: possible datasource or config binding changes if rendered files cannot preserve current keys.
- Infrastructure changes: Vault Kubernetes Auth, policies, injector annotations.
- CI/CD changes: OIDC/JWT authentication for deployment pipeline.
- Deployment pipeline changes: Helm or manifest updates.

## Recommended Vault Pattern

Primary pattern: **Kubernetes Auth with Vault Agent Injector**

Supporting patterns:

- Dynamic database secrets where database rotation is operationally approved.
- KV v2 for static application API keys.
- OIDC/JWT for CI/CD access to Vault.

Rationale:

- Kubernetes manifests were detected.
- Environment-based config can be supplied through injected files or templates.
- This minimizes application code changes compared with SDK integration.

Rejected alternatives:

| Pattern | Reason |
|---|---|
| SDK integration | More code and runtime lease handling than required for current evidence. |
| AppRole | Less appropriate when Kubernetes service account identity is available. |
| Terraform-managed secrets | Static secret payloads should not enter Terraform state. |

## Required Code Changes

- Likely minimal if the app can consume existing config keys from injected files or environment-compatible templates.
- Add reload or restart guidance if secrets are startup-loaded.

## Required Infrastructure Changes

- Enable Vault Kubernetes Auth for the namespace.
- Add Vault role mapped to service account.
- Add injector annotations or chart values.
- Create Vault policies for required paths.

## CI/CD Impact

- Replace long-lived pipeline secret access with OIDC/JWT where possible.
- Ensure deployment pipeline can apply injector annotations without exposing values.

## Operational Risks

- Secret rotation may require application restart if config is loaded only at startup.
- Datasource pool must be tested for credential rotation.
- Logs must not print resolved config values.

## Effort Estimation

| Dimension | Estimate |
|---|---|
| Development Effort | Medium |
| Testing Effort | Medium |
| Deployment Complexity | Medium |
| Rollback Complexity | Medium |
| Runtime Risk | Medium |
| Secret Rotation Complexity | High |

## Suggested Migration Sequence

1. Preserve current config keys and introduce Vault-rendered equivalents in a non-production environment.
2. Migrate low-risk static API keys to KV v2 using injected templates.
3. Update CI/CD to use OIDC/JWT for Vault authentication.
4. Add Kubernetes Auth and injector annotations to deployment manifests or Helm values.
5. Validate datasource rotation and connection pool behavior.
6. Migrate high-dependency database and certificate flows after rollback is proven.

## Potential Breaking Areas

| Area | Likelihood | Risk | Test Recommendation |
|---|---|---|---|
| Startup bean initialization | Medium | Medium | Start application with Vault-rendered config unavailable, delayed, and valid. |
| Connection pool startup | High | High | Rotate database credentials and verify pool eviction/reconnect behavior. |
| Vault availability dependency | Medium | High | Test pod startup when Vault is unreachable and during Vault restart. |
| Kubernetes auth failures | Medium | Medium | Validate service account, namespace, audience, and Vault role binding. |
| Certificate trust chain | Low | High | Verify truststore loading and certificate chain validation if TLS material migrates. |

## Open Questions

- Confirm Kubernetes namespace and service account ownership.
- Confirm whether dynamic database credentials are allowed.
- Confirm rotation windows and rollback expectations.

## Migration Complexity Score

Score: **54/100**

Category: **Medium**

## Evidence Appendix

| ID | Finding | File | Line | Evidence Type | Excerpt |
|---|---|---|---|---|---|
| ev-001 | config-file-secret-key | src/main/resources/application.yml | 12 | config | `password: [REDACTED]` |
| ev-002 | kubernetes-secret-reference | deploy/app.yaml | 38 | manifest | `secretKeyRef: name: [REDACTED]` |
