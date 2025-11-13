<?php
/**
 * Equipment Endpoint
 * Returns all equipment data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get type filter if provided
    $type = isset($_GET['type']) ? $_GET['type'] : null;

    if ($type) {
        $stmt = $db->prepare("SELECT * FROM equipment WHERE type = :type AND is_active = 1 ORDER BY name");
        $stmt->execute(['type' => $type]);
    } else {
        $stmt = $db->query("SELECT * FROM equipment WHERE is_active = 1 ORDER BY type, name");
    }

    $equipment = $stmt->fetchAll();

    // Convert numeric strings
    foreach ($equipment as &$item) {
        $item['id'] = (int)$item['id'];
        $item['unlock_level'] = (int)$item['unlock_level'];
        $item['damage'] = $item['damage'] ? (int)$item['damage'] : null;
        $item['effect_duration'] = $item['effect_duration'] ? (float)$item['effect_duration'] : null;
        $item['cooldown_time'] = $item['cooldown_time'] ? (float)$item['cooldown_time'] : null;
        $item['is_active'] = (bool)$item['is_active'];
    }

    Response::success([
        'count' => count($equipment),
        'equipment' => $equipment
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch equipment data', 500, $e->getMessage());
}
