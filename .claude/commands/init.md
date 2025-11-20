# CodBO7 Backend API - Development Standards & Guidelines

This document outlines the MANDATORY standards, patterns, and rules for developing the CodBO7 Backend API. **READ THIS FIRST** before making any changes to the codebase.

---

## ⚠️ CRITICAL RULE - NEVER FORGET! ⚠️

### When Creating ANY New Table:

**YOU MUST IMMEDIATELY ADD AN ENTRY TO `data_versions` TABLE!**

```sql
-- Step 1: Create your table
CREATE TABLE `your_new_table` (...);

-- Step 2: Insert your data
INSERT INTO `your_new_table` (...) VALUES (...);

-- Step 3: ⚠️ MANDATORY - Add to data_versions ⚠️
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`)
VALUES ('your_new_table', 1, 1, CURRENT_TIMESTAMP, 'Brief description');
```

**Without this entry:**
- ❌ The table won't appear in `/api/version` endpoint
- ❌ The table won't appear in `/api/data/all` endpoint
- ❌ Mobile apps won't know the table exists
- ❌ Version tracking won't work

**This is NOT optional. Every single table must be in `data_versions`.**

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Database Standards](#database-standards)
3. [API Endpoint Patterns](#api-endpoint-patterns)
4. [Type Conversion Rules](#type-conversion-rules)
5. [Data Versioning System](#data-versioning-system)
6. [Naming Conventions](#naming-conventions)
7. [Common Mistakes to Avoid](#common-mistakes-to-avoid)

---

## Project Overview

**Purpose:** Call of Duty: Black Ops 7 Companion API providing game data for mobile/web apps

**Tech Stack:**
- PHP 8+ (Backend)
- MySQL 8+ (Database)
- JSON REST API

**Key Features:**
- Two-tier versioning system (data version + schema version)
- GeoJSON support for interactive maps
- Dynamic schema updates without app deployment
- Structured data for multiplayer & zombies modes

---

## Database Standards

### Table Structure Requirements

#### 1. Primary Keys
- **ALWAYS** use `id INT NOT NULL AUTO_INCREMENT PRIMARY KEY` for main entity tables
- Exception: `data_versions` table uses `category VARCHAR(50) PRIMARY KEY`

#### 2. Character Encoding
- **MUST** use: `CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`
- This applies to ALL VARCHAR, TEXT, and ENUM fields

#### 3. Engine
- **MUST** use: `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;`

#### 4. Common Field Types

| Field Purpose | Type | Example |
|---------------|------|---------|
| ID (Primary Key) | `INT NOT NULL AUTO_INCREMENT` | `id` |
| Name/Identifier | `VARCHAR(50-100) NOT NULL` | `name`, `display_name` |
| Description | `TEXT NOT NULL` | `description`, `effect_description` |
| URL/Path | `VARCHAR(150-255) NOT NULL` | `icon_url`, `image_url` |
| Boolean | `TINYINT(1) NOT NULL` | `zombie_playable`, `is_new` |
| Integer Value | `INT NOT NULL` | `unlock_level`, `sort_order` |
| Float/Decimal | `DECIMAL(10,2)` or `FLOAT` | `coord_x`, `coord_y` |
| Enum | `ENUM('Value1','Value2')` | `rarity`, `pattern` |
| JSON Data | `JSON` or `TEXT` | `bounds`, `properties` |
| Timestamp | `TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | `last_updated` |

#### 5. Nullable vs NOT NULL
- **NOT NULL:** Required game data fields (name, description, icon_url)
- **NULL allowed:** Optional fields (doa4_effect, duration, synergy)

#### 6. Field Ordering Pattern
```sql
CREATE TABLE `example_table` (
  `id` INT NOT NULL AUTO_INCREMENT,           -- Always first
  `name` VARCHAR(100) NOT NULL,               -- Identifier
  `display_name` VARCHAR(100) NOT NULL,       -- Human-readable name
  -- Category/classification fields
  -- Numeric values (costs, levels)
  -- Text fields (descriptions)
  -- URLs (icon_url, image_url)
  -- Boolean flags
  -- Sort/order fields
  `sort_order` INT NOT NULL,                  -- Often last
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

---

## API Endpoint Patterns

### Standard Response Format

#### Success Response
```json
{
  "success": true,
  "data": { /* actual data */ },
  "message": null
}
```

#### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "details": "Optional debug info"
}
```

### Endpoints Structure

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/` | GET | API info & available endpoints |
| `/api/version` | GET | Get all data/schema versions |
| `/api/schema/all` | GET | Get ALL table schemas |
| `/api/schema/{table}` | GET | Get specific table schema |
| `/api/data/all` | GET | Get ALL table data |
| `/api/data/{table}` | GET | Get specific table data |
| `/api/maps/all` | GET | Get all maps with GeoJSON |
| `/api/maps/{mapName}` | GET | Get specific map with GeoJSON |

### URL Naming
- Use **snake_case** for table names and endpoints
- Examples: `game_modes`, `combat_specialties`, `perk_a_cola`

---

## Type Conversion Rules

### CRITICAL: PHP Type Conversions

**WHY:** PHP PDO returns all MySQL data as strings by default. The API MUST convert numeric/boolean values to proper JSON types.

### Automatic Conversions in `data.php`

#### Universal Conversions (All Tables)
```php
$row['id'] = (int)$row['id'];  // ALWAYS convert id to integer
```

#### Table-Specific Conversions

**Always check `/api/endpoints/data.php` for the complete list!**

Common patterns:

| Table Type | Fields to Convert | Conversion |
|------------|-------------------|------------|
| All tables | `id` | `(int)` |
| Data Versions | `version`, `schema_version` | `(int)` |
| Boolean flags | `zombie_playable`, `is_new`, `is_face_off`, `has_scorestreaks`, `has_respawns`, `is_hardcore_available`, `available_multiplayer`, `available_zombies`, `recyclable` | `(int)` |
| Integers | `slot`, `unlock_level`, `sort_order`, `score_cost`, `essence_value` | `(int)` |
| Foreign Keys | `map_id`, `perk_id`, `ammo_mod_id`, `field_upgrade_id`, `gobblegum_id` | `(int)` |
| Coordinates | `coord_x`, `coord_y` | `(float)` |
| Map Tiles | `zoom_level`, `tile_x`, `tile_y` | `(int)` |
| JSON Fields | `bounds`, `properties` | `json_decode($value, true)` |

### IMPORTANT: When Adding a New Table

**YOU MUST:**
1. Add conversion logic in `data.php` for both `/data/all` and `/data/{table}` sections
2. Test the JSON output to verify correct types
3. Update API.md documentation if needed

**Example for new table `my_table`:**
```php
case 'my_table':
    if (isset($row['my_int_field'])) {
        $row['my_int_field'] = (int)$row['my_int_field'];
    }
    if (isset($row['my_bool_field'])) {
        $row['my_bool_field'] = (int)$row['my_bool_field'];
    }
    break;
```

---

## Data Versioning System

### Two-Tier Versioning

Every table is tracked in the `data_versions` table with TWO version numbers:

#### 1. Data Version (`version`)
- Increments when **data** changes (INSERT/UPDATE/DELETE)
- Tells apps: "You need to re-fetch this data"

```sql
-- After modifying data in operators table:
UPDATE data_versions SET version = version + 1 WHERE category = 'operators';
```

#### 2. Schema Version (`schema_version`)
- Increments when **table structure** changes (ALTER TABLE)
- Tells apps: "You need to update your local database schema"

```sql
-- After adding a new column to operators table:
UPDATE data_versions SET schema_version = schema_version + 1 WHERE category = 'operators';
```

### MANDATORY: Update data_versions

**After ANY data change:**
```sql
-- Always update last_updated timestamp and version
UPDATE data_versions
SET version = version + 1,
    last_updated = CURRENT_TIMESTAMP
WHERE category = 'your_table_name';
```

**After ANY schema change:**
```sql
UPDATE data_versions
SET schema_version = schema_version + 1,
    last_updated = CURRENT_TIMESTAMP
WHERE category = 'your_table_name';
```

### Adding a New Table Checklist

When creating a new table:

1. ✅ Create table with proper structure
2. ✅ Add INSERT statements for data
3. ✅ **MUST** add entry to `data_versions`:
```sql
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`)
VALUES ('your_table_name', 1, 1, CURRENT_TIMESTAMP, 'Brief description of table purpose');
```
4. ✅ Add type conversions to `data.php` (both sections!)
5. ✅ Test endpoints: `/api/data/your_table_name` and `/api/data/all`
6. ✅ Update API.md documentation (if public-facing)

---

## Naming Conventions

### Database Tables
- **snake_case** (lowercase with underscores)
- Plural for entity tables: `operators`, `perks`, `game_modes`
- Singular for relationship/config tables: `data_versions`
- Descriptive suffixes: `_mp` (multiplayer), `_zm` (zombies)

### Database Columns
- **snake_case** (lowercase with underscores)
- Examples: `display_name`, `unlock_level`, `icon_url`, `coord_x`

### Field Name Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| `name` | Internal identifier (URL-safe) | `gung_ho`, `team_deathmatch` |
| `display_name` | Human-readable name | `Gung Ho`, `Team Deathmatch` |
| `description` | Main description field | Full text description |
| `icon_url` | Path to icon/image | `/assets/perks_mp/gung_ho.webp` |
| `image_url` | Path to larger image | `/assets/operators/50_50.webp` |
| `unlock_level` | Required level | `0` (default), `18`, `54` |
| `unlock_label` | Display text | `Default`, `Level 18` |
| `sort_order` | Display ordering | `1`, `2`, `3`... |
| `*_id` | Foreign key reference | `map_id`, `perk_id` |

### API Response Fields (camelCase)
When converting database fields to API responses (like GeoJSON):
- Use **camelCase** for JavaScript/JSON compatibility
- Examples: `displayName`, `baseImageUrl`, `defaultVisible`, `hideOnLoad`

---

## Common Mistakes to Avoid

### ❌ MISTAKE #1: Adding Rows to Wrong Table
**Example:** Adding `gobblegums` and `gobblegum_tips` entries to the `wildcards` table

**WHY IT HAPPENS:** Copy-paste errors in SQL INSERT statements

**SOLUTION:**
1. **ALWAYS** verify the table name in the INSERT statement
2. **ALWAYS** count the columns vs values
3. If INSERT has 8 columns, EVERY row must have exactly 8 values

```sql
-- ❌ WRONG - Only 5 values for 8 columns
INSERT INTO `wildcards` (...8 columns...) VALUES
('gobblegums', 1, 1, '2025-11-20 00:00:00', 'Description');

-- ✅ CORRECT - 8 values for 8 columns
INSERT INTO `wildcards` (...8 columns...) VALUES
(1, 'tac_expert', 'Tac Expert', 15, 'Level 15', 'Spawn with...', '/assets/...', 1);
```

### ❌ MISTAKE #2: Forgetting Type Conversions
**Example:** Adding a new table but not updating `data.php`

**SOLUTION:**
- **ALWAYS** add type conversion logic in TWO places in `data.php`:
  - Section 1: `/api/data/all` (inside the `foreach` loop)
  - Section 2: `/api/data/{table}` (standalone table query)

### ❌ MISTAKE #3: Not Updating data_versions
**Example:** Adding new data but forgetting to increment version

**SOLUTION:**
- **ALWAYS** update `data_versions` after data or schema changes
- Apps rely on this to know when to sync

### ❌ MISTAKE #4: Inconsistent Character Encoding
**Example:** Using `utf8` instead of `utf8mb4`

**SOLUTION:**
- **ALWAYS** use `utf8mb4` with `utf8mb4_unicode_ci` collation
- This supports emoji and international characters

### ❌ MISTAKE #5: Missing NOT NULL on Required Fields
**Example:** Making `icon_url` nullable when all entities need icons

**SOLUTION:**
- Use `NOT NULL` for required game data
- Use `NULL` only for truly optional fields (like `doa4_effect`)

### ❌ MISTAKE #6: Wrong Field Types for Booleans
**Example:** Using `BOOLEAN` or `BIT` instead of `TINYINT(1)`

**SOLUTION:**
- **ALWAYS** use `TINYINT(1)` for boolean flags
- **ALWAYS** convert to `(int)` in PHP for JSON output

### ❌ MISTAKE #7: Incorrect JSON Field Handling
**Example:** Returning JSON as string instead of object

**SOLUTION:**
```php
// ❌ WRONG - Returns string
$row['bounds'] = $row['bounds'];

// ✅ CORRECT - Returns object/array
$row['bounds'] = json_decode($row['bounds'], true);
```

---

## Table Categories Reference

### Multiplayer Tables
- `game_modes` - Game mode definitions
- `operators` - Playable characters
- `perks` - Perk system (3 slots)
- `combat_specialties` - Perk combinations
- `wildcards` - Loadout wildcards
- `scorestreaks` - Scorestreak rewards
- `tacticals_mp` - Tactical equipment
- `lethals` - Lethal equipment
- `field_upgrades` - Field upgrade abilities

### Zombies Tables
- `perk_a_cola` - Perk-a-Cola machines
- `perk_a_cola_augments` - Perk augments/upgrades
- `ammo_mods` - Ammo modification system
- `ammo_mod_augments` - Ammo mod upgrades
- `field_upgrades_zm` - Zombies field upgrades
- `field_upgrade_zm_augments` - Field upgrade augments
- `power_ups` - Power-up pickups
- `gobblegums` - GobbleGum consumables
- `gobblegum_tips` - GobbleGum strategies

### Map Tables
- `maps` - Map base data
- `map_layers` - Overlay layers (DOM, HP zones)
- `map_markers` - Interactive markers (GeoJSON)
- `map_tiles` - Tiled map images for zombies

### System Tables
- `data_versions` - Version tracking
- `icons` - Shared icons/emblems

---

## SQL Validation Checklist

Before committing SQL changes:

- [ ] All tables use `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci`
- [ ] All VARCHAR/TEXT/ENUM fields use `CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`
- [ ] All INSERT statements have matching column count and value count
- [ ] All tables with data have an entry in `data_versions`
- [ ] All boolean fields use `TINYINT(1)` type
- [ ] All foreign keys use proper naming (`*_id`)
- [ ] All type conversions added to `data.php`
- [ ] Test query runs without errors
- [ ] JSON output has correct types (not all strings)

---

## Quick Reference: Adding New Zombies Table

Example: Adding `wonder_weapons` table

```sql
-- 1. Create table
CREATE TABLE `wonder_weapons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` INT NOT NULL,
  `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Insert data
INSERT INTO `wonder_weapons` (`id`, `name`, `display_name`, `unlock_level`, `description`, `icon_url`, `sort_order`) VALUES
(1, 'ray_gun', 'Ray Gun', 1, 'Classic wonder weapon', '/assets/weapons/ray_gun.webp', 1);

-- 3. Add to data_versions
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`)
VALUES ('wonder_weapons', 1, 1, CURRENT_TIMESTAMP, 'Zombies wonder weapons');

-- 4. Add to data.php (both sections!)
-- Section 1: /data/all
case 'wonder_weapons':
    if (isset($row['unlock_level'])) {
        $row['unlock_level'] = (int)$row['unlock_level'];
    }
    if (isset($row['sort_order'])) {
        $row['sort_order'] = (int)$row['sort_order'];
    }
    break;

-- Section 2: /data/{table} - add same conversions after line ~365

-- 5. Test
curl https://codbo7.masoombadi.top/api/data/wonder_weapons
curl https://codbo7.masoombadi.top/api/data/all
```

---

## Final Reminders

1. **ALWAYS** read this document before making database changes
2. ⚠️ **ALWAYS** add new tables to `data_versions` table - NO EXCEPTIONS! ⚠️
3. **ALWAYS** test SQL queries before committing
4. **ALWAYS** count INSERT statement values vs columns
5. **ALWAYS** add type conversions to `data.php` (both sections!)
6. **ALWAYS** use proper character encoding (`utf8mb4`)
7. **NEVER** add data to wrong tables (check table name!)
8. **NEVER** skip version updates after data/schema changes
9. **NEVER** forget type conversions for new tables

---

## Resources

- Full API Documentation: `/API.md`
- Schema Documentation: `/SCHEMA.md`
- Database File: `/database/joziedti_codbo7.sql`
- Data Endpoint: `/api/endpoints/data.php`
- Schema Endpoint: `/api/endpoints/schema.php`

---

**Last Updated:** 2025-11-20
**Version:** 1.0
