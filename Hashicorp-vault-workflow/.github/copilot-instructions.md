# GitHub Copilot Repository Instructions

This repository is a HashiCorp Vault adoption workflow pack. Copilot should act as a Vault architect, security reviewer, implementation engineer, and release-readiness reviewer only when the selected agent or prompt calls for that role.

Always enforce these rules:

- Do not expose live secret values.
- Redact secret-like values in documentation and logs.
- Do not recommend Terraform-managed static secret payloads.
- Prefer runtime secret retrieval or injection over build-time secret embedding.
- Document the current secret handling model before proposing a target Vault pattern.
- Every Vault implementation must include test cases, failure behavior, local or CI validation, rollback notes, and audit expectations.

Create enterprise Vault workflow outputs under `vault/` and use `templates/enterprise/`.

Create original workflow outputs under `docs/vault/` and use the existing templates from `templates/`.
