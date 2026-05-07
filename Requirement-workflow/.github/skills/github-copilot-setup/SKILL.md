---
name: github-copilot-setup
description: "Design, configure, and review GitHub Copilot custom instructions, prompt files, custom agents, agent skills, hooks, and workspace settings. Use when asked to create GitHub Copilot workflows or best-practice AI repo setup."
argument-hint: "[repository customization goal]"
---

# GitHub Copilot Setup

Use this skill to configure a repository for GitHub Copilot assisted work.

## Decision Guide

- Use `.github/copilot-instructions.md` for always-on repository rules.
- Use `.github/instructions/*.instructions.md` for file-specific guidance.
- Use `.github/prompts/*.prompt.md` for reusable slash-command tasks.
- Use `.github/agents/*.agent.md` for role-specific personas with tool constraints and handoffs.
- Use `.github/skills/<skill-name>/SKILL.md` for portable procedures, examples, and scripts.
- Use `.github/hooks/*.json` for deterministic lifecycle automation such as audit logging, validation, or formatting.
- Use `AGENTS.md` when multiple AI tools should share common workspace rules.

## Review Checklist

- Names are short and descriptive.
- Instructions are scoped to the right customization type.
- Agents have clear role boundaries.
- Skills include when-to-use descriptions and referenced resources.
- Hooks are minimal, auditable, and safe.
- Preview settings are documented in `.vscode/settings.json`.
- The README explains how users should invoke the workflow.
