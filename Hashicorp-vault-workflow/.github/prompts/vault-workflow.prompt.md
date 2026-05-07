---
name: vault-workflow
description: "Run the full HashiCorp Vault discovery, implementation, and test automation workflow."
agent: "Vault Workflow Orchestrator"
argument-hint: "[target codebase path] [Vault goal]"
---

Run the complete HashiCorp Vault workflow.

Target codebase:

`${input:target_codebase:Path to the application repository or folder}`

Goal:

`${input:vault_goal:Describe why Vault is being adopted and any known constraints}`

Produce or update:

- `docs/vault/<app-name>.discovery.md`
- `docs/vault/<app-name>.implementation-plan.md`
- `docs/vault/<app-name>.test-cases.md`
- `scripts/vault/<app-name>-vault-validation.sh`
- `scripts/vault/<app-name>-vault-validation.ps1`

Use the Vault Discovery Architect, Vault Implementation Agent, and Vault Test Automation Agent. Do not expose live secret values.
