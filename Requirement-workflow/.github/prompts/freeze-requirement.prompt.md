---
name: freeze-requirement
description: "Run final readiness checks and create a frozen enterprise requirement baseline only after explicit approval."
agent: "Final Requirement Freezer"
argument-hint: "[working draft requirement path]"
---

Run final freeze readiness for:

`${input:requirement_file:Path to working draft requirement document}`

Review open questions, review findings, acceptance criteria, traceability, specialist coverage, and approval evidence.

If ready, ask for explicit freeze approval before creating:

- `requirements/frozen/<feature-slug>.requirements.v1.0.md`
- `requirements/baselines/<feature-slug>.baseline.md`
- `requirements/change-log/<feature-slug>.change-log.md`

If blocked, create:

- `requirements/reviews/<feature-slug>.freeze-readiness-review.md`
