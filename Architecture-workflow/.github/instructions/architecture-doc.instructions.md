---
applyTo: "architecture/**/*.md,docs/architecture/**/*.md,templates/**/*.md"
---

# Architecture Document Instructions

Architecture documents must separate:

- confirmed decisions,
- assumptions,
- interfaces,
- security controls,
- operational workflows,
- implementation constraints,
- open questions.

Every document must include status, owner, last updated date, scope, non-scope, context, target state, security model, observability, failure handling, risks, decisions, and freeze checklist.

For SNOW, Terraform, and Vault integrations, explicitly state that static secret payloads are excluded from Terraform state and plan files.

Enterprise architecture documents should use `templates/enterprise/enterprise-architecture-document.md` when the user requests enterprise, production-grade, client-facing, freeze-ready, or general solution architecture work.
