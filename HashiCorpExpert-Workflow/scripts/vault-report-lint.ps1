param(
    [Parameter(Mandatory = $true)][string]$Report,
    [string]$Type = "generic"
)

if (-not (Test-Path $Report)) {
    Write-Host "Report lint: $Report not present; skipping."
    exit 0
}

switch ($Type) {
    "discovery" {
        $sections = @(
            "## Executive Summary",
            "## Repository Details",
            "## Technology Stack",
            "## Deployment Model",
            "## Secret Inventory",
            "## Current Secret Handling",
            "## Risk Findings",
            "## Code Change Impact Matrix",
            "## Recommended Vault Pattern",
            "## Effort Estimation",
            "## Suggested Migration Sequence",
            "## Potential Breaking Areas",
            "## Open Questions",
            "## Migration Complexity Score",
            "## Evidence Appendix"
        )
    }
    "pattern" {
        $sections = @(
            "## Executive Decision",
            "## Input Reports Used",
            "## Ranked Pattern Recommendation",
            "## Rank 1 Target Pattern",
            "## Rank 2 Fallback Pattern",
            "## Pattern Scorecard",
            "## Rejected Patterns",
            "## Final Recommendation"
        )
    }
    "migration" {
        $sections = @(
            "## 1. Executive Summary",
            "## 2. Inputs Reviewed",
            "## 3. Selected Vault Pattern",
            "## 5. Secret Mapping Plan",
            "## 6. Code Change Plan",
            "## 9. Implementation Sequence",
            "## 10. Minimum Test Plan",
            "## 11. Rollback Plan",
            "## 13. Risk Register",
            "## 15. Implementation Readiness"
        )
    }
    "implementation" {
        $sections = @(
            "## Executive Summary",
            "## Inputs Reviewed",
            "## Approval And Scope",
            "## Selected Pattern",
            "## Skills Applied",
            "## Files Changed",
            "## Secret Safety Controls",
            "## Validation Performed",
            "## Rollback Notes",
            "## Next Steps"
        )
    }
    "validation" {
        $sections = @(
            "## 1. Executive Summary",
            "## 2. Inputs Reviewed",
            "## 3. Impacted Files Reviewed",
            "## 4. Affected Flows",
            "## 5. Minimal Test Plan",
            "## 6. Tests Executed",
            "## 7. Tests Not Executed",
            "## 8. Tests Blocked",
            "## 9. Build Validation",
            "## 10. Vault-Specific Validation",
            "## 12. Merge Readiness",
            "## 13. Manual Validation Checklist",
            "## 14. Required Manual Validation",
            "## 15. Risk-Based Recommendation"
        )
    }
    "security" {
        $sections = @(
            "## 1. Executive Summary",
            "## 2. Inputs Reviewed",
            "## 3. Diff Security Scope",
            "## 4. Security Control Checklist",
            "## 5. Secret Exposure Review",
            "## 6. Vault Auth Review",
            "## 7. Vault Policy And Path Review",
            "## 8. Runtime Safety Review",
            "## 9. CI/CD And Terraform Safety Review",
            "## 10. Rollback Security Review",
            "## 11. Findings",
            "## 12. Open Security Questions",
            "## 13. Merge Security Decision",
            "## 14. Human Approval Checklist",
            "## 15. Final Recommendation"
        )
    }
    default {
        $sections = @("## Executive Summary")
    }
}

$content = Get-Content -Raw -Path $Report
$missing = $false
foreach ($section in $sections) {
    if ($content -notlike "*$section*") {
        Write-Host "Missing required section in ${Report}: $section"
        $missing = $true
    }
}

if ($missing) {
    Write-Host "Report lint failed: $Report"
    exit 1
}

Write-Host "Report lint passed: $Report"
