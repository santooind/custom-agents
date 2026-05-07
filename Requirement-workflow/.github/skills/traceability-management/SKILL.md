---
name: traceability-management
description: "Build and validate enterprise traceability from business goals to requirements, business rules, integrations, security, data, risks, questions, and acceptance criteria."
argument-hint: "[requirement draft]"
---

# Traceability Management

Use this skill when validating coverage, freeze readiness, governance, auditability, or change impact.

## Procedure

1. Map `GOAL-###` to requirement IDs and `AC-###`.
2. Identify orphan requirements, unmapped goals, missing acceptance criteria, unresolved blocker questions, and risks without mitigations.
3. Link open questions to affected requirement IDs.
4. Link high risks to mitigation, owner, or decision question.
5. Produce a freeze-readiness traceability verdict.

## Output

Write:

- `requirements/traceability/<feature-slug>.traceability.md`

Use:

- `templates/enterprise/traceability-matrix.md`

**Why?** Traceability makes scope defensible and change impact visible.
