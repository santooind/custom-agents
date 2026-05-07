---
name: operational-readiness-review
description: "Review enterprise requirements for production support, monitoring, alerting, SLA/OLA, runbooks, rollout, rollback, migration, incident handling, and operational ownership."
argument-hint: "[requirement draft or operational notes]"
---

# Operational Readiness Review

Use this skill when requirements affect production support, incidents, monitoring, rollout, rollback, migration, maintenance, or support ownership.

## Procedure

1. Assign `OPS-###` operational requirements.
2. Capture owner, SLA/OLA, monitoring, alerting, runbook, incident response, rollout, rollback, and maintenance needs.
3. Link failure scenarios to `ERR-###`, integrations to `INT-###`, and audit/security needs to `SEC-###` or `AUD-###`.
4. Flag missing support ownership, detection, escalation path, and rollback plan.
5. Convert operational unknowns into open questions when they affect freeze readiness.

## Output

Write or update:

- `requirements/reviews/<feature-slug>.operational-readiness-review.md`
- draft operational, error handling, rollout, risk, and open-question sections.

**Why?** Operational requirements protect the team and users after launch.
