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
    "map_layers": {
      "version": 1,
      "schemaVersion": 1
    },
    "map_markers": {
      "version": 1,
      "schemaVersion": 1
    },
    "maps": {
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

### 5. Get All Table Data
Get all data from all tables including `data_versions`, `maps`, `map_layers`, and `map_markers`. Use this for initial sync.

**Endpoint:** `GET /api/data/all`

**Request:**
```
GET https://codbo7.masoombadi.top/api/data/all
```

**Response:**
```json
{
  "success": true,
  "data": {
    "data_versions": [
      {
        "category": "icons",
        "version": 1,
        "schema_version": 1,
        "last_updated": "2025-11-14 06:09:23",
        "description": "Icons and emblems"
      },
      {
        "category": "map_layers",
        "version": 1,
        "schema_version": 1,
        "last_updated": "2025-11-16 00:00:00",
        "description": "Map overlay layers"
      },
      {
        "category": "map_markers",
        "version": 1,
        "schema_version": 1,
        "last_updated": "2025-11-16 00:00:00",
        "description": "Interactive map markers and POIs"
      },
      {
        "category": "maps",
        "version": 1,
        "schema_version": 1,
        "last_updated": "2025-11-16 00:00:00",
        "description": "Interactive map base data"
      },
      {
        "category": "operators",
        "version": 1,
        "schema_version": 1,
        "last_updated": "2025-11-14 00:39:23",
        "description": "Playable characters"
      }
    ],
    "icons": [
      {
        "id": 1,
        "category": "operators",
        "name": "jsoc",
        "icon_url": "/assets/icons/jsoc.png"
      }
    ],
    "operators": [
      {
        "id": 1,
        "short_name": "50/50",
        "full_name": "Leilani \"50/50\" Tupuola",
        "nationality": "New Zealander",
        "divison": "jsoc",
        "zombie_playable": 0,
        "description": "Leilani \"50/50\" Tupoula survived...",
        "unlock_criteria": "Unlocked immediately",
        "image_url": "/assets/operators/50_50.webp"
      }
    ],
    "maps": [
      {
        "id": 1,
        "name": "blackheart",
        "display_name": "Blackheart",
        "base_image_url": "/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp",
        "cover_image_url": "/assets/maps/blackheart/cover.webp",
        "teams": "JSOC vs The Guilds",
        "modes": "All (except Skirmish)",
        "campaign_map": "Containment",
        "location": "NA",
        "bounds": {"southwest": [0, 0], "northeast": [2048, 2048]}
      }
    ],
    "map_layers": [
      {
        "id": 1,
        "map_id": 1,
        "layer_key": "domination_zone",
        "layer_name": "Domination Zone",
        "layer_type": "overlay",
        "image_url": "/assets/maps/blackheart/Blackheart_Tac_Map_DOM.webp",
        "default_visible": 0
      },
      {
        "id": 2,
        "map_id": 1,
        "layer_key": "hardpoint_zone",
        "layer_name": "Hardpoint Zone",
        "layer_type": "overlay",
        "image_url": "/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp",
        "default_visible": 0
      }
    ],
    "map_markers": [
      {
        "id": 1,
        "map_id": 1,
        "category": "multiplayer_objective_domination",
        "marker_type": "domination",
        "name": "Domination Zone A",
        "coord_x": 697.00,
        "coord_y": 959.00,
        "icon_url": "/assets/maps/blackheart/Marker_Objective_Domination.svg",
        "hide_on_load": 0,
        "properties": {"label": "A", "mode": "multiplayer", "gameSelection": "bo7"}
      }
    ]
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data` (object) - Object with table names as keys
  - `data_versions` (array) - Version tracking data
  - `icons` (array) - Icon data
  - `operators` (array) - Operator data
  - `maps` (array) - Map data with teams, modes, campaign info
  - `map_layers` (array) - Map overlay layers (DOM, HP zones)
  - `map_markers` (array) - Map markers with coordinates
- `message` (string|null) - Optional message

---

### 6. Get Data for Specific Table
Get data from a single table. Works for any table including `data_versions`.

**Endpoint:** `GET /api/data/{tableName}`

**Request:**
```
GET https://codbo7.masoombadi.top/api/data/operators
```

**Response:**
```json
{
  "success": true,
  "data": {
    "table": "operators",
    "data": [
      {
        "id": 1,
        "short_name": "50/50",
        "full_name": "Leilani \"50/50\" Tupuola",
        "nationality": "New Zealander",
        "divison": "jsoc",
        "zombie_playable": 0,
        "description": "Leilani \"50/50\" Tupoula survived...",
        "unlock_criteria": "Unlocked immediately",
        "image_url": "/assets/operators/50_50.webp"
      },
      {
        "id": 2,
        "short_name": "Anderson",
        "full_name": "Nora Anderson",
        "nationality": "N/A",
        "divison": "jsoc",
        "zombie_playable": 0,
        "description": "Captain Nora Anderson is a legendary...",
        "unlock_criteria": "Unlocked immediately",
        "image_url": "/assets/operators/anderson.webp"
      }
    ]
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data.table` (string) - Table name
- `data.data` (array) - Array of records from the table

**Available Tables:**
- `data_versions`
- `operators`
- `icons`
- `maps`
- `map_layers`
- `map_markers`

**Examples:**
```
GET /api/data/operators - Get all operators
GET /api/data/icons - Get all icons
GET /api/data/data_versions - Get version tracking data
GET /api/data/maps - Get all maps (with bounds as JSON)
GET /api/data/map_layers - Get all map layers
GET /api/data/map_markers - Get all map markers (with coordinates as floats, properties as JSON)
```

**Note:** Map-related tables include automatic type conversions:
- `maps`: `bounds` field is parsed as JSON object, `id` as integer
- `map_layers`: `map_id` and `default_visible` as integers
- `map_markers`: `map_id` and `hide_on_load` as integers, `coord_x`/`coord_y` as floats, `properties` as JSON object

---

### 7. Get All Maps with Markers
Get all maps with their markers in GeoJSON format. Use this for initial map data sync.

**Endpoint:** `GET /api/maps/all`

**Request:**
```
GET https://codbo7.masoombadi.top/api/maps/all
```

**Response:**
```json
{
  "success": true,
  "data": {
    "blackheart": {
      "name": "blackheart",
      "displayName": "Blackheart",
      "baseImageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp",
      "coverImageUrl": "/assets/maps/blackheart/cover.webp",
      "teams": "JSOC vs The Guilds",
      "modes": "All (except Skirmish)",
      "campaignMap": "Containment",
      "location": "NA",
      "bounds": {
        "southwest": [0, 0],
        "northeast": [2048, 2048]
      },
      "layers": [
        {
          "key": "domination_zone",
          "name": "Domination Zone",
          "type": "overlay",
          "imageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_DOM.webp",
          "defaultVisible": false
        },
        {
          "key": "hardpoint_zone",
          "name": "Hardpoint Zone",
          "type": "overlay",
          "imageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp",
          "defaultVisible": false
        }
      ],
      "filters": [
        {
          "category": "multiplayer_objective_domination",
          "displayName": "Multiplayer objective domination",
          "markerType": "domination",
          "iconUrl": "/assets/maps/blackheart/Marker_Objective_Domination.svg",
          "count": 3
        }
      ],
      "geojson": {
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [697, 959]
            },
            "properties": {
              "category": "multiplayer_objective_domination",
              "type": "domination",
              "name": "Domination Zone A",
              "hideOnLoad": false,
              "label": "A",
              "mode": "multiplayer",
              "gameSelection": "bo7"
            }
          }
        ]
      }
    }
  },
  "message": null
}
```

**Response Fields:**
- `success` (boolean) - Request success status
- `data` (object) - Object with map names as keys
  - `{mapName}.name` (string) - Map identifier
  - `{mapName}.displayName` (string) - Human-readable map name
  - `{mapName}.baseImageUrl` (string) - Base tactical map image (blank)
  - `{mapName}.coverImageUrl` (string) - Cover/preview image for the map
  - `{mapName}.teams` (string) - Team matchup (e.g., "JSOC vs The Guilds")
  - `{mapName}.modes` (string) - Available game modes
  - `{mapName}.campaignMap` (string) - Associated campaign map
  - `{mapName}.location` (string) - Map location/region
  - `{mapName}.bounds` (object) - Map boundary coordinates
  - `{mapName}.layers` (array) - Overlay layers (DOM/HP zones)
  - `{mapName}.filters` (array) - Filter metadata for building toggle UI
  - `{mapName}.geojson` (object) - GeoJSON FeatureCollection
    - `type` (string) - Always "FeatureCollection"
    - `features` (array) - Array of map markers
      - `type` (string) - Always "Feature"
      - `geometry.type` (string) - Always "Point"
      - `geometry.coordinates` (array) - [x, y] coordinates
      - `properties` (object) - Marker properties
        - `category` (string) - Marker category
        - `type` (string) - Marker type (domination, hardpoint, snd, spawn, poi)
        - `name` (string) - Marker name
        - Additional properties vary by marker type

---

### 8. Get Specific Map with Markers
Get a single map with its markers in GeoJSON format.

**Endpoint:** `GET /api/maps/{mapName}`

**Request:**
```
GET https://codbo7.masoombadi.top/api/maps/blackheart
```

**Response:**
```json
{
  "success": true,
  "data": {
    "name": "blackheart",
    "displayName": "Blackheart",
    "baseImageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp",
    "coverImageUrl": "/assets/maps/blackheart/cover.webp",
    "teams": "JSOC vs The Guilds",
    "modes": "All (except Skirmish)",
    "campaignMap": "Containment",
    "location": "NA",
    "bounds": {
      "southwest": [0, 0],
      "northeast": [2048, 2048]
    },
    "layers": [
      {
        "key": "domination_zone",
        "name": "Domination Zone",
        "type": "overlay",
        "imageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_DOM.webp",
        "defaultVisible": false
      },
      {
        "key": "hardpoint_zone",
        "name": "Hardpoint Zone",
        "type": "overlay",
        "imageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp",
        "defaultVisible": false
      }
    ],
    "filters": [
      {
        "category": "multiplayer_objective_domination",
        "displayName": "Multiplayer objective domination",
        "markerType": "domination",
        "iconUrl": "/assets/maps/blackheart/Marker_Objective_Domination.svg",
        "count": 3
      },
      {
        "category": "multiplayer_objective_hardpoint",
        "displayName": "Multiplayer objective hardpoint",
        "markerType": "hardpoint",
        "iconUrl": "/assets/maps/blackheart/Marker_Objective_Hardpoint.svg",
        "count": 5
      },
      {
        "category": "multiplayer_objective_searchAndDestroy",
        "displayName": "Multiplayer objective searchAndDestroy",
        "markerType": "snd",
        "iconUrl": "/assets/maps/blackheart/Marker_Objective_SearchAndDestroy.svg",
        "count": 2
      },
      {
        "category": "multiplayer_mainSpawnLocation",
        "displayName": "Multiplayer mainSpawnLocation",
        "markerType": "spawn",
        "iconUrl": "/assets/maps/blackheart/Marker_MainSpawnLocations.svg",
        "count": 2
      },
      {
        "category": "poiLabel",
        "displayName": "PoiLabel",
        "markerType": "poi",
        "iconUrl": "/assets/maps/blackheart/Marker_POIs.svg",
        "count": 5
      }
    ],
    "geojson": {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [697, 959]
          },
          "properties": {
            "category": "multiplayer_objective_domination",
            "type": "domination",
            "name": "Domination Zone A",
            "hideOnLoad": false,
            "label": "A",
            "mode": "multiplayer",
            "gameSelection": "bo7"
          }
        }
      ]
    }
  },
  "message": null
}
```

**Marker Types:**
- `domination` - Domination zone (A, B, C)
- `hardpoint` - Hardpoint location (1-5)
- `snd` - Search & Destroy site (A, B)
- `spawn` - Team spawn point (JSOC, Guild)
- `poi` - Point of Interest

**Response Fields:**
- `success` (boolean) - Request success status
- `data.name` (string) - Map identifier
- `data.displayName` (string) - Human-readable map name
- `data.baseImageUrl` (string) - Base tactical map image (blank)
- `data.coverImageUrl` (string) - Cover/preview image
- `data.teams` (string) - Team matchup
- `data.modes` (string) - Available game modes
- `data.campaignMap` (string) - Associated campaign map
- `data.location` (string) - Map location/region
- `data.bounds` (object) - Map boundary coordinates for scaling
- `data.layers` (array) - Overlay layers for toggling
- `data.filters` (array) - Filter metadata for UI
- `data.geojson` (object) - Standard GeoJSON FeatureCollection format

**Available Maps:**
- `blackheart` - Blackheart

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
        val dataResponse = api.getTableData(category) // GET /api/data/{category}

        when (category) {
            "operators" -> {
                database.updateOperators(dataResponse.data.data)
            }
            "icons" -> {
                database.updateIcons(dataResponse.data.data)
            }
        }

        // Save new version
        sharedPrefs.edit()
            .putInt("${category}_version", versionInfo.version)
            .apply()
    }
}
```

**Initial Sync (First App Launch):**
```kotlin
// For first time app installation, fetch all data at once
val allDataResponse = api.getAllData() // GET /api/data/all

// Store all data
database.updateOperators(allDataResponse.data.operators)
database.updateIcons(allDataResponse.data.icons)

// Save all version numbers
val versionResponse = api.getVersions()
versionResponse.data.forEach { (category, versionInfo) ->
    sharedPrefs.edit()
        .putInt("${category}_version", versionInfo.version)
        .putInt("${category}_schema_version", versionInfo.schemaVersion)
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
| maps | Interactive map data and markers | 1 |

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
