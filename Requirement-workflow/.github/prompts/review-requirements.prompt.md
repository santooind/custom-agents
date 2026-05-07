---
name: review-requirements
description: "Critique an existing requirement document and produce gaps, risks, and open questions."
agent: "Requirement Critic"
argument-hint: "[requirement document path]"
---

Review this requirement document:

`${input:requirement_file:Path to requirement document}`

Find ambiguity, missing requirements, contradictions, edge cases, untestable acceptance criteria, architectural gaps, security/privacy/compliance risks, and freeze blockers.

Create or update:

- `docs/requirements/<feature-name>.review.md`
- `docs/requirements/<feature-name>.open-questions.md`
