---
name: integration-architecture-review
description: "Review APIs, events, queues, files, contracts, trust boundaries, retries, idempotency, ordering, failure modes, monitoring, and ownership."
argument-hint: "[architecture draft or integration notes]"
---

# Integration Architecture Review

Use this skill when the architecture includes system-to-system communication.

## Procedure

1. Assign `INT-###` to each integration.
2. Capture source, target, direction, protocol, contract, auth, owner, SLA/SLO, rate limit, retry, idempotency, ordering, failure handling, monitoring, and rollback.
3. Create AIDs for important interfaces.
4. Link integrations to security, data, operations, ADRs, and risks.
5. Flag missing contracts and failure paths.

**Why?** Integration contracts are architecture, not implementation trivia.
