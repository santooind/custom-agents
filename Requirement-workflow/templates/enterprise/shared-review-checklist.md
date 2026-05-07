# Shared Enterprise Requirement Review Checklist

## Document Quality

- [ ] User/client vocabulary is preserved where useful.
- [ ] Facts, assumptions, risks, open questions, and recommendations are separated.
- [ ] Vague phrases are translated into measurable behavior or questions.
- [ ] No secrets, credentials, tokens, or sensitive values are exposed.
- [ ] Sources are captured for major requirements.

## Scope And Business Fit

- [ ] Problem statement is clear.
- [ ] Business goals have success measures.
- [ ] Current state and future state are understandable.
- [ ] In scope and out of scope are explicit.
- [ ] Stakeholders and decision owners are named or questioned.

## Requirement Completeness

- [ ] Each functional requirement has actor, trigger, behavior, outcome, dependencies, source, and priority.
- [ ] Missing owners, SLAs, data sources, failure paths, and audit needs are flagged.
- [ ] Business rules are explicit and testable.
- [ ] Non-functional requirements are measurable.
- [ ] Error handling and exception scenarios are documented.

## Specialist Coverage

- [ ] Integration contracts and owners are clear.
- [ ] Security, privacy, audit, and compliance needs are reviewed.
- [ ] Data source of truth, retention, quality, and reporting definitions are clear.
- [ ] Operational monitoring, support, and rollback needs are included.

## QA And Traceability

- [ ] Acceptance criteria are behavior-based and testable.
- [ ] Every `Must` requirement maps to at least one `AC-###`.
- [ ] Every business goal maps to one or more requirements.
- [ ] High risks map to mitigations or open questions.
- [ ] Freeze-blocking questions map to affected requirement IDs.

## Freeze Readiness

- [ ] No unresolved `Critical` findings.
- [ ] No unresolved `High` findings without owner acceptance.
- [ ] No unanswered `Decision Required` freeze blockers.
- [ ] Approval placeholders are completed or explicitly pending.

**Why?** A shared checklist keeps reviews consistent across agents and human reviewers.
