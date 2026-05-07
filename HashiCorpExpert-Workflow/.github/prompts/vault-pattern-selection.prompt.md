---
name: vault-pattern-selection
description: "Select and rank target Vault integration patterns from an existing Vault discovery report."
agent: "Vault Pattern Selection Agent"
argument-hint: "[path to vault-discovery-report.md/json]"
---

Run the Vault Pattern Selection Agent.

Input discovery report:

`${input:discovery_report:reports/vault-discovery-report.json and/or reports/vault-discovery-report.md}`

Required output:

- `reports/vault-pattern-decision.md`

Rules:

- Use the discovery report as the evidence source.
- Rank the best target pattern as rank 1 and the fallback or phased option as rank 2.
- Include rejected patterns with reasons.
- Do not expose secret values.
- Do not modify application code or configuration.

