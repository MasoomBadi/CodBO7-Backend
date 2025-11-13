# Database Schema Documentation

## Tables Overview

### 1. data_versions
**Purpose:** Track version numbers for each data category to enable efficient sync

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| category | VARCHAR(50) | PRIMARY KEY | Data category name (e.g., 'weapons', 'maps') |
| version | INT UNSIGNED | NOT NULL, DEFAULT 1 | Version number (max: 4,294,967,295) |
| last_updated | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last modification timestamp |
| description | VARCHAR(255) | NULL | Category description |

**Indexes:**
- PRIMARY KEY on `category`

---

### 2. weapons
**Purpose:** Store weapon statistics and details

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique weapon ID |
| name | VARCHAR(100) | NOT NULL | Weapon name |
| category | ENUM | NOT NULL | Weapon category |
| unlock_level | INT UNSIGNED | DEFAULT 0 | Level required to unlock |
| damage_range_min | INT UNSIGNED | NULL | Minimum damage value |
| damage_range_max | INT UNSIGNED | NULL | Maximum damage value |
| fire_rate | INT UNSIGNED | NULL | Rate of fire (RPM) |
| magazine_size | INT UNSIGNED | NULL | Magazine capacity |
| reload_time | DECIMAL(4,2) | NULL | Reload time in seconds |
| ads_time | DECIMAL(4,2) | NULL | Aim down sight time in seconds |
| mobility | INT UNSIGNED | NULL | Mobility stat (0-100) |
| range_value | INT UNSIGNED | NULL | Range stat (0-100) |
| accuracy | INT UNSIGNED | NULL | Accuracy stat (0-100) |
| control | INT UNSIGNED | NULL | Control stat (0-100) |
| description | TEXT | NULL | Weapon description |
| image_url | VARCHAR(255) | NULL | URL to weapon image |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for category:**
- 'Assault Rifle'
- 'SMG'
- 'LMG'
- 'Sniper'
- 'Marksman'
- 'Shotgun'
- 'Pistol'
- 'Melee'
- 'Launcher'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `category`
- INDEX on `is_active`

---

### 3. maps
**Purpose:** Store map information and callouts

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique map ID |
| name | VARCHAR(100) | NOT NULL | Map name |
| mode | ENUM | DEFAULT 'Multiplayer' | Game mode |
| size | ENUM | DEFAULT 'Medium' | Map size |
| description | TEXT | NULL | Map description |
| image_url | VARCHAR(255) | NULL | URL to map image |
| minimap_url | VARCHAR(255) | NULL | URL to minimap image |
| tips | TEXT | NULL | Strategy tips |
| callouts | JSON | NULL | Map callouts in JSON format |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for mode:**
- 'Multiplayer'
- 'Zombies'
- 'Warzone'
- 'All'

**ENUM Values for size:**
- 'Small'
- 'Medium'
- 'Large'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `mode`
- INDEX on `is_active`

---

### 4. perks
**Purpose:** Store perk descriptions and effects

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique perk ID |
| name | VARCHAR(100) | NOT NULL | Perk name |
| slot | ENUM | NOT NULL | Perk slot |
| unlock_level | INT UNSIGNED | DEFAULT 0 | Level required to unlock |
| description | TEXT | NOT NULL | Perk description |
| effect | TEXT | NULL | Detailed effect description |
| image_url | VARCHAR(255) | NULL | URL to perk image |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for slot:**
- 'Perk 1'
- 'Perk 2'
- 'Perk 3'
- 'Perk Greed'
- 'Wildcard'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `slot`
- INDEX on `is_active`

---

### 5. equipment
**Purpose:** Store equipment and tactical items

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique equipment ID |
| name | VARCHAR(100) | NOT NULL | Equipment name |
| type | ENUM | NOT NULL | Equipment type |
| unlock_level | INT UNSIGNED | DEFAULT 0 | Level required to unlock |
| description | TEXT | NOT NULL | Equipment description |
| damage | INT UNSIGNED | NULL | Damage value |
| effect_duration | DECIMAL(4,2) | NULL | Effect duration in seconds |
| cooldown_time | DECIMAL(5,2) | NULL | Cooldown time in seconds |
| image_url | VARCHAR(255) | NULL | URL to equipment image |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for type:**
- 'Lethal'
- 'Tactical'
- 'Field Upgrade'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `type`
- INDEX on `is_active`

---

### 6. scorestreaks
**Purpose:** Store scorestreak information

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique scorestreak ID |
| name | VARCHAR(100) | NOT NULL | Scorestreak name |
| score_required | INT UNSIGNED | NOT NULL | Score required to earn |
| unlock_level | INT UNSIGNED | DEFAULT 0 | Level required to unlock |
| description | TEXT | NOT NULL | Scorestreak description |
| duration | DECIMAL(5,2) | NULL | Duration in seconds |
| usage_tips | TEXT | NULL | Usage tips |
| image_url | VARCHAR(255) | NULL | URL to scorestreak image |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `score_required`
- INDEX on `is_active`

---

### 7. guides
**Purpose:** Store player guides and tips

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique guide ID |
| title | VARCHAR(200) | NOT NULL | Guide title |
| category | ENUM | NOT NULL | Guide category |
| content | TEXT | NOT NULL | Guide content |
| author | VARCHAR(100) | DEFAULT 'Admin' | Author name |
| thumbnail_url | VARCHAR(255) | NULL | URL to thumbnail image |
| is_featured | BOOLEAN | DEFAULT FALSE | Featured status |
| view_count | INT UNSIGNED | DEFAULT 0 | View count |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for category:**
- 'Beginner'
- 'Advanced'
- 'Weapon Guide'
- 'Map Strategy'
- 'Game Mode'
- 'Tips & Tricks'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `category`
- INDEX on `is_featured`
- INDEX on `is_active`

---

### 8. attachments
**Purpose:** Store weapon attachments

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT | Unique attachment ID |
| name | VARCHAR(100) | NOT NULL | Attachment name |
| category | ENUM | NOT NULL | Attachment category |
| unlock_level | INT UNSIGNED | DEFAULT 0 | Level required to unlock |
| description | TEXT | NULL | Attachment description |
| pros | TEXT | NULL | Advantages |
| cons | TEXT | NULL | Disadvantages |
| image_url | VARCHAR(255) | NULL | URL to attachment image |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

**ENUM Values for category:**
- 'Optic'
- 'Barrel'
- 'Muzzle'
- 'Underbarrel'
- 'Magazine'
- 'Stock'
- 'Rear Grip'
- 'Laser'

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `category`
- INDEX on `is_active`

---

### 9. weapon_attachments
**Purpose:** Many-to-many relationship between weapons and attachments

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| weapon_id | INT UNSIGNED | PRIMARY KEY, FOREIGN KEY | References weapons(id) |
| attachment_id | INT UNSIGNED | PRIMARY KEY, FOREIGN KEY | References attachments(id) |

**Constraints:**
- PRIMARY KEY on (`weapon_id`, `attachment_id`)
- FOREIGN KEY `weapon_id` REFERENCES `weapons(id)` ON DELETE CASCADE
- FOREIGN KEY `attachment_id` REFERENCES `attachments(id)` ON DELETE CASCADE

---

## Version Management

When you update data in any table, increment the corresponding version:

```sql
UPDATE data_versions SET version = version + 1 WHERE category = 'category_name';
```

### Available Categories:
- `weapons`
- `maps`
- `perks`
- `equipment`
- `guides`
- `scorestreaks`
