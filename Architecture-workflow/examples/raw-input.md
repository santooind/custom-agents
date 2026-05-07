# Sample Raw Architecture Input

We need an architecture where ServiceNow users request infrastructure provisioning. ServiceNow should trigger Terraform after approval and get run status back. We also need Vault for application static secrets. Static secrets must not be stored in Terraform state because we do not want sensitive values in state or plan files. ServiceNow should track requests, approvals, ownership, audit, and CMDB updates. Need AID documents between ServiceNow and Terraform, and ServiceNow and Vault.

Use this sample with:

```text
/architecture-workflow
```
