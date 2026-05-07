---
name: review-solution-package
description: "Review an existing solution package for cross-document consistency, gaps, corrections, and readiness."
agent: "Solution Review Engineer"
argument-hint: "[artifact folder or files]"
---

Run `Review` mode for:

`${input:artifact_folder:Path to final folder, workspace folder, or artifact list}`

Review requirements, AID, ServiceNow architecture/design, data model, ERDs, decisions, open questions, risks, and freeze readiness.

Create:

- `workspace/03-review/<solution-slug>.executive-architecture-review.md`
- `workspace/03-review/<solution-slug>.hld-review-response.md`
