# Call of Duty Companion App - Backend API

Backend API for the Call of Duty Companion Android app. Provides game data including weapons, maps, perks, equipment, guides, and more.

## Tech Stack

- **PHP 8.x** - Backend language
- **MySQL** - Database
- **REST API** - Simple, lightweight API architecture
- **Version Management System** - Efficient data sync mechanism

## Features

- No authentication required (public API)
- Version-based sync system for efficient data updates
- RESTful API endpoints
- CORS enabled for cross-origin requests
- Clean JSON responses
- Support for filtering and querying

## Database Schema

The database includes the following tables:

- `data_versions` - Version tracking for each data category
- `weapons` - Weapon statistics and details
- `maps` - Map information and callouts
- `perks` - Perk descriptions and effects
- `equipment` - Lethal, tactical, and field upgrades
- `scorestreaks` - Scorestreak information
- `guides` - Player guides and tips
- `attachments` - Weapon attachments
- `weapon_attachments` - Weapon-attachment relationships

## Setup Instructions

### 1. Database Configuration

**Step 1:** Create a new MySQL database (e.g., `cod_companion`)

**Step 2:** Run the schema file to create all tables:
```bash
mysql -u your_username -p cod_companion < database/schema.sql
```

**Step 3:** (Optional) Load sample data for testing:
```bash
mysql -u your_username -p cod_companion < database/sample_data.sql
```

### 2. Configure Database Connection

Edit `config/database.php` with your database credentials:

```php
return [
    'host' => 'localhost',
    'port' => '3306',
    'database' => 'cod_companion',  // Your database name
    'username' => 'your_username',   // Your MySQL username
    'password' => 'your_password',   // Your MySQL password
    'charset' => 'utf8mb4',
];
```

### 3. Deploy to Your Hosting

Upload all files to your web hosting via FTP/SFTP or your hosting's file manager.

**Recommended directory structure on server:**
```
public_html/
├── api/
│   ├── index.php
│   └── endpoints/
├── config/
├── includes/
├── database/ (not publicly accessible - store elsewhere if possible)
└── .htaccess
```

### 4. Test the API

Visit: `http://yourdomain.com/api/`

You should see:
```json
{
  "success": true,
  "data": {
    "name": "Call of Duty Companion API",
    "version": "1.0.0",
    "endpoints": { ... }
  }
}
```

## API Endpoints

### Version Management
- `GET /api/version` - Get all data versions

**Response:**
```json
{
  "success": true,
  "data": {
    "versions": {
      "weapons": 1,
      "maps": 1,
      "perks": 1,
      "equipment": 1,
      "guides": 1,
      "scorestreaks": 1
    },
    "detailed": {
      "weapons": {
        "version": 1,
        "last_updated": "2025-11-13 12:00:00"
      },
      ...
    }
  }
}
```

### Data Endpoints

- `GET /api/weapons` - Get all weapons
  - Optional: `?category=Assault Rifle` (filter by category)

- `GET /api/maps` - Get all maps
  - Optional: `?mode=Multiplayer` (filter by mode)

- `GET /api/perks` - Get all perks
  - Optional: `?slot=Perk 1` (filter by slot)

- `GET /api/equipment` - Get all equipment
  - Optional: `?type=Lethal` (filter by type)

- `GET /api/scorestreaks` - Get all scorestreaks

- `GET /api/guides` - Get all guides
  - Optional: `?category=Beginner` (filter by category)
  - Optional: `?featured=true` (get featured guides only)

- `GET /api/attachments` - Get all attachments
  - Optional: `?category=Optic` (filter by category)
  - Optional: `?weapon_id=1` (get attachments for specific weapon)

## Version Management Workflow

The version system ensures your Android app only downloads updated data.

### How It Works:

1. **Android app calls** `GET /api/version`
2. **Compares** returned versions with local database versions
3. **Syncs** only the categories where version numbers differ

### When You Update Data:

**Example:** Adding a new weapon

```sql
-- 1. Insert the new weapon
INSERT INTO weapons (name, category, damage_range_min, ...)
VALUES ('New Weapon', 'Assault Rifle', 30, ...);

-- 2. Update the version (IMPORTANT!)
UPDATE data_versions SET version = version + 1 WHERE category = 'weapons';
```

See `database/update_version.sql` for all version update queries.

## Connection Parameters Needed

When setting up, you'll need:

- **Database Host**: Usually `localhost` (check with your hosting provider)
- **Database Port**: Usually `3306` (default MySQL port)
- **Database Name**: The name you created (e.g., `cod_companion`)
- **Database Username**: Your MySQL username
- **Database Password**: Your MySQL password

## Project Structure

```
CodBO7-Backend/
├── api/
│   ├── index.php              # Main router
│   └── endpoints/              # API endpoint handlers
│       ├── version.php
│       ├── weapons.php
│       ├── maps.php
│       ├── perks.php
│       ├── equipment.php
│       ├── scorestreaks.php
│       ├── guides.php
│       └── attachments.php
├── config/
│   └── database.php           # Database configuration
├── includes/
│   ├── Database.php           # Database connection handler
│   └── Response.php           # Response helper
├── database/
│   ├── schema.sql             # Database schema
│   ├── sample_data.sql        # Sample data for testing
│   └── update_version.sql     # Version update helpers
├── .htaccess                  # URL rewriting rules
└── README.md                  # This file
```

## Adding New Data

### Example: Adding Weapons

```sql
INSERT INTO weapons (name, category, unlock_level, damage_range_min, damage_range_max, fire_rate, magazine_size, description)
VALUES
('M4A1', 'Assault Rifle', 5, 28, 35, 800, 30, 'Fast firing assault rifle with high accuracy.'),
('AK-47', 'Assault Rifle', 10, 35, 42, 600, 30, 'High damage assault rifle with moderate recoil.');

-- Don't forget to update the version!
UPDATE data_versions SET version = version + 1 WHERE category = 'weapons';
```

## Android App Integration

Your Kotlin app should:

1. **Store local version numbers** in SharedPreferences or local SQLite
2. **On app launch**, call `/api/version`
3. **Compare versions** with local versions
4. **Download updated data** for changed categories
5. **Update local version** numbers after successful sync

**Example Sync Logic:**
```kotlin
// Pseudo-code
val remoteVersions = api.getVersions()
val localVersions = localStorage.getVersions()

if (remoteVersions.weapons > localVersions.weapons) {
    val weapons = api.getWeapons()
    database.updateWeapons(weapons)
    localStorage.setVersion("weapons", remoteVersions.weapons)
}
```

## Troubleshooting

### API returns 500 error
- Check database credentials in `config/database.php`
- Ensure database exists and tables are created
- Check PHP error logs

### API returns 404 error
- Verify `.htaccess` is working
- Check if mod_rewrite is enabled
- Ensure file permissions are correct

### CORS issues
- Check `.htaccess` CORS headers
- Verify `Response::setCorsHeaders()` is being called

## License

This project is for educational purposes for the Call of Duty Companion App.

## Support

For issues or questions, please open an issue on the repository.
