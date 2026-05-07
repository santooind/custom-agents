---
name: light-requirement-workflow
description: "Run the light requirement workflow for small/internal features."
agent: "Enterprise Requirement Orchestrator"
argument-hint: "[raw input text or source file path]"
---

Run `Light` mode.

Input:

`${input:raw_input:Paste raw notes, issue text, small feature request, or draft path}`

Use only:

- `Enterprise Requirement Analyst`
- `Question Curator`
- `Requirement Challenger`
- `Acceptance Criteria QA Analyst`

Create:

- `requirements/working-draft/<feature-slug>.requirements.md`
- `requirements/questions/<feature-slug>.open-questions.md`
- `requirements/reviews/<feature-slug>.challenge-review.md`
- `requirements/reviews/<feature-slug>.qa-acceptance-review.md`

Escalate to `Standard` mode only if the input reveals client impact, business rules, integrations, reporting, sensitive data, SLA, rollout, or production support risk.
