-- Migration: Add schema_version column to data_versions table
-- Run this on your existing database to update it

-- Add schema_version column
ALTER TABLE data_versions
ADD COLUMN schema_version INT UNSIGNED NOT NULL DEFAULT 1 AFTER version;

-- Add icons category if not exists
INSERT INTO data_versions (category, version, schema_version, description) VALUES
('icons', 1, 1, 'Icons and emblems')
ON DUPLICATE KEY UPDATE category=category;

-- Verify the changes
SELECT * FROM data_versions;
