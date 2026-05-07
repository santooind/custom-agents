---
name: integration-analysis
description: "Analyze APIs, external systems, event flows, files, contracts, ownership, auth, retry behavior, monitoring, failure paths, and integration risks for enterprise requirements."
argument-hint: "[requirement draft, API notes, or integration notes]"
---

# Integration Analysis

Use this skill when requirements mention external systems, APIs, events, imports, exports, webhooks, files, queues, batch jobs, or platform dependencies.

## Procedure

1. Assign `INT-###` to each integration.
2. Capture source, target, direction, protocol, auth method, owner, data contract, frequency, SLA, rate limit, retry, idempotency, and failure handling.
3. Identify missing contracts, schemas, endpoint behavior, sequencing, monitoring, and rollback.
4. Redact secrets and tokens.
5. Link integrations to `REQ-###`, `DATA-###`, `SEC-###`, `OPS-###`, and `AC-###`.

## Output

Write or update:

- `requirements/reviews/<feature-slug>.integration-review.md`
- draft sections for integration, error handling, and operations.

**Why?** Integration assumptions often become delivery blockers.
