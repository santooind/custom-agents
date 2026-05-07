---
name: requirement-workflow
description: "Run the full multi-agent requirement workflow from raw input to reviewed requirement package."
agent: "Requirement Orchestrator"
argument-hint: "[raw input or requirement file path]"
---

Run the complete requirement workflow.

Raw input:

`${input:raw_input:Paste the raw requirement idea, meeting notes, issue text, or feature request here}`

Produce or update:

- `docs/requirements/<feature-name>.requirements.md`
- `docs/requirements/<feature-name>.review.md`
- `docs/requirements/<feature-name>.open-questions.md`

Use the Analyst, Architect, Critic, and Question Curator roles. Do not mark the requirement as ready to freeze unless all blocker questions are resolved.
