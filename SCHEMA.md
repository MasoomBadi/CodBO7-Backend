# Database Schema Documentation

## Tables Overview

### 1. data_versions
**Purpose:** Track version numbers for each data category to enable efficient sync

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| category | VARCHAR(50) | PRIMARY KEY | Data category name |
| version | INT UNSIGNED | NOT NULL, DEFAULT 1 | Data version number (increments on data changes) |
| schema_version | INT UNSIGNED | NOT NULL, DEFAULT 1 | Schema version number (increments on schema changes) |
| last_updated | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last modification timestamp |
| description | VARCHAR(255) | NULL | Category description |

**Indexes:**
- PRIMARY KEY on `category`

**Initial Data:**
- `operators` - Playable characters (version 1, schema_version 1)
- `icons` - Icons and emblems (version 1, schema_version 1)

---

### 2. operators
**Purpose:** Store playable character information

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique operator ID |
| short_name | VARCHAR(50) | NOT NULL | Short name of the operator |
| full_name | VARCHAR(50) | NOT NULL | Full name of the operator |
| nationality | VARCHAR(50) | NOT NULL | Operator's nationality |
| divison | VARCHAR(10) | NOT NULL | Division/faction |
| zombie_playable | TINYINT(1) | NOT NULL | Whether playable in zombies (0=no, 1=yes) |
| description | VARCHAR(500) | NOT NULL | Operator description |
| unlock_criteria | VARCHAR(50) | NOT NULL | How to unlock this operator |
| image_url | VARCHAR(50) | NOT NULL | URL to operator image |

**Indexes:**
- PRIMARY KEY on `id`

---

### 3. icons
**Purpose:** Store icons and emblems

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique icon ID |
| category | VARCHAR(50) | NOT NULL | Icon category |
| name | VARCHAR(50) | NOT NULL | Icon name |
| icon_url | VARCHAR(150) | NOT NULL | URL to icon image |

**Indexes:**
- PRIMARY KEY on `id`

---

## Version Management

### Two-Tier Versioning System

**1. Data Version (`version`)** - Increments when data changes:
- New records added
- Existing records updated
- Records deleted

```sql
-- After adding/updating/deleting operators data
UPDATE data_versions SET version = version + 1 WHERE category = 'operators';

-- After adding/updating/deleting icons data
UPDATE data_versions SET version = version + 1 WHERE category = 'icons';
```

**2. Schema Version (`schema_version`)** - Increments when schema changes:
- New fields added to table
- Field types modified
- Fields removed or renamed

```sql
-- After modifying operators table structure
UPDATE data_versions SET schema_version = schema_version + 1 WHERE category = 'operators';

-- After modifying icons table structure
UPDATE data_versions SET schema_version = schema_version + 1 WHERE category = 'icons';
```

### Android App Integration

1. Check `version` - if changed, fetch new data
2. Check `schemaVersion` - if changed, fetch new schema and update Realm models dynamically
3. This enables dynamic schema management without requiring app updates
