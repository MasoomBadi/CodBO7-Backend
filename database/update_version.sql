-- Helper: Update Version Numbers
-- Use these queries when you modify data in any table

-- IMPORTANT: Run the appropriate UPDATE query below after modifying data
-- This will increment the version number for that category

-- Update weapons version
UPDATE data_versions SET version = version + 1 WHERE category = 'weapons';

-- Update maps version
UPDATE data_versions SET version = version + 1 WHERE category = 'maps';

-- Update perks version
UPDATE data_versions SET version = version + 1 WHERE category = 'perks';

-- Update equipment version
UPDATE data_versions SET version = version + 1 WHERE category = 'equipment';

-- Update guides version
UPDATE data_versions SET version = version + 1 WHERE category = 'guides';

-- Update scorestreaks version
UPDATE data_versions SET version = version + 1 WHERE category = 'scorestreaks';

-- ============================================
-- EXAMPLE WORKFLOW:
-- ============================================
-- 1. Add/update weapon data:
--    INSERT INTO weapons (...) VALUES (...);
--
-- 2. Update version:
--    UPDATE data_versions SET version = version + 1 WHERE category = 'weapons';
--
-- 3. Android app will detect the version change and sync the new data
-- ============================================
