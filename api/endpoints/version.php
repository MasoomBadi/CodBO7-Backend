<?php
/**
 * Version Endpoint
 * Returns version information for all data categories
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

try {
    $stmt = $db->query("SELECT category, version, schema_version FROM data_versions ORDER BY category");
    $versions = $stmt->fetchAll();

    // Format with version and schemaVersion
    $versionData = [];

    foreach ($versions as $row) {
        $versionData[$row['category']] = [
            'version' => (int)$row['version'],
            'schemaVersion' => (int)$row['schema_version']
        ];
    }

    Response::success($versionData);

} catch (PDOException $e) {
    Response::error('Failed to fetch version data', 500, $e->getMessage());
}
