-- --------------------------------------------------------
-- Table structure for table `ammo_mods`
-- --------------------------------------------------------

CREATE TABLE `ammo_mods` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int NOT NULL DEFAULT 0,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `box_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ammo_mods`
--

INSERT INTO `ammo_mods` (`id`, `name`, `description`, `unlock_level`, `icon_url`, `box_url`, `recipe_url`, `sort_order`) VALUES
(1, 'Dead Wire', 'Bullets deal electric damage. Each bullet has a chance to stun a normal or special enemy, causing them to generate an electric damage field.', 0, '/assets/ammo_mods/icons/dead_wire.webp', '/assets/ammo_mods/box/dead_wire.png', '/assets/ammo_mods/recipe/dead_wire.webp', 1),
(2, 'Cryo Freeze', 'Bullets deal frost damage. Each bullet has a chance to slow a normal or special enemy and increase the damage they receive.', 12, '/assets/ammo_mods/icons/cryo_freeze.webp', '/assets/ammo_mods/box/cryo_freeze.png', '/assets/ammo_mods/recipe/cryo_freeze.webp', 2),
(3, 'Fire Works', 'Each bullet that hits a Normal or Special Enemy has a chance to launch fireworks that target enemies.', 18, '/assets/ammo_mods/icons/firework.webp', '/assets/ammo_mods/box/firework.png', '/assets/ammo_mods/recipe/firework.webp', 3),
(4, 'Napalm Burst', 'Bullets deal fire damage. Each bullet has a chance to apply a burn on normal and special enemies, dealing damage over time.', 35, '/assets/ammo_mods/icons/napalm_burst.webp', '/assets/ammo_mods/box/napalm_burst.png', '/assets/ammo_mods/recipe/napalm_burst.webp', 4),
(5, 'Shadow Rift', 'Bullets deal shadow damage. Each bullet has a chance to spawn a black hole on a normal or special enemy, warping away those nearby and dropping some from the air at lethal speed.', 44, '/assets/ammo_mods/icons/shadow_rift.webp', '/assets/ammo_mods/box/shadow_rift.png', '/assets/ammo_mods/recipe/shadow_rift.webp', 5),
(6, 'Brain Rot', 'Bullets deal toxic damage. Each bullet has a chance to temporarily turn a normal or special enemy into an ally.', 51, '/assets/ammo_mods/icons/brain_rot.webp', '/assets/ammo_mods/box/brain_rot.png', '/assets/ammo_mods/recipe/brain_rot.webp', 6);

--
-- Indexes for table `ammo_mods`
--
ALTER TABLE `ammo_mods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for table `ammo_mods`
--
ALTER TABLE `ammo_mods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Add to data_versions table
--
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`) VALUES
('ammo_mods', 1, 1, '2025-11-18 00:00:00', 'Ammo Mods for zombies mode');
