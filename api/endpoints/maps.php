<?php
/**
 * Maps Endpoint - Enhanced with layers and filter support
 * Returns map data with markers in GeoJSON format
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get map name from path (e.g., /api/maps/blackheart or /api/maps/all)
$pathParts = explode('/', trim($path, '/'));
$mapName = isset($pathParts[1]) && !empty($pathParts[1]) ? $pathParts[1] : null;

try {
    if ($mapName === 'all') {
        // Return all maps with their layers and markers
        $allMaps = [];

        // Get all maps
        $stmt = $db->query("SELECT id, name, display_name, base_image_url, cover_image_url, teams, modes, campaign_map, location, bounds FROM maps ORDER BY name");
        $maps = $stmt->fetchAll();

        foreach ($maps as $map) {
            $mapId = (int)$map['id'];
            $mapKey = $map['name'];

            // Get layers for this map
            $stmt = $db->prepare("SELECT layer_key, layer_name, layer_type, image_url, default_visible FROM map_layers WHERE map_id = ? ORDER BY id");
            $stmt->execute([$mapId]);
            $layers = $stmt->fetchAll();

            $layersData = [];
            foreach ($layers as $layer) {
                $layersData[] = [
                    'key' => $layer['layer_key'],
                    'name' => $layer['layer_name'],
                    'type' => $layer['layer_type'],
                    'imageUrl' => $layer['image_url'],
                    'defaultVisible' => (bool)$layer['default_visible']
                ];
            }

            // Get all markers for this map
            $stmt = $db->prepare("SELECT category, marker_type, name, coord_x, coord_y, icon_url, hide_on_load, properties FROM map_markers WHERE map_id = ? ORDER BY category, id");
            $stmt->execute([$mapId]);
            $markers = $stmt->fetchAll();

            // Build GeoJSON FeatureCollection
            $features = [];
            $filterConfig = [];

            foreach ($markers as $marker) {
                // Parse properties JSON
                $properties = json_decode($marker['properties'], true) ?: [];

                // Add standard fields to properties
                $properties['category'] = $marker['category'];
                $properties['type'] = $marker['marker_type'];
                $properties['name'] = $marker['name'];
                $properties['hideOnLoad'] = (bool)$marker['hide_on_load'];

                $features[] = [
                    'type' => 'Feature',
                    'geometry' => [
                        'type' => 'Point',
                        'coordinates' => [
                            (float)$marker['coord_x'],
                            (float)$marker['coord_y']
                        ]
                    ],
                    'properties' => $properties
                ];

                // Build filter configuration
                $category = $marker['category'];
                if (!isset($filterConfig[$category])) {
                    $filterConfig[$category] = [
                        'category' => $category,
                        'displayName' => ucfirst(str_replace('_', ' ', $category)),
                        'markerType' => $marker['marker_type'],
                        'iconUrl' => $marker['icon_url'],
                        'count' => 0
                    ];
                }
                $filterConfig[$category]['count']++;
            }

            $allMaps[$mapKey] = [
                'name' => $map['name'],
                'displayName' => $map['display_name'],
                'baseImageUrl' => $map['base_image_url'],
                'coverImageUrl' => $map['cover_image_url'],
                'teams' => $map['teams'],
                'modes' => $map['modes'],
                'campaignMap' => $map['campaign_map'],
                'location' => $map['location'],
                'bounds' => json_decode($map['bounds'], true),
                'layers' => $layersData,
                'filters' => array_values($filterConfig),
                'geojson' => [
                    'type' => 'FeatureCollection',
                    'features' => $features
                ]
            ];
        }

        Response::success($allMaps);

    } elseif ($mapName !== null) {
        // Return specific map with layers and markers

        // Get map details
        $stmt = $db->prepare("SELECT id, name, display_name, base_image_url, cover_image_url, teams, modes, campaign_map, location, bounds FROM maps WHERE name = ?");
        $stmt->execute([$mapName]);
        $map = $stmt->fetch();

        if (!$map) {
            Response::error("Map '$mapName' not found", 404);
        }

        $mapId = (int)$map['id'];

        // Get layers for this map
        $stmt = $db->prepare("SELECT layer_key, layer_name, layer_type, image_url, default_visible FROM map_layers WHERE map_id = ? ORDER BY id");
        $stmt->execute([$mapId]);
        $layers = $stmt->fetchAll();

        $layersData = [];
        foreach ($layers as $layer) {
            $layersData[] = [
                'key' => $layer['layer_key'],
                'name' => $layer['layer_name'],
                'type' => $layer['layer_type'],
                'imageUrl' => $layer['image_url'],
                'defaultVisible' => (bool)$layer['default_visible']
            ];
        }

        // Get all markers for this map
        $stmt = $db->prepare("SELECT category, marker_type, name, coord_x, coord_y, icon_url, hide_on_load, properties FROM map_markers WHERE map_id = ? ORDER BY category, id");
        $stmt->execute([$mapId]);
        $markers = $stmt->fetchAll();

        // Build GeoJSON FeatureCollection and filter config
        $features = [];
        $filterConfig = [];

        foreach ($markers as $marker) {
            // Parse properties JSON
            $properties = json_decode($marker['properties'], true) ?: [];

            // Add standard fields to properties
            $properties['category'] = $marker['category'];
            $properties['type'] = $marker['marker_type'];
            $properties['name'] = $marker['name'];
            $properties['hideOnLoad'] = (bool)$marker['hide_on_load'];

            $features[] = [
                'type' => 'Feature',
                'geometry' => [
                    'type' => 'Point',
                    'coordinates' => [
                        (float)$marker['coord_x'],
                        (float)$marker['coord_y']
                    ]
                ],
                'properties' => $properties
            ];

            // Build filter configuration
            $category = $marker['category'];
            if (!isset($filterConfig[$category])) {
                $filterConfig[$category] = [
                    'category' => $category,
                    'displayName' => ucfirst(str_replace('_', ' ', $category)),
                    'markerType' => $marker['marker_type'],
                    'iconUrl' => $marker['icon_url'],
                    'count' => 0
                ];
            }
            $filterConfig[$category]['count']++;
        }

        Response::success([
            'name' => $map['name'],
            'displayName' => $map['display_name'],
            'baseImageUrl' => $map['base_image_url'],
            'coverImageUrl' => $map['cover_image_url'],
            'teams' => $map['teams'],
            'modes' => $map['modes'],
            'campaignMap' => $map['campaign_map'],
            'location' => $map['location'],
            'bounds' => json_decode($map['bounds'], true),
            'layers' => $layersData,
            'filters' => array_values($filterConfig),
            'geojson' => [
                'type' => 'FeatureCollection',
                'features' => $features
            ]
        ]);

    } else {
        Response::error('Map name required. Usage: /api/maps/{mapName} or /api/maps/all', 400);
    }

} catch (PDOException $e) {
    Response::error('Failed to fetch map data', 500, $e->getMessage());
}
