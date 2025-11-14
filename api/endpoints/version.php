<?php
/**
 * Version Endpoint
 * Returns version information for all data categories
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    $stmt = $db->query("SELECT category, version FROM data_versions ORDER BY category");
    $versions = $stmt->fetchAll();

    // Format as simple key-value pairs
    $versionData = [];

    foreach ($versions as $row) {
        $versionData[$row['category']] = (int)$row['version'];
    }

    Response::success($versionData);

} catch (PDOException $e) {
    Response::error('Failed to fetch version data', 500, $e->getMessage());
}
