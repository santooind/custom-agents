---
name: servicenow-erd-design
description: "Create ServiceNow ERD packs using Mermaid for custom tables, native tables, combined architecture, model evolution, and integration flow diagrams."
argument-hint: "[ServiceNow data model path]"
---

# ServiceNow ERD Design

Use this skill to create ERD and diagram packs from a ServiceNow data model.

## Procedure

1. Read the final data model and identify custom and native tables.
2. Create ERDs for final custom model, native interaction model, and comprehensive model.
3. Optionally include legacy/superseded model for evolution comparison.
4. Add model evolution summary and consistency notes.
5. Do not add relationships that are not in the data model unless clearly marked proposed.

Use `templates/enterprise/servicenow-erd-pack.md`.

**Why?** ERDs help reviewers catch data model complexity and relationship errors.
