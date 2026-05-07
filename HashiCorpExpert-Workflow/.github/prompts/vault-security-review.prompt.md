---
name: vault-security-review
description: "Run the pre-merge Vault security review over workflow reports and current git diff."
agent: "Vault Security Review Agent"
argument-hint: "[paths to Vault reports and current PR/git diff]"
---

Run the Vault Security Review Agent.

Inputs:

`${input:inputs:reports/vault-discovery-report.md, reports/vault-pattern-decision.md, reports/vault-migration-plan.md, reports/vault-implementation-summary.md, reports/vault-test-validation-report.md, and current git diff}`

Required outputs:

- `reports/vault-security-review.md`
- `reports/vault-security-review.json`

Rules:

- Do not expose secret values.
- Do not run destructive commands.
- Review whether the Vault migration is safe before human approval.
- Clearly mark failed controls, conditions, blockers, and open security questions.

