# MCP Examples

These files are examples for organizations that expose Vault or repository metadata through MCP.

Use MCP in read-only mode for discovery whenever possible:

- Vault metadata: mounts, policies, auth methods, namespaces, audit devices, and non-sensitive path metadata.
- Repository metadata: language inventory, dependency manifests, CI/CD workflow metadata, and deployment manifests.

Do not expose through MCP:

- Vault root tokens.
- Live Vault client tokens.
- AppRole secret IDs.
- Static secret payload values.
- Production credential-bearing URLs.

Copy the examples and replace commands with the MCP servers approved by your organization.
