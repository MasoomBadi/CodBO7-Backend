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
('operators', 1, 'Playable characters'),
('icons', 1, 'Icons and emblems')
ON DUPLICATE KEY UPDATE category=category;

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
