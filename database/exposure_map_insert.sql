-- SQL Insert Statements for Exposure Map
-- Generated from GeoJSON data

-- --------------------------------------------------------
-- Insert Map Entry
-- --------------------------------------------------------

INSERT INTO `maps` (`id`, `name`, `display_name`, `base_image_url`, `cover_image_url`, `teams`, `modes`, `campaign_map`, `location`, `bounds`) VALUES
(3, 'exposure', 'Exposure', '/assets/maps/exposure/Exposure_Tac_Map_BLANK.webp', '/assets/maps/exposure/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Outback, Australia', '{"southwest": [0, 0], "northeast": [2048, 2048]}');

-- --------------------------------------------------------
-- Insert Map Layers
-- --------------------------------------------------------

INSERT INTO `map_layers` (`id`, `map_id`, `layer_key`, `layer_name`, `layer_type`, `image_url`, `default_visible`) VALUES
(5, 3, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/exposure/Exposure_Tac_Map_DOM.webp', 0),
(6, 3, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/exposure/Exposure_Tac_Map_HP.webp', 0);

-- --------------------------------------------------------
-- Insert Map Markers
-- --------------------------------------------------------

INSERT INTO `map_markers` (`id`, `map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
-- POI Markers
(34, 3, 'poiLabel', 'poi', 'Loading', 380.00, 1014.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(35, 3, 'poiLabel', 'poi', 'Solar Panels', 1026.00, 789.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(36, 3, 'poiLabel', 'poi', 'Tower', 1026.00, 1188.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(37, 3, 'poiLabel', 'poi', 'Drone', 1026.00, 1384.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
(38, 3, 'poiLabel', 'poi', 'Entrance', 1672.00, 1014.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{"mode": "multiplayer", "gameSelection": "bo7"}'),
-- Domination Objective Markers
(39, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 609.00, 1186.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(40, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1026.00, 1038.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),
(41, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1455.00, 875.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{"label": "C", "mode": "multiplayer", "gameSelection": "bo7"}'),
-- Hardpoint Objective Markers
(42, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1066.00, 1082.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{"label": "1", "mode": "multiplayer", "gameSelection": "bo7"}'),
(43, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1066.00, 707.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{"label": "2", "mode": "multiplayer", "gameSelection": "bo7"}'),
(44, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1346.00, 1041.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{"label": "3", "mode": "multiplayer", "gameSelection": "bo7"}'),
(45, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 799.00, 1072.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{"label": "4", "mode": "multiplayer", "gameSelection": "bo7"}'),
(46, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1066.00, 1318.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{"label": "5", "mode": "multiplayer", "gameSelection": "bo7"}'),
-- Search and Destroy Objective Markers
(47, 3, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1139.00, 1190.00, '/assets/maps/exposure/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}'),
(48, 3, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1399.00, 806.00, '/assets/maps/exposure/Marker_Objective_SearchAndDestroy.svg', 0, '{"label": "B", "mode": "multiplayer", "gameSelection": "bo7"}'),
-- Spawn Location Markers
(49, 3, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 237.00, 1017.00, '/assets/maps/exposure/Marker_MainSpawnLocations.svg', 0, '{"team": "JSOC", "mode": "multiplayer", "gameSelection": "bo7"}'),
(50, 3, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1818.00, 1028.00, '/assets/maps/exposure/Marker_MainSpawnLocations.svg', 0, '{"team": "Guild", "mode": "multiplayer", "gameSelection": "bo7"}');
