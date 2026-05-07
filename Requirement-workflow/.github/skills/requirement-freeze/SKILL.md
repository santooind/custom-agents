---
name: requirement-freeze
description: "Perform final enterprise requirement freeze readiness checks, create frozen baselines, maintain change history, and enforce post-freeze change control."
argument-hint: "[requirement draft]"
---

# Requirement Freeze

Use this skill when the user asks to freeze, baseline, approve, finalize, or lock a requirement document.

## Procedure

1. Confirm all blocker questions are answered.
2. Confirm `Critical` and `High` review findings are resolved or explicitly accepted.
3. Confirm every `Must` requirement maps to a goal and acceptance criterion.
4. Confirm security, privacy, data, integration, operational, and QA sections are complete enough for delivery.
5. Create frozen copy only after explicit user approval.
6. Record baseline version, date, approvals, source draft, and change-control rules.

## Output

If ready:

- `requirements/frozen/<feature-slug>.requirements.v1.0.md`
- `requirements/baselines/<feature-slug>.baseline.md`

If blocked:

- `requirements/reviews/<feature-slug>.freeze-readiness-review.md`

**Why?** Freezing scope without evidence creates governance and delivery risk.
