---
name: vault-release-readiness
description: "Perform final Vault release readiness checks, verify secret-boundary scans, validation evidence, tests, rollback, operations, approvals, and create frozen release baseline after explicit approval."
argument-hint: "[Vault release package]"
---

# Vault Release Readiness

Use this skill when the user asks to release, freeze, approve, finalize, or baseline Vault adoption.

## Procedure

1. Confirm no live secret values exist in artifacts.
2. Confirm critical/high findings are resolved or explicitly accepted.
3. Confirm auth, policies, lifecycle, platform integration, tests, operations, migration, rollback, and audit evidence are complete.
4. Run deterministic boundary/document checks when available.
5. Ask for explicit release freeze approval.
6. Create frozen baseline only after approval.

**Why?** Vault release readiness is a security and operations gate.
