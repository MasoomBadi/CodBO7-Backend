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
        // Return all table data including data_versions, maps, map_layers, and map_markers

        $allData = [];

        // 1. Get data_versions table data
        $stmt = $db->query("SELECT * FROM data_versions ORDER BY category");
        $allData['data_versions'] = $stmt->fetchAll();

        // Convert data types for data_versions
        foreach ($allData['data_versions'] as &$row) {
            $row['version'] = (int)$row['version'];
            $row['schema_version'] = (int)$row['schema_version'];
        }

        // 2. Get all category tables from data_versions
        $stmt = $db->query("SELECT category FROM data_versions ORDER BY category");
        $categories = $stmt->fetchAll();

        // Get data from each category table
        foreach ($categories as $cat) {
            $categoryName = $cat['category'];

            // Determine sort order based on table
            $orderBy = "id";
            if ($categoryName === 'map_layers' || $categoryName === 'map_markers') {
                $orderBy = "map_id, id";
            }

            $stmt = $db->prepare("SELECT * FROM `$categoryName` ORDER BY $orderBy");
            $stmt->execute();
            $allData[$categoryName] = $stmt->fetchAll();

            // Convert numeric fields to proper types based on table
            foreach ($allData[$categoryName] as &$row) {
                // Convert all 'id' fields to int
                if (isset($row['id'])) {
                    $row['id'] = (int)$row['id'];
                }

                // Table-specific conversions
                switch ($categoryName) {
                    case 'operators':
                        if (isset($row['zombie_playable'])) {
                            $row['zombie_playable'] = (int)$row['zombie_playable'];
                        }
                        break;

                    case 'maps':
                        // Parse JSON bounds field
                        if (isset($row['bounds'])) {
                            $row['bounds'] = json_decode($row['bounds'], true);
                        }
                        break;

                    case 'map_layers':
                        if (isset($row['map_id'])) {
                            $row['map_id'] = (int)$row['map_id'];
                        }
                        if (isset($row['default_visible'])) {
                            $row['default_visible'] = (int)$row['default_visible'];
                        }
                        break;

                    case 'map_markers':
                        if (isset($row['map_id'])) {
                            $row['map_id'] = (int)$row['map_id'];
                        }
                        if (isset($row['coord_x'])) {
                            $row['coord_x'] = (float)$row['coord_x'];
                        }
                        if (isset($row['coord_y'])) {
                            $row['coord_y'] = (float)$row['coord_y'];
                        }
                        if (isset($row['hide_on_load'])) {
                            $row['hide_on_load'] = (int)$row['hide_on_load'];
                        }
                        // Parse JSON properties field
                        if (isset($row['properties'])) {
                            $row['properties'] = json_decode($row['properties'], true);
                        }
                        break;
                }
            }
        }

        Response::success($allData);

    } elseif ($tableName !== null) {
        // Return specific table data

        try {
            $stmt = $db->prepare("SELECT * FROM `$tableName`");
            $stmt->execute();
            $data = $stmt->fetchAll();
        } catch (PDOException $e) {
            // If table doesn't exist, return error
            Response::error("Table '$tableName' not found or query failed", 404, $e->getMessage());
        }

        // Convert numeric fields to proper types
        foreach ($data as &$row) {
            // Convert all 'id' fields to int
            if (isset($row['id'])) {
                $row['id'] = (int)$row['id'];
            }
            // Convert version fields
            if (isset($row['version'])) {
                $row['version'] = (int)$row['version'];
            }
            if (isset($row['schema_version'])) {
                $row['schema_version'] = (int)$row['schema_version'];
            }
            // Convert boolean fields
            if (isset($row['zombie_playable'])) {
                $row['zombie_playable'] = (int)$row['zombie_playable'];
            }

            // Map-related table conversions
            // For maps table
            if (isset($row['bounds'])) {
                $row['bounds'] = json_decode($row['bounds'], true);
            }
            // For map_layers and map_markers tables
            if (isset($row['map_id'])) {
                $row['map_id'] = (int)$row['map_id'];
            }
            if (isset($row['default_visible'])) {
                $row['default_visible'] = (int)$row['default_visible'];
            }
            // For map_markers table
            if (isset($row['coord_x'])) {
                $row['coord_x'] = (float)$row['coord_x'];
            }
            if (isset($row['coord_y'])) {
                $row['coord_y'] = (float)$row['coord_y'];
            }
            if (isset($row['hide_on_load'])) {
                $row['hide_on_load'] = (int)$row['hide_on_load'];
            }
            if (isset($row['properties'])) {
                $row['properties'] = json_decode($row['properties'], true);
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
