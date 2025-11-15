# Interactive Maps Implementation Guide

## Overview
This guide explains how to implement the Call of Duty Black Ops 7 interactive tactical maps in your Android app, matching the functionality of the official CoD website.

---

## API Response Structure

### Endpoint: `GET /api/maps/blackheart`

```json
{
  "success": true,
  "data": {
    "name": "blackheart",
    "displayName": "Blackheart",
    "baseImageUrl": "/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp",
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
        // ... more markers
      ]
    }
  }
}
```

---

## What the API Provides

### 1. **Base Map Image**
- **Field**: `baseImageUrl`
- **Value**: `/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp`
- **Usage**: Display as the background tactical map image

### 2. **Map Bounds**
- **Field**: `bounds`
- **Value**: `{"southwest": [0, 0], "northeast": [2048, 2048]}`
- **Usage**: For coordinate transformation and map scaling

### 3. **Overlay Layers**
- **Field**: `layers[]`
- **Count**: 2 layers for Blackheart
  - Domination Zone overlay (red zones)
  - Hardpoint Zone overlay (yellow zones)
- **Usage**: Toggle these overlay images on/off based on selected game mode

### 4. **Marker Filters**
- **Field**: `filters[]`
- **Categories**:
  - `multiplayer_objective_domination` (3 markers)
  - `multiplayer_objective_hardpoint` (5 markers)
  - `multiplayer_objective_searchAndDestroy` (2 markers)
  - `multiplayer_mainSpawnLocation` (2 markers)
  - `poiLabel` (5 markers)
- **Usage**: Build toggle UI for showing/hiding marker categories

### 5. **GeoJSON Markers**
- **Field**: `geojson.features[]`
- **Total**: 17 markers for Blackheart
- **Format**: Standard GeoJSON with coordinates and properties
- **Usage**: Render markers on the map at specified coordinates

---

## Android Implementation Guide

### Step 1: Display Base Map

```kotlin
// Load the base tactical map
val imageView = findViewById<ImageView>(R.id.tacticalMapImage)
Glide.with(this)
    .load("https://codbo7.masoombadi.top${mapData.baseImageUrl}")
    .into(imageView)
```

### Step 2: Handle Map Bounds for Coordinate Transformation

```kotlin
data class MapBounds(
    val southwest: Pair<Float, Float>,
    val northeast: Pair<Float, Float>
)

// Convert GeoJSON coordinates to screen coordinates
fun coordinateToScreen(
    geoCoord: Pair<Float, Float>,
    bounds: MapBounds,
    imageView: ImageView
): Pair<Float, Float> {
    val mapWidth = bounds.northeast.first - bounds.southwest.first
    val mapHeight = bounds.northeast.second - bounds.southwest.second

    val normalizedX = (geoCoord.first - bounds.southwest.first) / mapWidth
    val normalizedY = (geoCoord.second - bounds.southwest.second) / mapHeight

    val screenX = normalizedX * imageView.width
    val screenY = normalizedY * imageView.height

    return Pair(screenX, screenY)
}
```

### Step 3: Render SVG Markers

```kotlin
// Add to build.gradle
implementation("io.coil-kt:coil-svg:2.5.0")

// Load SVG marker
fun loadSvgMarker(imageView: ImageView, iconUrl: String) {
    val loader = ImageLoader.Builder(context)
        .components {
            add(SvgDecoder.Factory())
        }
        .build()

    val request = ImageRequest.Builder(context)
        .data("https://codbo7.masoombadi.top$iconUrl")
        .target(imageView)
        .build()

    loader.enqueue(request)
}
```

### Step 4: Create Marker Overlay

```kotlin
// Create a custom overlay view for markers
class MarkerOverlayView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null
) : View(context, attrs) {

    private val markers = mutableListOf<MapMarker>()
    private val visibleCategories = mutableSetOf<String>()

    data class MapMarker(
        val x: Float,
        val y: Float,
        val iconBitmap: Bitmap,
        val category: String,
        val name: String
    )

    fun setMarkers(newMarkers: List<MapMarker>) {
        markers.clear()
        markers.addAll(newMarkers)
        invalidate()
    }

    fun toggleCategory(category: String, visible: Boolean) {
        if (visible) {
            visibleCategories.add(category)
        } else {
            visibleCategories.remove(category)
        }
        invalidate()
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        markers.forEach { marker ->
            if (visibleCategories.contains(marker.category)) {
                canvas.drawBitmap(
                    marker.iconBitmap,
                    marker.x - marker.iconBitmap.width / 2,
                    marker.y - marker.iconBitmap.height / 2,
                    null
                )
            }
        }
    }
}
```

### Step 5: Implement Layer Toggle

```kotlin
// Create overlay layers that can be toggled
val overlayLayers = mutableMapOf<String, ImageView>()

mapData.layers.forEach { layer ->
    val overlayImage = ImageView(context).apply {
        layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        scaleType = ImageView.ScaleType.FIT_XY
        visibility = if (layer.defaultVisible) View.VISIBLE else View.GONE
    }

    Glide.with(this)
        .load("https://codbo7.masoombadi.top${layer.imageUrl}")
        .into(overlayImage)

    mapContainer.addView(overlayImage)
    overlayLayers[layer.key] = overlayImage
}

// Toggle layer visibility
fun toggleLayer(layerKey: String, visible: Boolean) {
    overlayLayers[layerKey]?.visibility = if (visible) View.VISIBLE else View.GONE
}
```

### Step 6: Build Filter UI

```kotlin
// Create filter toggles from filters array
fun buildFilterUI(filters: List<MapFilter>) {
    filters.forEach { filter ->
        val toggleButton = MaterialButton(context).apply {
            text = "${filter.displayName} (${filter.count})"
            isCheckable = true
            setOnCheckedChangeListener { _, isChecked ->
                markerOverlay.toggleCategory(filter.category, isChecked)
            }
        }

        filterContainer.addView(toggleButton)
    }
}
```

### Step 7: Complete Layout Structure

```xml
<!-- activity_tactical_map.xml -->
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/mapContainer"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Base map image -->
    <ImageView
        android:id="@+id/baseMapImage"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:scaleType="fitXY" />

    <!-- Domination overlay (hidden by default) -->
    <ImageView
        android:id="@+id/dominationOverlay"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:scaleType="fitXY"
        android:visibility="gone" />

    <!-- Hardpoint overlay (hidden by default) -->
    <ImageView
        android:id="@+id/hardpointOverlay"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:scaleType="fitXY"
        android:visibility="gone" />

    <!-- Marker overlay -->
    <com.yourapp.MarkerOverlayView
        android:id="@+id/markerOverlay"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

</FrameLayout>

<!-- Filter controls at bottom -->
<com.google.android.material.chip.ChipGroup
    android:id="@+id/filterChips"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_gravity="bottom"
    android:padding="16dp"
    app:singleSelection="false" />
```

---

## Toggle System Like Official Website

### Filter Groups (Matching Official Site)

**1. Main Spawn Location** (`multiplayer_mainSpawnLocation`)
- JSOC Spawn Point
- Guild Spawn

**2. Objective** (Parent group with sub-options)
- **Domination** (`multiplayer_objective_domination`)
  - Domination Zone A, B, C
- **Hardpoint** (`multiplayer_objective_hardpoint`)
  - Hardpoint 1, 2, 3, 4, 5
- **Search & Destroy** (`multiplayer_objective_searchAndDestroy`)
  - Search and Destroy Site A, B

**3. POI** (`poiLabel`)
- Drill
- Diving Bell
- Grinder Pit
- Seabed Mining Vehicle
- Barge

**4. Layers** (Image overlays)
- **Domination Zone** (shows colored zones)
- **Hardpoint Zone** (shows colored zones)

### Implementing Grouped Filters

```kotlin
data class FilterGroup(
    val name: String,
    val children: List<FilterItem>
)

data class FilterItem(
    val category: String,
    val displayName: String,
    val iconUrl: String,
    val count: Int,
    var isVisible: Boolean = false
)

// Build hierarchical filter structure
val filterGroups = listOf(
    FilterGroup("Main Spawn Location", listOf(
        FilterItem("multiplayer_mainSpawnLocation", "Spawn Points", "...", 2)
    )),
    FilterGroup("Objective", listOf(
        FilterItem("multiplayer_objective_domination", "Domination", "...", 3),
        FilterItem("multiplayer_objective_hardpoint", "Hardpoint", "...", 5),
        FilterItem("multiplayer_objective_searchAndDestroy", "Search & Destroy", "...", 2)
    )),
    FilterGroup("POI", listOf(
        FilterItem("poiLabel", "Points of Interest", "...", 5)
    )),
    FilterGroup("Layers", listOf(
        // These control overlay images, not markers
    ))
)
```

---

## What's NOT Missing

All required assets are present:

✅ **Base Map**: `Blackheart_Tac_Map_BLANK1.webp` (368KB)
✅ **Domination Overlay**: `Blackheart_Tac_Map_DOM.webp` (15KB)
✅ **Hardpoint Overlay**: `Blackheart_Tac_Map_HP.webp` (18KB)
✅ **SVG Icons**:
- `Marker_Objective_Domination.svg`
- `Marker_Objective_Hardpoint.svg`
- `Marker_Objective_SearchAndDestroy.svg`
- `Marker_MainSpawnLocations.svg`
- `Marker_Objective.svg`
- `Marker_POIs.svg`

✅ **Real Coordinates**: From official CoD website
✅ **All 17 Markers**: 3 DOM + 5 HP + 2 S&D + 2 Spawn + 5 POI

---

## Database Setup

Run the SQL migration in phpMyAdmin:
```sql
-- Execute: database/migrations/update_maps_schema_with_layers.sql
```

This will:
1. Create/update the `maps`, `map_layers`, and `map_markers` tables
2. Populate with Blackheart map data
3. Insert all 17 markers with real coordinates
4. Add layer definitions for overlays

---

## Testing the API

```bash
# Get Blackheart map with all data
curl https://codbo7.masoombadi.top/api/maps/blackheart

# Get all maps
curl https://codbo7.masoombadi.top/api/maps/all
```

---

## Android Dependencies

```gradle
dependencies {
    // Image loading
    implementation 'com.github.bumptech.glide:glide:4.16.0'

    // SVG support
    implementation 'io.coil-kt:coil:2.5.0'
    implementation 'io.coil-kt:coil-svg:2.5.0'

    // Material Design (for chips/toggles)
    implementation 'com.google.android.material:material:1.11.0'

    // Networking
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
}
```

---

## Advanced Features You Can Add

1. **Pinch-to-Zoom**: Use `PhotoView` library for zoomable maps
2. **Marker Click Events**: Show marker details in a bottom sheet
3. **Smart Filtering**: Auto-show relevant overlays when toggling markers
4. **Save Preferences**: Remember user's filter settings with SharedPreferences
5. **Offline Support**: Cache map images and marker data in Room database

---

## Summary

Everything you need is now available via the API:

| Feature | Status | Endpoint |
|---------|--------|----------|
| Base map image | ✅ Ready | `/api/maps/blackheart` → `baseImageUrl` |
| Overlay layers | ✅ Ready | `/api/maps/blackheart` → `layers[]` |
| All markers with coordinates | ✅ Ready | `/api/maps/blackheart` → `geojson.features[]` |
| SVG marker icons | ✅ Ready | Included in each marker's `iconUrl` |
| Filter metadata | ✅ Ready | `/api/maps/blackheart` → `filters[]` |
| Toggle system data | ✅ Ready | Use `category` field to filter markers |

**No assets are missing.** The API provides everything needed to build a fully interactive tactical map matching the official CoD website functionality.
