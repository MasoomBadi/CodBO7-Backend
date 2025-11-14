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
('operators', 1, 'Playable characters')
ON DUPLICATE KEY UPDATE category=category;
