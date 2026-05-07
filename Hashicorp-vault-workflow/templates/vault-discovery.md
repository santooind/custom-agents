# <App Name> Vault Discovery Document

## Status

- Status: `Draft`
- Owner:
- Last Updated:
- Target Codebase:

## Executive Summary

## Source Raw Input

```text

```

## Codebase Evidence

| Area | Evidence | Files / Paths | Confidence |
|---|---|---|---|
| Languages |  |  |  |
| Frameworks |  |  |  |
| Package managers |  |  |  |
| Runtime platform |  |  |  |
| Deployment model |  |  |  |
| CI/CD |  |  |  |
| IaC |  |  |  |

## Current Secret Handling

| Secret Source | Usage | Evidence | Risk | Notes |
|---|---|---|---|---|
| Environment variables |  |  |  |  |
| Config files |  |  |  |  |
| CI/CD variables |  |  |  |  |
| Kubernetes / deployment secrets |  |  |  |  |
| Terraform / IaC |  |  |  |  |
| Application code |  |  |  |  |

## Secret Inventory Metadata

Do not record secret values.

| Secret ID | Type | Consumer | Environment | Current Source | Target Vault Path | Rotation Need | Owner |
|---|---|---|---|---|---|---|---|
| SEC-001 |  |  |  |  |  |  |  |

## Risk Findings

| ID | Severity | Finding | Evidence | Recommendation |
|---|---|---|---|---|
| RISK-001 |  |  |  |  |

## Recommended Vault Pattern

| Decision | Value |
|---|---|
| Primary pattern |  |
| Fallback pattern |  |
| Auth method |  |
| Secret engine |  |
| Runtime consumption model |  |
| Rotation model |  |
| Audit model |  |

## Pattern Rationale

## Pattern Decision Matrix

| Pattern | Fit | Why Preferred / Not Preferred | Required Changes | Residual Risk |
|---|---|---|---|---|
| Vault Agent Injector |  |  |  |  |
| Vault CSI Provider |  |  |  |  |
| Vault Agent sidecar / daemon |  |  |  |  |
| Platform identity auth |  |  |  |  |
| CI/CD OIDC/JWT auth |  |  |  |  |
| Application SDK/API |  |  |  |  |

## Vault Design Inputs

| Input | Decision / Value | Source / Evidence | Open Question |
|---|---|---|---|
| Vault namespace |  |  |  |
| Mount path |  |  |  |
| Secret engine type |  |  |  |
| KV path convention |  |  |  |
| Auth method |  |  |  |
| Vault role name |  |  |  |
| Policy requirements |  |  |  |
| Token TTL |  |  |  |
| Renewal behavior |  |  |  |
| Rotation ownership |  |  |  |
| Break-glass access |  |  |  |
| Audit expectations |  |  |  |
| Environment separation |  |  |  |

## Required Code And Config Changes

| ID | Classification | Area | Change | Files / Paths | Owner |
|---|---|---|---|---|---|
| CHG-001 | Mandatory | Application config |  |  |  |

## Implementation Phases

| Phase | Scope | Exit Criteria |
|---|---|---|
| Phase 1 - Prepare |  |  |
| Phase 2 - Integrate |  |  |
| Phase 3 - Validate |  |  |
| Phase 4 - Rollout |  |  |

## Security Controls

## Operational Model

## Test Strategy

## Assumptions

| ID | Assumption | Validation Needed |
|---|---|---|
| ASM-001 |  |  |

## Open Questions

| ID | Question | Why It Matters | Blocks Implementation |
|---|---|---|---|
| Q-001 |  |  | Yes |

## Discovery Checklist

- [ ] Tech stack identified.
- [ ] Current secret handling mapped.
- [ ] Secret values redacted.
- [ ] Vault pattern selected with rationale.
- [ ] Code and config changes listed.
- [ ] Risks and open questions captured.
