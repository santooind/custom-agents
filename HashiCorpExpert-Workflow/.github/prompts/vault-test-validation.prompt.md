---
name: vault-test-validation
description: "Generate Vault migration validation evidence from reports and current git diff."
agent: "Vault Test & Validation Agent"
argument-hint: "[paths to Vault reports and current git diff context]"
---

Run the Vault Test & Validation Agent.

Inputs:

`${input:inputs:reports/vault-discovery-report.md, reports/vault-pattern-decision.md, reports/vault-migration-plan.md, reports/vault-implementation-summary.md, and current git diff}`

Required outputs:

- `reports/vault-test-validation-report.md`
- `reports/vault-test-validation-report.json`

Rules:

- Do not expose secret values.
- Do not fake test success.
- Run only safe local tests when available.
- Clearly separate executed, not executed, and blocked tests.
- Do not deploy or call production systems.

