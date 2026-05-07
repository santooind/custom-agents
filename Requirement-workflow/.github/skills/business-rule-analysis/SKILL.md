---
name: business-rule-analysis
description: "Extract, normalize, validate, and challenge enterprise business rules, decision tables, approvals, eligibility, calculations, exceptions, and policy logic from rough requirement inputs or drafts."
argument-hint: "[requirement draft or business rule notes]"
---

# Business Rule Analysis

Use this skill when business behavior depends on policies, thresholds, approvals, calculations, exceptions, eligibility, routing, prioritization, or operational rules.

## Procedure

1. Extract explicit rules and assign `BR-###`.
2. Identify implied rules and mark them as assumptions or questions.
3. Capture owner, source, effective date, priority, exceptions, dependencies, and affected `REQ-###`.
4. Use decision tables for branching logic.
5. Flag missing thresholds, formulas, exception handling, approval authority, and audit needs.
6. Link each rule to acceptance criteria where testable.

## Output

Write or update:

- `requirements/reviews/<feature-slug>.business-rules-review.md`
- the `Business Rules` section in the working draft.

**Why?** Business rules are implementation logic and governance logic; they need explicit ownership.
