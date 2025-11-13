<?php
/**
 * Guides Endpoint
 * Returns all guide data
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    // Get category filter if provided
    $category = isset($_GET['category']) ? $_GET['category'] : null;
    $featured = isset($_GET['featured']) ? filter_var($_GET['featured'], FILTER_VALIDATE_BOOLEAN) : null;

    $query = "SELECT * FROM guides WHERE is_active = 1";
    $params = [];

    if ($category) {
        $query .= " AND category = :category";
        $params['category'] = $category;
    }

    if ($featured !== null) {
        $query .= " AND is_featured = :featured";
        $params['featured'] = $featured ? 1 : 0;
    }

    $query .= " ORDER BY is_featured DESC, created_at DESC";

    $stmt = $db->prepare($query);
    $stmt->execute($params);
    $guides = $stmt->fetchAll();

    // Convert numeric strings
    foreach ($guides as &$guide) {
        $guide['id'] = (int)$guide['id'];
        $guide['is_featured'] = (bool)$guide['is_featured'];
        $guide['view_count'] = (int)$guide['view_count'];
        $guide['is_active'] = (bool)$guide['is_active'];
    }

    Response::success([
        'count' => count($guides),
        'guides' => $guides
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch guides data', 500, $e->getMessage());
}
