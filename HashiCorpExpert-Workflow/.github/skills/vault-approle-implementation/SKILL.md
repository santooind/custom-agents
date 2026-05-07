---
name: vault-approle-implementation
description: "Implement AppRole-based Vault access patterns for VM, bare-metal, batch, app-server, or non-Kubernetes workloads."
argument-hint: "[approved migration plan and startup/config files]"
---

# Vault AppRole Implementation

## Applicability

Use when the selected auth method is AppRole.

## Approved Changes

May update approved files for:

- Vault Agent config templates with placeholders
- startup wrapper references
- systemd or process manager examples when in scope
- Docker entrypoint integration when paired with Docker skill
- documentation of wrapped secret-id delivery assumptions

## Do Not

- Do not store role IDs or secret IDs in source control.
- Do not create static AppRole secret IDs in docs or examples.
- Do not use AppRole for Kubernetes workloads when Kubernetes Auth is selected.

## Implementation Guidance

- Prefer Vault Agent rendered files for legacy apps.
- Use response wrapping for secret-id delivery when documented.
- Keep rendered files out of logs and build artifacts.
- Define file permissions and ownership placeholders.

