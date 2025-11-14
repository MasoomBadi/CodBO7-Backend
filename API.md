# API Documentation

## Base URL
```
https://codbo7.masoombadi.top/api/
```

## Authentication
No authentication required. All endpoints are public.

---

## Endpoints

### 1. API Info
Get API information and available endpoints.

**Endpoint:** `GET /api/`

**Request:**
```
GET https://codbo7.masoombadi.top/api/
```

**Response:**
```json
{
  "success": true,
  "data": {
    "name": "Call of Duty Companion API",
    "version": "1.0.0",
    "endpoints": {
      "GET /api/version": "Get all data versions"
    }
  },
  "message": "API is running"
}
```

---

### 2. Get Data Versions
Get version numbers for all data categories. Use this to check if your local data needs updating.

**Endpoint:** `GET /api/version`

**Request:**
```
GET https://codbo7.masoombadi.top/api/version
```

**Response:**
```json
{
  "success": true,
  "data": {
    "icons": {
      "version": 1,
      "schemaVersion": 1
    },
    "operators": {
      "version": 1,
      "schemaVersion": 1
    }
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data` (object) - Object containing category information
  - `{category}.version` (int) - Data version (increments when data changes)
  - `{category}.schemaVersion` (int) - Schema version (increments when table structure changes)
- `message` (string|null) - Optional message

---

### 3. Get All Table Schemas
Get field definitions for all tables including `data_versions`. Call this for bulk schema updates.

**Endpoint:** `GET /api/schema/all`

**Request:**
```
GET https://codbo7.masoombadi.top/api/schema/all
```

**Response:**
```json
{
  "success": true,
  "data": {
    "data_versions": {
      "table": "data_versions",
      "fields": [
        {
          "name": "category",
          "type": "varchar(50)",
          "nullable": false,
          "key": "PRI",
          "default": null,
          "extra": ""
        },
        {
          "name": "version",
          "type": "int unsigned",
          "nullable": false,
          "key": "",
          "default": "1",
          "extra": ""
        },
        {
          "name": "schema_version",
          "type": "int unsigned",
          "nullable": false,
          "key": "",
          "default": "1",
          "extra": ""
        }
      ]
    },
    "icons": {
      "table": "icons",
      "fields": [
        {
          "name": "id",
          "type": "int",
          "nullable": false,
          "key": "PRI",
          "default": null,
          "extra": "auto_increment"
        },
        {
          "name": "category",
          "type": "varchar(50)",
          "nullable": false,
          "key": "",
          "default": null,
          "extra": ""
        },
        {
          "name": "name",
          "type": "varchar(50)",
          "nullable": false,
          "key": "",
          "default": null,
          "extra": ""
        },
        {
          "name": "icon_url",
          "type": "varchar(150)",
          "nullable": false,
          "key": "",
          "default": null,
          "extra": ""
        }
      ]
    },
    "operators": {
      "table": "operators",
      "fields": [
        {
          "name": "id",
          "type": "int",
          "nullable": false,
          "key": "PRI",
          "default": null,
          "extra": "auto_increment"
        },
        {
          "name": "short_name",
          "type": "varchar(50)",
          "nullable": false,
          "key": "",
          "default": null,
          "extra": ""
        },
        {
          "name": "full_name",
          "type": "varchar(50)",
          "nullable": false,
          "key": "",
          "default": null,
          "extra": ""
        }
      ]
    }
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data` (object) - Object with table names as keys
  - `{tableName}.table` (string) - Table name
  - `{tableName}.fields` (array) - Array of field definitions
    - `name` (string) - Field name
    - `type` (string) - MySQL data type
    - `nullable` (boolean) - Whether field can be null
    - `key` (string) - Key type (PRI for primary key, empty otherwise)
    - `default` - Default value (null if none)
    - `extra` (string) - Additional info (e.g., "auto_increment")

---

### 4. Get Schema for Specific Table
Get field definitions for a single table. Works for any table including `data_versions`.

**Endpoint:** `GET /api/schema/{tableName}`

**Request:**
```
GET https://codbo7.masoombadi.top/api/schema/operators
```

**Response:**
```json
{
  "success": true,
  "data": {
    "table": "operators",
    "fields": [
      {
        "name": "id",
        "type": "int",
        "nullable": false,
        "key": "PRI",
        "default": null,
        "extra": "auto_increment"
      },
      {
        "name": "short_name",
        "type": "varchar(50)",
        "nullable": false,
        "key": "",
        "default": null,
        "extra": ""
      },
      {
        "name": "full_name",
        "type": "varchar(50)",
        "nullable": false,
        "key": "",
        "default": null,
        "extra": ""
      }
    ]
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data.table` (string) - Table name
- `data.fields` (array) - Array of field definitions (same structure as above)

**Available Tables:**
- `data_versions`
- `operators`
- `icons`

**Example: Get data_versions schema**
```
GET https://codbo7.masoombadi.top/api/schema/data_versions
```

---

## Version Sync Strategy

### How to Use Two-Tier Versioning

1. **On App Launch:**
   - Call `GET /api/version`
   - Compare both `version` and `schemaVersion` with locally stored values

2. **If Any Schema Version Changed:**
   - Call `GET /api/schema/all` to get all schemas at once
   - Update Realm models dynamically based on new fields
   - Store new schemaVersion for each category locally

3. **If Data Version Changed:**
   - Fetch updated data for that category
   - Update local database
   - Store new version number locally

4. **If Both Same:**
   - Skip sync, use local data

### Example Android Implementation

```kotlin
// 1. Get remote versions
val response = api.getVersions()

// 2. Check if any schema version changed
var anySchemaChanged = false
response.data.forEach { (category, versionInfo) ->
    val localSchemaVersion = sharedPrefs.getInt("${category}_schema_version", 0)
    if (versionInfo.schemaVersion > localSchemaVersion) {
        anySchemaChanged = true
    }
}

// 3. If any schema changed, fetch all schemas
if (anySchemaChanged) {
    val schemaResponse = api.getAllSchemas() // GET /api/schema/all

    // Update Realm schemas dynamically for each table
    schemaResponse.data.forEach { (tableName, schemaInfo) ->
        realmManager.updateSchema(tableName, schemaInfo.fields)

        // Save new schema version
        sharedPrefs.edit()
            .putInt("${category}_schema_version", response.data[category]!!.schemaVersion)
            .apply()
    }
}

// 4. Check data versions and sync if needed
response.data.forEach { (category, versionInfo) ->
    val localVersion = sharedPrefs.getInt("${category}_version", 0)

    if (versionInfo.version > localVersion) {
        // Data changed - fetch new data
        when (category) {
            "operators" -> {
                val operators = api.getOperators()
                database.updateOperators(operators)
            }
            "icons" -> {
                val icons = api.getIcons()
                database.updateIcons(icons)
            }
        }

        // Save new version
        sharedPrefs.edit()
            .putInt("${category}_version", versionInfo.version)
            .apply()
    }
}
```

---

## Error Responses

All error responses follow this format:

```json
{
  "success": false,
  "error": "Error message here"
}
```

### Common Error Codes

| Code | Description |
|------|-------------|
| 400 | Bad Request - Invalid parameters |
| 404 | Not Found - Endpoint doesn't exist |
| 405 | Method Not Allowed - Wrong HTTP method |
| 500 | Internal Server Error - Server or database error |

### Example Error Response

**Request:**
```
GET https://codbo7.masoombadi.top/api/invalid
```

**Response (404):**
```json
{
  "success": false,
  "error": "Endpoint not found"
}
```

---

## Data Categories

Current available categories:

| Category | Description | Version |
|----------|-------------|---------|
| operators | Playable characters | 1 |
| icons | Icons and emblems | 1 |

---

## Rate Limiting

Currently no rate limiting is applied.

---

## CORS

CORS is enabled for all origins. You can call the API from any domain or Android app.

---

## Notes for Frontend Developers

1. **Always check `success` field** in response before accessing data
2. **Handle errors gracefully** - display user-friendly messages
3. **Cache version numbers locally** to minimize API calls
4. **Use HTTPS** for production (http also available for testing)
5. **Response format is consistent** - all successful responses have `success: true` and `data` object

---

## Support

For issues or questions, contact the backend team or check the repository documentation.
