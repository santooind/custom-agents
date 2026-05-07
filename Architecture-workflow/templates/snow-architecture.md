# <Solution Name> ServiceNow Architecture

## Status

- Status: `Draft`
- Owner:
- Last Updated:

## SNOW Scope

| Area | Decision |
|---|---|
| Product/Module |  |
| Catalog Item / Record Producer |  |
| Flow Designer / Workflow |  |
| IntegrationHub |  |
| MID Server |  |
| CMDB/CSDM |  |

## Request And Approval Workflow

| State | Actor | Action | System Update | Audit Evidence |
|---|---|---|---|---|
| Submitted |  |  |  |  |
| Approved |  |  |  |  |
| Fulfillment Started |  |  |  |  |
| Completed |  |  |  |  |

## IntegrationHub And Connections

| Integration | Connection Alias | Credential Alias | Auth Method | Network Path |
|---|---|---|---|---|
| Terraform |  |  |  |  |
| Vault |  |  |  |  |

## Sensitive Data Handling

| Risk Area | Control |
|---|---|
| Catalog variables | Do not collect static secret payloads unless variable handling is approved and masked; prefer Vault-native write path. |
| Flow logs | Do not log secret payloads. |
| Work notes/comments | Do not paste secrets. |
| Attachments/import sets | Do not store secrets. |
| CMDB | Store metadata only, never secret values. |

## CMDB And Operational Records

| Record Type | Purpose | Owner | Update Trigger |
|---|---|---|---|
|  |  |  |  |

## Failure Handling

| Failure | Detection | Retry | Escalation | User Message |
|---|---|---|---|---|
| Terraform run failure |  |  |  |  |
| Vault write/read failure |  |  |  |  |

## Open Questions

| ID | Question | Why It Matters | Blocks Freeze |
|---|---|---|---|
| Q-SNOW-001 |  |  | Yes |
