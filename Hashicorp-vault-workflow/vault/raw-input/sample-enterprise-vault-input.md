# Sample Enterprise Vault Raw Input

Target application needs to migrate secret handling to HashiCorp Vault.

Notes:

- Current app appears to use environment variables and deployment secrets.
- Some values may also be configured through CI/CD variables.
- Team wants Vault-backed runtime secret consumption.
- Runtime platform, Vault namespace, auth method, mount path, secret engine, token TTL, and rotation owner are not confirmed.
- Terraform may configure Vault mounts, policies, auth methods, namespaces, and metadata only if no long-lived secret payload enters state or plans.
- Static secret payloads must not appear in Terraform state, CI logs, pull requests, application logs, ServiceNow notes, or documentation.
- Need rollout, rollback, validation automation, audit evidence, and operations runbook before production release.

Use this with:

```text
/enterprise-vault-workflow
Mode: Auto
```

Expected result:

- discovery in `vault/discovery/`
- questions in `vault/questions/`
- design files in `vault/design/` and `vault/policies/`
- reviews in `vault/reviews/`
- release readiness only for Enterprise Release mode
- no frozen release baseline until explicit approval.
