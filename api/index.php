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
    switch ($path) {
        case 'version':
        case 'versions':
            require __DIR__ . '/endpoints/version.php';
            break;

        case 'weapons':
            require __DIR__ . '/endpoints/weapons.php';
            break;

        case 'maps':
            require __DIR__ . '/endpoints/maps.php';
            break;

        case 'perks':
            require __DIR__ . '/endpoints/perks.php';
            break;

        case 'equipment':
            require __DIR__ . '/endpoints/equipment.php';
            break;

        case 'scorestreaks':
            require __DIR__ . '/endpoints/scorestreaks.php';
            break;

        case 'guides':
            require __DIR__ . '/endpoints/guides.php';
            break;

        case 'attachments':
            require __DIR__ . '/endpoints/attachments.php';
            break;

        case '':
            // API info endpoint
            Response::success([
                'name' => 'Call of Duty Companion API',
                'version' => '1.0.0',
                'endpoints' => [
                    'GET /api/version' => 'Get all data versions',
                    'GET /api/weapons' => 'Get all weapons',
                    'GET /api/maps' => 'Get all maps',
                    'GET /api/perks' => 'Get all perks',
                    'GET /api/equipment' => 'Get all equipment',
                    'GET /api/scorestreaks' => 'Get all scorestreaks',
                    'GET /api/guides' => 'Get all guides',
                    'GET /api/attachments' => 'Get all attachments'
                ]
            ], 'API is running');
            break;

        default:
            Response::notFound('Endpoint not found');
            break;
    }
} catch (Exception $e) {
    Response::error('Internal server error', 500, $e->getMessage());
}
