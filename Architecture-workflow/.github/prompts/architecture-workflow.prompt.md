---
name: architecture-workflow
description: "Run the full ServiceNow, Terraform, and Vault architecture workflow."
agent: "Architecture Orchestrator"
argument-hint: "[raw architecture input]"
---

Run the complete architecture workflow.

Raw input:

`${input:raw_input:Paste the architecture goal, requirement notes, meeting notes, or current design here}`

Produce or update:

- `docs/architecture/<solution-name>.architecture.md`
- `docs/architecture/<solution-name>.snow-architecture.md`
- `docs/architecture/<solution-name>.aid-snow-terraform.md`
- `docs/architecture/<solution-name>.aid-snow-vault.md`
- `docs/architecture/<solution-name>.security-review.md`
- `docs/architecture/<solution-name>.open-questions.md`

Use ServiceNow, Terraform, Vault, Critic, and Question Curator agents. Enforce the rule that static secret payloads must not enter Terraform state or plan files.
