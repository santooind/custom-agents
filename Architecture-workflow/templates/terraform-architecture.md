# <Solution Name> Terraform Architecture

## Status

- Status: `Draft`
- Owner:
- Last Updated:

## Repository And Module Strategy

| Area | Decision |
|---|---|
| Repository layout |  |
| Module boundaries |  |
| Environment model |  |
| Workspace model |  |
| Provider strategy |  |

## State Architecture

| State Scope | Backend | Encryption | Access Control | Retention |
|---|---|---|---|---|
|  |  |  |  |  |

## Pipeline

| Stage | Tool | Gate | Evidence |
|---|---|---|---|
| fmt | Terraform |  |  |
| validate | Terraform |  |  |
| security scan |  |  |  |
| plan | Terraform |  |  |
| approval | ServiceNow / VCS |  |  |
| apply | Terraform |  |  |
| callback | ServiceNow |  |  |

## ServiceNow Trigger Contract

| Field | Source | Required | Notes |
|---|---|---|---|
| request_id | ServiceNow | Yes | Correlation ID. |
| module | ServiceNow | Yes | Approved module key, not arbitrary path. |
| environment | ServiceNow | Yes | Must map to allowed workspace. |
| inputs | ServiceNow | Yes | Non-secret inputs only unless approved secure runtime path exists. |

## Vault Boundary

| Allowed With Terraform | Disallowed With Terraform |
|---|---|
| Vault mounts | Static secret payloads |
| Vault policies | Long-lived passwords |
| Vault auth methods | Secret outputs |
| Vault namespaces | Secret data sources that persist in state |
| Non-sensitive metadata | Values printed in plan/apply logs |

## Drift And Rollback

| Scenario | Detection | Response |
|---|---|---|
|  |  |  |

## Open Questions

| ID | Question | Why It Matters | Blocks Freeze |
|---|---|---|---|
| Q-TF-001 |  |  | Yes |
