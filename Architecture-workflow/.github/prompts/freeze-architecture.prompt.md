---
name: freeze-architecture
description: "Run final architecture readiness checks and create a frozen architecture baseline only after explicit approval."
agent: "Final Architecture Freezer"
argument-hint: "[working draft architecture path]"
---

Run final architecture freeze readiness for:

`${input:architecture_file:Path to working draft architecture document}`

Review open questions, review findings, ADRs, interface documents, security/privacy, data, platform, resilience/operations, cost/governance, traceability, and approval evidence.

If ready, ask for explicit freeze approval before creating:

- `architecture/frozen/<solution-slug>.architecture.v1.0.md`
- `architecture/baselines/<solution-slug>.baseline.md`
- `architecture/change-log/<solution-slug>.change-log.md`

If blocked, create:

- `architecture/reviews/<solution-slug>.freeze-readiness-review.md`
