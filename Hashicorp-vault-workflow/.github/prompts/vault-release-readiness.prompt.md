---
name: vault-release-readiness
description: "Run final Vault release readiness checks and create a frozen release baseline only after explicit approval."
agent: "Vault Release Freezer"
argument-hint: "[Vault release package path]"
---

Run Vault release readiness for:

`${input:vault_package:Path to Vault discovery/design/release package}`

Review discovery, identity/policy, lifecycle, platform integration, security/compliance, operations, migration/cutover, tests, validation scripts, boundary scans, rollback, and approvals.

If ready, ask for explicit release freeze approval before creating:

- `vault/frozen/<app-slug>.vault-release.v1.0.md`
- `vault/baselines/<app-slug>.baseline.md`
- `vault/change-log/<app-slug>.change-log.md`

If blocked, create:

- `vault/release/<app-slug>.release-readiness.md`

Never include secret values.
