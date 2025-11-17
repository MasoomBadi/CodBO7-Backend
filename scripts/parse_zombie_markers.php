<?php
/**
 * Parse zombie map markers from GeoJSON format
 * Generates SQL INSERT statements for map_markers table
 */

// Category to icon URL mapping
$iconMap = [
    'poiLabel' => '/assets/maps/vandorn_farm/Marker_POIs.svg',
    'zombies_wallBuys' => '/assets/maps/vandorn_farm/WallBuy.svg',
    'zombies_fastTravel' => '/assets/maps/vandorn_farm/FastTravel.svg',
    'zombies_exfil' => '/assets/maps/vandorn_farm/ExfilRadio.svg',
    'zombies_traps' => '/assets/maps/vandorn_farm/Traps.svg',
    'zombies_ammo' => '/assets/maps/vandorn_farm/Ammo.svg',
    'zombies_craftingTables' => '/assets/maps/vandorn_farm/CraftingTable.svg',
    'zombies_mysteryBoxes' => '/assets/maps/vandorn_farm/MysteryBox.svg',
    'zombies_arsenals' => '/assets/maps/vandorn_farm/Arsenal.svg',
    'zombies_armorVests' => '/assets/maps/vandorn_farm/Armor.svg',
    'zombies_powerDoors' => '/assets/maps/vandorn_farm/PowerDoor.svg',
    'zombies_gobbleGumMachines' => '/assets/maps/vandorn_farm/GobbleGum.svg',

    // Perk-specific icons
    'zombies_perk_juggernog' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_juggernaut_lg.png',
    'zombies_perk_doubleTap' => '/assets/maps/vandorn_farm/ui_icon_perks_double_tap_lg.png',
    'zombies_perk_vultureAid' => '/assets/maps/vandorn_farm/ui_icon_perks_vulture_aid_lg.png',
    'zombies_perk_speedCola' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_speedloader_lg.png',
    'zombies_perk_meleeMacchiato' => '/assets/maps/vandorn_farm/ui_icon_perks_melee_macchiato_lg.png',
    'zombies_perk_quickRevive' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_quickrevive_lg.png',
    'zombies_perk_staminUp' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_staminup_lg.png',
    'zombies_perk_deathPerception' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_deathperception_lg.png',
    'zombies_perk_elementalPop' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_elemental_pop_lg.png',
    'zombies_perk_deadshotDaiquiri' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_deadshot_lg.png',
    'zombies_perk_wispTea' => '/assets/maps/vandorn_farm/ui_icon_perks_wisp_tea_lg.png',
    'zombies_perk_phdFlopper' => '/assets/maps/vandorn_farm/ui_icon_perks_zm_phdslider_lg.png',
];

// Category to marker type mapping
$markerTypeMap = [
    'poiLabel' => 'poi',
    'zombies_wallBuys' => 'wall_buy',
    'zombies_fastTravel' => 'fast_travel',
    'zombies_exfil' => 'exfil',
    'zombies_traps' => 'trap',
    'zombies_ammo' => 'ammo',
    'zombies_craftingTables' => 'crafting',
    'zombies_mysteryBoxes' => 'mystery_box',
    'zombies_arsenals' => 'arsenal',
    'zombies_armorVests' => 'armor',
    'zombies_powerDoors' => 'power',
    'zombies_gobbleGumMachines' => 'gobble_gum',
    'zombies_perk_juggernog' => 'perk',
    'zombies_perk_doubleTap' => 'perk',
    'zombies_perk_vultureAid' => 'perk',
    'zombies_perk_speedCola' => 'perk',
    'zombies_perk_meleeMacchiato' => 'perk',
    'zombies_perk_quickRevive' => 'perk',
    'zombies_perk_staminUp' => 'perk',
    'zombies_perk_deathPerception' => 'perk',
    'zombies_perk_elementalPop' => 'perk',
    'zombies_perk_deadshotDaiquiri' => 'perk',
    'zombies_perk_wispTea' => 'perk',
    'zombies_perk_phdFlopper' => 'perk',
];

// Read GeoJSON from stdin
echo "Paste the GeoJSON data and press Ctrl+D when done:\n";
$json = file_get_contents('php://stdin');

$data = json_decode($json, true);

if (!$data || !isset($data['features'])) {
    die("Invalid GeoJSON format\n");
}

$mapId = 17; // vandorn_farm
$startingId = 1000; // Starting ID for markers
$currentId = $startingId;

$inserts = [];

foreach ($data['features'] as $feature) {
    $coords = $feature['geometry']['coordinates'];
    $props = $feature['properties'];

    $coordX = $coords[0];
    $coordY = $coords[1];
    $name = $props['name'];
    $category = $props['category'];
    $hideOnLoad = ($props['hideOnLoad'] === 'true' || $props['hideOnLoad'] === true) ? 1 : 0;

    // Get marker type from category
    $markerType = $markerTypeMap[$category] ?? 'unknown';

    // Get icon URL from category
    $iconUrl = $iconMap[$category] ?? '/assets/maps/vandorn_farm/Marker_POIs.svg';

    // Build properties JSON (store any extra metadata)
    $extraProps = [];
    foreach ($props as $key => $value) {
        if (!in_array($key, ['mode', 'gameSelection', 'hideOnLoad', 'x', 'y', 'name', 'category', 'mapId', 'mapPath', 'sling:resourceType'])) {
            $extraProps[$key] = $value;
        }
    }
    $propertiesJson = json_encode($extraProps);

    // Escape strings for SQL
    $nameEsc = addslashes($name);
    $iconUrlEsc = addslashes($iconUrl);
    $propertiesEsc = addslashes($propertiesJson);

    $inserts[] = "($currentId, $mapId, '$category', '$markerType', '$nameEsc', $coordX, $coordY, '$iconUrlEsc', $hideOnLoad, '$propertiesEsc')";

    $currentId++;
}

// Generate SQL
echo "\n-- Vandorn Farm Zombie Map Markers\n";
echo "-- Total markers: " . count($inserts) . "\n\n";

echo "INSERT INTO `map_markers` (`id`, `map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES\n";
echo implode(",\n", $inserts);
echo ";\n\n";

echo "-- Update auto_increment\n";
echo "ALTER TABLE `map_markers` AUTO_INCREMENT = $currentId;\n";
