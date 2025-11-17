<?php
/**
 * Generate SQL for all vandorn_farm tiles
 */

$mapId = 17;
$id = 1;
$basePath = '/home/user/CodBO7-Backend/assets/maps/vandorn_farm/tiles';

// Find all tiles
exec("find $basePath -type f -name '*.png' | sort -V", $tiles);

echo "-- Vandorn Farm Zombie Map Tiles (Complete Set: " . count($tiles) . " tiles)\n";
echo "-- Generated on " . date('Y-m-d H:i:s') . "\n\n";

echo "INSERT INTO `map_tiles` (`id`, `map_id`, `zoom_level`, `tile_x`, `tile_y`, `tile_url`) VALUES\n";

$inserts = [];
foreach ($tiles as $tile) {
    // Extract z, x, y from path like: .../tiles/5/23/24.png
    preg_match('/tiles\/(\d+)\/(\d+)\/(\d+)\.png$/', $tile, $matches);
    if (count($matches) === 4) {
        $z = $matches[1];
        $x = $matches[2];
        $y = $matches[3];

        $inserts[] = "($id, $mapId, $z, $x, $y, '/assets/maps/vandorn_farm/tiles/$z/$x/$y.png')";
        $id++;
    }
}

echo implode(",\n", $inserts);
echo ";\n\n";

echo "-- Update AUTO_INCREMENT\n";
echo "ALTER TABLE `map_tiles` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=$id;\n";
