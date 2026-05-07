# GitHub Copilot Repository Instructions

This repository is an enterprise architecture workflow customization pack plus a specialized ServiceNow, Terraform, and HashiCorp Vault architecture workflow.

Always enforce these rules:

- Static secret values must not be managed through Terraform.
- Terraform may manage Vault configuration, policies, auth methods, namespaces, and metadata only when the resulting state does not contain long-lived secret payloads.
- ServiceNow architecture must define request, approval, fulfillment, audit, CMDB, incident/change, and ownership flows.
- Architecture Interface Documents must define systems, contracts, authentication, authorization, payloads, error handling, retries, audit, observability, ownership, and open questions.
- Every architecture must include non-functional requirements, failure modes, operational runbooks, risk decisions, and freeze readiness.

Create enterprise architecture outputs under `architecture/` and use templates from `templates/enterprise/`.

Create specialized ServiceNow/Terraform/Vault outputs under `docs/architecture/` and use the existing templates from `templates/`.
