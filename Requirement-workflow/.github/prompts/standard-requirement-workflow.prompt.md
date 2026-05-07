---
name: standard-requirement-workflow
description: "Run the standard requirement workflow for normal client/product requirements."
agent: "Enterprise Requirement Orchestrator"
argument-hint: "[raw input text or source file path]"
---

Run `Standard` mode.

Input:

`${input:raw_input:Paste raw notes, client email, product requirement, architecture note, API note, or draft path}`

Use:

- `Enterprise Requirement Analyst`
- `Question Curator`
- `Requirement Challenger`
- `Business Rule Analyst`
- `Integration Analyst`
- `Data Reporting Analyst`
- `Acceptance Criteria QA Analyst`
- `Traceability Matrix Agent`

Create:

- `requirements/working-draft/<feature-slug>.requirements.md`
- `requirements/questions/<feature-slug>.open-questions.md`
- `requirements/reviews/<feature-slug>.challenge-review.md`
- `requirements/reviews/<feature-slug>.business-rules-review.md`
- `requirements/reviews/<feature-slug>.integration-review.md`
- `requirements/reviews/<feature-slug>.data-reporting-review.md`
- `requirements/reviews/<feature-slug>.qa-acceptance-review.md`
- `requirements/traceability/<feature-slug>.traceability.md`

Escalate to `Enterprise Freeze` mode only if the input reveals regulated data, security/privacy risk, contractual approval, production-critical SLA, formal client signoff, or baseline/freeze request.
