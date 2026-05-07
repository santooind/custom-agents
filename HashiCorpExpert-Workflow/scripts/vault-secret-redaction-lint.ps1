param(
    [string]$Target = "reports"
)

if (-not (Test-Path $Target)) {
    Write-Host "Secret redaction lint: $Target not present; skipping."
    exit 0
}

$rg = Get-Command rg -ErrorAction SilentlyContinue
if (-not $rg) {
    Write-Host "Secret redaction lint requires ripgrep (rg)."
    exit 2
}

$patterns = @(
    "(password|passwd|pwd|token|secret|api[_-]?key|access[_-]?key|client[_-]?secret|private[_-]?key)\s*[:=]\s*[""']?[^""'\s<\[][^\r\n]*",
    "Authorization:\s*(Bearer|Basic)\s+[A-Za-z0-9+/._=-]{8,}",
    "-----BEGIN [A-Z ]*PRIVATE KEY-----"
)

$allowed = "(\[REDACTED\]|<redacted>|<[^>]+>|\$\{[^}]+\}|REDACTED|placeholder|example|sample|optional|not included)"
$found = $false

foreach ($pattern in $patterns) {
    $matches = & rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**' $pattern $Target 2>$null
    foreach ($match in $matches) {
        if ($match -notmatch $allowed) {
            Write-Host "Potential unredacted secret-like content found:"
            Write-Host ($match -replace "(:|=)\s*\S+", '$1 <redacted>')
            $found = $true
        }
    }
}

if ($found) {
    Write-Host "Secret redaction lint failed. Replace values with [REDACTED] or placeholders."
    exit 1
}

Write-Host "Secret redaction lint passed: $Target"

