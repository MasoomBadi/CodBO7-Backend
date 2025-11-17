<?php
/**
 * GeoJSON Endpoint
 * Returns map markers in pure GeoJSON format (Call of Duty API compatible)
 *
 * Usage: /api/geojson/{mapName}
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get map name from path (e.g., /api/geojson/vandorn_farm)
$pathParts = explode('/', trim($path, '/'));
$mapName = isset($pathParts[1]) && !empty($pathParts[1]) ? $pathParts[1] : null;

if ($mapName === null) {
    Response::error('Map name required. Usage: /api/geojson/{mapName}', 400);
}

try {
    // Get map details
    $stmt = $db->prepare("SELECT id, name, type FROM maps WHERE name = ?");
    $stmt->execute([$mapName]);
    $map = $stmt->fetch();

    if (!$map) {
        Response::error("Map '$mapName' not found", 404);
    }

    $mapId = (int)$map['id'];
    $mapType = $map['type'];

    // Determine mode based on map type
    $mode = ($mapType === 'zombie_big' || $mapType === 'zombie') ? 'zombies' : 'multiplayer';

    // Get all markers for this map
    $stmt = $db->prepare("
        SELECT
            id,
            category,
            marker_type,
            name,
            coord_x,
            coord_y,
            icon_url,
            hide_on_load,
            properties
        FROM map_markers
        WHERE map_id = ?
        ORDER BY id
    ");
    $stmt->execute([$mapId]);
    $markers = $stmt->fetchAll();

    // Build GeoJSON FeatureCollection
    $features = [];

    foreach ($markers as $marker) {
        $markerId = (int)$marker['id'];
        $coordX = (float)$marker['coord_x'];
        $coordY = (float)$marker['coord_y'];
        $hideOnLoad = (int)$marker['hide_on_load'] === 1 ? 'true' : 'false';

        // Parse existing properties JSON
        $customProps = json_decode($marker['properties'], true) ?: [];

        // Build properties object (Call of Duty API format)
        $properties = [
            'mode' => $mode,
            'gameSelection' => 'bo7',
            'hideOnLoad' => $hideOnLoad,
            'x' => (string)round($coordX),
            'y' => (string)round($coordY),
            'name' => $marker['name'],
            'category' => $marker['category'],
            'mapId' => (string)$markerId,
            'mapPath' => "/content/atvi/callofduty/guides/web/en/blackops7/{$mode}/" . str_replace('_', '-', $mapName),
            'sling:resourceType' => 'atvi/callofduty/strategy-guide/components/maps/map-data'
        ];

        // Merge any custom properties from the database
        $properties = array_merge($customProps, $properties);

        // Build feature
        $features[] = [
            'type' => 'Feature',
            'geometry' => [
                'type' => 'Point',
                'coordinates' => [$coordX, $coordY]
            ],
            'properties' => $properties
        ];
    }

    // Return pure GeoJSON FeatureCollection (not wrapped in success envelope)
    header('Content-Type: application/geo+json');
    echo json_encode([
        'type' => 'FeatureCollection',
        'features' => $features
    ], JSON_PRETTY_PRINT);
    exit;

} catch (PDOException $e) {
    Response::error('Failed to fetch markers', 500, $e->getMessage());
}
