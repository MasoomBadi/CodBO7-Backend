<?php
/**
 * Schema Endpoint
 * Returns schema definition (fields) for all tables or a specific table
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get table name from path (e.g., /api/schema/operators or /api/schema/all)
$pathParts = explode('/', trim($path, '/'));
$tableName = isset($pathParts[1]) && !empty($pathParts[1]) ? $pathParts[1] : null;

try {
    if ($tableName === 'all') {
        // Return all table schemas including data_versions

        // Get all tables that have entries in data_versions
        $stmt = $db->query("SELECT category FROM data_versions ORDER BY category");
        $categories = $stmt->fetchAll();

        $allSchemas = [];

        // First, add data_versions table schema
        $stmt = $db->prepare("DESCRIBE `data_versions`");
        $stmt->execute();
        $columns = $stmt->fetchAll();

        $fields = [];
        foreach ($columns as $column) {
            $fields[] = [
                'name' => $column['Field'],
                'type' => $column['Type'],
                'nullable' => $column['Null'] === 'YES',
                'key' => $column['Key'],
                'default' => $column['Default'],
                'extra' => $column['Extra']
            ];
        }

        $allSchemas['data_versions'] = [
            'table' => 'data_versions',
            'fields' => $fields
        ];

        // Then add all category tables
        foreach ($categories as $cat) {
            $categoryName = $cat['category'];

            $stmt = $db->prepare("DESCRIBE `$categoryName`");
            $stmt->execute();
            $columns = $stmt->fetchAll();

            $fields = [];
            foreach ($columns as $column) {
                $fields[] = [
                    'name' => $column['Field'],
                    'type' => $column['Type'],
                    'nullable' => $column['Null'] === 'YES',
                    'key' => $column['Key'],
                    'default' => $column['Default'],
                    'extra' => $column['Extra']
                ];
            }

            $allSchemas[$categoryName] = [
                'table' => $categoryName,
                'fields' => $fields
            ];
        }

        Response::success($allSchemas);

    } elseif ($tableName !== null) {
        // Return specific table schema

        // Get table schema using DESCRIBE
        $stmt = $db->prepare("DESCRIBE `$tableName`");
        $stmt->execute();
        $columns = $stmt->fetchAll();

        if (empty($columns)) {
            Response::error("Table '$tableName' not found", 404);
        }

        // Format schema
        $fields = [];
        foreach ($columns as $column) {
            $fields[] = [
                'name' => $column['Field'],
                'type' => $column['Type'],
                'nullable' => $column['Null'] === 'YES',
                'key' => $column['Key'],
                'default' => $column['Default'],
                'extra' => $column['Extra']
            ];
        }

        Response::success([
            'table' => $tableName,
            'fields' => $fields
        ]);
    } else {
        Response::error('Table name required. Usage: /api/schema/{tableName} or /api/schema/all', 400);
    }

} catch (PDOException $e) {
    Response::error('Failed to fetch schema', 500, $e->getMessage());
}
