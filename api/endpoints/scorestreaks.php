<?php
/**
 * Scorestreaks Endpoint
 * Returns all scorestreak data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    $stmt = $db->query("SELECT * FROM scorestreaks WHERE is_active = 1 ORDER BY score_required ASC");
    $scorestreaks = $stmt->fetchAll();

    // Convert numeric strings
    foreach ($scorestreaks as &$streak) {
        $streak['id'] = (int)$streak['id'];
        $streak['score_required'] = (int)$streak['score_required'];
        $streak['unlock_level'] = (int)$streak['unlock_level'];
        $streak['duration'] = $streak['duration'] ? (float)$streak['duration'] : null;
        $streak['is_active'] = (bool)$streak['is_active'];
    }

    Response::success([
        'count' => count($scorestreaks),
        'scorestreaks' => $scorestreaks
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch scorestreaks data', 500, $e->getMessage());
}
