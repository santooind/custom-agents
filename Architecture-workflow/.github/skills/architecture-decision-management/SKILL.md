---
name: architecture-decision-management
description: "Create and maintain architecture decision records with context, decision, alternatives, rationale, consequences, owners, status, and affected architecture elements."
argument-hint: "[architecture draft or decision notes]"
---

# Architecture Decision Management

Use this skill when an architecture choice has meaningful alternatives, consequences, risks, cost, security, operational, or governance impact.

## Procedure

1. Assign `ADR-###`.
2. Capture status: `Proposed`, `Accepted`, `Superseded`, `Rejected`, or `Deferred`.
3. Document context, decision, alternatives considered, rationale, consequences, owner, date, and affected IDs.
4. Do not mark as `Accepted` without confirmation.
5. Link ADRs to components, integrations, risks, requirements, and open questions.

Use `templates/enterprise/architecture-decision-record.md`.

**Why?** ADRs prevent architecture rationale from disappearing.
