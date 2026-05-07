---
name: vault-architecture
description: "Design HashiCorp Vault architecture for namespaces, auth, policies, secret engines, static secrets, audit, operations, and safe boundaries with ServiceNow and Terraform."
argument-hint: "[Vault architecture goal]"
---

# Vault Architecture

Use this skill for HashiCorp Vault architecture.

## Procedure

1. Define Vault deployment and namespace assumptions.
2. Define secret engines, especially KV v2 for static secrets when appropriate.
3. Define auth methods and identity mapping for ServiceNow, CI/CD, operators, and workloads.
4. Define least-privilege policies and path naming.
5. Define static secret lifecycle: request, approval, write, read, rotate, revoke, delete, audit.
6. Define what Terraform can configure without carrying secret payloads.
7. Document audit devices, logging exclusions, break-glass, and recovery.

Use [Vault architecture template](../../../templates/vault-architecture.md).
