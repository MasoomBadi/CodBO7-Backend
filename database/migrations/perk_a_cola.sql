-- --------------------------------------------------------
-- Table structure for table `perk_a_cola`
-- --------------------------------------------------------

CREATE TABLE `perk_a_cola` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bottle_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perk_a_cola`
--

INSERT INTO `perk_a_cola` (`id`, `name`, `display_name`, `location`, `effect`, `icon_url`, `bottle_url`, `recipe_url`, `sort_order`) VALUES
(1, 'deadshot_daiquiri', 'Deadshot Daiquiri', 'Exit 115', 'Increased damage to critical hit zones.', '/assets/perk_a_cola/icons/deadshot_daiquiri.png', '/assets/perk_a_cola/bottle/deadshot_daiquiri.png', '/assets/perk_a_cola/recipe/deadshot_daiquiri.webp', 1),
(2, 'death_perception', 'Death Perception', 'Vandorn Farm', 'See enemy health bars, equipment, Field Upgrades, and Scorestreaks through walls. Obscured enemies are highlighted.', '/assets/perk_a_cola/icons/death_perception.png', '/assets/perk_a_cola/bottle/death_perception.png', '/assets/perk_a_cola/recipe/death_perception.webp', 2),
(3, 'double_tap', 'Double Tap', 'Ashwood', 'Increased bullet weapon fire rate.', '/assets/perk_a_cola/icons/double_tap.png', '/assets/perk_a_cola/bottle/double_tap.png', '/assets/perk_a_cola/recipe/double_tap.webp', 3),
(4, 'elemental_pop', 'Elemental Pop', 'Exit 115', 'Bullets have a small chance to apply a random base Ammo Mod effect.', '/assets/perk_a_cola/icons/elemental_pop.png', '/assets/perk_a_cola/bottle/elemental_pop.png', '/assets/perk_a_cola/recipe/elemental_pop.webp', 4),
(5, 'jugger_nog', 'Jugger-Nog', 'Ashwood', 'Increase maximum health by 100.', '/assets/perk_a_cola/icons/jugger_nog.png', '/assets/perk_a_cola/bottle/jugger_nog.png', '/assets/perk_a_cola/recipe/jugger_nog.webp', 5),
(6, 'melee_macchiato', 'Melee Macchiato', 'Blackwater Lake', 'Increased melee damage and movement speed while using your melee weapon.', '/assets/perk_a_cola/icons/melee_macchiato.png', '/assets/perk_a_cola/bottle/melee_macchiato.png', '/assets/perk_a_cola/recipe/melee_macchiato.webp', 6),
(7, 'phd_flopper', 'PHD Flopper', 'Zarya Cosmodrome', 'Immunity to self-inflicted explosive damage. Diving to prone creates an explosion.', '/assets/perk_a_cola/icons/phd_flopper.png', '/assets/perk_a_cola/bottle/phd_flopper.png', '/assets/perk_a_cola/recipe/phd_flopper.webp', 7),
(8, 'quick_revive', 'Quick Revive', 'Janus Towers Plaza', 'Reduced delay before health regeneration begins. Revive allies faster.', '/assets/perk_a_cola/icons/quick_revive.png', '/assets/perk_a_cola/bottle/quick_revive.png', '/assets/perk_a_cola/recipe/quick_revive.webp', 8),
(9, 'speed_cola', 'Speed Cola', 'Blackwater Lake', 'Increased reload speed, and the speed to use equipment and Field Upgrades.', '/assets/perk_a_cola/icons/speed_cola.png', '/assets/perk_a_cola/bottle/speed_cola.png', '/assets/perk_a_cola/recipe/speed_cola.webp', 9),
(10, 'stamin_up', 'Stamin-Up', 'Vandorn Farm', 'Increased movement and sprint speed. Reduced movement penalties when strafing and taking damage. Increased backpedal speed. Jump higher.', '/assets/perk_a_cola/icons/stamin_up.png', '/assets/perk_a_cola/bottle/stamin_up.png', '/assets/perk_a_cola/recipe/stamin_up.webp', 10),
(11, 'vulture_aid', 'Vulture Aid', 'Ashwood', 'See enemies through walls. Enemies have a chance to drop ammo upon death.', '/assets/perk_a_cola/icons/vulture_aid.png', '/assets/perk_a_cola/bottle/vulture_aid.png', '/assets/perk_a_cola/recipe/vulture_aid.webp', 11),
(12, 'wisp_tea', 'Wisp Tea', 'Zarya Cosmodrome', 'Doubles the duration of all Power-Ups.', '/assets/perk_a_cola/icons/wisp_tea.png', '/assets/perk_a_cola/bottle/wisp_tea.png', '/assets/perk_a_cola/recipe/wisp_tea.webp', 12);

-- --------------------------------------------------------
-- Table structure for table `perk_a_cola_augments`
-- --------------------------------------------------------

CREATE TABLE `perk_a_cola_augments` (
  `id` int NOT NULL,
  `perk_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perk_a_cola_augments`
--

INSERT INTO `perk_a_cola_augments` (`id`, `perk_id`, `name`, `type`, `effect`, `sort_order`) VALUES
(1, 1, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(2, 1, 'Trickshotter', 'Major', 'Hip-fire spread reduced by 25%.', 2),
(3, 1, 'Sharpshooter', 'Major', 'Bullets have a 30% chance to deal 4x damage to critical areas.', 3),
(4, 1, 'Locked In', 'Major', 'Shooting from ADS does not reveal you on the minimap.', 4),
(5, 1, 'Close Out', 'Minor', 'After a kill, reload speed is improved for 10 seconds.', 5),
(6, 1, 'Focus Up', 'Minor', 'Weapon sway reduced by 90% when ADS.', 6),
(7, 1, 'Tunnel Vision', 'Minor', 'Aim walking speed improved by 30%.', 7),
(8, 1, 'Headshot Machine', 'Minor', 'Aiming at an enemy''s head increases damage by 10% for 2 seconds.', 8),
(9, 1, 'Crosshair Enhancer', 'Minor', 'Aiming at enemies increases ADS speed by 40%.', 9),
(10, 2, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(11, 2, 'Radar King', 'Major', 'Shooting from ADS will reveal enemies in a 10m radius for 2 seconds.', 2),
(12, 2, 'Bloodthirsty', 'Major', 'Enemies you have damaged will remain highlighted through walls indefinitely.', 3),
(13, 2, 'Scent of Blood', 'Major', 'Enemies below 30% health will be highlighted through walls.', 4),
(14, 2, 'Predator Sense', 'Minor', 'Shooting an enemy marks them on the minimap for 3 seconds.', 5),
(15, 2, 'Spotter', 'Minor', 'Enemy equipment and Field Upgrades are displayed on the minimap.', 6),
(16, 2, 'Heightened Awareness', 'Minor', 'Damaged enemies are kept on the minimap for 2 seconds longer.', 7),
(17, 2, 'Hunted Vision', 'Minor', 'Increase health bar visibility by 15m.', 8),
(18, 2, 'Sixth Sense', 'Minor', 'Your crosshair changes when an enemy looks at you or aims at you from any distance.', 9),
(19, 3, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(20, 3, 'Rapid Burst', 'Major', 'Increases fire rate by 30%.', 2),
(21, 3, 'Spray and Pray', 'Major', 'Reduces reload time by 35%.', 3),
(22, 3, 'Bullet Storm', 'Major', 'Magazine capacity increased by 25%.', 4),
(23, 3, 'Quick Trigger', 'Minor', 'Firing delay after sprinting reduced by 50%.', 5),
(24, 3, 'Hair Trigger', 'Minor', 'Weapon swap speed improved by 30%.', 6),
(25, 3, 'Ammo Hoarder', 'Minor', 'Reserve ammo capacity increased by 20%.', 7),
(26, 3, 'Sustained Fire', 'Minor', 'Hip-fire accuracy improved while sustained firing.', 8),
(27, 3, 'Trigger Discipline', 'Minor', 'Reduces time to return to center after firing by 30%.', 9),
(28, 4, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(29, 4, 'Elemental Master', 'Major', 'Ammo Mod effects trigger 50% more often.', 2),
(30, 4, 'Chaos Theory', 'Major', 'Each bullet has an 8% chance to trigger all Ammo Mod effects simultaneously.', 3),
(31, 4, 'Chain Reaction', 'Major', 'Ammo Mod effects spread to nearby enemies within 3m.', 4),
(32, 4, 'Elemental Surge', 'Minor', 'Ammo Mod effect damage increased by 20%.', 5),
(33, 4, 'Volatile Rounds', 'Minor', 'Ammo Mod effects last 2 seconds longer.', 6),
(34, 4, 'Lucky Shot', 'Minor', 'Critical hits have a 15% chance to trigger an Ammo Mod effect.', 7),
(35, 4, 'Elemental Focus', 'Minor', 'Consecutive hits with the same Ammo Mod increase its damage by 5% per hit, up to 25%.', 8),
(36, 4, 'Combustion', 'Minor', 'Fire Ammo Mod burns for 30% longer.', 9),
(37, 5, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(38, 5, 'Tank', 'Major', 'Increase maximum health by 50.', 2),
(39, 5, 'Unbreakable', 'Major', 'Taking lethal damage leaves you with 1 health. 90 second cooldown.', 3),
(40, 5, 'Armor Plating', 'Major', 'Reduce damage taken from explosives by 40%.', 4),
(41, 5, 'Rapid Recovery', 'Minor', 'Health regeneration starts 1 second sooner.', 5),
(42, 5, 'Thick Skin', 'Minor', 'Reduce flinch when shot by 30%.', 6),
(43, 5, 'Endurance', 'Minor', 'Reduce slowdown from damage by 40%.', 7),
(44, 5, 'Last Stand', 'Minor', 'Health regeneration rate improved by 25%.', 8),
(45, 5, 'Bulletproof', 'Minor', 'Incoming bullet damage reduced by 5%.', 9),
(46, 6, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(47, 6, 'Blade Master', 'Major', 'Melee damage increased by 50%.', 2),
(48, 6, 'Executioner', 'Major', 'Melee kills instantly refresh sprint.', 3),
(49, 6, 'Relentless', 'Major', 'Melee kills grant a 3-second speed boost.', 4),
(50, 6, 'Swift Striker', 'Minor', 'Melee lunge distance increased by 30%.', 5),
(51, 6, 'Berserker', 'Minor', 'Melee attack speed increased by 25%.', 6),
(52, 6, 'Lightweight', 'Minor', 'Movement speed with melee weapon out increased by 10%.', 7),
(53, 6, 'Silent Step', 'Minor', 'Melee kills do not reveal you on the minimap.', 8),
(54, 6, 'Blood Frenzy', 'Minor', 'Consecutive melee kills increase damage by 10% per kill, up to 30%.', 9),
(55, 7, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(56, 7, 'Blast Shield', 'Major', 'Reduce damage from enemy explosives by 50%.', 2),
(57, 7, 'Demolition Expert', 'Major', 'Dive explosion radius increased by 50%.', 3),
(58, 7, 'Shockwave', 'Major', 'Dive explosions stun enemies for 2 seconds.', 4),
(59, 7, 'Impact Landing', 'Minor', 'Dive explosion damage increased by 30%.', 5),
(60, 7, 'Quick Drop', 'Minor', 'Going prone from a dive is 40% faster.', 6),
(61, 7, 'Explosive Momentum', 'Minor', 'Dive explosion cooldown reduced by 2 seconds.', 7),
(62, 7, 'Reinforced', 'Minor', 'Reduce flinch from explosives by 50%.', 8),
(63, 7, 'Safe Distance', 'Minor', 'Explosive damage to self reduced by an additional 30%.', 9),
(64, 8, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(65, 8, 'Combat Medic', 'Major', 'Revive allies at full health.', 2),
(66, 8, 'Guardian Angel', 'Major', 'Allies you revive gain temporary invulnerability for 3 seconds.', 3),
(67, 8, 'Triage', 'Major', 'Revive speed improved by 50%.', 4),
(68, 8, 'Fast Healer', 'Minor', 'Health regeneration rate improved by 30%.', 5),
(69, 8, 'Resilient', 'Minor', 'Health regeneration delay reduced by 1 second.', 6),
(70, 8, 'Lifeline', 'Minor', 'Reviving grants you and the revived ally a temporary 25% damage reduction for 5 seconds.', 7),
(71, 8, 'Adrenaline Rush', 'Minor', 'Reviving an ally instantly refreshes your Tactical and Lethal equipment.', 8),
(72, 8, 'Helping Hand', 'Minor', 'Increased movement speed by 20% while reviving.', 9),
(73, 9, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(74, 9, 'Speedster', 'Major', 'Reload speed improved by 40%.', 2),
(75, 9, 'Quick Hands', 'Major', 'Equipment and Field Upgrade use speed improved by 50%.', 3),
(76, 9, 'Rapid Deploy', 'Major', 'Weapon swap speed improved by 50%.', 4),
(77, 9, 'Fast Loader', 'Minor', 'Reload while sprinting.', 5),
(78, 9, 'Nimble Fingers', 'Minor', 'Reload from empty improved by an additional 20%.', 6),
(79, 9, 'Quick Draw', 'Minor', 'Weapon raise speed after sprinting improved by 40%.', 7),
(80, 9, 'Hasty', 'Minor', 'Equipment throw speed improved by 35%.', 8),
(81, 9, 'Speed Demon', 'Minor', 'Movement speed during reload improved by 15%.', 9),
(82, 10, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(83, 10, 'Marathon Runner', 'Major', 'Unlimited sprint duration.', 2),
(84, 10, 'Parkour Pro', 'Major', 'Jump height increased by an additional 30%.', 3),
(85, 10, 'Speed Boost', 'Major', 'Sprint speed improved by an additional 15%.', 4),
(86, 10, 'Agile', 'Minor', 'Strafe speed improved by 20%.', 5),
(87, 10, 'Quick Feet', 'Minor', 'Sprint-out time reduced by 30%.', 6),
(88, 10, 'Light Step', 'Minor', 'Movement noise reduced by 40%.', 7),
(89, 10, 'Evasive', 'Minor', 'Slide distance improved by 25%.', 8),
(90, 10, 'Sure Footed', 'Minor', 'Reduce movement penalty from damage by an additional 30%.', 9),
(91, 11, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(92, 11, 'Predator', 'Major', 'See enemies through walls up to 30m.', 2),
(93, 11, 'Scavenger', 'Major', 'Ammo drop chance increased to 50%.', 3),
(94, 11, 'Hunter''s Mark', 'Major', 'Enemies you damage are visible to your team through walls for 3 seconds.', 4),
(95, 11, 'Eagle Eye', 'Minor', 'See enemy equipment and Field Upgrades through walls.', 5),
(96, 11, 'Fortune Finder', 'Minor', 'Enemies have a 15% chance to drop equipment on death.', 6),
(97, 11, 'Tracker', 'Minor', 'Enemy footsteps are visible for 4 seconds.', 7),
(98, 11, 'Keen Senses', 'Minor', 'Enemy visibility through walls increased by 10m.', 8),
(99, 11, 'Opportunist', 'Minor', 'Ammo drops grant 20% more ammo.', 9),
(100, 12, 'Extra Slot', 'Minor', 'Equip one additional Augment to this Perk-a-Cola.', 1),
(101, 12, 'Time Warp', 'Major', 'Power-Up duration tripled (total 6x normal duration).', 2),
(102, 12, 'Power Surge', 'Major', 'Power-Ups affect a 50% larger radius.', 3),
(103, 12, 'Catalyst', 'Major', 'Power-Ups spawn 25% more frequently.', 4),
(104, 12, 'Extended Boost', 'Minor', 'Power-Up effects are 20% stronger.', 5),
(105, 12, 'Lucky Find', 'Minor', 'Increased chance to find rare Power-Ups by 30%.', 6),
(106, 12, 'Energy Saver', 'Minor', 'Power-Ups grant 15% more points.', 7),
(107, 12, 'Quick Activation', 'Minor', 'Power-Up pickup radius increased by 25%.', 8),
(108, 12, 'Resonance', 'Minor', 'Picking up a Power-Up grants a 3-second speed boost.', 9);

--
-- Indexes for table `perk_a_cola`
--
ALTER TABLE `perk_a_cola`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `perk_a_cola_augments`
--
ALTER TABLE `perk_a_cola_augments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perk_id` (`perk_id`);

--
-- AUTO_INCREMENT for table `perk_a_cola`
--
ALTER TABLE `perk_a_cola`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `perk_a_cola_augments`
--
ALTER TABLE `perk_a_cola_augments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Constraints for table `perk_a_cola_augments`
--
ALTER TABLE `perk_a_cola_augments`
  ADD CONSTRAINT `perk_a_cola_augments_ibfk_1` FOREIGN KEY (`perk_id`) REFERENCES `perk_a_cola` (`id`) ON DELETE CASCADE;

--
-- Add to data_versions table
--
INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`) VALUES
('perk_a_cola', 1, 1, '2025-11-18 00:00:00', 'Perk-a-Cola perks for zombies mode'),
('perk_a_cola_augments', 1, 1, '2025-11-18 00:00:00', 'Augments for Perk-a-Cola perks');
