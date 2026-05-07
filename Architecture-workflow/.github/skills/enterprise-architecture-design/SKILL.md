---
name: enterprise-architecture-design
description: "Create structured enterprise architecture documents from rough input, requirements, platform notes, integration notes, security constraints, operational assumptions, or existing architecture drafts."
argument-hint: "[raw architecture input or draft]"
---

# Enterprise Architecture Design

Use this skill when creating or updating a solution architecture document.

## Procedure

1. Capture raw input and source labels.
2. Identify goals, non-goals, constraints, assumptions, risks, and open questions.
3. Define context, system boundaries, components, responsibilities, integrations, data flows, security controls, operational model, rollout, and decisions.
4. Assign stable IDs: `ARCH-###`, `COMP-###`, `INT-###`, `DATA-###`, `SEC-###`, `OPS-###`, `ADR-###`, `RISK-###`, `Q-###`.
5. Create ADRs for meaningful decisions.
6. Mark unconfirmed decisions as assumptions or questions.

Use `templates/enterprise/enterprise-architecture-document.md`.

**Why?** Architecture documents should explain the design and the decisions behind it.
