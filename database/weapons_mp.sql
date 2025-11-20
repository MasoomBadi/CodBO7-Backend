-- --------------------------------------------------------
--
-- Table structure for table `weapons_mp`
--

CREATE TABLE `weapons_mp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('Assault Rifle','SMG','Shotgun','LMG','Marksman','Sniper','Pistol','Launcher','Melee') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weapon_type` enum('Primary','Secondary') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_criteria` enum('Immediate Unlock','Level Unlock') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int DEFAULT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_level` int NOT NULL,
  `fire_modes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weapons_mp`
--

INSERT INTO `weapons_mp` (`id`, `name`, `display_name`, `category`, `weapon_type`, `unlock_criteria`, `unlock_level`, `unlock_label`, `max_level`, `fire_modes`, `icon_url`, `sort_order`) VALUES
(1, 'm15_mod_0', 'M15 MOD 0', 'Assault Rifle', 'Primary', 'Immediate Unlock', NULL, 'Default', 47, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/m15_mod_0.webp', 1),
(2, 'ak_27', 'AK-27', 'Assault Rifle', 'Primary', 'Level Unlock', 4, 'Level 4', 47, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/ak_27.webp', 2),
(3, 'mxr_17', 'MXR-17', 'Assault Rifle', 'Primary', 'Level Unlock', 16, 'Level 16', 46, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/mxr_17.webp', 3),
(4, 'peacekeeper_mk1', 'PEACEKEEPER MK1', 'Assault Rifle', 'Primary', 'Level Unlock', 52, 'Level 52', 46, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/peacekeeper_mk1.webp', 4),
(5, 'ds20_mirage', 'DS20 Mirage', 'Assault Rifle', 'Primary', 'Level Unlock', 37, 'Level 37', 43, 'Fully-Automatic (rifle) / Semi-Automatic 2-round burst (Grenade Launcher)', '/assets/weapons/ds20_mirage.webp', 5),
(6, 'x9_maverick', 'X9 Maverick', 'Assault Rifle', 'Primary', 'Level Unlock', 28, 'Level 28', 42, '3-Round Burst / Semi-Auto (select-fire)', '/assets/weapons/x9_maverick.webp', 6),
(7, 'ryden_45k', 'RYDEN 45K', 'SMG', 'Primary', 'Immediate Unlock', NULL, 'Default', 42, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/ryden_45k.webp', 7),
(8, 'dravec_45', 'Dravec 45', 'SMG', 'Primary', 'Level Unlock', 34, 'Level 34', 42, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/dravec_45.webp', 8),
(9, 'rk_9', 'RK-9', 'SMG', 'Primary', 'Level Unlock', 7, 'Level 7', 42, '3-Round Burst', '/assets/weapons/rk_9.webp', 9),
(10, 'razor_9mm', 'RAZOR 9mm', 'SMG', 'Primary', 'Level Unlock', 19, 'Level 19', 42, 'Full-Auto / Semi-Auto (select-fire)', '/assets/weapons/razor_9mm.webp', 10),
(11, 'mpc_25', 'MPC-25', 'SMG', 'Primary', 'Level Unlock', 55, 'Level 55', 42, 'Fully-Automatic', '/assets/weapons/mpc_25.webp', 11),
(12, 'carbon_57', 'CARBON 57', 'SMG', 'Primary', 'Level Unlock', 46, 'Level 46', 42, 'Fully-Automatic', '/assets/weapons/carbon_57.webp', 12),
(13, 'm10_breacher', 'M10 Breacher', 'Shotgun', 'Primary', 'Immediate Unlock', NULL, 'Default', 36, 'Pump-Action', '/assets/weapons/m10_breacher.webp', 13),
(14, 'echo_12', 'Echo 12', 'Shotgun', 'Primary', 'Level Unlock', 22, 'Level 22', 36, 'Semi-Automatic (2-round rechamber)', '/assets/weapons/echo_12.webp', 14),
(15, 'akita', 'Akita', 'Shotgun', 'Primary', 'Level Unlock', 40, 'Level 40', 43, 'Fully-Automatic', '/assets/weapons/akita.webp', 15),
(16, 'mk_78', 'MK.78', 'LMG', 'Primary', 'Immediate Unlock', NULL, 'Default', 50, 'Automatic', '/assets/weapons/mk_78.webp', 16),
(17, 'xm325', 'XM325', 'LMG', 'Primary', 'Level Unlock', 31, 'Level 31', 50, 'Fully-Automatic', '/assets/weapons/xm325.webp', 17),
(18, 'm8a1', 'M8A1', 'Marksman', 'Primary', 'Level Unlock', 10, 'Level 10', 50, '4-Round Auto-Burst / Semi-Auto (select-fire)', '/assets/weapons/m8a1.webp', 18),
(19, 'warden_308', 'Warden 308', 'Marksman', 'Primary', 'Level Unlock', 25, 'Level 25', 43, 'Double-Action (Semi-Automatic)', '/assets/weapons/warden_308.webp', 19),
(20, 'm34_novaline', 'M34 Novaline', 'Marksman', 'Primary', 'Level Unlock', 49, 'Level 49', 48, '2-Round Burst / Semi-Auto (select-fire)', '/assets/weapons/m34_novaline.webp', 20),
(21, 'vs_recon', 'VS Recon', 'Sniper', 'Primary', 'Immediate Unlock', NULL, 'Default', 45, 'Bolt-action', '/assets/weapons/vs_recon.webp', 21),
(22, 'xr_3_ion', 'XR-3 ION Sniper Rifle', 'Sniper', 'Primary', 'Level Unlock', 43, 'Level 43', 44, '3-Round Auto-Burst', '/assets/weapons/xr_3_ion.webp', 22),
(23, 'jager_45', 'Jager 45', 'Pistol', 'Secondary', 'Immediate Unlock', NULL, 'Default', 31, 'Semi-automatic', '/assets/weapons/jager_45.webp', 23),
(24, 'coda_9', 'CODA 9', 'Pistol', 'Secondary', 'Level Unlock', 34, 'Level 34', 31, 'Semi-automatic', '/assets/weapons/coda_9.webp', 24),
(25, 'velox_57', 'Velox 5.7', 'Pistol', 'Secondary', 'Level Unlock', 13, 'Level 13', 30, '3-Round Burst', '/assets/weapons/velox_57.webp', 25),
(26, 'arrow_109', 'ARROW 109', 'Launcher', 'Secondary', 'Immediate Unlock', NULL, 'Default', 30, 'Single-shot', '/assets/weapons/arrow_109.webp', 26),
(27, 'arc_m1', 'A.R.C. M1', 'Launcher', 'Secondary', 'Level Unlock', 25, 'Level 25', 30, 'Semi-automatic', '/assets/weapons/arc_m1.webp', 27),
(28, 'knife', 'Knife', 'Melee', 'Secondary', 'Immediate Unlock', NULL, 'Default', 30, 'Melee', '/assets/weapons/knife.webp', 28),
(29, 'flatline_mk2', 'Flatline MK. II', 'Melee', 'Secondary', 'Level Unlock', 49, 'Level 49', 30, 'Melee', '/assets/weapons/flatline_mk2.webp', 29);

--
-- Add entry to `data_versions` table
--

INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`) VALUES
('weapons_mp', 1, 1, CURRENT_TIMESTAMP, 'Multiplayer weapons data');
