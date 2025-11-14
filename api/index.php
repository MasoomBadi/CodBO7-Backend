<?php
/**
 * API Router
 * Main entry point for all API requests
 */

require_once __DIR__ . '/../includes/Database.php';
require_once __DIR__ . '/../includes/Response.php';

// Set CORS headers
Response::setCorsHeaders();

// Get request URI and method
$requestUri = $_SERVER['REQUEST_URI'];
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Remove query string and parse path
$path = parse_url($requestUri, PHP_URL_PATH);
$path = str_replace('/api/', '', $path);
$path = trim($path, '/');

// Get database connection
$db = Database::getInstance()->getConnection();

// Route handling
try {
    // Handle schema endpoint (e.g., /api/schema or /api/schema/operators)
    if ($path === 'schema' || strpos($path, 'schema/') === 0) {
        require __DIR__ . '/endpoints/schema.php';
    }
    // Handle data endpoint (e.g., /api/data/all or /api/data/operators)
    elseif ($path === 'data' || strpos($path, 'data/') === 0) {
        require __DIR__ . '/endpoints/data.php';
    } else {
        switch ($path) {
            case 'version':
            case 'versions':
                require __DIR__ . '/endpoints/version.php';
                break;

            case '':
                // API info endpoint
                Response::success([
                    'name' => 'Call of Duty Companion API',
                    'version' => '1.0.0',
                    'endpoints' => [
                        'GET /api/version' => 'Get all data versions',
                        'GET /api/schema/all' => 'Get all table schemas',
                        'GET /api/schema/{tableName}' => 'Get schema for a specific table',
                        'GET /api/data/all' => 'Get all table data',
                        'GET /api/data/{tableName}' => 'Get data for a specific table'
                    ]
                ], 'API is running');
                break;

            default:
                Response::notFound('Endpoint not found');
                break;
        }
    }
} catch (Exception $e) {
    Response::error('Internal server error', 500, $e->getMessage());
}
