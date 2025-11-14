<?php
/**
 * Schema Endpoint
 * Returns schema definition (fields) for all categories or a specific category
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get category from path (e.g., /api/schema/operators or /api/schema)
$pathParts = explode('/', trim($path, '/'));
$category = isset($pathParts[1]) && !empty($pathParts[1]) ? $pathParts[1] : null;

try {
    if ($category === null) {
        // Return all schemas (exclude data_versions table)
        $stmt = $db->query("SELECT category FROM data_versions ORDER BY category");
        $categories = $stmt->fetchAll();

        $allSchemas = [];

        foreach ($categories as $cat) {
            $categoryName = $cat['category'];

            // Get table schema using DESCRIBE
            $stmt = $db->prepare("DESCRIBE `$categoryName`");
            $stmt->execute();
            $columns = $stmt->fetchAll();

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

            $allSchemas[$categoryName] = [
                'category' => $categoryName,
                'fields' => $fields
            ];
        }

        Response::success($allSchemas);

    } else {
        // Return specific category schema
        // Validate category exists in data_versions
        $stmt = $db->prepare("SELECT category FROM data_versions WHERE category = :category");
        $stmt->execute(['category' => $category]);
        $exists = $stmt->fetch();

        if (!$exists) {
            Response::error("Category '$category' not found", 404);
        }

        // Get table schema using DESCRIBE
        $stmt = $db->prepare("DESCRIBE `$category`");
        $stmt->execute();
        $columns = $stmt->fetchAll();

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
            'category' => $category,
            'fields' => $fields
        ]);
    }

} catch (PDOException $e) {
    Response::error('Failed to fetch schema', 500, $e->getMessage());
}
