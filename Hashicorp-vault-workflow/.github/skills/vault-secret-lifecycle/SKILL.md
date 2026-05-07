---
name: vault-secret-lifecycle
description: "Design metadata-only secret inventory, ownership, path conventions, onboarding, rotation, revocation, expiry, break-glass, decommissioning, and audit evidence for Vault."
argument-hint: "[Vault discovery or lifecycle goal]"
---

# Vault Secret Lifecycle

Use this skill when defining how secrets are onboarded, consumed, rotated, revoked, and retired.

## Procedure

1. Create metadata-only inventory. Never include values.
2. Define owner, consumer, environment, mount/path, rotation need, rotation owner, and evidence.
3. Define onboarding, update, rotation, revocation, expiry, break-glass, and decommission workflows.
4. Include rollback and validation for rotations.
5. Mark unclear ownership or rotation as blockers for production release.

**Why?** Vault is only useful when secret ownership and lifecycle are clear.
