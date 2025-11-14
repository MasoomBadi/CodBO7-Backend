<?php
/**
 * Schema Endpoint
 * Returns schema definition (fields) for a specific category
 */

if ($requestMethod !== 'GET') {
    Response::error('Method not allowed', 405);
}

// Get category from path (e.g., /api/schema/operators)
$pathParts = explode('/', trim($path, '/'));
if (count($pathParts) < 2 || $pathParts[0] !== 'schema') {
    Response::error('Category parameter required. Usage: /api/schema/{category}', 400);
}

$category = $pathParts[1];

// Validate category exists in data_versions
try {
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

} catch (PDOException $e) {
    Response::error('Failed to fetch schema', 500, $e->getMessage());
}
