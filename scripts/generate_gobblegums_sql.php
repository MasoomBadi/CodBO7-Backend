<?php
/**
 * Generate SQL INSERT statements for gobblegums and gobblegum_tips
 */

function escapeSqlString($str) {
    return str_replace("'", "''", $str);
}

// Read gobblegums.csv
$gobblegums = [];
$handle = fopen(__DIR__ . '/../data/gobblegums.csv', 'r');
$headers = fgetcsv($handle); // Skip header row

while (($row = fgetcsv($handle)) !== false) {
    $gobblegums[] = [
        'id' => $row[0],
        'name' => $row[1],
        'rarity' => $row[2],
        'color' => $row[3],
        'essence_value' => $row[4],
        'pattern' => $row[5],
        'activation_type' => $row[6],
        'zombies_effect' => $row[7],
        'doa4_effect' => $row[8],
        'duration' => $row[9],
        'short_description' => $row[10],
        'gum_type' => $row[11],
        'icon_url' => $row[12],
        'recyclable' => $row[13],
        'synergy' => $row[14],
        'tags' => $row[15],
        'sort_order' => $row[16]
    ];
}
fclose($handle);

// Read gobblegum_tips.csv
$tips = [];
$handle = fopen(__DIR__ . '/../data/gobblegum_tips.csv', 'r');
$headers = fgetcsv($handle); // Skip header row

while (($row = fgetcsv($handle)) !== false) {
    $tips[] = [
        'id' => $row[0],
        'gobblegum_id' => $row[1],
        'tip' => $row[2],
        'sort_order' => $row[3]
    ];
}
fclose($handle);

// Generate gobblegums INSERT statements
echo "-- Gobblegums INSERT statements\n";
echo "INSERT INTO `gobblegums` (`id`, `name`, `rarity`, `color`, `essence_value`, `pattern`, `activation_type`, `zombies_effect`, `doa4_effect`, `duration`, `short_description`, `gum_type`, `icon_url`, `recyclable`, `synergy`, `tags`, `sort_order`) VALUES\n";

$gobblegumValues = [];
foreach ($gobblegums as $gum) {
    $doa4 = $gum['doa4_effect'] ? "'" . escapeSqlString($gum['doa4_effect']) . "'" : 'NULL';
    $duration = $gum['duration'] ? "'" . escapeSqlString($gum['duration']) . "'" : 'NULL';
    $synergy = $gum['synergy'] ? "'" . escapeSqlString($gum['synergy']) . "'" : 'NULL';
    $tags = $gum['tags'] ? "'" . escapeSqlString($gum['tags']) . "'" : 'NULL';

    $gobblegumValues[] = sprintf(
        "(%d, '%s', '%s', '%s', %d, '%s', '%s', '%s', %s, %s, '%s', '%s', '%s', %d, %s, %s, %d)",
        $gum['id'],
        escapeSqlString($gum['name']),
        escapeSqlString($gum['rarity']),
        escapeSqlString($gum['color']),
        $gum['essence_value'],
        escapeSqlString($gum['pattern']),
        escapeSqlString($gum['activation_type']),
        escapeSqlString($gum['zombies_effect']),
        $doa4,
        $duration,
        escapeSqlString($gum['short_description']),
        escapeSqlString($gum['gum_type']),
        escapeSqlString($gum['icon_url']),
        $gum['recyclable'],
        $synergy,
        $tags,
        $gum['sort_order']
    );
}

echo implode(",\n", $gobblegumValues) . ";\n\n";

// Generate gobblegum_tips INSERT statements
echo "-- Gobblegum Tips INSERT statements\n";
echo "INSERT INTO `gobblegum_tips` (`id`, `gobblegum_id`, `tip`, `sort_order`) VALUES\n";

$tipValues = [];
foreach ($tips as $tip) {
    $tipValues[] = sprintf(
        "(%d, %d, '%s', %d)",
        $tip['id'],
        $tip['gobblegum_id'],
        escapeSqlString($tip['tip']),
        $tip['sort_order']
    );
}

echo implode(",\n", $tipValues) . ";\n";

echo "\nTotal gobblegums: " . count($gobblegums) . "\n";
echo "Total tips: " . count($tips) . "\n";
