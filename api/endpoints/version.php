<?php
/**
 * Version Endpoint
 * Returns version information for all data categories
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    $stmt = $db->query("SELECT category, version, last_updated FROM data_versions ORDER BY category");
    $versions = $stmt->fetchAll();

    // Format as simple key-value pairs
    $versionData = [];
    $detailedData = [];

    foreach ($versions as $row) {
        $versionData[$row['category']] = (int)$row['version'];
        $detailedData[$row['category']] = [
            'version' => (int)$row['version'],
            'last_updated' => $row['last_updated']
        ];
    }

    Response::success([
        'versions' => $versionData,
        'detailed' => $detailedData
    ]);

} catch (PDOException $e) {
    Response::error('Failed to fetch version data', 500, $e->getMessage());
}
