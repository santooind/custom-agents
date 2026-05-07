---
name: vault-migration-plan
description: "Generate an implementation-ready Vault migration plan from discovery and pattern decision reports."
agent: "Vault Migration Plan Agent"
argument-hint: "[paths to vault-discovery-report.md/json and vault-pattern-decision.md]"
---

Run the Vault Migration Plan Agent.

Inputs:

`${input:inputs:reports/vault-discovery-report.md, reports/vault-discovery-report.json, reports/vault-pattern-decision.md}`

Required outputs:

- `reports/vault-migration-plan.md`
- `reports/vault-migration-plan.json`

Rules:

- Do not modify application source code.
- Do not expose secret values.
- Do not invent missing business or security decisions.
- Mark unclear items as assumptions or open questions.
- Produce practical, implementation-ready migration steps.

