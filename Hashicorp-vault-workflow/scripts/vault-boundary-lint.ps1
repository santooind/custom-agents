[CmdletBinding()]
param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $Target)) {
    Write-Error "Target not found: $Target"
    exit 2
}

if (-not (Get-Command rg -ErrorAction SilentlyContinue)) {
    Write-Error "This linter requires ripgrep (rg)."
    exit 2
}

$patterns = @(
    "vault_(kv_secret|generic_secret)",
    "data\s+`"vault_",
    "terraform output -raw",
    "nonsensitive\(",
    "(password|passwd|pwd)\s*=",
    "(token|secret|api_key|private_key)\s*="
)

$found = $false

foreach ($pattern in $patterns) {
    $matches = & rg -n --hidden `
        --glob '!**/.git/**' `
        --glob '!**/node_modules/**' `
        --glob '!**/vendor/**' `
        --glob '!**/dist/**' `
        --glob '!**/build/**' `
        --glob '!**/vault-boundary-lint.sh' `
        --glob '!**/vault-boundary-lint.ps1' `
        --glob '!**/vault-validation-script.sh' `
        --glob '!**/vault-validation-script.ps1' `
        $pattern $Target 2>$null

    if ($matches) {
        Write-Output "Potential Vault boundary concern: $pattern"
        $matches | ForEach-Object {
            $_ -replace "(=|:)\s*\S+", '$1 <redacted>'
        }
        $found = $true
    }
}

if ($found) {
    Write-Output "Review required: confirm no static secret payloads are persisted in source, Terraform state, generated files, or logs."
    exit 1
}

Write-Output "No obvious Vault boundary concerns found in: $Target"
