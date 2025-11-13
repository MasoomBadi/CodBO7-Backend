<?php
/**
 * Maps Endpoint
 * Returns all map data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get mode filter if provided
    $mode = isset($_GET['mode']) ? $_GET['mode'] : null;

    if ($mode) {
        $stmt = $db->prepare("SELECT * FROM maps WHERE (mode = :mode OR mode = 'All') AND is_active = 1 ORDER BY name");
        $stmt->execute(['mode' => $mode]);
    } else {
        $stmt = $db->query("SELECT * FROM maps WHERE is_active = 1 ORDER BY name");
    }

    $maps = $stmt->fetchAll();

    // Convert numeric strings and parse JSON
    foreach ($maps as &$map) {
        $map['id'] = (int)$map['id'];
        $map['is_active'] = (bool)$map['is_active'];
        $map['callouts'] = $map['callouts'] ? json_decode($map['callouts'], true) : null;
    }

    Response::success([
        'count' => count($maps),
        'maps' => $maps
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch maps data', 500, $e->getMessage());
}
