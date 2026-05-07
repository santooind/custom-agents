# <Solution Name> ServiceNow Data Model

## 1. Status

- Status: `Draft | Needs Answers | Ready For Review | Approved | Frozen`
- Version:
- Related Design:

## 2. Design Philosophy

| ID | Principle | Impact |
|---|---|---|
| DMP-001 | Native-first ServiceNow model |  |
| DMP-002 | Metadata-only secret governance |  |

## 3. Table Inventory

### Custom Tables

| # | Table Name | Purpose | Justification |
|---|---|---|---|
| 1 |  |  |  |

### Native Tables Leveraged

| Table | Role | Notes |
|---|---|---|
| `sc_req_item` | Core request record |  |

## 4. Custom Table Schemas

### Table 1: `<table_name>`

| Column Name | Label | Data Type | Max Length | Nullable | Default | Reference | Unique Key / Index | Notes |
|---|---|---|---|---|---|---|---|---|
| `sys_id` | Sys ID | GUID | 32 | No | Auto |  | PK |  |

## 5. ACLs, Business Rules, And Configuration

| Type | ID | Target | Design |
|---|---|---|---|
| ACL | ACL-001 |  |  |
| Business Rule | BR-001 |  |  |
| sys_property | PROP-001 |  |  |

## 6. Flow Examples

| Flow | Record Changes | Audit Evidence |
|---|---|---|
| Onboarding |  |  |

## 7. Open Questions

| ID | Question | Why It Matters | Blocks Approval |
|---|---|---|---|
| Q-001 |  |  | Yes |
