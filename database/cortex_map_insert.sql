-- SQL INSERT statements for Cortex map
-- Generated from GeoJSON data

-- Insert into maps table
INSERT INTO `maps` (`id`, `name`, `display_name`, `base_image_url`, `cover_image_url`, `teams`, `modes`, `campaign_map`, `location`, `bounds`) VALUES
(2, 'cortex', 'Cortex', '/assets/maps/cortex/Cortex_Tac_Map_BLANK.webp', '/assets/maps/cortex/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Mediterranean Sea', '{"southwest": [655, 462], "northeast": [1386, 1742]}');

-- Insert into map_layers table
INSERT INTO `map_layers` (`id`, `map_id`, `layer_key`, `layer_name`, `layer_type`, `image_url`, `default_visible`) VALUES
(3, 2, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_DOM.webp', 0),
(4, 2, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_HP.webp', 0);

-- Insert into map_markers table
INSERT INTO `map_markers` (`id`, `map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
-- Domination Zones
(18, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 786.00, 1460.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(19, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1219.00, 983.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),
(20, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 782.00, 746.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{"label": "C", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Hardpoints
(21, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 783.00, 1094.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "1", "mode": "multiplayer", "gameSelection": "bo7"}'),
(22, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1003.00, 750.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "2", "mode": "multiplayer", "gameSelection": "bo7"}'),
(23, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 830.00, 1492.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "3", "mode": "multiplayer", "gameSelection": "bo7"}'),
(24, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1266.00, 1135.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{"label": "4", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Search and Destroy Sites
(25, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1386.00, 1134.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(26, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 805.00, 1189.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Spawn Points
(27, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 976.00, 572.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{"team": "JSOC", "mode": "multiplayer", "gameSelection": "bo7"}'),
(28, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1066.00, 1641.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{"team": "Guild", "mode": "multiplayer", "gameSelection": "bo7"}'),

-- Points of Interest
(29, 2, 'poiLabel', 'poi', 'Entrance', 961.00, 462.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(30, 2, 'poiLabel', 'poi', 'Vat Chamber', 655.00, 1136.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(31, 2, 'poiLabel', 'poi', 'Underpass', 1213.00, 1224.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(32, 2, 'poiLabel', 'poi', 'Skybridge', 1335.00, 1424.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(33, 2, 'poiLabel', 'poi', 'Maintenance', 1071.00, 1742.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}');
