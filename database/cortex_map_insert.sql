-- SQL INSERT statements for Cortex map
-- Generated from GeoJSON data

-- Insert into maps table
INSERT INTO `maps` (`id`, `name`, `display_name`, `base_image_url`, `cover_image_url`, `teams`, `modes`, `campaign_map`, `location`, `bounds`) VALUES
(2, 'cortex', 'Cortex', '/assets/maps/cortex/Cortex_Tac_Map_BLANK.webp', '/assets/maps/cortex/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Mediterranean Sea', '{"southwest": [0, 0], "northeast": [2048, 2048]}');

-- Insert into map_layers table
INSERT INTO `map_layers` (`id`, `map_id`, `layer_key`, `layer_name`, `layer_type`, `image_url`, `default_visible`) VALUES
(3, 2, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_DOM.webp', 0),
(4, 2, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_HP.webp', 0);

-- Insert into map_markers table
INSERT INTO `map_markers` (`id`, `map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
-- Domination Zones
(18, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 697.00, 959.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(19, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1022.00, 731.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),
(20, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1452.00, 1141.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "C", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Hardpoints
(21, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1022.00, 1060.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "1", "mode": "multiplayer", "gameSelection": "bo7"}'),
(22, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 468.00, 1236.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "2", "mode": "multiplayer", "gameSelection": "bo7"}'),
(23, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1426.00, 720.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "3", "mode": "multiplayer", "gameSelection": "bo7"}'),
(24, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 633.00, 679.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "4", "mode": "multiplayer", "gameSelection": "bo7"}'),
(25, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1353.00, 1303.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "5", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Search and Destroy Sites
(26, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 937.00, 1208.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(27, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 582.00, 729.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Spawn Points
(28, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn Point', 1744.00, 980.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{"team": "JSOC", "mode": "multiplayer", "gameSelection": "bo7"}'),
(29, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'Guild Spawn', 364.00, 966.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{"team": "Guild", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Points of Interest
(30, 2, 'poiLabel', 'poi', 'Drill', 1028.00, 1175.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(31, 2, 'poiLabel', 'poi', 'Diving Bell', 1025.00, 748.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(32, 2, 'poiLabel', 'poi', 'Grinder Pit', 1025.00, 1383.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(33, 2, 'poiLabel', 'poi', 'Seabed Mining Vehicle', 364.00, 1012.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(34, 2, 'poiLabel', 'poi', 'Barge', 1639.00, 1041.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}');
