<?php
/**
 * Maps Endpoint
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
        // Return all maps with their markers in GeoJSON format

        $allMaps = [];

        // Get all maps
        $stmt = $db->query("SELECT id, name, display_name, image_url, bounds FROM maps ORDER BY name");
        $maps = $stmt->fetchAll();

        foreach ($maps as $map) {
            $mapId = (int)$map['id'];
            $mapKey = $map['name'];

            // Get all markers for this map
            $stmt = $db->prepare("SELECT marker_type, name, coord_x, coord_y, properties FROM map_markers WHERE map_id = ? ORDER BY id");
            $stmt->execute([$mapId]);
            $markers = $stmt->fetchAll();

            // Build GeoJSON FeatureCollection
            $features = [];
            foreach ($markers as $marker) {
                // Parse properties JSON
                $properties = json_decode($marker['properties'], true) ?: [];

                // Add type and name to properties
                $properties['type'] = $marker['marker_type'];
                $properties['name'] = $marker['name'];

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
            }

            $allMaps[$mapKey] = [
                'name' => $map['name'],
                'displayName' => $map['display_name'],
                'imageUrl' => $map['image_url'],
                'bounds' => json_decode($map['bounds'], true),
                'geojson' => [
                    'type' => 'FeatureCollection',
                    'features' => $features
                ]
            ];
        }

        Response::success($allMaps);

    } elseif ($mapName !== null) {
        // Return specific map with markers in GeoJSON format

        // Get map details
        $stmt = $db->prepare("SELECT id, name, display_name, image_url, bounds FROM maps WHERE name = ?");
        $stmt->execute([$mapName]);
        $map = $stmt->fetch();

        if (!$map) {
            Response::error("Map '$mapName' not found", 404);
        }

        $mapId = (int)$map['id'];

        // Get all markers for this map
        $stmt = $db->prepare("SELECT marker_type, name, coord_x, coord_y, properties FROM map_markers WHERE map_id = ? ORDER BY id");
        $stmt->execute([$mapId]);
        $markers = $stmt->fetchAll();

        // Build GeoJSON FeatureCollection
        $features = [];
        foreach ($markers as $marker) {
            // Parse properties JSON
            $properties = json_decode($marker['properties'], true) ?: [];

            // Add type and name to properties
            $properties['type'] = $marker['marker_type'];
            $properties['name'] = $marker['name'];

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
        }

        Response::success([
            'name' => $map['name'],
            'displayName' => $map['display_name'],
            'imageUrl' => $map['image_url'],
            'bounds' => json_decode($map['bounds'], true),
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
