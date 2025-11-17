#!/bin/bash

# Script to generate SQL for all vandorn_farm tiles

mapId=17
id=1

echo "-- Vandorn Farm Zombie Map Tiles (Complete Set: 1,364 tiles)"
echo "-- Generated on $(date)"
echo ""
echo "INSERT INTO \`map_tiles\` (\`id\`, \`map_id\`, \`zoom_level\`, \`tile_x\`, \`tile_y\`, \`tile_url\`) VALUES"

# Find all tiles, sort them, and generate SQL
first=true
find /home/user/CodBO7-Backend/assets/maps/vandorn_farm/tiles -type f -name "*.png" | sort -V | while read tile; do
    # Extract z, x, y from path like: .../tiles/5/23/24.png
    z=$(echo $tile | awk -F'/' '{print $(NF-2)}')
    x=$(echo $tile | awk -F'/' '{print $(NF-1)}')
    y=$(basename $tile .png)

    # Add comma for all except first
    if [ "$first" = true ]; then
        first=false
        echo -n "($id, $mapId, $z, $x, $y, '/assets/maps/vandorn_farm/tiles/$z/$x/$y.png')"
    else
        echo ","
        echo -n "($id, $mapId, $z, $x, $y, '/assets/maps/vandorn_farm/tiles/$z/$x/$y.png')"
    fi

    id=$((id + 1))
done

echo ";"
echo ""
echo "-- Update AUTO_INCREMENT"
echo "ALTER TABLE \`map_tiles\` MODIFY \`id\` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=$id;"
