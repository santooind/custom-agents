# <App Name> Enterprise Vault Discovery

## Status

- Status: `Draft | Needs Answers | Ready For Design | Ready For Implementation | Ready For Release`
- Owner:
- Last Updated:
- Target Codebase:
- Mode:

## Executive Summary

<Metadata-only summary of current secret handling, target Vault direction, risks, blockers, and recommended next step.>

## Source Raw Input

```text
<Paste raw input here. Do not include live secret values.>
```

## Codebase Evidence

| Area | Evidence | Files / Paths | Confidence |
|---|---|---|---|
| Languages |  |  |  |
| Frameworks |  |  |  |
| Runtime platform |  |  |  |
| Deployment model |  |  |  |
| CI/CD |  |  |  |
| IaC |  |  |  |

## Current Secret Handling

| Source | Usage | Evidence | Risk | Notes |
|---|---|---|---|---|
| Environment variables |  |  |  |  |
| Config files |  |  |  |  |
| CI/CD variables |  |  |  |  |
| Kubernetes / deployment secrets |  |  |  |  |
| Terraform / IaC |  |  |  |  |
| Application code |  |  |  |  |

## Secret Inventory Metadata

Do not record secret values.

| ID | Secret Type | Consumer | Environment | Current Source | Target Vault Mount / Path | Rotation Need | Owner | Status |
|---|---|---|---|---|---|---|---|---|
| VSEC-001 |  |  |  |  |  |  |  | Open |

## Recommended Vault Pattern

| Decision | Value | Source / Evidence | Status |
|---|---|---|---|
| Primary pattern |  |  | Open |
| Auth method |  |  | Open |
| Secret engine |  |  | Open |
| Runtime consumption model |  |  | Open |
| Rotation model |  |  | Open |
| Audit model |  |  | Open |

## Pattern Decision Matrix

| Pattern | Fit | Why Preferred / Not Preferred | Required Changes | Residual Risk |
|---|---|---|---|---|
| Vault Agent / Injector |  |  |  |  |
| Vault CSI Provider |  |  |  |  |
| Platform identity auth |  |  |  |  |
| CI/CD OIDC/JWT auth |  |  |  |  |
| Application SDK/API |  |  |  |  |
| Controlled operator workflow |  |  |  |  |

## Risk Findings

| ID | Severity | Finding | Evidence | Recommendation | Blocks Implementation | Blocks Release |
|---|---|---|---|---|---|---|
| RISK-001 |  |  |  |  | Yes | Yes |

## Open Questions

| ID | Category | Question | Why It Matters | Blocks Implementation | Blocks Release | Owner |
|---|---|---|---|---|---|---|
| Q-001 | Decision Required |  |  | Yes | Yes |  |

## Discovery Checklist

- [ ] Tech stack identified.
- [ ] Current secret handling mapped with evidence.
- [ ] Secret values redacted.
- [ ] Secret inventory is metadata-only.
- [ ] Candidate Vault patterns compared.
- [ ] Security-impacting unknowns are marked as blockers.
