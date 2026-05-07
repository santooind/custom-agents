[CmdletBinding()]
param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $Target)) {
    Write-Error "Target not found: $Target"
    exit 2
}

Write-Output "Running Vault integration validation against: $Target"

$status = 0

function Check-Pattern {
    param(
        [string]$Label,
        [string]$Pattern
    )

    if (Get-Command rg -ErrorAction SilentlyContinue) {
        $matches = & rg -n --hidden `
            --glob '!**/.git/**' `
            --glob '!**/vault-boundary-lint.sh' `
            --glob '!**/vault-boundary-lint.ps1' `
            --glob '!**/vault-validation-script.sh' `
            --glob '!**/vault-validation-script.ps1' `
            $Pattern $Target 2>$null
    }
    else {
        $matches = Select-String -Path (Join-Path $Target "*") -Pattern $Pattern -Recurse -ErrorAction SilentlyContinue
    }

    if ($matches) {
        Write-Output "Review required: $Label"
        $matches | ForEach-Object {
            "$_" -replace "(=|:)\s*\S+", '$1 <redacted>'
        }
        $script:status = 1
    }
}

Check-Pattern "Terraform may be managing Vault secret payloads" "vault_(kv_secret|generic_secret)"
Check-Pattern "Terraform Vault data source may read secrets into state" "data\s+`"vault_"
Check-Pattern "Potential hardcoded password assignment" "(password|passwd|pwd)\s*="
Check-Pattern "Potential hardcoded token assignment" "(token|secret|api_key|private_key)\s*="
Check-Pattern "Potential environment dump risk" "printenv|env\s*\||process\.env|System\.getenv"

if ($status -ne 0) {
    Write-Output "Vault validation found review items. Confirm no secret payloads are exposed or persisted."
    exit 1
}

Write-Output "Vault validation completed with no obvious boundary concerns."
