---
name: standard-architecture-workflow
description: "Run the standard architecture workflow for normal product/client solution architecture."
agent: "Enterprise Architecture Orchestrator"
argument-hint: "[raw architecture input or draft path]"
---

Run `Standard` mode.

Input:

`${input:raw_input:Paste raw architecture input, requirements path, platform notes, API notes, or draft path}`

Use:

- `Enterprise Solution Architect`
- `Architecture Question Curator`
- `Architecture Challenger`
- `Application Domain Architect`
- `Integration Architecture Reviewer`
- `Data Architecture Reviewer`
- `Platform DevOps Architect`
- `Resilience Operations Reviewer`
- `Architecture Decision Record Agent`
- `Architecture Traceability Agent`

Add `Security Privacy Architecture Reviewer` when access control, secrets, regulated data, PII, audit, or external trust boundaries appear.

Create:

- `architecture/working-draft/<solution-slug>.architecture.md`
- `architecture/questions/<solution-slug>.open-questions.md`
- `architecture/reviews/<solution-slug>.challenge-review.md`
- specialist review files as needed
- `architecture/decisions/<solution-slug>.adr.md`
- `architecture/traceability/<solution-slug>.traceability.md`

Escalate to `Enterprise Freeze` if the input reveals regulated data, contractual approval, production-critical SLA, formal client signoff, cost governance, or baseline/freeze request.
