<?php
/**
 * Weapons Endpoint
 * Returns all weapon data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get category filter if provided
    $category = isset($_GET['category']) ? $_GET['category'] : null;

    if ($category) {
        $stmt = $db->prepare("SELECT * FROM weapons WHERE category = :category AND is_active = 1 ORDER BY category, name");
        $stmt->execute(['category' => $category]);
    } else {
        $stmt = $db->query("SELECT * FROM weapons WHERE is_active = 1 ORDER BY category, name");
    }

    $weapons = $stmt->fetchAll();

    // Convert numeric strings to integers/floats
    foreach ($weapons as &$weapon) {
        $weapon['id'] = (int)$weapon['id'];
        $weapon['unlock_level'] = (int)$weapon['unlock_level'];
        $weapon['damage_range_min'] = $weapon['damage_range_min'] ? (int)$weapon['damage_range_min'] : null;
        $weapon['damage_range_max'] = $weapon['damage_range_max'] ? (int)$weapon['damage_range_max'] : null;
        $weapon['fire_rate'] = $weapon['fire_rate'] ? (int)$weapon['fire_rate'] : null;
        $weapon['magazine_size'] = $weapon['magazine_size'] ? (int)$weapon['magazine_size'] : null;
        $weapon['reload_time'] = $weapon['reload_time'] ? (float)$weapon['reload_time'] : null;
        $weapon['ads_time'] = $weapon['ads_time'] ? (float)$weapon['ads_time'] : null;
        $weapon['mobility'] = $weapon['mobility'] ? (int)$weapon['mobility'] : null;
        $weapon['range_value'] = $weapon['range_value'] ? (int)$weapon['range_value'] : null;
        $weapon['accuracy'] = $weapon['accuracy'] ? (int)$weapon['accuracy'] : null;
        $weapon['control'] = $weapon['control'] ? (int)$weapon['control'] : null;
        $weapon['is_active'] = (bool)$weapon['is_active'];
    }

    Response::success([
        'count' => count($weapons),
        'weapons' => $weapons
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch weapons data', 500, $e->getMessage());
}
