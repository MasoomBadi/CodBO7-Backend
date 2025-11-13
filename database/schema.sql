-- Call of Duty Companion App - Database Schema
-- Created: 2025-11-13

-- ============================================
-- DATA VERSIONING TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS data_versions (
    category VARCHAR(50) PRIMARY KEY,
    version INT UNSIGNED NOT NULL DEFAULT 1,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    description VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert initial version data
INSERT INTO data_versions (category, version, description) VALUES
('weapons', 1, 'Weapon statistics and details'),
('maps', 1, 'Map information and callouts'),
('perks', 1, 'Perk descriptions and effects'),
('equipment', 1, 'Equipment and tactical items'),
('guides', 1, 'Player guides and tips'),
('scorestreaks', 1, 'Scorestreak information')
ON DUPLICATE KEY UPDATE category=category;

-- ============================================
-- WEAPONS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS weapons (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('Assault Rifle', 'SMG', 'LMG', 'Sniper', 'Marksman', 'Shotgun', 'Pistol', 'Melee', 'Launcher') NOT NULL,
    unlock_level INT UNSIGNED DEFAULT 0,
    damage_range_min INT UNSIGNED,
    damage_range_max INT UNSIGNED,
    fire_rate INT UNSIGNED,
    magazine_size INT UNSIGNED,
    reload_time DECIMAL(4,2),
    ads_time DECIMAL(4,2),
    mobility INT UNSIGNED,
    range_value INT UNSIGNED,
    accuracy INT UNSIGNED,
    control INT UNSIGNED,
    description TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- MAPS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS maps (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mode ENUM('Multiplayer', 'Zombies', 'Warzone', 'All') DEFAULT 'Multiplayer',
    size ENUM('Small', 'Medium', 'Large') DEFAULT 'Medium',
    description TEXT,
    image_url VARCHAR(255),
    minimap_url VARCHAR(255),
    tips TEXT,
    callouts JSON,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_mode (mode),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- PERKS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS perks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slot ENUM('Perk 1', 'Perk 2', 'Perk 3', 'Perk Greed', 'Wildcard') NOT NULL,
    unlock_level INT UNSIGNED DEFAULT 0,
    description TEXT NOT NULL,
    effect TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_slot (slot),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- EQUIPMENT TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS equipment (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('Lethal', 'Tactical', 'Field Upgrade') NOT NULL,
    unlock_level INT UNSIGNED DEFAULT 0,
    description TEXT NOT NULL,
    damage INT UNSIGNED,
    effect_duration DECIMAL(4,2),
    cooldown_time DECIMAL(5,2),
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_type (type),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- SCORESTREAKS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS scorestreaks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    score_required INT UNSIGNED NOT NULL,
    unlock_level INT UNSIGNED DEFAULT 0,
    description TEXT NOT NULL,
    duration DECIMAL(5,2),
    usage_tips TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_score (score_required),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- GUIDES TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS guides (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    category ENUM('Beginner', 'Advanced', 'Weapon Guide', 'Map Strategy', 'Game Mode', 'Tips & Tricks') NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) DEFAULT 'Admin',
    thumbnail_url VARCHAR(255),
    is_featured BOOLEAN DEFAULT FALSE,
    view_count INT UNSIGNED DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_featured (is_featured),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- ATTACHMENTS TABLE (for weapon attachments)
-- ============================================
CREATE TABLE IF NOT EXISTS attachments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('Optic', 'Barrel', 'Muzzle', 'Underbarrel', 'Magazine', 'Stock', 'Rear Grip', 'Laser') NOT NULL,
    unlock_level INT UNSIGNED DEFAULT 0,
    description TEXT,
    pros TEXT,
    cons TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- WEAPON_ATTACHMENTS (Many-to-Many relationship)
-- ============================================
CREATE TABLE IF NOT EXISTS weapon_attachments (
    weapon_id INT UNSIGNED NOT NULL,
    attachment_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (weapon_id, attachment_id),
    FOREIGN KEY (weapon_id) REFERENCES weapons(id) ON DELETE CASCADE,
    FOREIGN KEY (attachment_id) REFERENCES attachments(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
