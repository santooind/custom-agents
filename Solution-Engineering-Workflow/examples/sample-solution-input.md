# Sample Solution Input

Build a ServiceNow self-service portal for HashiCorp Vault onboarding and lifecycle management.

Raw requirement:

- Application owners need to onboard applications to Vault.
- Users need to manage static secret metadata and request dynamic database access.
- ServiceNow should provide request intake, validation, approvals, tracking, reporting, notifications, and audit visibility.
- Terraform may provision Vault configuration and dynamic access workflows.
- Vault is the system of truth for secrets.
- ServiceNow must not store or log secret values.
- Need AID, ServiceNow architecture/design, ServiceNow data model, ERDs, and executive review package.

Additional architecture inputs:

- Prefer native ServiceNow request model.
- Use catalog items and portal pages where appropriate.
- Use CMDB/iTAP references instead of duplicating application data.
- Capture correlation ID across ServiceNow, Terraform, and Vault.
- Need final baseline only after approval.

Use:

```text
/solution-engineering-workflow
Mode: Auto
```
