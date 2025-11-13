<?php
/**
 * Database Configuration
 *
 * IMPORTANT: Fill in your database credentials below
 */

return [
    'host' => 'localhost',          // Database host (usually 'localhost')
    'port' => '3306',                // Database port (default: 3306)
    'database' => 'your_database_name',  // Your database name
    'username' => 'your_username',       // Your database username
    'password' => 'your_password',       // Your database password
    'charset' => 'utf8mb4',
    'options' => [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]
];
