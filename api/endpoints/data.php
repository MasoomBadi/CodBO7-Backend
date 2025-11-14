<?php
/**
 * Data Endpoint
 * Returns data from all tables or a specific table
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get table name from path (e.g., /api/data/operators or /api/data/all)
$pathParts = explode('/', trim($path, '/'));
$tableName = isset($pathParts[1]) && !empty($pathParts[1]) ? $pathParts[1] : null;

try {
    if ($tableName === 'all') {
        // Return all table data including data_versions

        $allData = [];

        // First, get data_versions table data
        $stmt = $db->query("SELECT * FROM data_versions ORDER BY category");
        $allData['data_versions'] = $stmt->fetchAll();

        // Convert data types for data_versions
        foreach ($allData['data_versions'] as &$row) {
            $row['version'] = (int)$row['version'];
            $row['schema_version'] = (int)$row['schema_version'];
        }

        // Get all tables from data_versions
        $stmt = $db->query("SELECT category FROM data_versions ORDER BY category");
        $categories = $stmt->fetchAll();

        // Get data from each category table
        foreach ($categories as $cat) {
            $categoryName = $cat['category'];

            $stmt = $db->prepare("SELECT * FROM `$categoryName`");
            $stmt->execute();
            $allData[$categoryName] = $stmt->fetchAll();

            // Convert data types based on table
            if ($categoryName === 'operators') {
                foreach ($allData[$categoryName] as &$row) {
                    $row['id'] = (int)$row['id'];
                    $row['zombie_playable'] = (int)$row['zombie_playable'];
                }
            } elseif ($categoryName === 'icons') {
                foreach ($allData[$categoryName] as &$row) {
                    $row['id'] = (int)$row['id'];
                }
            }
        }

        Response::success($allData);

    } elseif ($tableName !== null) {
        // Return specific table data

        $stmt = $db->prepare("SELECT * FROM `$tableName`");
        $stmt->execute();
        $data = $stmt->fetchAll();

        if (empty($data) && $tableName !== 'data_versions') {
            // Check if table exists
            $checkStmt = $db->prepare("SHOW TABLES LIKE :tableName");
            $checkStmt->execute(['tableName' => $tableName]);
            if (!$checkStmt->fetch()) {
                Response::error("Table '$tableName' not found", 404);
            }
        }

        // Convert data types based on table
        if ($tableName === 'data_versions') {
            foreach ($data as &$row) {
                $row['version'] = (int)$row['version'];
                $row['schema_version'] = (int)$row['schema_version'];
            }
        } elseif ($tableName === 'operators') {
            foreach ($data as &$row) {
                $row['id'] = (int)$row['id'];
                $row['zombie_playable'] = (int)$row['zombie_playable'];
            }
        } elseif ($tableName === 'icons') {
            foreach ($data as &$row) {
                $row['id'] = (int)$row['id'];
            }
        }

        Response::success([
            'table' => $tableName,
            'data' => $data
        ]);
    } else {
        Response::error('Table name required. Usage: /api/data/{tableName} or /api/data/all', 400);
    }

} catch (PDOException $e) {
    Response::error('Failed to fetch data', 500, $e->getMessage());
}
