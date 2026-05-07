---
name: vault-implementation
description: "Run the approval-gated Vault Implementation Agent against an approved migration plan."
agent: "Vault Implementation Agent"
argument-hint: "[dry-run or approved implementation scope plus paths to reports]"
---

Run the Vault Implementation Agent.

Inputs:

`${input:inputs:reports/vault-discovery-report.md, reports/vault-discovery-report.json, reports/vault-pattern-decision.md, reports/vault-migration-plan.md, reports/vault-migration-plan.json}`

Implementation approval/scope:

`${input:approval:Say dry-run for scope preview, or explicitly approve implementation and list scope}`

Required output:

- `reports/vault-implementation-summary.md`

Rules:

- Default to dry-run unless implementation approval is explicit.
- Do not expose secret values.
- Do not add live secrets to any file.
- Change only files required by the approved migration plan.
- Generate a clear implementation summary.

