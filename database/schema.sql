-- Call of Duty Companion App - Database Schema
-- Updated: 2025-11-14

-- ============================================
-- DATA VERSIONING TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS data_versions (
    category VARCHAR(50) COLLATE utf8mb4_unicode_ci PRIMARY KEY,
    version INT UNSIGNED NOT NULL DEFAULT 1,
    schema_version INT UNSIGNED NOT NULL DEFAULT 1,
    last_updated TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    description VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert initial version data
INSERT INTO data_versions (category, version, schema_version, description) VALUES
('operators', 1, 1, 'Playable characters'),
('icons', 1, 1, 'Icons and emblems')
ON DUPLICATE KEY UPDATE category=category;

-- ============================================
-- ICONS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS icons (
    id INT NOT NULL AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    icon_url VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sample data for icons
INSERT INTO icons (id, category, name, icon_url) VALUES
(1, 'operators', 'jsoc', '/assets/icons/jsoc.png'),
(2, 'operators', 'guild', '/assets/icons/guild.png'),
(3, 'operators', 'zombie', '/assets/icons/zombie.png')
ON DUPLICATE KEY UPDATE id=id;

-- ============================================
-- OPERATORS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS operators (
    id INT NOT NULL AUTO_INCREMENT,
    short_name VARCHAR(50) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    divison VARCHAR(10) NOT NULL,
    zombie_playable TINYINT(1) NOT NULL,
    description VARCHAR(500) NOT NULL,
    unlock_criteria VARCHAR(50) NOT NULL,
    image_url VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
