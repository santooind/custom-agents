---
applyTo: "vault/**/*.md,docs/vault/**/*.md,templates/**/*.md,scripts/**/*.sh,**/*.tf,**/*.tfvars,**/*.hcl,**/*.yaml,**/*.yml,**/*.properties,**/*.env*"
---

# Vault Workflow Instructions

When editing Vault workflow documents, code, config, or automation:

- Separate confirmed facts, assumptions, decisions, risks, and open questions.
- Redact live secret values. Use placeholders such as `<redacted>`, `<vault-path>`, or `<runtime-token>`.
- Do not add static secret payloads to Terraform resources, variables, outputs, state, plan files, YAML manifests, `.env` files, code constants, tests, or documentation.
- Prefer Vault Agent, injector, CSI, workload identity, AppRole, JWT/OIDC, cloud auth, or SDK patterns based on runtime evidence.
- Include audit, observability, failure handling, rollback, and rotation impact in implementation plans.
- Tests should verify behavior and boundaries without requiring production secrets.

Enterprise Vault documents should use `templates/enterprise/` when the user requests enterprise, production-grade, release-ready, regulated, or formal Vault adoption work.
