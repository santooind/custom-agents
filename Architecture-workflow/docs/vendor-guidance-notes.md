# Vendor Guidance Notes

This workflow reflects the following current vendor guidance.

## HashiCorp Vault

Vault centralizes secret management, encrypts stored data, validates and authorizes clients before access, and can audit interactions. Vault supports static secrets through engines such as Key/Value.

For programmatic Vault management, HashiCorp recommends codifying Vault resources such as policies, namespaces, plugins, and auth methods where appropriate. The important boundary is that Terraform should avoid reading or writing long-lived static secrets to Vault because data read to or written by Terraform can persist in Terraform state and generated plan files.

## Terraform

Terraform state maps real-world objects to configuration and stores metadata needed for operations. Terraform state and plan files can contain sensitive values. If secret values are placed directly in configuration or managed resources, Terraform can store those values in state or plan artifacts. Treat state as sensitive and use secure remote storage and access controls.

## ServiceNow

ServiceNow IntegrationHub uses connection and credential aliases so flows and actions do not need to be updated directly when connection or credential information changes. Use least-privilege access for integration users and avoid elevated roles unless required. For this workflow, SNOW should store metadata, workflow state, approvals, audit evidence, and ownership records, not static secret payloads.

## Architecture Decision

Terraform may configure the Vault control plane. Static secret payloads are handled through Vault-native operational paths or approved ServiceNow-to-Vault fulfillment paths that do not persist secret values in Terraform state, Terraform plan files, ServiceNow logs, or Git history.
