---
name: create-architecture-review
description: "Create executive architecture review and/or HLD review response artifacts from an architecture package."
agent: "Architecture Review Response Agent"
argument-hint: "[architecture package, review questions, or artifact folder]"
---

Create architecture review artifacts.

Input:

`${input:raw_input:Paste review questions, artifact paths, HLD, AID, data model, ERD, user stories, or final folder path}`

Use:

- `templates/enterprise/executive-architecture-review.md`
- `templates/enterprise/hld-review-response.md`

Write:

- `architecture/reviews/<solution-slug>.executive-architecture-review.md`
- `architecture/reviews/<solution-slug>.hld-review-response.md`

Include review summary, what was done well, issues and corrections, parked/future scope alignment, cross-document consistency, finalized decisions, responses to review questions, RBAC matrix, event types, remaining blockers, and recommendation.

Do not mark approved if blocker questions remain.
