# Database Schema Documentation

## Tables Overview

### data_versions
**Purpose:** Track version numbers for each data category to enable efficient sync

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| category | VARCHAR(50) | PRIMARY KEY | Data category name |
| version | INT UNSIGNED | NOT NULL, DEFAULT 1 | Version number (max: 4,294,967,295) |
| last_updated | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last modification timestamp |
| description | VARCHAR(255) | NULL | Category description |

**Indexes:**
- PRIMARY KEY on `category`

**Initial Data:**
- `operators` - Playable characters (version 1)

---

## Version Management

When you update data in any category, increment the version:

```sql
UPDATE data_versions SET version = version + 1 WHERE category = 'operators';
```

This allows your Android app to detect changes and sync only updated data.
