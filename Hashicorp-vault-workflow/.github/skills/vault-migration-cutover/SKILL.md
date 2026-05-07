---
name: vault-migration-cutover
description: "Plan migration from existing secret handling to Vault with phases, prechecks, dual-run, cutover, validation, rollback, cleanup, communication, and release evidence."
argument-hint: "[Vault discovery or migration goal]"
---

# Vault Migration Cutover

Use this skill when moving an application from existing secret handling to Vault.

## Procedure

1. Define prepare, integrate, validate, cutover, monitor, cleanup, and rollback phases.
2. Keep old and new secret sources controlled during migration.
3. Define validation evidence before cleanup.
4. Do not recommend destructive cleanup until rollback and ownership are confirmed.
5. Document communication, freeze window, approvers, and post-cutover evidence.

**Why?** Migration risk is mostly cutover, validation, and cleanup timing.
