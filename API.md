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

### 3. Get Schema Definition
Get field definitions for a specific category. Call this only when `schemaVersion` changes.

**Endpoint:** `GET /api/schema/{category}`

**Request:**
```
GET https://codbo7.masoombadi.top/api/schema/operators
```

**Response:**
```json
{
  "success": true,
  "data": {
    "category": "operators",
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
- `data.category` (string) - Category name
- `data.fields` (array) - Array of field definitions
  - `name` (string) - Field name
  - `type` (string) - MySQL data type
  - `nullable` (boolean) - Whether field can be null
  - `key` (string) - Key type (PRI for primary key, empty otherwise)
  - `default` - Default value (null if none)
  - `extra` (string) - Additional info (e.g., "auto_increment")

**Available Categories:**
- `operators`
- `icons`

---

## Version Sync Strategy

### How to Use Two-Tier Versioning

1. **On App Launch:**
   - Call `GET /api/version`
   - Compare both `version` and `schemaVersion` with locally stored values

2. **If Schema Version Changed:**
   - Call `GET /api/schema/{category}` to get new schema
   - Update Realm models dynamically based on new fields
   - Store new schemaVersion locally

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
val remoteData = response.data.operators
val remoteVersion = remoteData.version
val remoteSchemaVersion = remoteData.schemaVersion

// 2. Get local versions from SharedPreferences
val localVersion = sharedPrefs.getInt("operators_version", 0)
val localSchemaVersion = sharedPrefs.getInt("operators_schema_version", 0)

// 3. Check schema version first
if (remoteSchemaVersion > localSchemaVersion) {
    // Schema changed - fetch new schema
    val schemaResponse = api.getSchema("operators")

    // Update Realm schema dynamically
    realmManager.updateSchema("operators", schemaResponse.data.fields)

    // Save new schema version
    sharedPrefs.edit()
        .putInt("operators_schema_version", remoteSchemaVersion)
        .apply()
}

// 4. Check data version
if (remoteVersion > localVersion) {
    // Data changed - fetch new data
    val operators = api.getOperators()

    // Update local database
    database.updateOperators(operators)

    // Save new version
    sharedPrefs.edit()
        .putInt("operators_version", remoteVersion)
        .apply()
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
