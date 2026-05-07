# Sample Enterprise Architecture Raw Input

We need an architecture for a client-facing request portal capability.

Notes:

- Users submit requests through a portal.
- Some requests trigger infrastructure provisioning.
- Some requests involve onboarding or rotating static secrets.
- ServiceNow may be used for request, approval, and audit workflow.
- Terraform may be used for provisioning infrastructure and Vault configuration.
- Vault should store static secrets.
- Static secret values must not enter Terraform state, Terraform plan files, CI logs, or pull requests.
- Need approval workflow, audit trail, operational runbook, monitoring, and rollback.
- Cloud provider, Terraform backend, Vault edition, namespaces, auth method, ServiceNow licensing, and target SLA are not confirmed.
- Client expects an architecture review before implementation.

Use this with:

```text
/enterprise-architecture-workflow
Mode: Auto
```

Expected result:

- working draft in `architecture/working-draft/`
- open questions in `architecture/questions/`
- reviews in `architecture/reviews/`
- ADRs in `architecture/decisions/`
- traceability in `architecture/traceability/` when the selected mode requires it
- no frozen baseline until explicit approval.
