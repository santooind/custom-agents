[CmdletBinding()]
param(
    [string]$Event = "Unknown"
)

$ErrorActionPreference = "Stop"

$logDir = "docs/vault"
$logFile = Join-Path $logDir "workflow-audit.log"

New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
Add-Content -LiteralPath $logFile -Value "$timestamp`t$Event"

$null = [Console]::In.ReadToEnd()
Write-Output '{"continue":true}'
