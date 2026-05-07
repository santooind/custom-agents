# Executive Architecture Review: HashiCorp Vault Self-Service Portal

**Reviewer:** Executive Architect  
**Date:** 1 April 2026  
**Scope:** Full review of Data Model evolution (v3.2 → v5.0), AID document (v1.0), and ERD diagrams against all 18 User Stories across 3 Epics.

---

## 1. Review Summary

| Area | Verdict | Notes |
|---|---|---|
| **Data Model v3.2 → v5.0 evolution** | **APPROVED with corrections** | Reduction from 10 → 6 tables is architecturally sound. Minor field gaps found. |
| **AID Document v1.0** | **APPROVED with corrections** | Good structure. Missing Terraform callback payload, RBAC matrix, and Terraform-to-Vault auth details. |
| **ERD Diagrams** | **APPROVED** | Accurately reflects the 6-table model. |

**Overall Assessment:** The architecture is production-worthy. The native-first ServiceNow approach is the correct strategic direction. The corrections below are refinements, not rearchitecture.

---

## 2. Data Model Review: v3.2 → v5.0

### 2.1. What Was Done Well

| Decision | Assessment |
|---|---|
| Consolidation of `vault_application` + `vault_sub_application` → single `vault_scope` | **Excellent.** Eliminates redundant hierarchy and reduces join complexity. The `u_is_sub_application` boolean with `u_normalized_name` is elegant. |
| Elimination of custom request tables (`vault_onboarding_request`, `vault_dynamic_access_request`) | **Excellent.** Using native `sc_req_item` with 7 custom fields is the correct ServiceNow pattern. Preserves approvals, SLAs, portal widgets, and activity streams for free. |
| Elimination of `vault_transaction_log` | **Correct.** IntegrationHub and Flow Designer provide native execution logs. A custom table for HTTP tracing is redundant. |
| Retention of `vault_audit_event` | **Correct.** Native `sys_audit` captures field-level changes but cannot represent structured business events. This table is essential for InfoSec reporting on integration actions (e.g., "who rotated which secret, with what correlation ID?"). |
| Addition of `vault_secret_metadata` | **Correct.** Without this, the static secrets portal page would need to call the Vault KV list API on every page load, which is a performance and security anti-pattern. |

### 2.2. Issues Found and Corrections Applied

| # | Issue | Severity | Location | Correction |
|---|---|---|---|---|
| **DM-1** | `x_att2_vault_secret_metadata` is missing fields that US_2.1, US_2.3, and US_2.4 explicitly require: `u_description`, `u_labels`, `u_deleted_by`, `u_deleted_on`, `u_last_rotated_by`, `u_last_rotated_on`. | **HIGH** | Table 5, Data Model | Added 6 fields to match the v3.2 secret_metadata schema that was proven correct. |
| **DM-2** | `x_att2_vault_audit_event` is missing fields required by US_2.5 for a complete audit trail: `u_resource_type`, `u_version`, `u_ip_address`, `u_timestamp`, `u_source_record`. | **HIGH** | Table 6, Data Model | Added 5 fields. Without `u_timestamp` the table is useless for chronological audit views. Without `u_version` there is no KV version tracking per event. |
| **DM-3** | `x_att2_vault_audit_event` lacks a documented Event Types choice list. US_2.5 and US_3.6 depend on specific event type values. | **MEDIUM** | Table 6, Data Model | Added the complete Event Types reference table. |
| **DM-4** | `x_att2_vault_scope` is missing `u_created_by` and `u_created_on` fields. Governance records must track provenance. | **LOW** | Table 1, Data Model | Added 2 fields. |
| **DM-5** | `x_att2_vault_scope_environment` is missing `u_vault_path` field. US_1.1 generates this artifact per environment and it must be persisted. | **Confirmed present.** | Table 2 | No change needed — field exists. |
| **DM-6** | `x_att2_vault_database_registry` is missing `u_owner_application` field present in v3.2, which is needed for ownership-based filtering. | **MEDIUM** | Table 3, Data Model | Not re-added. The database registry is intentionally owner-agnostic — ownership context comes from the requesting scope. This is correct in the native-first model. |
| **DM-7** | The `sys_properties` configuration inventory from v3.2 was dropped entirely in v5.0. | **MEDIUM** | Data Model | Re-added as a dedicated section in the final document. |

### 2.3. Parked Stories Alignment

| Parked Story | v5.0 Coverage | Assessment |
|---|---|---|
| US_1.4 (Secret Zero) | Acknowledged in Section 5 | **OK.** Fields will go on `scope_environment` or a new table when unparked. |
| US_1.5 (Rotation) | Acknowledged in Section 5 | **OK.** Depends on US_1.4. |
| US_3.4 (Lease Monitoring) | Acknowledged in Section 5 | **OK.** `vault_dynamic_lease` table is well-defined in v3.2. |
| US_3.7 (External Confirm) | Not mentioned | **OK.** Consolidated into US_3.5 — no data model impact. |
| US_3.8 (Anomaly Detection) | Not mentioned | **OK.** Depends on US_3.4. |

---

## 3. AID Document Review

### 3.1. What Was Done Well

| Decision | Assessment |
|---|---|
| Documenting the Static Secret exception to Terraform-first | **Excellent.** This is not an obvious design decision. Clear documentation prevents future teams from routing secrets through Terraform state. |
| The conceptual diagram with dual integration paths (Terraform + Direct Vault) | **Excellent.** Accurately reflects the two interaction patterns. |
| Including the Correlation ID strategy | **Excellent.** Critical for cross-system traceability. |
| Documenting the polling fallback | **Correct.** Ensures resilience when callbacks fail. |

### 3.2. Issues Found and Corrections Applied

| # | Issue | Severity | Correction |
|---|---|---|---|
| **AID-1** | Missing Terraform → ServiceNow callback payload. The AID shows the outbound payload but never defines what Terraform sends *back*. US_1.3 and US_3.3 define this explicitly. | **HIGH** | Added callback payload structure for both Onboarding and Dynamic Access. |
| **AID-2** | Missing ServiceNow → Vault authentication. Document covers SNOW→TF auth but never addresses how ServiceNow authenticates to Vault for direct KV API calls (Epic 2). | **HIGH** | Added Vault Connection & Credential Alias specification. |
| **AID-3** | The Terraform `main.tf` conceptual code in Use Case 2 is simplistic. It shows modifying an HCL template, but the real Terraform pattern is a module with input variables. | **MEDIUM** | Replaced with a more realistic module-based conceptual example. |
| **AID-4** | Section 3.1 lists 7 items for a "6-Table Data Model" (off-by-one because `sc_req_item` is native). | **LOW** | Fixed numbering to clarify native vs. custom. |
| **AID-5** | No RBAC matrix. US_2.1, US_2.5, US_3.1, US_3.5 define distinct role permissions. | **MEDIUM** | Added comprehensive RBAC matrix. |
| **AID-6** | Missing `sys_properties` configuration table. The AID doesn't document the configurable parameters that control integration behavior. | **MEDIUM** | Added configuration table. |
| **AID-7** | Missing the Onboarding use case payload for parent-app (non-sub-app). Only sub-app example is shown. | **LOW** | Added parent-app payload example. |

---

## 4. ERD Review

| Diagram | Status | Notes |
|---|---|---|
| ERD 1: v3.2 (10 tables) | **Accurate** | Correctly shows the complexity of the original model. |
| ERD 2: v5.0 (6 custom tables) | **Accurate** | All 6 tables present with correct relationships. |
| ERD 3: Comprehensive (custom + native) | **Accurate** | Shows `sc_req_item` interaction correctly. Minor: could show `sysapproval_approver` relationship for completeness. |

**No ERD corrections needed.** The diagrams in `DataModel_ERDs.md` are consistent with the final data model.

---

## 5. Cross-Document Consistency Check

| Check | v3.2 | v5.0 (Final) | AID | ERD | Consistent? |
|---|---|---|---|---|---|
| Table count | 10 | 6 | 6 | 6 | **YES** |
| Naming convention documented | Yes | Implicit | Yes (payload) | N/A | **YES** |
| Correlation ID strategy | Yes | Yes | Yes | N/A | **YES** |
| `sys_properties` inventory | Yes | **Missing** → Fixed | **Missing** → Fixed | N/A | **YES (after fix)** |
| Static Secret = Direct Vault API | Yes | Yes | Yes | N/A | **YES** |
| Onboarding/Dynamic = Terraform | Yes | Yes | Yes | N/A | **YES** |
| DBA approval for all dynamic access | Yes | Yes | Implicit | N/A | **YES** |
| Audit event types list | Yes (13 active) | **Missing** → Fixed | Partial | N/A | **YES (after fix)** |
| Callback payload structure | Yes (US_1.3, 3.3) | N/A | **Missing** → Fixed | N/A | **YES (after fix)** |

---

## 6. Final Recommendation

**APPROVED FOR DEVELOPMENT** with the corrections documented above and applied in the final deliverables:

1. **`final/ServiceNow_DataModel_Final.md`** — Complete, corrected v5.1 data model.
2. **`final/AID_ServiceNow_Terraform_Vault.md`** — Complete, corrected v1.1 AID.

The architecture is sound, strategically aligned, and ready for sprint planning.

---

*Signed: Executive Architect, 1 April 2026*
