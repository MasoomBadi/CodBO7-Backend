<?php
/**
 * Attachments Endpoint
 * Returns all attachment data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get category filter if provided
    $category = isset($_GET['category']) ? $_GET['category'] : null;
    // Get weapon_id to fetch attachments for specific weapon
    $weaponId = isset($_GET['weapon_id']) ? (int)$_GET['weapon_id'] : null;

    if ($weaponId) {
        // Get attachments for specific weapon
        $stmt = $db->prepare("
            SELECT a.*
            FROM attachments a
            INNER JOIN weapon_attachments wa ON a.id = wa.attachment_id
            WHERE wa.weapon_id = :weapon_id AND a.is_active = 1
            ORDER BY a.category, a.name
        ");
        $stmt->execute(['weapon_id' => $weaponId]);
    } elseif ($category) {
        $stmt = $db->prepare("SELECT * FROM attachments WHERE category = :category AND is_active = 1 ORDER BY name");
        $stmt->execute(['category' => $category]);
    } else {
        $stmt = $db->query("SELECT * FROM attachments WHERE is_active = 1 ORDER BY category, name");
    }

    $attachments = $stmt->fetchAll();

    // Convert numeric strings
    foreach ($attachments as &$attachment) {
        $attachment['id'] = (int)$attachment['id'];
        $attachment['unlock_level'] = (int)$attachment['unlock_level'];
        $attachment['is_active'] = (bool)$attachment['is_active'];
    }

    Response::success([
        'count' => count($attachments),
        'attachments' => $attachments
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch attachments data', 500, $e->getMessage());
}
