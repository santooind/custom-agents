# MCP Configuration Notes

The files in this folder are examples for connecting architecture agents to live or read-only context.

Recommended pattern:

- Use read-only MCP servers for ServiceNow, Vault, and Terraform documentation/state metadata during architecture drafting.
- Keep write actions out of MCP until the architecture workflow and approvals are mature.
- Do not expose static secret payloads through MCP tools.
- Do not commit tokens, Vault root tokens, ServiceNow passwords, or Terraform Cloud tokens.
- Prefer short-lived credentials and least-privilege service accounts.

## Suggested Servers

| MCP Server | Purpose | Access |
|---|---|---|
| `servicenow-readonly` | Read catalog, flows, tables, CMDB model, and existing integration metadata. | Read-only |
| `vault-readonly` | Read mounts, policies, auth methods, and metadata only. | Read-only, no secret payload reads |
| `terraform-docs` | Read module docs, provider docs, and workspace metadata. | Read-only |

The `.mcp/mcp.json` file references placeholder server scripts. Replace them with your organization's approved MCP servers.
