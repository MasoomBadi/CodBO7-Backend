-- Enhanced maps schema with layers support
-- This replaces/enhances the previous maps tables

-- Drop existing tables if you want to recreate
-- DROP TABLE IF EXISTS `map_markers`;
-- DROP TABLE IF EXISTS `map_layers`;
-- DROP TABLE IF EXISTS `maps`;

-- Updated maps table structure
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base blank tactical map',
  `bounds` JSON DEFAULT NULL COMMENT 'Map boundary coordinates',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- New table for map layers (DOM overlay, HP overlay, etc.)
CREATE TABLE IF NOT EXISTS `map_layers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `layer_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'e.g., domination_zone, hardpoint_zone',
  `layer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layer_type` enum('overlay','base') DEFAULT 'overlay',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_visible` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `map_id` (`map_id`),
  CONSTRAINT `map_layers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Updated map_markers table with proper categories
CREATE TABLE IF NOT EXISTS `map_markers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'e.g., multiplayer_objective_domination, poiLabel',
  `marker_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'domination, hardpoint, snd, spawn, poi',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coord_x` decimal(10,2) NOT NULL,
  `coord_y` decimal(10,2) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_on_load` tinyint(1) DEFAULT 0,
  `properties` JSON DEFAULT NULL COMMENT 'Additional marker properties',
  PRIMARY KEY (`id`),
  KEY `map_id` (`map_id`),
  KEY `category` (`category`),
  CONSTRAINT `map_markers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Clear existing data (optional - comment out if you want to keep existing data)
DELETE FROM `map_markers`;
DELETE FROM `map_layers`;
DELETE FROM `maps`;

-- Insert Blackheart map
INSERT INTO `maps` (`name`, `display_name`, `base_image_url`, `bounds`) VALUES
('blackheart', 'Blackheart', '/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp',
 '{"southwest": [0, 0], "northeast": [2048, 2048]}');

SET @blackheart_id = LAST_INSERT_ID();

-- Insert map layers for Blackheart
INSERT INTO `map_layers` (`map_id`, `layer_key`, `layer_name`, `layer_type`, `image_url`, `default_visible`) VALUES
(@blackheart_id, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/blackheart/Blackheart_Tac_Map_DOM.webp', 0),
(@blackheart_id, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp', 0);

-- Insert markers with REAL coordinates from official CoD website
-- Domination Zones (3)
INSERT INTO `map_markers` (`map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(@blackheart_id, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 697, 959, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0,
 '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1022, 731, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0,
 '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1452, 1141, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0,
 '{"label": "C", "mode": "multiplayer", "gameSelection": "bo7"}');

-- Hardpoints (5)
INSERT INTO `map_markers` (`map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(@blackheart_id, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1022, 1060, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0,
 '{"label": "1", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 468, 1236, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0,
 '{"label": "2", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1426, 720, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0,
 '{"label": "3", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 633, 679, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0,
 '{"label": "4", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1353, 1303, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0,
 '{"label": "5", "mode": "multiplayer", "gameSelection": "bo7"}');

-- Search & Destroy Sites (2)
INSERT INTO `map_markers` (`map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(@blackheart_id, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 937, 1208, '/assets/maps/blackheart/Marker_Objective_SearchAndDestroy.svg', 0,
 '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 582, 729, '/assets/maps/blackheart/Marker_Objective_SearchAndDestroy.svg', 0,
 '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}');

-- Spawn Points (2)
INSERT INTO `map_markers` (`map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(@blackheart_id, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn Point', 1744, 980, '/assets/maps/blackheart/Marker_MainSpawnLocations.svg', 0,
 '{"team": "JSOC", "mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'multiplayer_mainSpawnLocation', 'spawn', 'Guild Spawn', 364, 966, '/assets/maps/blackheart/Marker_MainSpawnLocations.svg', 0,
 '{"team": "Guild", "mode": "multiplayer", "gameSelection": "bo7"}');

-- POIs - Points of Interest (5)
INSERT INTO `map_markers` (`map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(@blackheart_id, 'poiLabel', 'poi', 'Drill', 1028, 1175, '/assets/maps/blackheart/Marker_POIs.svg', 0,
 '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'poiLabel', 'poi', 'Diving Bell', 1025, 748, '/assets/maps/blackheart/Marker_POIs.svg', 0,
 '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'poiLabel', 'poi', 'Grinder Pit', 1025, 1383, '/assets/maps/blackheart/Marker_POIs.svg', 0,
 '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'poiLabel', 'poi', 'Seabed Mining Vehicle', 364, 1012, '/assets/maps/blackheart/Marker_POIs.svg', 0,
 '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(@blackheart_id, 'poiLabel', 'poi', 'Barge', 1639, 1041, '/assets/maps/blackheart/Marker_POIs.svg', 0,
 '{"mode": "multiplayer", "gameSelection": "bo7"}');

-- Update data_versions table to track maps
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `description`)
VALUES ('maps', 1, 1, 'Interactive map data and markers')
ON DUPLICATE KEY UPDATE version = 1, schema_version = 1;
