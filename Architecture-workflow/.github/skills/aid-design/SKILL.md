---
name: aid-design
description: "Create Architecture Interface Documents between systems, including advanced enterprise AIDs and ServiceNow-Terraform-Vault integration contracts with ground rules, payloads, flows, security, operations, and freeze readiness."
argument-hint: "[system A] [system B]"
---

# Architecture Interface Document Design

Use this skill when creating AID documents between two or more systems.

## Procedure

1. Define purpose and business process.
2. Identify source and target systems.
3. Define source of truth and ownership.
4. Define authentication, authorization, and network path.
5. Define request and response payloads.
6. Define correlation IDs, idempotency, status, retries, errors, timeout, and rollback.
7. Define secret handling and data classification.
8. Define audit, observability, evidence, and support ownership.
9. For important use cases, add sequence diagrams, request contracts, success response contracts, failure response contracts, idempotency rules, audit evidence, and operational ownership.
10. List open questions and freeze blockers.

Use [enterprise AID template](../../../templates/enterprise/enterprise-aid-document.md) for enterprise workflows.

Use [ServiceNow-Terraform-Vault AID template](../../../templates/enterprise/aid-servicenow-terraform-vault.md) when all three systems are in scope.

Use [basic AID template](../../../templates/aid-document.md) only for lightweight two-system interface docs.
