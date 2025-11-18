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
(1, 1, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(2, 1, 'Dead Point', 'Major', 'Bullets deal bonus damage to enemies within Point Blank range.', 2),
(3, 1, 'Dead Heat', 'Minor', 'Temporarily increase your movement speed after getting a Point Blank Kill with a gun.', 3),
(4, 1, 'Dead Set', 'Minor', 'Reduce gun movement while performing advanced movement (jumping, with a faster sprint-out time).', 4),
(5, 1, 'Dead Draw', 'Minor', 'Reduce hip-fire spread.', 5),
(6, 1, 'Dead Break', 'Minor', 'Increase damage to armor pieces.', 6),
(7, 1, 'Dead Again', 'Major', 'Critical hits have a chance of adding a bullet to your magazine. Adjustment: A slight cooldown has been added.', 7),
(8, 1, 'Dead First', 'Major', 'Bullets deal double Critical Damage if an enemy is at full health.', 8),
(9, 1, 'Dead Head', 'Major', 'Further increase Deadshot Daiquiri''s Critical Damage Bonus for guns.', 9),
(10, 2, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(11, 2, 'Sixth Sense', 'Major', 'See enemies close behind you and take less damage from behind.', 2),
(12, 2, 'Hidden Gems', 'Minor', 'Death Perception can now see loot.', 3),
(13, 2, 'Further Insight', 'Minor', 'See enemies through walls from farther away.', 4),
(14, 2, 'Extra Charge', 'Minor', 'Find extra Essence under more locations.', 5),
(15, 2, 'Bird''s Eye View', 'Minor', 'The minimap''s scan rate is increased.', 6),
(16, 2, 'Critical Eye', 'Major', 'Body shots with bullet weapons have a chance to deal Critical Damage.', 7),
(17, 2, 'Death Stare', 'Major', 'Your Elemental Weakness damage has a chance to kill an enemy that is low on health.', 8),
(18, 2, 'Treasure Hunter', 'Major', 'Spot items others can miss from loot containers as well as Special and Elite kills.', 9),
(19, 3, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(20, 3, 'Double Dealer', 'Major', 'Every 4th bullet in your weapon magazine deals double damage.', 2),
(21, 3, 'Double Caliber', 'Minor', 'Bullet Weapons have increased penetration through enemies.', 3),
(22, 3, 'Double Play', 'Minor', 'Killing 2 enemies in quick succession has a chance of returning 2 rounds to your magazine.', 4),
(23, 3, 'Double or Nothing', 'Minor', 'Weapons have a chance to do double damage but also have a chance to do no damage.', 5),
(24, 3, 'Double Time', 'Minor', 'Further increase weapon fire rate.', 6),
(25, 3, 'Double Standard', 'Major', 'All non-critical shots do double damage.', 7),
(26, 3, 'Double Impact', 'Major', 'Every other successive hit on the same target deals bonus damage.', 8),
(27, 3, 'Double Jeopardy', 'Major', 'Normal zombies at low health have a chance to die immediately when shot.', 9),
(28, 4, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(29, 4, 'Rainbow Pop', 'Major', 'Weapons with an Ammo Mod equipped has a chance to deal Elemental Damage that an enemy is weak to.', 2),
(30, 4, 'Refresh Mint', 'Minor', 'Killing a Special or Elite Enemy with its Elemental Weakness resets your Elemental Pop cooldown.', 3),
(31, 4, 'Chill Berry', 'Minor', 'Reduce Elemental Pop cooldowns.', 4),
(32, 4, 'Pineapple Blast', 'Minor', 'Equipment can also trigger a random Ammo Mod.', 5),
(33, 4, 'Vulnera Bean', 'Minor', 'Increase enemy Elemental Weakness damage.', 6),
(34, 4, 'Electric Cherry', 'Major', 'Reloading creates an electric damage discharge that damages and stuns nearby Normal Enemies. The more empty the magazine, the stronger the damage.', 7),
(35, 4, 'Imperil Peach', 'Major', 'Enemies that hit you have a chance to trigger a random Ammo Mod.', 8),
(36, 4, 'Citrus Focus', 'Major', 'If a weapon has an Ammo Mod applied, Elemental Pop will only activate that one.', 9),
(37, 5, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(38, 5, 'Iron Core', 'Major', 'Your health is increased when all of your Armor Plates are broken.', 2),
(39, 5, 'Shake It Off', 'Minor', 'Incoming damage will occassionally be significantly reduced.', 3),
(40, 5, 'Durable Plates', 'Minor', 'Increase your armor''s durability.', 4),
(41, 5, 'Hardened Plates', 'Minor', 'Armor plates have more damage mitigation.', 5),
(42, 5, 'Retaliation', 'Minor', 'Deal bonus damage while your health is low.', 6),
(43, 5, 'Reactive Armor', 'Major', 'When an Armor Plate breaks, nearby Normal Enemies are stunned for a short time.', 7),
(44, 5, 'Turtle Shell', 'Major', 'Armor now completely absorbs damage to your back.', 8),
(45, 5, 'Probiotic', 'Major', 'Slightly increase Maximum Health with Jugger-Nog.', 9),
(46, 6, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(47, 6, 'Mocha Maul', 'Major', 'The punch is replaced with your Dedicated Melee Weapon.', 2),
(48, 6, 'Barista Brawl', 'Minor', 'Gain more Essence from Melee Kills.', 3),
(49, 6, 'Mugging', 'Minor', 'Melee Kills reload a portion of your held weapon.', 4),
(50, 6, 'Strength Training', 'Minor', 'Your punch can one-hit kill Normal Enemies for more rounds.', 5),
(51, 6, 'Stick Stick ''N Move', 'Minor', 'Backpedal speed is increased after a successful melee attack.', 6),
(52, 6, 'Triple Shot', 'Major', 'Your punch can hit multiple enemies at once.', 7),
(53, 6, 'Expresso', 'Major', 'All melee attacks are faster.', 8),
(54, 6, 'Vampiritic Extraction', 'Major', 'Melee attacks heal a small amount of your health.', 9),
(55, 7, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(56, 7, 'Double Whammy', 'Major', 'Release a second explosion shortly after a flop.', 2),
(57, 7, 'Stuntman', 'Minor', 'Wall Jumping creates an explosion.', 3),
(58, 7, 'Tribologist', 'Minor', 'Sliding distance and speed are increased.', 4),
(59, 7, 'EOD Technician', 'Minor', 'Reduce height and slide distance requirements for explosions.', 5),
(60, 7, 'Environmentalist', 'Minor', 'Become immune to environmental damage while sliding.', 6),
(61, 7, 'PhD Slider', 'Major', 'Sliding into enemies triggers explosions.', 7),
(62, 7, 'Dr Ram', 'Major', 'For short bursts, sprinting into Normal Enemies damages and knocks them down. This also works while Tactical Sprinting.', 8),
(63, 7, 'Gravity MD', 'Major', 'Just falling from heights creates explosions.', 9),
(64, 8, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(65, 8, 'Adrenaline Rush', 'Major', 'Killing a Special or Elite Enemy will immediately start your health regeneration.', 2),
(66, 8, 'Emergency Medical Kit', 'Minor', 'You can now craft a Self Revive Kit up to 4 times.', 3),
(67, 8, 'Slow Death', 'Minor', 'Increase your time in last stand.', 4),
(68, 8, 'Karmic Return', 'Minor', 'Reviving an ally heals you to full health.', 5),
(69, 8, 'Swift Recovery', 'Minor', 'Reviving an ally increases both of your movement speeds for a short time.', 6),
(70, 8, 'Dying Wish', 'Major', 'On lethal damage, become immune to all damage briefly and keep 1 health. Quick Revive is removed on use. This can be done up to 3 times.', 7),
(71, 8, 'Equivalent Exchange', 'Major', 'Dealing enough damage while downed will revive you with all of your perks. This can be done up to 3 times.', 8),
(72, 8, 'EMT', 'Major', 'Reviving an ally allows them to keep all of the Perks on their bleed-out bar. When you are revived, keep up to 5 of your perks.', 9),
(73, 9, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(74, 9, 'Ammo Surge', 'Major', 'Gain a burst of speed when initiating a reload. The emptier the magazine, the greater the speed boost.', 2),
(75, 9, 'Prestidigitation', 'Minor', 'Reloading has a chance to not use stock ammo.', 3),
(76, 9, 'Fast Pitcher', 'Minor', 'Deploy equipment faster.', 4),
(77, 9, 'Quick Swap', 'Minor', 'Swap weapons faster.', 5),
(78, 9, 'Speedy Roulette', 'Minor', 'The Mystery Box settles much faster.', 6),
(79, 9, 'Phantom Reload', 'Major', 'Weapon magazines are refilled over time.', 7),
(80, 9, 'Classic Formula', 'Major', 'Reload speed is even faster.', 8),
(81, 9, 'Supercharged', 'Major', 'Field Upgrades recharge faster.', 9),
(82, 10, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(83, 10, 'Guns Up', 'Major', 'Fire while sprinting.', 2),
(84, 10, 'Footwork', 'Minor', 'Increase non-forward sprinting speed.', 3),
(85, 10, 'Hot Foot', 'Minor', 'Gain a speed boost after your equipment kills a zombie.', 4),
(86, 10, 'Quarterback', 'Minor', 'Use equipment while sprinting.', 5),
(87, 10, 'Hard Target', 'Minor', 'While sprinting, projectile damage is reduced.', 6),
(88, 10, 'Stalker', 'Major', 'Walk faster while aiming.', 7),
(89, 10, 'Dasher', 'Major', 'Enable Tactical Sprint with increased duration.', 8),
(90, 10, 'Free Faller', 'Major', 'Become immune to fall damage.', 9),
(91, 11, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(92, 11, 'Armor-Matic', 'Major', 'Picking up an Armor Plate automatically applies it to your vest.', 2),
(93, 11, 'Extra Serving', 'Minor', 'Special and Elite Enemies you kill have a chance to drop a Large Essence Vial.', 3),
(94, 11, 'Picky Eater', 'Minor', 'On death, zombies have a high chance of dropping your current equipment.', 4),
(95, 11, 'Carrion Luggage', 'Minor', 'Critical kills have a chance to drop extra Salvage.', 5),
(96, 11, 'Condor''s Reach', 'Minor', 'Auto-pickup loot from farther away.', 6),
(97, 11, 'Parting Gift', 'Major', 'Ammo drops give more ammo to Wonder Weapons.', 7),
(98, 11, 'Smell of Death', 'Major', 'On death, zombies have a chance to create a gas cloud that conceals you while standing in it.', 8),
(99, 11, 'Fetid Upgr-aid', 'Major', 'On death, zombies have a chance to create a gas cloud that charges your Field Upgrade.', 9),
(100, 12, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(101, 12, 'Mask of Benevolence', 'Major', 'The Maiden does not attack but will periodically heal you.', 2),
(102, 12, 'Fetcher', 'Minor', 'The Wisp will pick up items and Powerups for you.', 3),
(103, 12, 'Mask of Salvation', 'Major', 'The Fox can revive you while it''s active. This can be done up to 3 times.', 4),
(104, 12, 'Zombie Sitter', 'Minor', 'The Wisp will distract and avoid damaging the last zombie in the round until the round times out.', 5),
(105, 12, 'Mask of Distraction', 'Major', 'The Monkey attracts enemies and does damage in an area.', 6),
(106, 12, 'Haste', 'Minor', 'Decrease the cooldown before a Wisp can be summoned.', 7),
(107, 12, 'Mask of Wrath', 'Major', 'The Demon does more damage.', 8),
(108, 12, 'Extension', 'Minor', 'Increase the Wisp''s lifetime.', 9);

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
