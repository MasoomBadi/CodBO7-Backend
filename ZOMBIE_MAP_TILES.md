# Zombie Map Tiling System

## Overview
Zombie maps use a tiled rendering system for large 8192x8192 maps instead of a single image like multiplayer maps (2048x2048).

## Database Structure

### `maps` Table
Zombie maps are distinguished by:
- `type = 'zombie'` (vs `'core'` for multiplayer)
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

## Vandorn Farm (Ashes of the Damned) Tile Distribution

```
Zoom 1: 4 tiles (complete 2x2 grid)
Zoom 2: 16 tiles (complete 4x4 grid)
Zoom 3: 8 tiles (sparse - only populated areas)
Zoom 4: 9 tiles (sparse - only populated areas)
Zoom 5: 7 tiles (sparse - highest detail for key areas)

Total: 44 tiles
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

## API Endpoints Needed

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
 'zombie')

-- Sample tile entries
(1, 17, 1, 0, 0, '/assets/maps/vandorn_farm/tiles/1/0/0.png')
(2, 17, 1, 0, 1, '/assets/maps/vandorn_farm/tiles/1/0/1.png')
...
```

## Zombie-Specific Markers

Zombie maps use different marker categories:
- `zombie_ammo` - Ammo boxes
- `zombie_armor` - Armor stations
- `zombie_arsenal` - Arsenal upgrade stations
- `zombie_crafting` - Crafting tables
- `zombie_exfil` - Exfil points
- `zombie_fast_travel` - Fast travel teleporters
- `zombie_gobble_gum` - GobbleGum machines
- `zombie_mystery_box` - Mystery box locations
- `zombie_perk` - Perk machines (with specific perk icon)
- `zombie_power` - Power switches/doors
- `zombie_trap` - Trap locations
- `zombie_wall_buy` - Wall weapon purchases
- `zombie_poi` - General points of interest

Each perk machine can have a specific icon from:
- `ui_icon_perks_double_tap_lg.png`
- `ui_icon_perks_zm_juggernaut_lg.png`
- etc. (12 total perk icons)
