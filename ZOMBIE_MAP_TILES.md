# Zombie Map Tiling System

## Overview
Zombie maps use a tiled rendering system for large 8192x8192 maps instead of a single image like multiplayer maps (2048x2048).

## Database Structure

### `maps` Table
Zombie maps are distinguished by:
- `type = 'zombie_big'` (vs `'core'` for multiplayer)
- `bounds = {"southwest": [0, 0], "northeast": [8192, 8192]}` (4x larger)
- `base_image_url` contains tile pattern: `/assets/maps/{map_name}/tiles/{z}/{x}/{y}.png`

### `map_tiles` Table
```sql
CREATE TABLE `map_tiles` (
  `id` int NOT NULL,
  `map_id` int NOT NULL,
  `zoom_level` int NOT NULL,
  `tile_x` int NOT NULL,
  `tile_y` int NOT NULL,
  `tile_url` varchar(255) NOT NULL
)
```

### `map_markers` Table
Zombie markers use the same table structure as multiplayer markers:
```sql
CREATE TABLE `map_markers` (
  `id` int NOT NULL,
  `map_id` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `marker_type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `coord_x` decimal(10,2) NOT NULL,
  `coord_y` decimal(10,2) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `hide_on_load` tinyint(1) DEFAULT 0,
  `properties` JSON DEFAULT NULL
)
```

## Zoom Level Mapping

Frontend scale (0.5f - 5f) maps to discrete zoom levels (1-5):

| Frontend Scale | Zoom Level | Tile Grid | Description |
|----------------|------------|-----------|-------------|
| 0.5 - 1.0 | 1 | 2x2 (4 tiles) | Minimum zoom - overview |
| 1.0 - 1.5 | 2 | 4x4 (16 tiles) | Low detail |
| 1.5 - 2.5 | 3 | 8x8 (64 tiles max) | Medium detail |
| 2.5 - 4.0 | 4 | 16x16 (256 tiles max) | High detail |
| 4.0 - 5.0 | 5 | 32x32 (1024 tiles max) | Maximum zoom |

**Note:** Not all tiles exist at all zoom levels. Only populated areas have tiles.

## Vandorn Farm (Ashes of the Damned) Data

### Tile Distribution
```
Zoom 1: 4 tiles (complete 2x2 grid)
Zoom 2: 16 tiles (complete 4x4 grid)
Zoom 3: 8 tiles (sparse - only populated areas)
Zoom 4: 9 tiles (sparse - only populated areas)
Zoom 5: 7 tiles (sparse - highest detail for key areas)

Total: 44 tiles
```

### Marker Distribution (97 total)
```
POI Labels: 6 (Ashwood, Blackwater Lake, Janus Towers Plaza, Vandorn Farm, Exit 115, Zarya Cosmodrome)
Wall Buys: 27 (Various weapon purchases)
Perks: 12 (Jugger-Nog, Double Tap, Speed Cola, Quick Revive, Stamin-UP, etc.)
Fast Travel: 7 locations
Exfil Points: 5 locations
Ammo Caches: 15 locations
Mystery Boxes: 4 locations
Crafting Tables: 4 locations
Arsenals: 5 locations
Armor Vests: 5 locations
Power Doors: 10 locations
GobbleGum Machines: 4 locations
Traps: 3 locations

Total: 97 markers
```

## Frontend Implementation

### 1. Detect Tiled Map
```javascript
const isTiledMap = map.base_image_url.includes('{z}/{x}/{y}');
const isZombieMap = map.type === 'zombie';
```

### 2. Calculate Zoom Level from Scale
```javascript
function getZoomLevel(scale) {
  if (scale < 1.0) return 1;
  if (scale < 1.5) return 2;
  if (scale < 2.5) return 3;
  if (scale < 4.0) return 4;
  return 5;
}
```

### 3. Fetch Tiles for Zoom Level
```javascript
// Query map_tiles table
const tiles = await fetch(`/api/maps/${mapId}/tiles?zoom=${zoomLevel}`);
```

### 4. Render Visible Tiles
```javascript
// Calculate viewport bounds
// Load only tiles within viewport
// Render in grid layout based on tile_x and tile_y
```

### 5. Handle Missing Tiles
```javascript
// Not all tiles exist at higher zoom levels
// Show empty/transparent tile if tile doesn't exist
// Gracefully degrade to lower zoom level tiles if needed
```

## API Endpoints

### Available Endpoints

```
GET /api/data/all
  - Returns all data including map_tiles and map_markers
  - Includes proper type conversions (int for zoom_level, tile_x, tile_y)

GET /api/data/map_tiles
  - Returns all map tiles
  - Sorted by map_id, id

GET /api/data/map_markers
  - Returns all map markers (multiplayer + zombie)
  - Sorted by map_id, id

GET /api/maps/{mapName}
  - Returns map with markers in wrapped GeoJSON format
  - Example: /api/maps/vandorn_farm

GET /api/geojson/{mapName}
  - Returns pure GeoJSON FeatureCollection (CoD API compatible)
  - Content-Type: application/geo+json
  - Properties include: mode, gameSelection, hideOnLoad, x, y, name, category
  - Example: /api/geojson/vandorn_farm
```

### Future Endpoints (Optional)

```
GET /api/maps/{mapId}/tiles
  - Returns all tiles for a map
  - Optional query params: ?zoom={level}

GET /api/maps/{mapId}/tiles/{zoom}/{x}/{y}
  - Returns specific tile URL or 404
```

## Performance Optimizations

1. **Tile Caching**: Cache loaded tiles in memory
2. **Lazy Loading**: Only load visible tiles
3. **Preloading**: Preload adjacent tiles for smooth panning
4. **Unloading**: Unload off-screen tiles to save memory
5. **Sprite Atlases**: Consider combining small tiles into atlases

## Marker Coordinate Scaling

Zombie maps use 8192x8192 coordinate space (4x larger):
```javascript
// Multiplayer: 0-2048
const multiplayerCoord = { x: 1024, y: 1024 }; // center

// Zombie: 0-8192
const zombieCoord = { x: 4096, y: 4096 }; // center

// No conversion needed - coordinates are already in correct space
```

## Example: Vandorn Farm Map Entry

```sql
-- Map entry
(17, 'vandorn_farm', 'Ashes of the Damned',
 '/assets/maps/vandorn_farm/tiles/{z}/{x}/{y}.png',
 NULL, 'Zombies', 'Zombies', NULL, 'Germany',
 '{"southwest": [0, 0], "northeast": [8192, 8192]}',
 'zombie_big')

-- Sample tile entries
(1, 17, 1, 0, 0, '/assets/maps/vandorn_farm/tiles/1/0/0.png')
(2, 17, 1, 0, 1, '/assets/maps/vandorn_farm/tiles/1/0/1.png')
...

-- Sample marker entries
(1000, 17, 'poiLabel', 'poi', 'Ashwood', 4376, 4600, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]')
(1011, 17, 'zombies_perk_juggernog', 'perk', 'Jugger-Nog', 4126, 4519, '/assets/maps/vandorn_farm/ui_icon_perks_zm_juggernaut_lg.png', 0, '[]')
...
```

## Zombie-Specific Markers

### Marker Categories and Types

Zombie maps use different marker categories than multiplayer maps:

| Category | Marker Type | Icon | Count (Vandorn Farm) |
|----------|-------------|------|----------------------|
| `poiLabel` | `poi` | `Marker_POIs.svg` | 6 |
| `zombies_wallBuys` | `wall_buy` | `WallBuy.svg` | 27 |
| `zombies_fastTravel` | `fast_travel` | `FastTravel.svg` | 7 |
| `zombies_exfil` | `exfil` | `ExfilRadio.svg` | 5 |
| `zombies_traps` | `trap` | `Traps.svg` | 3 |
| `zombies_ammo` | `ammo` | `Ammo.svg` | 15 |
| `zombies_craftingTables` | `crafting` | `CraftingTable.svg` | 4 |
| `zombies_mysteryBoxes` | `mystery_box` | `MysteryBox.svg` | 4 |
| `zombies_arsenals` | `arsenal` | `Arsenal.svg` | 5 |
| `zombies_armorVests` | `armor` | `Armor.svg` | 5 |
| `zombies_powerDoors` | `power` | `PowerDoor.svg` | 10 |
| `zombies_gobbleGumMachines` | `gobble_gum` | `GobbleGum.svg` | 4 |

### Perk Machines

Perk markers use specific category names with individual PNG icons:

| Category | Name | Icon File |
|----------|------|-----------|
| `zombies_perk_juggernog` | Jugger-Nog | `ui_icon_perks_zm_juggernaut_lg.png` |
| `zombies_perk_doubleTap` | Double Tap | `ui_icon_perks_double_tap_lg.png` |
| `zombies_perk_speedCola` | Speed Cola | `ui_icon_perks_zm_speedloader_lg.png` |
| `zombies_perk_quickRevive` | Quick Revive | `ui_icon_perks_zm_quickrevive_lg.png` |
| `zombies_perk_staminUp` | Stamin-UP | `ui_icon_perks_zm_staminup_lg.png` |
| `zombies_perk_vultureAid` | Vulture Aid | `ui_icon_perks_vulture_aid_lg.png` |
| `zombies_perk_meleeMacchiato` | Melee Macchiato | `ui_icon_perks_melee_macchiato_lg.png` |
| `zombies_perk_deathPerception` | Death Perception | `ui_icon_perks_zm_deathperception_lg.png` |
| `zombies_perk_elementalPop` | Elemental Pop | `ui_icon_perks_zm_elemental_pop_lg.png` |
| `zombies_perk_deadshotDaiquiri` | Deadshot Daiquiri | `ui_icon_perks_zm_deadshot_lg.png` |
| `zombies_perk_wispTea` | Wisp Tea | `ui_icon_perks_wisp_tea_lg.png` |
| `zombies_perk_phdFlopper` | PhD Flopper | `ui_icon_perks_zm_phdslider_lg.png` |

All perk markers use `marker_type = 'perk'`

## Parsing GeoJSON Markers

Use the provided script to parse markers from official CoD GeoJSON format:

```bash
cd /home/user/CodBO7-Backend/scripts
php parse_zombie_markers.php < vandorn_farm_markers.json > vandorn_farm_markers.sql
```

The script automatically:
- Maps categories to marker types and icon URLs
- Generates SQL INSERT statements with proper IDs
- Handles perk-specific icon assignments
- Updates AUTO_INCREMENT values
