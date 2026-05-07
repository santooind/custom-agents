[CmdletBinding()]
param(
    [string]$File
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($File) -or -not (Test-Path -LiteralPath $File -PathType Leaf)) {
    Write-Error "Usage: ./scripts/vault-doc-lint.ps1 docs/vault/<file>.md"
    exit 2
}

$content = Get-Content -LiteralPath $File -Raw
$required = New-Object System.Collections.Generic.List[string]
$required.Add("## Status")
$required.Add("## Open Questions")

if ($content.Contains("## Pattern Decision Matrix") -and $content.Contains("## Discovery Checklist")) {
    if ($content.Contains("## Required Code And Config Changes")) {
        @(
            "## Codebase Evidence",
            "## Current Secret Handling",
            "## Secret Inventory Metadata",
            "## Risk Findings",
            "## Recommended Vault Pattern",
            "## Pattern Decision Matrix",
            "## Vault Design Inputs",
            "## Required Code And Config Changes",
            "## Discovery Checklist"
        ) | ForEach-Object { $required.Add($_) }
    }
    else {
        @(
            "## Codebase Evidence",
            "## Current Secret Handling",
            "## Secret Inventory Metadata",
            "## Recommended Vault Pattern",
            "## Pattern Decision Matrix",
            "## Risk Findings",
            "## Discovery Checklist"
        ) | ForEach-Object { $required.Add($_) }
    }
}

if ($File -like "*.implementation-plan.md" -or $File -like "*vault-implementation-plan.md") {
    @(
        "## Selected Pattern",
        "## Change Plan",
        "## Vault Platform Changes",
        "## Failure Behavior",
        "## Validation Results",
        "## Rollback Plan",
        "## Release Checklist"
    ) | ForEach-Object { $required.Add($_) }
}
elseif ($File -like "*.test-cases.md" -or $File -like "*vault-test-cases.md") {
    @(
        "## Test Environments",
        "## Test Cases",
        "## Automation Commands",
        "## Manual Evidence",
        "## Exit Criteria"
    ) | ForEach-Object { $required.Add($_) }
}

$missing = $false
foreach ($heading in $required) {
    if (-not $content.Contains($heading)) {
        Write-Output "Missing required heading: $heading"
        $missing = $true
    }
}

if ($content -match "(?i)(password|token|secret|api[_-]?key)\s*[:=]\s*[^<\s]\S{5,}") {
    Write-Output "Potential unredacted secret-like assignment found in document: $File"
    $missing = $true
}

if ($missing) {
    exit 1
}

Write-Output "Vault document structure looks valid: $File"
