---
name: acceptance-criteria-qa
description: "Create and review behavior-based, testable acceptance criteria linked to requirements, business rules, integrations, security, data, reporting, and error scenarios."
argument-hint: "[requirement draft]"
---

# Acceptance Criteria QA

Use this skill when converting requirement text into QA-ready acceptance criteria or reviewing testability.

## Procedure

1. Assign or preserve `AC-###`.
2. Link each acceptance criterion to `REQ-###` or another requirement ID.
3. Prefer `Given / When / Then` for behavior.
4. Cover positive, negative, boundary, permission, failure, audit, accessibility, integration, data, reporting, and operational cases.
5. Flag untestable vague language.
6. Create open questions when expected behavior is unknown.

## Output

Write or update:

- `requirements/reviews/<feature-slug>.qa-acceptance-review.md`
- the draft acceptance criteria section.

**Why?** QA-ready criteria force requirements to become observable.
