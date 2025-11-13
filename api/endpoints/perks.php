<?php
/**
 * Perks Endpoint
 * Returns all perk data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get slot filter if provided
    $slot = isset($_GET['slot']) ? $_GET['slot'] : null;

    if ($slot) {
        $stmt = $db->prepare("SELECT * FROM perks WHERE slot = :slot AND is_active = 1 ORDER BY name");
        $stmt->execute(['slot' => $slot]);
    } else {
        $stmt = $db->query("SELECT * FROM perks WHERE is_active = 1 ORDER BY slot, name");
    }

    $perks = $stmt->fetchAll();

    // Convert numeric strings
    foreach ($perks as &$perk) {
        $perk['id'] = (int)$perk['id'];
        $perk['unlock_level'] = (int)$perk['unlock_level'];
        $perk['is_active'] = (bool)$perk['is_active'];
    }

    Response::success([
        'count' => count($perks),
        'perks' => $perks
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch perks data', 500, $e->getMessage());
}
