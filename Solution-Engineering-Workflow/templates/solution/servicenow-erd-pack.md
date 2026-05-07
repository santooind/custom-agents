# <Solution Name> ServiceNow ERD Pack

## 1. Status

- Status: `Draft | Ready For Review | Approved`
- Related Data Model:

## 2. Final Custom Model

```mermaid
erDiagram
  CUSTOM_TABLE {
    string sys_id PK
  }
```

## 3. Comprehensive Native And Custom Model

```mermaid
erDiagram
  sc_req_item {
    string sys_id PK
  }
  CUSTOM_TABLE {
    string sys_id PK
  }
```

## 4. Integration Flow Diagram

```mermaid
flowchart LR
  SNOW[ServiceNow] --> External[External System]
```

## 5. Model Evolution And Consistency

| Check | Status | Notes |
|---|---|---|
| Table count matches data model |  |  |

## 6. Open Questions

| ID | Question | Why It Matters | Blocks Approval |
|---|---|---|---|
| Q-001 |  |  | Yes |
