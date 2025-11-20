<?php
/**
 * Insert gobblegums tables into the main database file
 */

$dbFile = __DIR__ . '/../database/joziedti_codbo7.sql';
$gobblegumsSql = file_get_contents(__DIR__ . '/gobblegums_complete.sql');

// Read the entire database file
$lines = file($dbFile);

// Find insertion points
$insertAfterPowerUps = 881; // After power_ups INSERT statements
$dataVersionsInsertLine = null;
$indexesInsertLine = null;
$autoIncrementInsertLine = null;
$foreignKeyInsertLine = null;

// Find the data_versions INSERT line
for ($i = 0; $i < count($lines); $i++) {
    if (strpos($lines[$i], "INSERT INTO `data_versions`") !== false) {
        // Find the end of the INSERT statement
        for ($j = $i; $j < count($lines); $j++) {
            if (strpos($lines[$j], "('wildcards',") !== false) {
                $dataVersionsInsertLine = $j;
                break;
            }
        }
        break;
    }
}

// Find where to insert indexes (after power_ups indexes, before maps indexes)
for ($i = 0; $i < count($lines); $i++) {
    if (strpos($lines[$i], "Indexes for table `power_ups`") !== false) {
        // Find the end of power_ups indexes
        for ($j = $i; $j < count($lines); $j++) {
            if (trim($lines[$j]) === '--' && strpos($lines[$j+1], "Indexes for table `maps`") !== false) {
                $indexesInsertLine = $j;
                break;
            }
        }
        break;
    }
}

// Find where to insert AUTO_INCREMENT (find power_ups AUTO_INCREMENT, insert after it)
for ($i = 0; $i < count($lines); $i++) {
    if (strpos($lines[$i], "AUTO_INCREMENT for table `power_ups`") !== false) {
        // Find the end (next -- comment)
        for ($j = $i; $j < count($lines); $j++) {
            if ($j > $i + 2 && trim($lines[$j]) === '--') {
                $autoIncrementInsertLine = $j;
                break;
            }
        }
        break;
    }
}

// Find where to insert FOREIGN KEY (after field_upgrade_zm_augments, before map_layers)
for ($i = 0; $i < count($lines); $i++) {
    if (strpos($lines[$i], "Constraints for table `field_upgrade_zm_augments`") !== false) {
        // Find the end
        for ($j = $i; $j < count($lines); $j++) {
            if (trim($lines[$j]) === '--' && strpos($lines[$j+1], "Constraints for table `map_layers`") !== false) {
                $foreignKeyInsertLine = $j;
                break;
            }
        }
        break;
    }
}

echo "Insertion points found:\n";
echo "After power_ups data: line " . $insertAfterPowerUps . "\n";
echo "Data versions: line " . $dataVersionsInsertLine . "\n";
echo "Indexes: line " . $indexesInsertLine . "\n";
echo "AUTO_INCREMENT: line " . $autoIncrementInsertLine . "\n";
echo "FOREIGN KEY: line " . $foreignKeyInsertLine . "\n\n";

// Prepare the new content parts
$newLines = $lines;

// 1. Insert gobblegums tables after power_ups
array_splice($newLines, $insertAfterPowerUps, 0, $gobblegumsSql . "\n");

// Adjust line numbers after insertion
$gobblegumsSqlLines = substr_count($gobblegumsSql, "\n") + 1;
$dataVersionsInsertLine += $gobblegumsSqlLines;
$indexesInsertLine += $gobblegumsSqlLines;
$autoIncrementInsertLine += $gobblegumsSqlLines;
$foreignKeyInsertLine += $gobblegumsSqlLines;

// 2. Update data_versions INSERT (add gobblegums and gobblegum_tips before wildcards)
$dataVersionsAddition = "('gobblegums', 1, 1, '2025-11-20 00:00:00', 'GobbleGums for zombies mode'),\n" .
                         "('gobblegum_tips', 1, 1, '2025-11-20 00:00:00', 'Tips and strategies for GobbleGums'),\n";
array_splice($newLines, $dataVersionsInsertLine, 0, $dataVersionsAddition);

// Adjust line numbers
$dataVersionsAdditionLines = substr_count($dataVersionsAddition, "\n");
$indexesInsertLine += $dataVersionsAdditionLines;
$autoIncrementInsertLine += $dataVersionsAdditionLines;
$foreignKeyInsertLine += $dataVersionsAdditionLines;

// 3. Insert indexes
$indexesAddition = "--\n" .
                   "-- Indexes for table `gobblegums`\n" .
                   "--\n" .
                   "ALTER TABLE `gobblegums`\n" .
                   "  ADD PRIMARY KEY (`id`),\n" .
                   "  ADD UNIQUE KEY `name` (`name`);\n" .
                   "\n" .
                   "--\n" .
                   "-- Indexes for table `gobblegum_tips`\n" .
                   "--\n" .
                   "ALTER TABLE `gobblegum_tips`\n" .
                   "  ADD PRIMARY KEY (`id`),\n" .
                   "  ADD KEY `gobblegum_id` (`gobblegum_id`);\n" .
                   "\n";
array_splice($newLines, $indexesInsertLine, 0, $indexesAddition);

// Adjust line numbers
$indexesAdditionLines = substr_count($indexesAddition, "\n");
$autoIncrementInsertLine += $indexesAdditionLines;
$foreignKeyInsertLine += $indexesAdditionLines;

// 4. Insert AUTO_INCREMENT
$autoIncrementAddition = "--\n" .
                          "-- AUTO_INCREMENT for table `gobblegums`\n" .
                          "--\n" .
                          "ALTER TABLE `gobblegums`\n" .
                          "  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;\n" .
                          "\n" .
                          "--\n" .
                          "-- AUTO_INCREMENT for table `gobblegum_tips`\n" .
                          "--\n" .
                          "ALTER TABLE `gobblegum_tips`\n" .
                          "  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;\n" .
                          "\n";
array_splice($newLines, $autoIncrementInsertLine, 0, $autoIncrementAddition);

// Adjust line numbers
$autoIncrementAdditionLines = substr_count($autoIncrementAddition, "\n");
$foreignKeyInsertLine += $autoIncrementAdditionLines;

// 5. Insert FOREIGN KEY
$foreignKeyAddition = "--\n" .
                       "-- Constraints for table `gobblegum_tips`\n" .
                       "--\n" .
                       "ALTER TABLE `gobblegum_tips`\n" .
                       "  ADD CONSTRAINT `gobblegum_tips_ibfk_1` FOREIGN KEY (`gobblegum_id`) REFERENCES `gobblegums` (`id`) ON DELETE CASCADE;\n" .
                       "\n";
array_splice($newLines, $foreignKeyInsertLine, 0, $foreignKeyAddition);

// Write the modified content back
file_put_contents($dbFile, implode('', $newLines));

echo "Successfully inserted gobblegums data into database file!\n";
echo "Total lines added: " . ($gobblegumsSqlLines + $dataVersionsAdditionLines + $indexesAdditionLines + $autoIncrementAdditionLines + substr_count($foreignKeyAddition, "\n")) . "\n";
