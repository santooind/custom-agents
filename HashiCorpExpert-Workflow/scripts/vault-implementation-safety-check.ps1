param(
    [string]$Target = "."
)

if (-not (Test-Path $Target)) {
    Write-Host "Target not found: $Target"
    exit 2
}

$rg = Get-Command rg -ErrorAction SilentlyContinue
if (-not $rg) {
    Write-Host "Implementation safety check requires ripgrep (rg)."
    exit 2
}

$patterns = @(
    "VAULT_TOKEN\s*[:=]\s*[^<\[`$][^\s]+",
    "VAULT_SECRET_ID\s*[:=]\s*[^<\[`$][^\s]+",
    "secret_id\s*[:=]\s*[""']?[A-Za-z0-9._/-]{8,}",
    "vault_(kv_secret|generic_secret)",
    "data\s+""vault_",
    "terraform\s+output\s+-raw",
    "set\s+-x",
    "printenv",
    "env\s*\|"
)

$found = $false
foreach ($pattern in $patterns) {
    $matches = & rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**' --glob '!**/examples/**' --glob '!**/docs/**' --glob '!**/schemas/**' --glob '!**/.github/agents/**' --glob '!**/.github/prompts/**' --glob '!**/.github/skills/**' --glob '!**/.github/hooks/**' --glob '!**/vault-implementation-safety-check.sh' --glob '!**/vault-implementation-safety-check.ps1' $pattern $Target 2>$null
    if ($matches) {
        Write-Host "Potential Vault implementation safety concern: $pattern"
        foreach ($match in $matches) {
            Write-Host ($match -replace "(=|:)\s*\S+", '$1 <redacted>')
        }
        $found = $true
    }
}

if ($found) {
    Write-Host "Implementation safety check failed. Review secret payloads, Terraform state boundaries, and log exposure risks."
    exit 1
}

Write-Host "Implementation safety check passed: $Target"
