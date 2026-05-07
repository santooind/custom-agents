---
name: architecture-freeze
description: "Perform final enterprise architecture freeze readiness checks, create frozen baselines, maintain change history, and enforce post-freeze change control."
argument-hint: "[architecture draft]"
---

# Architecture Freeze

Use this skill when the user asks to freeze, baseline, approve, finalize, or lock an architecture document.

## Procedure

1. Confirm all freeze-blocking questions are answered.
2. Confirm critical/high findings are resolved or explicitly accepted.
3. Confirm ADRs, interface documents, security, data, operations, traceability, and approvals are complete enough for baseline.
4. Ask for explicit freeze approval.
5. Create frozen copy and baseline metadata.
6. Never edit frozen baselines in place.

Use `templates/enterprise/architecture-freeze-checklist.md`.

**Why?** Architecture freeze is a governance baseline with change-control implications.
