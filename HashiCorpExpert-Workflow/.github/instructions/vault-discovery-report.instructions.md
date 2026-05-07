---
applyTo: "reports/vault-discovery-report.*"
---

# Vault Discovery Report Instructions

Reports must be safe for enterprise sharing.

## Redaction

- Never include actual secret values.
- Replace secret-looking values with `[REDACTED]`.
- Include key names, file path, line number, pattern type, and risk only when safe.
- Redact URLs containing credentials.
- Do not include private key material, certificates, tokens, passwords, client secrets, access keys, or database credentials.

## Evidence

Evidence entries must include:

- file path
- line number when available
- evidence type
- masked excerpt
- confidence score
- finding id

## Code Change Impact Matrix

Every report must include `Code Change Impact Matrix`.

For each finding, include impact rows when evidence supports a likely change. Each row must include:

- area
- file or component
- current pattern
- recommended change
- complexity
- runtime risk
- confidence

Use exact file paths when confidence is high. Use probable locations when confidence is medium. Mark assumptions when uncertain.

The report must also include:

- likely files impacted
- likely services/modules impacted
- startup/runtime impact likelihood
- refactoring likelihood
- backward compatibility concerns
- suggested migration sequence
- potential breaking areas

## Tone

Separate facts from assumptions. Use evidence-backed language such as "detected", "appears", "not found in scanned files", or "requires confirmation".

## JSON

JSON output must conform to `schemas/vault-discovery-report.schema.json`.
