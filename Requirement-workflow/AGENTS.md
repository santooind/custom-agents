# Agent Operating Instructions

This workspace is a requirement discovery, review, and freeze workflow. All agents must keep requirements traceable, reviewable, and safe to hand to architecture, development, QA, security, operations, and client stakeholders.

## Shared Rules

- Treat raw input as incomplete until proven otherwise.
- Separate facts, assumptions, decisions, risks, and open questions.
- Do not invent business decisions. If an answer changes scope, cost, compliance, security, data model, customer promise, or rollout plan, ask the user.
- Prefer concise, numbered questions over broad essay prompts.
- Keep enterprise requirement outputs in `requirements/`.
- Keep lightweight workflow outputs in `docs/requirements/` only when the simple workflow is explicitly used.
- Use the templates in `templates/` unless the user asks for a different format.
- Mark requirement status as one of: `Draft`, `Needs Answers`, `Ready For Review`, `Ready To Freeze`, `Frozen`.
- A document can be `Ready To Freeze` only when there are no unresolved high-impact questions.

## Multi-Agent Protocol

When agents collaborate, first identify the mode.

### Light Mode

Use for small/internal features:

1. Enterprise Requirement Analyst
2. Question Curator
3. Requirement Challenger
4. Acceptance Criteria QA Analyst

### Standard Mode

Use for normal product/client requirements:

1. Enterprise Requirement Analyst
2. Question Curator
3. Requirement Challenger
4. Business Rule Analyst
5. Integration Analyst
6. Data Reporting Analyst
7. Acceptance Criteria QA Analyst
8. Traceability Matrix Agent

### Enterprise Freeze Mode

Use for high-risk, regulated, contractual, security-sensitive, production-critical, or formal baseline requirements:

1. Enterprise Requirement Analyst creates or updates the working draft.
2. Question Curator extracts missing decisions and clarifications.
3. Requirement Challenger reviews for gaps, ambiguity, conflict, and hidden assumptions.
4. Specialist agents review business rules, integrations, security/privacy, data/reporting, QA, operations, and traceability.
5. Enterprise Requirement Analyst reconciles accepted feedback into the working draft.
6. Executive Summary Writer updates leadership-facing summary.
7. Traceability Matrix Agent validates mapping and coverage.
8. Final Requirement Freezer checks readiness and creates a frozen baseline only after explicit approval.

If the user does not specify a mode, use `Auto`: choose the smallest safe mode and state why.

Each specialist must return:

- `Findings`: concrete issues or improvements.
- `Recommended Changes`: edits to apply to the requirement document.
- `Open Questions`: questions that need user input.
- `Freeze Impact`: whether the issue blocks freezing.

## File Ownership

- `requirements/working-draft/*.requirements.md`: Enterprise Requirement Analyst.
- `requirements/questions/*.open-questions.md`: Question Curator.
- `requirements/reviews/*`: reviewer or specialist agent that owns that review.
- `requirements/traceability/*.traceability.md`: Traceability Matrix Agent.
- `requirements/frozen/*`: Final Requirement Freezer only.

Agents should avoid circular edits by writing review findings to review artifacts instead of silently rewriting another agent's owned file.
