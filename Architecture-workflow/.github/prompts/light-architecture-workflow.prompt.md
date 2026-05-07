---
name: light-architecture-workflow
description: "Run the light architecture workflow for small/internal technical designs."
agent: "Enterprise Architecture Orchestrator"
argument-hint: "[raw architecture input or draft path]"
---

Run `Light` mode.

Input:

`${input:raw_input:Paste raw architecture input, small design notes, or draft path}`

Use only:

- `Enterprise Solution Architect`
- `Architecture Question Curator`
- `Architecture Challenger`
- `Architecture Decision Record Agent`

Create:

- `architecture/working-draft/<solution-slug>.architecture.md`
- `architecture/questions/<solution-slug>.open-questions.md`
- `architecture/reviews/<solution-slug>.challenge-review.md`
- `architecture/decisions/<solution-slug>.adr.md`

Escalate to `Standard` if the input reveals external integrations, sensitive data, production SLA, platform changes, cost impact, compliance, or formal approval.
