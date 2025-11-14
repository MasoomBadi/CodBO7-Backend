# Call of Duty Companion App - Backend API

Backend API for Call of Duty Companion Android app.

## Tech Stack

- **PHP 8.x**
- **MySQL**
- **REST API**

## Setup

### 1. Create Database

Create a new MySQL database (e.g., `cod_companion`)

### 2. Run Schema

```bash
mysql -u your_username -p cod_companion < database/schema.sql
```

### 3. Configure Database Connection

Edit `config/database.php` with your credentials:

```php
return [
    'host' => 'localhost',
    'port' => '3306',
    'database' => 'your_database_name',
    'username' => 'your_username',
    'password' => 'your_password',
    'charset' => 'utf8mb4',
];
```

### 4. Deploy

Upload all files to your web hosting.

### 5. Test

Visit: `http://yourdomain.com/api/`

## Production URL

```
https://codbo7.masoombadi.top/api/
```

## API Documentation

See [API.md](API.md) for complete API documentation with sample requests and responses.

## Database Schema

See [SCHEMA.md](SCHEMA.md) for complete database schema documentation.

## Version Management

When you update data, increment the version:

```sql
UPDATE data_versions SET version = version + 1 WHERE category = 'operators';
```

Your Android app compares version numbers and syncs only changed data.

## Auto Deployment

This repository uses cPanel auto-deployment via `.cpanel.yml`. Any push to the branch automatically deploys to the production server.
