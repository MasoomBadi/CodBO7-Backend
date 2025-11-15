-- Add maps and map_markers tables for interactive map feature
-- Run this SQL in phpMyAdmin to add the new tables

-- Table structure for table `maps`
CREATE TABLE `maps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounds` JSON DEFAULT NULL COMMENT 'Map boundary coordinates',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `map_markers`
CREATE TABLE `map_markers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `marker_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'domination, hardpoint, snd, spawn, poi',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coord_x` decimal(10,6) NOT NULL,
  `coord_y` decimal(10,6) NOT NULL,
  `properties` JSON DEFAULT NULL COMMENT 'Additional marker properties',
  PRIMARY KEY (`id`),
  KEY `map_id` (`map_id`),
  CONSTRAINT `map_markers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add maps to data_versions table
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `description`) VALUES
('maps', 1, 1, 'Interactive map data and markers');

-- Sample data for Blackheart map
INSERT INTO `maps` (`name`, `display_name`, `image_url`, `bounds`) VALUES
('blackheart', 'Blackheart', '/assets/maps/blackheart.jpg', '{"southwest": [0, 0], "northeast": [2048, 2048]}');

-- Get the map_id for Blackheart (will be 1 if this is first map)
SET @blackheart_id = LAST_INSERT_ID();

-- Sample markers for Blackheart map (based on the GeoJSON you provided)
INSERT INTO `map_markers` (`map_id`, `marker_type`, `name`, `coord_x`, `coord_y`, `properties`) VALUES
-- Domination points
(@blackheart_id, 'domination', 'A', 512.5, 1536.75, '{"label": "A", "icon": "domination"}'),
(@blackheart_id, 'domination', 'B', 1024.0, 1024.0, '{"label": "B", "icon": "domination"}'),
(@blackheart_id, 'domination', 'C', 1536.75, 512.5, '{"label": "C", "icon": "domination"}'),

-- Hardpoint locations
(@blackheart_id, 'hardpoint', 'Hardpoint 1', 768.25, 1280.5, '{"label": "1", "icon": "hardpoint"}'),
(@blackheart_id, 'hardpoint', 'Hardpoint 2', 1024.0, 1024.0, '{"label": "2", "icon": "hardpoint"}'),
(@blackheart_id, 'hardpoint', 'Hardpoint 3', 1280.5, 768.25, '{"label": "3", "icon": "hardpoint"}'),
(@blackheart_id, 'hardpoint', 'Hardpoint 4', 896.75, 896.75, '{"label": "4", "icon": "hardpoint"}'),
(@blackheart_id, 'hardpoint', 'Hardpoint 5', 1152.25, 1152.25, '{"label": "5", "icon": "hardpoint"}'),

-- Search & Destroy sites
(@blackheart_id, 'snd', 'A Site', 640.0, 1408.0, '{"label": "A", "icon": "snd"}'),
(@blackheart_id, 'snd', 'B Site', 1408.0, 640.0, '{"label": "B", "icon": "snd"}'),

-- Spawn points
(@blackheart_id, 'spawn', 'JSOC Spawn', 256.0, 1792.0, '{"team": "JSOC", "icon": "spawn_jsoc"}'),
(@blackheart_id, 'spawn', 'Guild Spawn', 1792.0, 256.0, '{"team": "Guild", "icon": "spawn_guild"}'),

-- POIs (Points of Interest)
(@blackheart_id, 'poi', 'Drill', 512.0, 1536.0, '{"icon": "poi"}'),
(@blackheart_id, 'poi', 'Diving Bell', 1024.0, 1280.0, '{"icon": "poi"}'),
(@blackheart_id, 'poi', 'Control Room', 1280.0, 1024.0, '{"icon": "poi"}'),
(@blackheart_id, 'poi', 'Communications', 768.0, 768.0, '{"icon": "poi"}');
