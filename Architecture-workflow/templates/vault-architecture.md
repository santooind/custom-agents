# <Solution Name> HashiCorp Vault Architecture

## Status

- Status: `Draft`
- Owner:
- Last Updated:

## Vault Scope

| Area | Decision |
|---|---|
| Deployment model |  |
| Namespaces |  |
| Secret engines |  |
| Auth methods |  |
| Audit devices |  |
| Replication/DR |  |

## Static Secret Lifecycle

| Step | Actor/System | Action | Secret Payload Exposure Control | Audit Evidence |
|---|---|---|---|---|
| Request | ServiceNow |  | Metadata only |  |
| Approval | ServiceNow |  | Metadata only |  |
| Write | Operator / Secure Automation |  | Payload goes directly to Vault |  |
| Read | Authorized workload/operator |  | Payload returned only to authorized caller |  |
| Rotate | Owner / Automation |  | Payload handled outside Terraform |  |
| Revoke/Delete | Owner / Automation |  | Metadata retained as policy allows |  |

## Secret Engine Design

| Path | Engine | Purpose | Owner | Policy |
|---|---|---|---|---|
| kv/<team>/<app>/<env> | KV v2 | Static app secrets |  |  |

## Auth And Policy Model

| Principal | Auth Method | Policy | Allowed Paths | Notes |
|---|---|---|---|---|
| ServiceNow integration |  |  |  | Metadata and controlled operations only. |
| Terraform pipeline |  |  |  | Configuration only; no static secret payloads. |
| Workload |  |  |  | Runtime read path. |
| Operator |  |  |  | Break-glass or rotation path. |

## Terraform Boundary

Terraform may create policy and path structure, but static secret payloads must be written outside Terraform.

## Audit And Monitoring

| Event | Source | Destination | Alert |
|---|---|---|---|
|  |  |  |  |

## Open Questions

| ID | Question | Why It Matters | Blocks Freeze |
|---|---|---|---|
| Q-VLT-001 |  |  | Yes |
