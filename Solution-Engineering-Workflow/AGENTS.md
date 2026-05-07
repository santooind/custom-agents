# Agent Operating Instructions

This workspace runs enterprise solution engineering from raw input through requirement freeze, architecture/design, review, and baseline.

## Shared Rules

- Separate facts, assumptions, decisions, risks, open questions, and recommendations.
- Do not invent business decisions, technical decisions, endpoints, schemas, table names, roles, SLAs, auth methods, or approval rules.
- Preserve user/client vocabulary where useful.
- Use stable IDs: `REQ-###`, `AC-###`, `BR-###`, `INT-###`, `DATA-###`, `SEC-###`, `OPS-###`, `ADR-###`, `RISK-###`, `ASM-###`, `Q-###`.
- Never expose secrets, credentials, tokens, or sensitive values.
- Architecture cannot silently change frozen requirement scope.
- Review agents write review artifacts; primary drafting agents reconcile accepted findings.

## Phase Gates

1. Requirement work can start from raw input.
2. Architecture work should start from a frozen or explicitly approved requirement baseline.
3. AID and ServiceNow architecture/design should trace back to requirements and architecture decisions.
4. Data model and ERDs should trace back to ServiceNow architecture/design and user stories.
5. Final baseline requires explicit user approval.

## File Ownership

- `workspace/01-requirements/working-draft/*`: Requirement phase agent.
- `workspace/01-requirements/frozen/*`: Requirement freezer only.
- `workspace/02-architecture/working-draft/*`: Architecture phase agent.
- `workspace/02-architecture/interface-docs/*`: AID phase agent.
- `workspace/02-architecture/servicenow/*`: ServiceNow design phase agent.
- `workspace/02-architecture/data-model/*`: ServiceNow data model phase agent.
- `workspace/02-architecture/diagrams/*`: ERD phase agent.
- `workspace/03-review/*`: Review phase agent.
- `workspace/04-baseline/*`: Final baseline agent.

## Modes

- `Discovery`: classify input and create questions.
- `Requirement`: create/review/freeze-ready requirements.
- `Architecture`: create architecture/design from frozen requirements and architecture inputs.
- `Full`: run requirement through final solution baseline.
- `Review`: critique and consistency-check existing artifacts.
- `Auto`: choose the smallest safe mode and explain why.
