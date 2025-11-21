-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2025 at 09:35 PM
-- Server version: 8.0.40-cll-lve
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joziedti_codbo7`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_versions`
--

CREATE TABLE `data_versions` (
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `schema_version` int UNSIGNED NOT NULL DEFAULT '1',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_versions`
--

INSERT INTO `data_versions` (`category`, `version`, `schema_version`, `last_updated`, `description`) VALUES
('ammo_mods', 1, 1, '2025-11-18 00:00:00', 'Ammo Mods for zombies mode'),
('ammo_mod_augments', 1, 1, '2025-11-18 00:00:00', 'Augments for Ammo Mods'),
('camo', 1, 1, '2025-11-20 00:00:00', 'Weapon camouflage customization options'),
('classic_prestige', 1, 1, '2025-11-20 00:00:00', 'Classic prestige progression system for multiplayer'),
('combat_specialties', 1, 1, '2025-11-18 00:00:00', 'Combat specialties for multiplayer loadouts'),
('field_upgrades', 1, 1, '2025-11-18 00:00:00', 'Field upgrades for multiplayer mode'),
('field_upgrades_zm', 1, 1, '2025-11-18 00:00:00', 'Field upgrades for zombies mode'),
('field_upgrade_zm_augments', 1, 1, '2025-11-18 00:00:00', 'Augments for Zombies Field Upgrades'),
('game_modes', 1, 1, '2025-11-17 00:00:00', 'Multiplayer game modes'),
('gobblegums', 1, 1, '2025-11-20 00:00:00', 'GobbleGums for zombies mode'),
('gobblegum_tips', 1, 1, '2025-11-20 00:00:00', 'Tips and strategies for GobbleGums'),
('icons', 1, 1, '2025-11-14 16:04:00', 'Icons and emblems'),
('lethals', 1, 1, '2025-11-18 00:00:00', 'Lethal equipment for multiplayer and zombies modes'),
('map_layers', 1, 1, '2025-11-16 00:00:00', 'Map overlay layers'),
('map_markers', 1, 1, '2025-11-16 00:00:00', 'Interactive map markers and POIs'),
('map_tiles', 1, 1, '2025-11-17 00:00:00', 'Tiled map data for zombie maps'),
('maps', 1, 1, '2025-11-16 00:00:00', 'Interactive map base data'),
('operators', 1, 1, '2025-11-14 00:39:23', 'Playable characters'),
('perks', 1, 1, '2025-11-18 00:00:00', 'Multiplayer perk system for loadout customization'),
('perk_a_cola', 1, 1, '2025-11-18 00:00:00', 'Perk-a-Cola perks for zombies mode'),
('perk_a_cola_augments', 1, 1, '2025-11-18 00:00:00', 'Augments for Perk-a-Cola perks'),
('power_ups', 1, 1, '2025-11-18 00:00:00', 'Power ups for zombies mode'),
('scorestreaks', 1, 1, '2025-11-18 00:00:00', 'Scorestreaks with overclock upgrades'),
('tacticals_mp', 1, 1, '2025-11-18 00:00:00', 'Tactical equipment for multiplayer and zombies modes'),
('weapons_mp', 1, 1, '2025-11-20 00:00:00', 'Multiplayer weapons data'),
('weapon_camo', 1, 1, '2025-11-20 00:00:00', 'Weapon-specific prestige camo mappings'),
('wildcards', 1, 1, '2025-11-18 00:00:00', 'Wildcards for loadout customization');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int NOT NULL,
  `category` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon_url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `category`, `name`, `icon_url`) VALUES
(1, 'operators', 'jsoc', '/assets/icons/jsoc.png'),
(2, 'operators', 'guild', '/assets/icons/guild.png'),
(3, 'operators', 'zombie', '/assets/icons/zombie.png');

-- --------------------------------------------------------

--
-- Table structure for table `game_modes`
--

CREATE TABLE `game_modes` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `match_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score_limit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `party_size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_face_off` tinyint(1) NOT NULL DEFAULT '0',
  `has_scorestreaks` tinyint(1) NOT NULL DEFAULT '1',
  `has_respawns` tinyint(1) NOT NULL DEFAULT '1',
  `is_hardcore_available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_modes`
--

INSERT INTO `game_modes` (`id`, `name`, `display_name`, `mode_type`, `match_time`, `score_limit`, `party_size`, `team_size`, `description`, `icon_url`, `is_new`, `is_face_off`, `has_scorestreaks`, `has_respawns`, `is_hardcore_available`) VALUES
(1, 'overload', 'Overload', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'Bring the device to enemy zones to sabotage them', '/assets/modes/overload.webp', 1, 0, 1, 1, 1),
(2, 'team_deathmatch', 'Team Deathmatch', 'Standard/Core/HC', '10 min', '100', '1-6', '6v6', 'Eliminate enemies to earn score for your team', '/assets/modes/team_deathmatch.webp', 0, 0, 1, 1, 1),
(3, 'domination', 'Domination', 'Standard/Core/HC', 'Unlimited', '200', '1-6', '6v6', 'Capture, hold, defend objectives for score', '/assets/modes/domination.webp', 0, 0, 1, 1, 1),
(4, 'search_destroy', 'Search & Destroy', 'Standard/Core/HC', '2 min/round', '6', '1-6', '6v6', 'Teams alternate attacking/defusing a bomb; no respawns', '/assets/modes/search_and_destroy.webp', 0, 0, 1, 0, 1),
(5, 'kill_confirmed', 'Kill Confirmed', 'Standard/Core/HC', '10 min', '75', '1-6', '6v6', 'Collect dog tags for score, deny enemy score', '/assets/modes/kill_confirmed.webp', 0, 0, 1, 1, 1),
(6, 'free_for_all', 'Free-For-All', 'Standard/Core/HC', '10 min', '30', '1', '1vAll', 'Every player for themselves; reach score limit to win', '/assets/modes/free_for_all.webp', 0, 0, 1, 1, 1),
(7, 'hardpoint', 'Hardpoint', 'Standard/Core/HC', '5 min', '250', '1-6', '6v6', 'Capture and hold the Hardpoint area for points', '/assets/modes/hardpoint.webp', 0, 0, 1, 1, 1),
(8, 'kill_order', 'Kill Order', 'Standard/Core/HC', '10 min', '150', '1-6', '6v6', 'Eliminate enemy HVT, keep yours alive for bonus score', '/assets/modes/kill_order.webp', 0, 0, 1, 1, 1),
(9, 'control', 'Control', 'Standard/Core', '1.5 min/round', '2', '1-6', '6v6', 'Alternate attacking/defending zones, limited lives', '/assets/modes/control.webp', 0, 0, 1, 1, 0),
(10, 'face_off_moshpit', 'Face Off Moshpit', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'Various 6v6 respawn modes on small maps, Scorestreaks off', '/assets/modes/face_off.webp', 0, 0, 0, 1, 1),
(11, 'skirmish', 'Skirmish', '-', 'Varied', 'Varied', '1-20', '20v20', 'Two teams of 20, compete for objectives and score', '/assets/modes/skirmish.webp', 1, 0, 1, 1, 0),
(12, 'gunfight', 'Gunfight', '-', '40 sec', '6', '1-2', '2v2', 'Eliminate all enemies w/ preset classes, no respawns', '/assets/modes/gunfight.webp', 0, 0, 1, 0, 0),
(13, 'face_off_domination', 'Face Off Domination', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'Capture/hold objectives for score', '/assets/modes/domination.webp', 0, 1, 0, 1, 1),
(14, 'face_off_team_deathmatch', 'Face Off Team Deathmatch', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'Eliminate for score', '/assets/modes/team_deathmatch.webp', 0, 1, 0, 1, 1),
(15, 'face_off_kill_order', 'Face Off Kill Order', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'HVT gameplay', '/assets/modes/kill_order.webp', 0, 1, 0, 1, 1),
(16, 'face_off_kill_confirmed', 'Face Off Kill Confirmed', 'Standard/Core/HC', 'Varied', 'Varied', '1-6', '6v6', 'Recover tags for points', '/assets/modes/kill_confirmed.webp', 0, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `divison` varchar(10) NOT NULL,
  `zombie_playable` tinyint(1) NOT NULL,
  `description` varchar(500) NOT NULL,
  `unlock_criteria` varchar(50) NOT NULL,
  `image_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `short_name`, `full_name`, `nationality`, `divison`, `zombie_playable`, `description`, `unlock_criteria`, `image_url`) VALUES
(1, '50/50', 'Leilani \"50/50\" Tupuola', 'New Zealander', 'jsoc', 0, 'Leilani “50/50” Tupoula survived a genetic condition by joining an experimental bionics program, gaining cybernetic limbs that enhance her reflexes, precision, and stamina.\\nKnowing her time may be limited, she fights like every moment matters.\\n\\nWithin Specter One, she’s the steady presence — tough, loyal, and resourceful, with a hardened exterior and a heart that keeps the team grounded.', 'Unlocked immediately', '/assets/operators/50_50.webp'),
(2, 'Anderson', 'Nora Anderson', 'N/A', 'jsoc', 0, 'Captain Nora Anderson is a legendary Air Force veteran known for pulling off impossible air strike missions and leading precise ground operations.\\nHer calm, mission-focused mindset and years of classified experience earned her deep trust within the special forces community.\\n\\nA steady leader under pressure, she’s a force multiplier in any combat zone.', 'Unlocked immediately', '/assets/operators/anderson.webp'),
(3, 'Falkner', 'Gideon Falkner', 'British', 'guild', 0, 'Gideon Falkner, a brilliant bio-engineer chosen by Emma Kagan to lead the Guild’s research division, quickly found himself entangled in the corporation’s covert operations.\\nThough known publicly as a scientific prodigy, he’s also a capable field agent. Years of working with dangerous neurotoxins, however, have made him increasingly unstable and paranoid.\\n\\nDespite his flaws, Falkner remains one of Kagan’s most trusted assets.', 'Unlocked at Player Level 13', '/assets/operators/falkner.webp'),
(4, 'Grimm', 'Anika Grimm', 'N/A', 'guild', 0, 'Anika Grimm is a tech prodigy who grew up mastering autonomous drones, now directing the Guild’s drone production and leading high-level recon missions.\\nHer sharp instincts and battlefield awareness make her one of Emma Kagan’s most trusted specialists.\\n\\nThough not social, her team respects her intelligence, precision, and relentless drive to finish the mission.', 'Unlocked at Player Level 7', '/assets/operators/grimm.webp'),
(5, 'Harper', 'Mike Harper', 'American', 'jsoc', 0, 'Harper’s philosophy is simple: get in clean, stay tight, and finish the job. His long record of successful missions and unmatched operational hours proves the method works.\\nDirect, loyal, and tactically sharp, he’s widely respected across JSOC.\\n\\nWhen things fall apart, Harper is the soldier you want holding the line beside you.', 'Unlocked via the Black Ops 7 Vault Edition', '/assets/operators/harper.webp'),
(6, 'Jurado', 'Ciro Jurado', 'N/A', 'guild', 0, 'Ciro Jurado moves with a swagger that turns heads, often written off as a reckless hothead. In reality, he’s a sharp tactician with a skillset forged through relentless training.\\nWhen he unleashes force, the ferocity is overwhelming — breaking enemy morale and swinging the fight instantly.\\n\\nHis style may not win friends, but his raw effectiveness makes him impossible to replace.', 'Unlocked immediately', '/assets/operators/jurado.webp'),
(7, 'Kagan', 'Emma Kagan', 'American', 'guild', 0, 'Emma Kagan, CEO of the global private security giant The Guild, is relentless in her drive for dominance. Once a modest analyst, her sharp business instincts and mastery of corporate politics propelled her rapidly upward.\\nKnown as a powerful ally who quickly abandons anyone slowing her down, Kagan used the support of the old guard to climb the ranks — only to remove them once she claimed control.\\n\\nAmbitious, calculated, and feared, she built The Guild in her own image.', 'Unlocked at Player Level 40', '/assets/operators/kagan.webp'),
(8, 'Karma', 'Chloe \"Karma\" Lynch', 'American', 'jsoc', 0, 'Chloe “Karma” Lynch moved from codebreaker to mission command after the 2025 Menendez attacks, where her technical expertise and calm under pressure proved critical.\\nHer tactical instincts and deep understanding of the modern connected battlefield help her cut through chaos and keep her teams focused and alive.\\n\\nWith the ability to lead, delegate, or jump back on the terminal when needed, Karma is the perfect fit to oversee JSOC’s field operations.', 'Unlocked via the Black Ops 7 Vault Edition', '/assets/operators/karma.webp'),
(9, 'Mason', 'David \"Section\" Mason', 'American', 'jsoc', 0, 'Driven to follow in his father’s footsteps, David “Section” Mason rose through the ranks to lead Specter One, an elite counterterrorism unit tasked with tackling high-risk global threats.\\nHis bold tactics are balanced by a strong sense of responsibility for the people under his command.\\n\\nGuarded and precise, Section operates with total control — whether he’s leading JSOC missions or unwinding at his father’s cabin in Alaska.', 'Unlocked immediately', '/assets/operators/mason.webp'),
(10, 'Razor', 'Slade \"Razor\" Barrick', 'American', 'jsoc', 0, 'Slade “Razor” Barrick is a former private security contractor turned JSOC operative, now leading the special operations squad Specter Two. Loud, confident, and highly skilled, he never misses a chance to remind others that his team can match Specter One’s performance.\\nTough and resourceful, Razor is a force on the battlefield, and while some leaders question his loose command style, his results speak for themselves.', 'Unlocked at Player Level 28', '/assets/operators/razor.webp'),
(11, 'Reaper EWR-3', 'Experimental War Robot-3 \"Reaper\"', 'N/A', 'guild', 0, 'The Experimental War Robot 3, known as “Reaper,” is a major leap in human-robot integration. Remotely piloted by a decorated veteran, it merges advanced engineering with human decision-making, giving it exceptional precision and tactical strength in hostile environments.\\nThrough a direct cranial link, the operator experiences the battlefield in real time, allowing a retired soldier to re-enter combat with unmatched control.', 'Unlocked via the Black Ops 7 Vault Edition', '/assets/operators/reaper.webp'),
(12, 'Samuels', 'Eric Samuels', 'American', 'jsoc', 0, 'Eric Samuels served on President Bosworth’s Secret Service detail during the 2025 Los Angeles drone attacks, fighting alongside David Mason and Mike Harper. Tough, old-school, and dependable, he quickly became someone others relied on in moments of crisis.\\nHis ability to spot danger early and stay calm under fire made him an exceptional protector, paving the way for his move to Delta Force and eventually his recruitment into Specter One.', 'Unlocked immediately', '/assets/operators/samuels.webp'),
(13, 'T.E.D.D.', 'T.E.D.D.', 'N/A', 'guild', 0, 'Originally a civilian bus driver, T.E.D.D. has spent an unknown amount of time trapped in the Dark Aether, leaving his mental state warped by the experience.\\nKnown for sudden outbursts and unpredictable aggression, his instability makes him dangerous—but also surprisingly effective in combat.\\n\\nApproach the robotic driver with caution… and preferably a valid ticket.', 'Unlocked via the Black Ops 7 Vault Edition', '/assets/operators/tedd.webp'),
(14, 'Vermaak', 'Axel Vermaak', 'South African', 'jsoc', 0, 'Axel Vermaak is a seasoned South African recon expert whose years of high-risk scouting make him a strong fit for JSOC. Calm, precise, and highly efficient, he excels at both gathering intel and holding his own in a firefight.\\n\\nInitially recruited for his talent in tracking terrorist threats, his sharp instincts and steady presence under pressure have made him a crucial asset in the fight against the Guild.', 'Unlocked at Player Level 34', '/assets/operators/vermaak.webp'),
(15, 'Wei Lin', 'Wei Lin', 'Chinese', 'jsoc', 0, 'Inspired by her brother, Wei Lin completed medical school before joining the army, quickly proving herself in high-risk peacekeeping and disaster relief missions. Her lifesaving work under fire earned her a strong reputation and eventually led to collaboration with JSOC.\\n\\nResilient, disciplined, and guided by a deep sense of duty, Lin is a rare battlefield presence — a soldier who can save a life just as effectively as she can end one.', 'Unlocked at Player Level 19', '/assets/operators/weilin.webp'),
(16, 'Zaveri', 'Priya Zaveri', 'N/A', 'guild', 0, 'Priya Zaveri is defined by her deadly accuracy and unshakable calm. The Guild’s top marksman—and its highest paid—she dominates from high ground with precise kill shots, but is just as dangerous up close or with heavy weapons.\\n\\nA lifelong top performer, she’s tough to impress and isn’t shy about showing her displeasure, whether through a sharp remark or a well-placed round.', 'Unlocked immediately', '/assets/operators/zaveri.webp'),
(17, 'Dempsey', '\"Tank\" Dempsey', 'American', 'jsoc', 1, 'Tank Dempsey is a battle-tested Marine who survived the brutal jungles of 1968 Vietnam with sheer grit, sharp sarcasm, and an iron will.\\n\\nIn this fractured reality, the strange environment and his mistrust of unfamiliar allies have shifted this normally reliable soldier into an unpredictable wild card.', 'Unlocked immediately', '/assets/operators/dempsey.webp'),
(18, 'Nikolai', 'Nikolai Belinski', 'Soviet', 'guild', 1, 'Nikolai Belinski, a Soviet tank commander pulled from the harsh mountains of 1984 Afghanistan, arrives in the Dark Aether shaped by duty, disillusionment, and loss.\\n\\nScarred by war and burdened by betrayal and his own choices, he hides his bitterness behind dark humor—but when the fighting starts, he remains a loyal and relentless warrior.', 'Unlocked immediately', '/assets/operators/nikolai.webp'),
(19, 'Richtofen', 'Edward Richtofen', 'German', 'guild', 1, 'Dr. Edward Richtofen is a brilliant yet unstable scientist pulled from a 1945 where the Axis emerged victorious. Ambitious and deeply corrupted, he hides his sadism and towering ego behind quick wit and disarming charm.\\n\\nConvinced that reality should serve his will, Richtofen is determined to bend the world to his designs.', 'Unlocked immediately', '/assets/operators/richtofen.webp'),
(20, 'Takeo', 'Takeo Masaki', 'Japanese', 'jsoc', 1, 'Takeo Masaki is a disgraced ronin from 1591 Feudal Japan, wandering without master or honor and carrying the heavy weight of exile.\\n\\nStill clinging to a fading code, he searches for redemption through battle—his blade serving as both his burden and his judgment on those who stand against him.', 'Unlocked immediately', '/assets/operators/takeo.webp'),
(21, 'Carver', 'Mackenzie Carver', 'American', 'guild', 1, 'Major Mackenzie Carver comes from a long line of military excellence and earned his own reputation through exceptional skill and loyalty. Even after losing his rank and being imprisoned, he kept his mind and body sharp, determined to reclaim his honor.\\n\\nLeaving Janus Towers with a renewed fury toward the Dark Aether, Carver emerges with a clear purpose. No longer content to simply follow orders, he now fights as a protector, determined to build a future where humanity stands free from any mast', 'Unlocked immediately', '/assets/operators/carver.webp'),
(22, 'Grey', 'Elizabeth Grey', 'British', 'guild', 1, 'Dr. Elizabeth Grey is a brilliant Aetherium researcher whose groundbreaking work was twisted toward darker purposes. Years of imprisonment under Requiem’s former director changed her, leaving her sharper, tougher, and determined to use her scientific skill to give her team every possible advantage.\\n\\nLeaving Janus Towers, Grey carries both hard-won victories and a growing unease—wondering if science alone can repair the damage it has caused. Once devoted to pure reason, she now fears that survi', 'Unlocked immediately', '/assets/operators/grey.webp'),
(23, 'Maya', 'Maya Aguinaldo', 'Filipina', 'jsoc', 1, 'Raised in a family of smugglers, Maya Aguinaldo brings sharp instincts, stealth, and covert skill to every mission. Her search for the Syndicate that abducted her brother led her to Requiem, where she helped free their leaders on Terminus Island.\\n\\nThough the Dark Aether is far outside her world, her grit and street-honed instincts made her a crucial ally in a much larger fight.\\n\\nUnsure of her place in this new “family,” the events at Janus Towers force her to stand with old and new allies al', 'Unlocked immediately', '/assets/operators/maya.webp'),
(24, 'Weaver', 'Grigori Weaver', 'Soviet, American', 'jsoc', 1, 'Grigori Weaver is a Ranger-trained CIA operative whose combat skill and espionage expertise have carried him through countless covert missions. After his mother defected from the Soviet Union, he devoted himself to clandestine service, driven by past mistakes and a need to fight for something that matters.\\n\\nThe fall of Janus Towers changed him. No longer just a shadowy handler, Weaver has become a hardened leader shaped by sacrifice. With Requiem in ruins, he''s determined to pull the pieces to', 'Unlocked immediately', '/assets/operators/weaver.webp');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `perks`
--

CREATE TABLE `perks` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slot` int NOT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perks`
--

INSERT INTO `perks` (`id`, `name`, `display_name`, `slot`, `category`, `category_color`, `unlock_level`, `unlock_label`, `description`, `icon_url`, `sort_order`) VALUES
(1, 'gung_ho', 'Gung Ho', 1, 'enforcer', 'red', 18, 'Level 18', 'Fire while sprinting. Improved movement speed while reloading or using equipment.', '/assets/perks_mp/gung_ho.webp', 1),
(2, 'dexterity', 'Dexterity', 1, 'enforcer', 'red', 22, 'Level 22', 'Reduced flinch while aiming down sights.', '/assets/perks_mp/dexterity.webp', 2),
(3, 'lightweight', 'Lightweight', 1, 'enforcer', 'red', 36, 'Level 36', 'Increased movement and swim speed.', '/assets/perks_mp/lightweight.webp', 3),
(4, 'cold_blooded', 'Cold Blooded', 1, 'recon', 'blue', 0, 'Default', 'Immune to AI targeting systems and thermal optics. Immune to detection from Recon Combat Specialty.', '/assets/perks_mp/cold_blooded.webp', 4),
(5, 'ghost', 'Ghost', 1, 'recon', 'blue', 10, 'Level 10', 'Undetectable by UAV and Intel abilities while moving, planting, or defusing bombs, or controlling Scorestreaks.', '/assets/perks_mp/ghost.webp', 5),
(6, 'ninja', 'Ninja', 1, 'recon', 'blue', 44, 'Level 44', 'Dampened footstep and equipment sounds. Reduced detection range on Spy Cam while crouched or prone.', '/assets/perks_mp/ninja.webp', 6),
(7, 'tech_mask', 'Tech Mask', 1, 'strategist', 'green', 26, 'Level 26', 'Reduced duration on effects from Gas Grenades and Flash Grenades.', '/assets/perks_mp/tech_mask.webp', 7),
(8, 'flak_jacket', 'Flak Jacket', 1, 'strategist', 'green', 50, 'Level 50', 'Reduced damage from explosives and fire. Immune to Molotov slow effect. Incoming Frag Grenades are displayed on minimap.', '/assets/perks_mp/flak_jacket.webp', 8),
(9, 'shadow', 'Shadow', 1, 'strategist', 'green', 54, 'Level 54', 'Immune to UAVs while moving, planting, or defusing bombs, or controlling Scorestreaks. Enemies within 10 meters are revealed on minimap.', '/assets/perks_mp/shadow.webp', 9),
(10, 'scavenger', 'Scavenger', 2, 'enforcer', 'red', 0, 'Default', 'Replenish ammo from fallen players.', '/assets/perks_mp/scavenger.webp', 10),
(11, 'assassin', 'Assassin', 2, 'enforcer', 'red', 30, 'Level 30', 'Increased movement and aim down sights speed. Improved target flinch.', '/assets/perks_mp/assassin.webp', 11),
(12, 'close_shave', 'Close Shave', 2, 'enforcer', 'red', 48, 'Level 48', 'Regenerate health while near enemies.', '/assets/perks_mp/close_shave.webp', 12),
(13, 'hunter_instinct', 'Hunter Instinct', 2, 'enforcer', 'red', 14, 'Level 14', 'Minimap shows a larger area. Faster and more accurate aim when aiming down sights at enemies detected by your Intel.', '/assets/perks_mp/hunter_instinct.webp', 13),
(14, 'vigilance', 'Vigilance', 2, 'recon', 'blue', 38, 'Level 38', 'Enemies who damage you are shown on your minimap. Suppressed enemy gunfire is visible on minimap.', '/assets/perks_mp/vigilance.webp', 14),
(15, 'blast_link', 'Blast Link', 2, 'recon', 'blue', 46, 'Level 46', 'Enemies near your recently placed C4, Proximity Mine, or Drill Charge are revealed on minimap.', '/assets/perks_mp/blast_link.webp', 15),
(16, 'engineer', 'Engineer', 2, 'recon', 'blue', 0, 'Default', 'Detect enemy equipment and Scorestreaks through walls. Equipment kills give Intel.', '/assets/perks_mp/engineer.webp', 16),
(17, 'fast_hands', 'Fast Hands', 2, 'strategist', 'green', 5, 'Level 5', 'Faster weapon swap and equipment use.', '/assets/perks_mp/fast_hands.webp', 17),
(18, 'gearhead', 'Gearhead', 2, 'strategist', 'green', 42, 'Level 42', 'Reduced cooldown on Field Upgrades.', '/assets/perks_mp/gearhead.webp', 18),
(19, 'tac_sprinter', 'Tac Sprinter', 3, 'enforcer', 'red', 6, 'Level 6', 'Reduced Tactical Sprint cooldown and increased Tactical Sprint duration.', '/assets/perks_mp/tac_sprinter.webp', 19),
(20, 'bankroll', 'Bankroll', 3, 'enforcer', 'red', 16, 'Level 16', 'Start with additional Score. Gain Score faster.', '/assets/perks_mp/bankroll.webp', 20),
(21, 'bruiser', 'Bruiser', 3, 'enforcer', 'red', 24, 'Level 24', 'Increased melee quickness and damage.', '/assets/perks_mp/bruiser.webp', 21),
(22, 'looper', 'Looper', 3, 'enforcer', 'red', 0, 'Default', 'Toss back Frag Grenades and reset Frag Grenade fuses. Can carry two Lethal Equipment.', '/assets/perks_mp/looper.webp', 22),
(23, 'vendetta', 'Vendetta', 3, 'recon', 'blue', 32, 'Level 32', 'Grant additional Score when streaking and revenge kills.', '/assets/perks_mp/vendetta.webp', 23),
(24, 'tracker', 'Tracker', 3, 'recon', 'blue', 52, 'Level 52', 'See a preview of enemy footsteps. Reset Tracker on kills.', '/assets/perks_mp/tracker.webp', 24),
(25, 'quartermaster', 'Quartermaster', 3, 'strategist', 'green', 8, 'Level 8', 'Recharge equipment over time.', '/assets/perks_mp/quartermaster.webp', 25),
(26, 'charge_link', 'Charge Link', 3, 'strategist', 'green', 12, 'Level 12', 'Increased Field Upgrade charge rate from ally Field Upgrade use.', '/assets/perks_mp/charge_link.webp', 26),
(27, 'guardian', 'Guardian', 3, 'strategist', 'green', 0, 'Default', 'Can take an additional hit while at full health in Hardcore modes. Taking damage scrambles the minimap of nearby enemies.', '/assets/perks_mp/guardian.webp', 27);



-- --------------------------------------------------------

--
-- Table structure for table `combat_specialties`
--

CREATE TABLE `combat_specialties` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required_perks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perk_combination` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `combat_specialties`
--

INSERT INTO `combat_specialties` (`id`, `name`, `display_name`, `specialty_type`, `category_color`, `required_perks`, `perk_combination`, `effect_description`, `icon_url`, `sort_order`) VALUES
(1, 'enforcer', 'Enforcer', 'core', 'red', 'Three Red (Enforcer) Perks', 'red:3', 'After each elimination, gain a buff to movement speed and health regen for a short time.', '/assets/combat_specialities/enforcer.webp', 1),
(2, 'recon', 'Recon', 'core', 'blue', 'Three Blue (Recon) Perks', 'blue:3', 'On respawn, see the direction of the closest enemy on the minimap. Edge of HUD pulses for enemies outside view. No death skulls shown.', '/assets/combat_specialities/recon.webp', 2),
(3, 'strategist', 'Strategist', 'core', 'green', 'Three Green (Strategist) Perks', 'green:3', 'Increased score for objectives and sabotage. Deploy equipment faster. See enemy content through walls at short distance.', '/assets/combat_specialities/strategist.webp', 3),
(4, 'scout', 'Scout', 'hybrid', 'hybrid', 'Mix of Red and Blue Perks (2 + 1)', 'red:2,blue:1', 'Offense and stealth hybrid. When you get a bullet elimination, stay completely hidden from enemy minimaps for 5 seconds. Additional eliminations reset the timer.', '/assets/combat_specialities/scout.webp', 4),
(5, 'tactician', 'Tactician', 'hybrid', 'hybrid', 'Mix of Red and Green Perks (2 + 1)', 'red:2,green:1', 'Support and offense hybrid. When you earn assists, earn bonus score from bullet eliminations for 10 seconds.', '/assets/combat_specialities/tactician.webp', 5),
(6, 'operative', 'Operative', 'hybrid', 'hybrid', 'Mix of Blue and Green Perks (2 + 1)', 'blue:2,green:1', 'Stealth and support hybrid. Earn Field Upgrade charge from stealthy eliminations such as suppressed weapons, melee, or out of line of sight.', '/assets/combat_specialities/operative.webp', 6);



-- --------------------------------------------------------

--
-- Table structure for table `weapons_mp`
--

CREATE TABLE `weapons_mp` (
  `id` int NOT NULL,
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
  `sort_order` int NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `weapon_camo`
--

CREATE TABLE `weapon_camo` (
  `id` int NOT NULL,
  `weapon_id` int NOT NULL,
  `camo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weapon_camo`
--

INSERT INTO `weapon_camo` (`id`, `weapon_id`, `camo_id`) VALUES
(1, 1, 49),
(2, 1, 50),
(3, 1, 54),
(4, 2, 67),
(5, 2, 68),
(6, 2, 69),
(7, 3, 55),
(8, 3, 56),
(9, 3, 57),
(10, 4, 58),
(11, 4, 59),
(12, 4, 60),
(13, 5, 64),
(14, 5, 65),
(15, 5, 66),
(16, 6, 61),
(17, 6, 62),
(18, 6, 63),
(19, 7, 70),
(20, 7, 71),
(21, 7, 72),
(22, 8, 73),
(23, 8, 74),
(24, 8, 75),
(25, 9, 85),
(26, 9, 86),
(27, 9, 87),
(28, 10, 76),
(29, 10, 77),
(30, 10, 78),
(31, 11, 82),
(32, 11, 83),
(33, 11, 84),
(34, 12, 79),
(35, 12, 80),
(36, 12, 81),
(37, 13, 88),
(38, 13, 89),
(39, 13, 90),
(40, 14, 91),
(41, 14, 92),
(42, 14, 93),
(43, 15, 94),
(44, 15, 95),
(45, 15, 96),
(46, 16, 97),
(47, 16, 98),
(48, 16, 99),
(49, 17, 100),
(50, 17, 101),
(51, 17, 102),
(52, 18, 103),
(53, 18, 104),
(54, 18, 105),
(55, 19, 106),
(56, 19, 107),
(57, 19, 108),
(58, 20, 109),
(59, 20, 110),
(60, 20, 111),
(61, 21, 112),
(62, 21, 113),
(63, 21, 114),
(64, 22, 115),
(65, 22, 116),
(66, 22, 117),
(67, 23, 118),
(68, 23, 119),
(69, 23, 120),
(70, 24, 121),
(71, 24, 122),
(72, 24, 123),
(73, 25, 124),
(74, 25, 125),
(75, 25, 126),
(76, 26, 127),
(77, 26, 128),
(78, 26, 129),
(79, 27, 130),
(80, 27, 131),
(81, 27, 132),
(82, 28, 133),
(83, 28, 134),
(84, 28, 135),
(85, 29, 136),
(86, 29, 137),
(87, 29, 138);

-- --------------------------------------------------------

--
-- Table structure for table `wildcards`
--

CREATE TABLE `wildcards` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wildcards`
--

INSERT INTO `wildcards` (`id`, `name`, `display_name`, `unlock_level`, `unlock_label`, `description`, `icon_url`, `sort_order`) VALUES
(1, 'tac_expert', 'Tac Expert', 15, 'Level 15', 'Spawn with an extra Tactical.', '/assets/wildcards/tac_expert.webp', 1),
(2, 'overkill', 'Overkill', 20, 'Level 20', 'Equip any non-melee weapon in Primary and Secondary slots.', '/assets/wildcards/overkill.webp', 2),
(3, 'danger_close', 'Danger Close', 24, 'Level 24', 'Spawn with an extra lethal.', '/assets/wildcards/danger_close.webp', 3),
(4, 'gunfighter', 'Gunfighter', 29, 'Level 29', 'Get 3 extra attachment points for your Primary weapon.', '/assets/wildcards/gunfighter.webp', 4),
(5, 'perk_greed', 'Perk Greed', 33, 'Level 33', 'Equip an extra Perk.', '/assets/wildcards/perk_greed.webp', 5),
(6, 'prepper', 'Prepper', 38, 'Level 38', 'Equip two different Field Upgrades.', '/assets/wildcards/prepper.webp', 6),
(7, 'flyswatter', 'Flyswatter', 41, 'Level 41', 'Replace the melee in your Dedicated Melee Slot with a Launcher.', '/assets/wildcards/flyswatter.webp', 7),
(8, 'high_roller', 'High Roller', 48, 'Level 48', 'Equip a fourth Scorestreak.', '/assets/wildcards/high_roller.webp', 8),
(9, 'specialist', 'Specialist', 53, 'Level 53', 'Replace your Scorestreaks with three Perks. You earn them at 200, 400, and 600 Score. Earn all remaining eligible Perks at 1200 Score. Perks equipped by using Wildcards do not count towards Combat Specialty.', '/assets/wildcards/specialist.webp', 9);



-- --------------------------------------------------------

--
-- Table structure for table `scorestreaks`
--

CREATE TABLE `scorestreaks` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `score_cost` int NOT NULL,
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overclock_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overclock_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_o1_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_o2_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scorestreaks`
--

INSERT INTO `scorestreaks` (`id`, `name`, `display_name`, `description`, `score_cost`, `unlock_level`, `unlock_label`, `overclock_1`, `overclock_2`, `icon_url`, `icon_o1_url`, `icon_o2_url`, `sort_order`) VALUES
(1, 'scout_pulse', 'Scout Pulse', 'Radar ping that reveals nearby enemies on the user\'s minimap.', 350, 0, 'Default', 'Lower score cost.', 'Radar ping shows directional arrows instead of red dots.', '/assets/scorestreak/scout_pulse.webp', '/assets/scorestreak/scout_pulse_o1.webp', '/assets/scorestreak/scout_pulse_o2.webp', 1),
(2, 'rc_xd', 'RC-XD', 'Deploy a small remote controlled, remote detonated explosive vehicle.', 400, 5, 'Level 5', 'Increased Resistance to enemy gunfire.', 'See target indicators on occluded enemies in medium range.', '/assets/scorestreak/rc_xd.webp', '/assets/scorestreak/rc_xd_o1.webp', '/assets/scorestreak/rc_xd_o2.webp', 2),
(3, 'uav', 'UAV', 'UAV recon ship that reveals enemy locations on the minimap.', 500, 11, 'Level 11', 'Lower score cost.', 'Counters the first lock-on missile with a flare. Increases bullet resistance.', '/assets/scorestreak/uav.webp', '/assets/scorestreak/uav_o1.webp', '/assets/scorestreak/uav_o2.webp', 3),
(4, 'skewer', 'Skewer', 'Fire and forget air-to-ground projectile for precision eliminations. Bladed design minimizes collateral damage.', 525, 0, 'Default', 'Increased velocity.', 'Skewer targets higher priority enemies when possible.', '/assets/scorestreak/skewer.webp', '/assets/scorestreak/skewer_o1.webp', '/assets/scorestreak/skewer_o2.webp', 4),
(5, 'care_package', 'Care Package', 'Call in an airdrop that contains a random Scorestreak.', 550, 26, 'Level 26', 'Re-roll a Care Package drop one time.', 'Lower score cost.', '/assets/scorestreak/care_package.webp', '/assets/scorestreak/care_package_o1.webp', '/assets/scorestreak/care_package_o2.webp', 5),
(6, 'counter_uav', 'Counter UAV', 'A drone that scrambles all enemy minimaps.', 600, 20, 'Level 20', 'Lower score cost.', 'Counters the first lock-on missile with a flare. Increases bullet resistance.', '/assets/scorestreak/counter_uav.webp', '/assets/scorestreak/counter_uav_o1.webp', '/assets/scorestreak/counter_uav_o2.webp', 6),
(7, 'napalm_strike', 'Napalm Strike', 'Launch a targeted carpet bomb strike of explosive napalm.', 700, 33, 'Level 33', 'Reveals enemies longer and displays their movement directions while aiming a strike.', 'Flames burn longer.', '/assets/scorestreak/napalm_strike.webp', '/assets/scorestreak/napalm_strike_o1.webp', '/assets/scorestreak/napalm_strike_o2.webp', 7),
(8, 'lgm', 'LGM', 'Launch a continuous bombardment of explosive shells at a targeted area.', 725, 38, 'Level 38', 'Marks a second target location. Reduced payload per zone.', 'Rains down extra projectiles.', '/assets/scorestreak/lgm.webp', '/assets/scorestreak/lgm_o1.webp', '/assets/scorestreak/lgm_o2.webp', 8),
(9, 'sentry_turret', 'Sentry Turret', 'Automated turret that scans for and attacks nearby enemies in a forward-facing cone.', 750, 21, 'Level 21', 'Increased turret rotation for greater coverage.', 'Adds ability to control remotely.', '/assets/scorestreak/sentry_turrent.webp', '/assets/scorestreak/sentry_turrent_o1.webp', '/assets/scorestreak/sentry_turrent_o2.webp', 9),
(10, 'hand_canon', 'Hand Cannon', 'Powerful large caliber handgun with high bullet damage and penetration.', 800, 42, 'Level 42', 'More ammo in clip.', 'Dual Hand Cannons.', '/assets/scorestreak/hand_canon.webp', '/assets/scorestreak/hand_canon_o1.webp', '/assets/scorestreak/hand_canon_o2.webp', 10),
(11, 'hellstorm', 'Hellstorm', 'Control a long-range cruise missile with boost capabilities and secondary missiles.', 850, 9, 'Level 9', 'Additional cluster missile.', 'Missiles can lock onto Scorestreaks.', '/assets/scorestreak/hellstorm.webp', '/assets/scorestreak/hellstorm_o1.webp', '/assets/scorestreak/hellstorm_o2.webp', 11),
(12, 'watchdog_helo', 'Watchdog Helo', 'Close air support escort chopper that pings and attacks enemies in your area.', 950, 23, 'Level 23', 'Improved durability against enemy attack.', 'Direct Watchdog Helo to guard an area.', '/assets/scorestreak/watchdog_helo.webp', '/assets/scorestreak/watchdog_helo_o1.webp', '/assets/scorestreak/watchdog_helo_o2.webp', 12),
(13, 'gravemaker', 'Gravemaker', 'Assemble a portable, one-hit-kill sniper rifle that can reveal and eliminate targets behind cover.', 1000, 17, 'Level 17', 'A larger magazine provides more ammo.', 'Reduced charge time before firing.', '/assets/scorestreak/gravemaker.webp', '/assets/scorestreak/gravemaker_o1.webp', '/assets/scorestreak/gravemaker_o2.webp', 13),
(14, 'interceptors', 'Interceptors', 'Call in a group of five jets to destroy enemy flying targets.', 1025, 51, 'Level 51', 'Deploy Interceptors without detected threats.', 'Lower score cost.', '/assets/scorestreak/interceptors.webp', '/assets/scorestreak/interceptors_o1.webp', '/assets/scorestreak/interceptors_o2.webp', 14),
(15, 'dawg', 'D.A.W.G.', 'Deployable Armored Weaponized Groundcraft featuring a large caliber turret and rocket pod. Very effective against infantry targets.', 1050, 0, 'Default', 'Longer active duration.', 'Adds Sentry Mode. D.A.W.G. hunkers down, guarding an area and deploying a supply pack and integrated Trophy System.', '/assets/scorestreak/dawg.webp', '/assets/scorestreak/dawg_o1.webp', '/assets/scorestreak/dawg_o2.webp', 15),
(16, 'hkds', 'HKDS', 'Aerial payload delivers wheeled Hunter Kill Drones which seek targets and explode.', 1200, 30, 'Level 30', 'Improved durability against enemy attack.', 'Deploy additional GDU drop pods.', '/assets/scorestreak/hkds.webp', '/assets/scorestreak/hkds_o1.webp', '/assets/scorestreak/hkds_o2.webp', 16),
(17, 'rhino', 'Rhino', 'Remotely control an armored robotic soldier equipped with a deadly minigun.', 1250, 54, 'Level 54', 'Extended runtime for Rhino.', 'Reveals nearby enemy location on Rhino\'s minimap. Enhanced radar length and duration.', '/assets/scorestreak/rhino.webp', '/assets/scorestreak/rhino_o1.webp', '/assets/scorestreak/rhino_o2.webp', 17),
(18, 'vtol_warship', 'VTOL Warship', 'Control a VTOL Warship armed with a turret and air-to-land missiles.', 1350, 48, 'Level 48', 'Increased durability.', 'Adds ability to boost in a direction, breaking enemy rocket lock-on.', '/assets/scorestreak/vtol_warship.webp', '/assets/scorestreak/vtol_warship_o1.webp', '/assets/scorestreak/vtol_warship_o2.webp', 18),
(19, 'harp', 'HARP', 'High altitude recon vehicle reveals enemy position and direction on the minimap in real time.', 1400, 47, 'Level 47', 'Deploys flares against incoming lock-on rockets.', 'Lower score cost.', '/assets/scorestreak/harp.webp', '/assets/scorestreak/harp_o1.webp', '/assets/scorestreak/harp_o2.webp', 19),
(20, 'emp', 'EMP Systems', 'Massive electromagnetic pulse weapon disrupts enemies and destroys all hostile equipment and vehicles.', 1450, 44, 'Level 44', 'Lower score cost.', 'Prevents enemies from using Scorestreaks and Field Upgrades for a long duration.', '/assets/scorestreak/emp.webp', '/assets/scorestreak/emp_o1.webp', '/assets/scorestreak/emp_o2.webp', 20),
(21, 'legion', 'Legion', 'Large autonomous drone cluster patrols the skies, automatically seeking targets and exploding on impact.', 1500, 0, 'Default', 'Launches multiple drones in quick succession to overwhelm a target.', 'Extended flight duration for drones.', '/assets/scorestreak/legion.webp', '/assets/scorestreak/legion_o1.webp', '/assets/scorestreak/legion_o2.webp', 21);

-- --------------------------------------------------------

--
-- Table structure for table `tacticals_mp`
--

CREATE TABLE `tacticals_mp` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_multiplayer` tinyint(1) NOT NULL DEFAULT '0',
  `available_zombies` tinyint(1) NOT NULL DEFAULT '0',
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overclock_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overclock_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_hud_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_o1_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_o2_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tacticals_mp`
--

INSERT INTO `tacticals_mp` (`id`, `name`, `display_name`, `available_multiplayer`, `available_zombies`, `unlock_level`, `unlock_label`, `description`, `overclock_1`, `overclock_2`, `icon_url`, `icon_hud_url`, `icon_o1_url`, `icon_o2_url`, `sort_order`) VALUES
(1, 'emp_grenade', 'EMP Grenade', 1, 1, 0, 'Default', 'Disables or destroys electronics. Effective against Equipment, Scorestreaks, and players.', 'Increased disruption radius.', 'Cook for up to three extra EMP bursts.', '/assets/tacticals_mp/emp_grenade.webp', '/assets/tacticals_mp/emp_grenade_hud.webp', '/assets/tacticals_mp/emp_grenade_o1.webp', '/assets/tacticals_mp/emp_grenade_o2.webp', 1),
(2, 'stun_grenade', 'Stun Grenade', 1, 1, 0, 'Default', 'Slows victim\'s movement and aiming.', 'Increased stun duration.', 'Slows enemy movement speed when stunned.', '/assets/tacticals_mp/stun_grenade.webp', '/assets/tacticals_mp/stun_grenade_hud.webp', '/assets/tacticals_mp/stun_grenade_o1.webp', '/assets/tacticals_mp/stun_grenade_o2.webp', 2),
(3, 'flashbang', 'Flashbang', 1, 0, 6, 'Level 6', 'Blinds and deafens targets.', 'Wider full flash angle; harder to counter by looking away.', 'Adds ability to cook for additional detonations.', '/assets/tacticals_mp/flashbang.webp', '/assets/tacticals_mp/flashbang_hud.webp', '/assets/tacticals_mp/flashbang_o1.webp', '/assets/tacticals_mp/flashbang_o2.webp', 3),
(4, 'pinpoint_grenade', 'Pinpoint Grenade', 1, 0, 8, 'Level 8', 'Detects enemies within range; close targets shot with tracking devices removable by victims.', 'AI chip increases grenade lifetime and detection radius.', 'Tagged enemies appear on allied minimaps.', '/assets/tacticals_mp/pinpoint_grenade.webp', '/assets/tacticals_mp/pinpoint_grenade_hud.webp', '/assets/tacticals_mp/pinpoint_grenade_o1.webp', '/assets/tacticals_mp/pinpoint_grenade_o2.webp', 4),
(5, 'stim_shot', 'Stim Shot', 1, 1, 21, 'Level 21', 'Military stimulant that quickly heals combat wounds.', 'Adds ability to remove player debuffs.', 'Adds a move speed boost.', '/assets/tacticals_mp/stim_shot.webp', '/assets/tacticals_mp/stim_shot_hud.webp', '/assets/tacticals_mp/stim_shot_o1.webp', '/assets/tacticals_mp/stim_shot_o2.webp', 5),
(6, 'psych_grenade', 'Psych Grenade', 1, 1, 29, 'Level 29', 'Explodes on impact releasing hallucinogenic gas cloud.', 'Increases duration enemies are affected by gas.', 'Gas deals damage over time.', '/assets/tacticals_mp/psych_grenade.webp', '/assets/tacticals_mp/psych_grenade_hud.webp', '/assets/tacticals_mp/psych_grenade_o1.webp', '/assets/tacticals_mp/psych_grenade_o2.webp', 6),
(7, 'smoke', 'Smoke Grenade', 1, 0, 35, 'Level 35', 'Deploys a smoke screen that blocks vision and automated targeting systems.', NULL, NULL, '/assets/tacticals_mp/smoke.webp', NULL, NULL, NULL, 7),
(8, 'hunter_bot', 'Hunter Bot', 1, 1, 42, 'Level 42', 'Personal defense drone; targets enemy equipment, field upgrades, and Scorestreaks. Counters grenades.', NULL, NULL, '/assets/tacticals_mp/hunter_bot.webp', NULL, NULL, NULL, 8),
(9, 'decoy', 'Decoy Grenade', 1, 1, 50, 'Level 50', 'Grenade that simulates gunfire sounds to confuse enemies. Sticks to surfaces.', NULL, NULL, '/assets/tacticals_mp/decoy.webp', NULL, NULL, NULL, 9),
(10, 'cymbal_monkey', 'Cymbal Monkey', 0, 1, 24, 'Level 24', 'Attracts zombies for a short duration before exploding.', NULL, NULL, '/assets/tacticals_mp/cymbal_monkey.webp', NULL, NULL, NULL, 10),
(11, 'kazimir', 'LT53 Kazimir', 0, 1, 47, 'Level 47', 'Creates a small singularity that pulls in and kills enemies.', NULL, NULL, '/assets/tacticals_mp/kazimir_hud.webp', '/assets/tacticals_mp/kazimir_hud.webp', NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `lethals`
--

CREATE TABLE `lethals` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_multiplayer` tinyint(1) NOT NULL DEFAULT '0',
  `available_zombies` tinyint(1) NOT NULL DEFAULT '0',
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overclock_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overclock_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_hud_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_o1_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_o2_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lethals`
--

INSERT INTO `lethals` (`id`, `name`, `display_name`, `available_multiplayer`, `available_zombies`, `unlock_level`, `unlock_label`, `description`, `overclock_1`, `overclock_2`, `icon_url`, `icon_hud_url`, `icon_o1_url`, `icon_o2_url`, `sort_order`) VALUES
(1, 'frag', 'Frag', 1, 1, 0, 'Default', 'Cookable fragmentation grenade.', 'High density explosive material improves lethality.', 'Increased throw distance; cooking shows arc indicator.', '/assets/lethals/frag.webp', '/assets/lethals/frag_hud.webp', '/assets/lethals/frag_o1.webp', '/assets/lethals/frag_o2.webp', 1),
(2, 'cluster_grenade', 'Cluster Grenade', 1, 1, 5, 'Level 5', 'Grenade that scatters smaller explosives when detonated.', 'Adds ability to cook the fuse.', 'Additional mini grenade.', '/assets/lethals/cluster_grenade.webp', '/assets/lethals/cluster_grenade_hud.webp', '/assets/lethals/cluster_grenade_o1.webp', '/assets/lethals/cluster_grenade_o2.webp', 2),
(3, 'sticky_grenade', 'Sticky Grenade', 1, 1, 12, 'Level 12', 'Timed sticky grenade.', 'High density explosive material improves lethality.', 'Adds ability to cook the fuse.', '/assets/lethals/sticky_grenade.webp', '/assets/lethals/sticky_grenade_hud.webp', '/assets/lethals/sticky_grenade_o1.webp', '/assets/lethals/sticky_grenade_o2.webp', 3),
(4, 'needle_drone', 'Needle Drone', 1, 0, 18, 'Level 18', 'Small flying drone that explodes on impact; manual/auto control toggle.', 'High density explosive material improves lethality.', 'Adds ability to boost dart manually.', '/assets/lethals/needle_drone.webp', '/assets/lethals/needle_drone_hud.webp', '/assets/lethals/needle_drone_o1.webp', '/assets/lethals/needle_drone_o2.webp', 4),
(5, 'molotov', 'Molotov', 1, 1, 26, 'Level 26', 'Thrown incendiary weapon creating a patch of flames.', NULL, NULL, '/assets/lethals/molotov.webp', '/assets/lethals/molotov_hud.webp', NULL, NULL, 5),
(6, 'point_turret', 'Point Turret', 1, 1, 33, 'Level 33', 'Small deployable turret that automatically shoots at enemies.', 'Increased turret firing rate.', 'Orientation sensors for wall/ceiling mount.', '/assets/lethals/point_turret.webp', '/assets/lethals/point_turret_hud.webp', '/assets/lethals/point_turret_o1.webp', '/assets/lethals/point_turret_o2.webp', 6),
(7, 'c4', 'C4', 1, 1, 41, 'Level 41', 'Large explosive sticks to surfaces; detonated remotely or immediately.', NULL, NULL, '/assets/lethals/c4.webp', '/assets/lethals/c4_hud.webp', NULL, NULL, 7),
(8, 'combat_axe', 'Combat Axe', 1, 1, 54, 'Level 54', 'Thrown axe kills enemies in one hit; bounces off surfaces.', 'Faster raise speed.', 'Throw axe farther and faster.', '/assets/lethals/combat_axe.webp', '/assets/lethals/combat_axe_hud.webp', '/assets/lethals/combat_axe_o1.webp', '/assets/lethals/combat_axe_o2.webp', 8);

-- --------------------------------------------------------

--
-- Table structure for table `field_upgrades`
--

CREATE TABLE `field_upgrades` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_multiplayer` tinyint(1) NOT NULL DEFAULT '0',
  `available_zombies` tinyint(1) NOT NULL DEFAULT '0',
  `unlock_level` int NOT NULL,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `overclock_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overclock_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_hud_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_o1_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_o2_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_upgrades`
--

INSERT INTO `field_upgrades` (`id`, `name`, `display_name`, `available_multiplayer`, `available_zombies`, `unlock_level`, `unlock_label`, `description`, `overclock_1`, `overclock_2`, `icon_url`, `icon_hud_url`, `icon_o1_url`, `icon_o2_url`, `sort_order`) VALUES
(1, 'assault_pack', 'Assault Pack', 1, 0, 0, 'Default', 'Extra ammo and equipment to resupply your team.', 'Faster charge time', 'Additional score on eliminations', '/assets/field_upgrade/assault_pack.webp', '/assets/field_upgrade/assault_pack_hud.webp', '/assets/field_upgrade/assault_pack_o1.webp', '/assets/field_upgrade/assault_pack_o2.webp', 1),
(2, 'drone_pod', 'Drone Pod', 1, 0, 6, 'Level 6', 'Deployable device that launches aerial drones. Drones seek out enemies and explode.', 'Drones launch much faster', 'Leave minimap icon at detonation points', '/assets/field_upgrade/drone_pod.webp', '/assets/field_upgrade/drone_pod_hud.webp', '/assets/field_upgrade/drone_pod_o1.webp', '/assets/field_upgrade/drone_pod_o2.webp', 2),
(3, 'trophy_system', 'Trophy System', 1, 0, 9, 'Level 9', 'Area defense system that destroys enemy projectiles in the air.', 'Faster charge time', '+2 explosive charge ammo', '/assets/field_upgrade/trophy_system.webp', '/assets/field_upgrade/trophy_system_hud.webp', '/assets/field_upgrade/trophy_system_o1.webp', '/assets/field_upgrade/trophy_system_o2.webp', 3),
(4, 'mute_field', 'Mute Field', 1, 0, 14, 'Level 14', 'A stealth device that reduces your footstep volume, hides you from enemy minimaps, and prevents you from being targeted by enemy Scorestreaks for a limited time.', NULL, NULL, '/assets/field_upgrade/mute_field.webp', NULL, NULL, NULL, 4),
(5, 'squad_link', 'Squad Link', 1, 0, 20, 'Level 20', 'Deployed device that boosts score and improves effectiveness of allied Operators and gadgets in range.', 'Expands coverage area', 'Increases nearby allies\' Field Upgrade recharge speed and doubles earned score', '/assets/field_upgrade/squad_link.webp', '/assets/field_upgrade/squad_link_hud.webp', '/assets/field_upgrade/squad_link_o1.webp', '/assets/field_upgrade/squad_link_o2.webp', 5),
(6, 'echo_unit', 'Echo Unit', 1, 0, 27, 'Level 27', 'Holographic soldier decoy tricks enemies and captures and holds objectives.', 'Hologram flashes when enemies come near', 'Faster charge time', '/assets/field_upgrade/echo_unit.webp', '/assets/field_upgrade/echo_unit_hud.webp', '/assets/field_upgrade/echo_unit_o1.webp', '/assets/field_upgrade/echo_unit_o2.webp', 6),
(7, 'fear_trap', 'Fear Trap', 1, 0, 32, 'Level 32', 'A deployed trap which emits a neurotoxic gas cloud, causing hallucinations and disorienting victims.', NULL, NULL, '/assets/field_upgrade/fear_trap.webp', '/assets/field_upgrade/fear_trap_hud.webp', NULL, NULL, 7),
(8, 'black_hat', 'Black Hat', 1, 0, 38, 'Level 38', 'Hack enemies, equipment, and vehicles. Hacked targets are disabled, destroyed, or converted to fight for you.', NULL, NULL, '/assets/field_upgrade/black_hat.webp', NULL, NULL, NULL, 8),
(9, 'scrambler', 'Scrambler', 1, 0, 45, 'Level 45', 'Creates an area that scrambles enemy equipment, field upgrades, scorestreaks and minimaps.', NULL, NULL, '/assets/field_upgrade/scrambler.webp', NULL, NULL, NULL, 9),
(10, 'active_camo', 'Active Camo', 1, 0, 51, 'Level 51', 'Become partially invisible for a short period of time.', 'Increased duration and faster charge time', 'Gunfire reveals you temporarily instead of ending ability', '/assets/field_upgrade/active_camo.webp', '/assets/field_upgrade/active_camo_hud.webp', '/assets/field_upgrade/active_camo_o1.webp', '/assets/field_upgrade/active_camo_o2.webp', 10);

-- --------------------------------------------------------

--
-- Table structure for table `perk_a_cola`
--

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

--
-- Table structure for table `perk_a_cola_augments`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `ammo_mods`
--

CREATE TABLE `ammo_mods` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int NOT NULL DEFAULT 0,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `box_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ammo_mods`
--

INSERT INTO `ammo_mods` (`id`, `name`, `description`, `unlock_level`, `unlock_label`, `icon_url`, `box_url`, `recipe_url`, `sort_order`) VALUES
(1, 'Dead Wire', 'Bullets deal electric damage. Each bullet has a chance to stun a normal or special enemy, causing them to generate an electric damage field.', 0, 'Default', '/assets/ammo_mods/icons/dead_wire.webp', '/assets/ammo_mods/box/dead_wire.png', '/assets/ammo_mods/recipe/dead_wire.webp', 1),
(2, 'Cryo Freeze', 'Bullets deal frost damage. Each bullet has a chance to slow a normal or special enemy and increase the damage they receive.', 12, 'Level 12', '/assets/ammo_mods/icons/cryo_freeze.webp', '/assets/ammo_mods/box/cryo_freeze.png', '/assets/ammo_mods/recipe/cryo_freeze.webp', 2),
(3, 'Fire Works', 'Each bullet that hits a Normal or Special Enemy has a chance to launch fireworks that target enemies.', 18, 'Level 18', '/assets/ammo_mods/icons/firework.webp', '/assets/ammo_mods/box/firework.png', '/assets/ammo_mods/recipe/firework.webp', 3),
(4, 'Napalm Burst', 'Bullets deal fire damage. Each bullet has a chance to apply a burn on normal and special enemies, dealing damage over time.', 35, 'Level 35', '/assets/ammo_mods/icons/napalm_burst.webp', '/assets/ammo_mods/box/napalm_burst.png', '/assets/ammo_mods/recipe/napalm_burst.webp', 4),
(5, 'Shadow Rift', 'Bullets deal shadow damage. Each bullet has a chance to spawn a black hole on a normal or special enemy, warping away those nearby and dropping some from the air at lethal speed.', 44, 'Level 44', '/assets/ammo_mods/icons/shadow_rift.webp', '/assets/ammo_mods/box/shadow_rift.png', '/assets/ammo_mods/recipe/shadow_rift.webp', 5),
(6, 'Brain Rot', 'Bullets deal toxic damage. Each bullet has a chance to temporarily turn a normal or special enemy into an ally.', 51, 'Level 51', '/assets/ammo_mods/icons/brain_rot.webp', '/assets/ammo_mods/box/brain_rot.png', '/assets/ammo_mods/recipe/brain_rot.webp', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ammo_mod_augments`
--

CREATE TABLE `ammo_mod_augments` (
  `id` int NOT NULL,
  `ammo_mod_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Major','Minor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ammo_mod_augments`
--

INSERT INTO `ammo_mod_augments` (`id`, `ammo_mod_id`, `name`, `type`, `effect`, `sort_order`) VALUES
(1, 1, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(2, 1, 'Shock Value', 'Major', 'Increases the damage dealt by the electric damage field.', 2),
(3, 1, 'Chain Reaction', 'Minor', 'Increases the radius of the electric damage field.', 3),
(4, 1, 'Overload', 'Minor', 'Increases the duration of the electric damage field.', 4),
(5, 1, 'Short Circuit', 'Minor', 'Increases the frequency of the stun effect.', 5),
(6, 1, 'Power Surge', 'Major', 'Enemies killed by the electric field explode, dealing damage to nearby enemies.', 6),
(7, 1, 'Static Discharge', 'Major', 'The electric field chains to additional nearby enemies.', 7),
(8, 1, 'Electrocution', 'Minor', 'Increases the damage multiplier against stunned enemies.', 8),
(9, 1, 'Tesla Coil', 'Major', 'The electric field periodically emits powerful lightning bolts.', 9),
(10, 2, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(11, 2, 'Deep Freeze', 'Major', 'Frozen enemies take increased damage from all sources.', 2),
(12, 2, 'Slow and Steady', 'Minor', 'Increases the duration of the slow effect.', 3),
(13, 2, 'Permafrost', 'Minor', 'Increases the slow percentage.', 4),
(14, 2, 'Ice Age', 'Minor', 'Increases the frequency of the slow effect.', 5),
(15, 2, 'Shatter', 'Major', 'Killing a slowed enemy causes them to shatter, dealing damage to nearby enemies.', 6),
(16, 2, 'Frostbite', 'Major', 'Slowed enemies continuously take damage over time.', 7),
(17, 2, 'Absolute Zero', 'Minor', 'Increases the damage multiplier against slowed enemies.', 8),
(18, 2, 'Glacial Advance', 'Major', 'Slowed enemies have a chance to freeze completely for a short duration.', 9),
(19, 3, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(20, 3, 'Grand Finale', 'Major', 'Increases the damage dealt by each firework.', 2),
(21, 3, 'Pyrotechnics', 'Minor', 'Increases the number of fireworks launched.', 3),
(22, 3, 'Rapid Fire', 'Minor', 'Increases the frequency of firework launches.', 4),
(23, 3, 'Explosive Payload', 'Minor', 'Increases the explosion radius of each firework.', 5),
(24, 3, 'Chain Detonation', 'Major', 'Fireworks that hit enemies launch additional smaller fireworks.', 6),
(25, 3, 'Smart Targeting', 'Major', 'Fireworks prioritize Special and Elite enemies.', 7),
(26, 3, 'Cluster Bomb', 'Minor', 'Each firework splits into multiple smaller projectiles.', 8),
(27, 3, 'Sky Show', 'Major', 'Killing an enemy with fireworks launches a massive barrage.', 9),
(28, 4, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(29, 4, 'Inferno', 'Major', 'Increases the damage dealt by the burn effect.', 2),
(30, 4, 'Wildfire', 'Minor', 'Burn spreads to nearby enemies.', 3),
(31, 4, 'Scorched Earth', 'Minor', 'Increases the duration of the burn effect.', 4),
(32, 4, 'Accelerant', 'Minor', 'Increases the frequency of the burn effect.', 5),
(33, 4, 'Backdraft', 'Major', 'Enemies killed while burning explode, igniting nearby enemies.', 6),
(34, 4, 'Molten Core', 'Major', 'Burning enemies leave fire trails that damage others.', 7),
(35, 4, 'Flame On', 'Minor', 'Increases the damage multiplier against burning enemies.', 8),
(36, 4, 'Phoenix Protocol', 'Major', 'Burning enemies have a chance to reignite after the burn expires.', 9),
(37, 5, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(38, 5, 'Event Horizon', 'Major', 'Increases the pull radius of the black hole.', 2),
(39, 5, 'Singularity', 'Minor', 'Increases the duration of the black hole.', 3),
(40, 5, 'Gravity Well', 'Minor', 'Increases the pull strength of the black hole.', 4),
(41, 5, 'Dark Matter', 'Minor', 'Increases the frequency of black hole spawns.', 5),
(42, 5, 'Void Collapse', 'Major', 'Black holes deal damage over time to trapped enemies.', 6),
(43, 5, 'Dimensional Rift', 'Major', 'Black holes last longer and pull in more enemies before collapsing.', 7),
(44, 5, 'Warp Speed', 'Minor', 'Enemies dropped from the air take increased fall damage.', 8),
(45, 5, 'Supermassive', 'Major', 'Black holes have a chance to spawn a second smaller black hole nearby.', 9),
(46, 6, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 1),
(47, 6, 'Hive Mind', 'Major', 'Turned enemies are more aggressive and deal more damage.', 2),
(48, 6, 'Infectious', 'Minor', 'Increases the duration enemies remain as allies.', 3),
(49, 6, 'Contagion', 'Minor', 'Increases the frequency of enemy conversion.', 4),
(50, 6, 'Zombification', 'Minor', 'Turned enemies have increased health.', 5),
(51, 6, 'Outbreak', 'Major', 'When a turned enemy is killed, they have a chance to turn a nearby enemy.', 6),
(52, 6, 'Symbiosis', 'Major', 'You heal slightly when your turned allies damage enemies.', 7),
(53, 6, 'Mind Control', 'Minor', 'Turned enemies prioritize attacking stronger enemy types.', 8),
(54, 6, 'Mutation', 'Major', 'Turned enemies explode when their duration expires, dealing toxic damage.', 9);

-- --------------------------------------------------------

--
-- Table structure for table `field_upgrades_zm`
--

CREATE TABLE `field_upgrades_zm` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_level` int NOT NULL DEFAULT 0,
  `unlock_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fire_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_ammo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gun_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flow_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_upgrades_zm`
--

INSERT INTO `field_upgrades_zm` (`id`, `name`, `description`, `unlock_level`, `unlock_label`, `fire_mode`, `max_ammo`, `icon_url`, `gun_url`, `flow_url`, `sort_order`) VALUES
(1, 'Dark Flare', 'Generate an energy beam that deals lethal shadow damage and penetrates everything in its path.', 0, 'Default', 'Single-Use', '1 Charge (Base), 2 Charges (Extra Charge Minor Augment)', '/assets/field_upgrade_zm/icons/dark_flare.webp', '/assets/field_upgrade_zm/gun/dark_flare.png', '/assets/field_upgrade_zm/flow/dark_flare.webp', 1),
(2, 'Energy Mine', 'Create a mine of pure energy that detonates 3 times, dealing lethal damage.', 0, 'Default', 'Single-Use', '1 Charge (Base), 2 Charges (Extra Charge Minor Augment)', '/assets/field_upgrade_zm/icons/energy_mine.webp', '/assets/field_upgrade_zm/gun/energy_mine.png', '/assets/field_upgrade_zm/flow/energy_mine.webp', 2),
(3, 'Frenzied Guard', 'Repair armor to full and force all enemies in the area to temporarily target you. Armor takes all damage and repairs your armor.', 8, 'Level 8', 'Single-Use', '1 Charge', '/assets/field_upgrade_zm/icons/frenzied_guard.webp', '/assets/field_upgrade_zm/gun/frenzied_guard.png', '/assets/field_upgrade_zm/flow/frenzied_guard.webp', 3),
(4, 'Healing Aura', 'Heal all nearby players immediately by summoning beams of energy to revive and restore full health.', 17, 'Level 17', 'Single-Use', '1 Charge', '/assets/field_upgrade_zm/icons/healing_aura.webp', '/assets/field_upgrade_zm/gun/healing_aura.png', '/assets/field_upgrade_zm/flow/healing_aura.webp', 4),
(5, 'Toxic Growth', 'Summon deadly thorns; enemies moving through are slowed and take Toxic damage.', 29, 'Level 29', 'Single-Use', '1 Charge (Base), 2 Charges (Extra Charge Minor Augment)', '/assets/field_upgrade_zm/icons/toxic_growth.webp', '/assets/field_upgrade_zm/gun/toxic_growth.png', '/assets/field_upgrade_zm/flow/toxic_growth.webp', 5),
(6, 'Aether Shroud', 'Phase into the Dark Aether and become hidden from enemy detection.', 48, 'Level 48', 'Single-Use', '1 Charge (Base), 2 Charges (Extra Charge Minor Augment)', '/assets/field_upgrade_zm/icons/aether_shroud.webp', '/assets/field_upgrade_zm/gun/aether_shroud.png', '/assets/field_upgrade_zm/flow/aether_shroud.webp', 6);

-- --------------------------------------------------------

--
-- Table structure for table `field_upgrade_zm_augments`
--

CREATE TABLE `field_upgrade_zm_augments` (
  `id` int NOT NULL,
  `field_upgrade_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Major','Minor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_upgrade_zm_augments`
--

INSERT INTO `field_upgrade_zm_augments` (`id`, `field_upgrade_id`, `name`, `type`, `effect`, `sort_order`) VALUES
(1, 1, 'Extension', 'Major', 'Significantly increase Dark Flare duration.', 1),
(2, 1, 'Supernova', 'Major', 'Beam replaced with a damaging sphere that detonates at end.', 2),
(3, 1, 'Dark Pact', 'Major', 'Beam heals and revives allies; faster revive speed.', 3),
(4, 1, 'Muzzle Blast', 'Major', 'Beam deals additional cone damage in front of you.', 4),
(5, 1, 'Broad Beam', 'Minor', 'Increase beam size.', 5),
(6, 1, 'Heavy Gloom', 'Minor', 'Beam slows enemies.', 6),
(7, 1, 'Extra Charge', 'Minor', 'Increase maximum charges by one.', 7),
(8, 1, 'Dusk Flame', 'Minor', 'Beam applies Shadow damage over time.', 8),
(9, 1, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9),
(10, 2, 'Scatter', 'Major', 'Mine splits into three mines after first detonation.', 1),
(11, 2, 'Turret', 'Major', 'Mine becomes a turret firing at enemies.', 2),
(12, 2, 'Carousel', 'Major', 'Three mines orbit you and detonate near enemies.', 3),
(13, 2, 'Smart Mine', 'Major', 'More detonations, waits for multiple enemies per blast.', 4),
(14, 2, 'Frequency Boost', 'Minor', 'Increase detonation count and duration.', 5),
(15, 2, 'Extra Charge', 'Minor', 'Increase maximum charges by one.', 6),
(16, 2, 'Siren', 'Minor', 'Mine attracts nearby Normal Enemies.', 7),
(17, 2, 'Recycle', 'Minor', 'Recycle mine for Field Upgrade charge.', 8),
(18, 2, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9),
(19, 3, 'Phalanx', 'Major', 'Allies near you also repair armor from kills.', 1),
(20, 3, 'Retribution', 'Major', 'Explosion on activation; melee attackers damaged and knocked.', 2),
(21, 3, 'Frenzy Fire', 'Major', 'Use ammo from stock.', 3),
(22, 3, 'Fists of Frenzy', 'Major', 'While Frenzied, fists annihilate enemies.', 4),
(23, 3, 'Repair Boost', 'Minor', 'Repair more armor per kill.', 5),
(24, 3, 'Extension', 'Minor', 'Increase Frenzied Guard duration.', 6),
(25, 3, 'Rally', 'Minor', 'Activation repairs nearby allies\' armor.', 7),
(26, 3, 'Dual Layer', 'Minor', 'Armor durability increased while active.', 8),
(27, 3, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9),
(28, 4, 'Resilience', 'Major', 'Reduce regen delay; increase healing rate.', 1),
(29, 4, 'Enduring Radiance', 'Major', 'Healing beams persist briefly after leaving area.', 2),
(30, 4, 'Persistence', 'Major', 'Revived players keep perks on bleed-out bar.', 3),
(31, 4, 'Necromancer', 'Major', 'Can revive dead allies.', 4),
(32, 4, 'Inner Strength', 'Minor', 'Affected player damage increased.', 5),
(33, 4, 'Protection', 'Minor', 'Healing players take less damage.', 6),
(34, 4, 'Stoic Presence', 'Minor', 'Stuns elites/specials; knocks normal enemies.', 7),
(35, 4, 'Cornucopia', 'Minor', 'Players gain temporary health overcharge.', 8),
(36, 4, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9),
(37, 5, 'Urticant', 'Major', 'Wider area; enemies stay slowed after leaving.', 1),
(38, 5, 'Cordyception', 'Major', 'First enemy becomes charmed and attacks others.', 2),
(39, 5, 'Pollination', 'Major', 'Killed enemies explode with Toxic damage.', 3),
(40, 5, 'Zoochory', 'Major', 'First enemy becomes the Toxic Growth.', 4),
(41, 5, 'Ankle Shredder', 'Minor', 'Enemies slowed more.', 5),
(42, 5, 'Green Thumb', 'Minor', 'Increase Toxic Growth health.', 6),
(43, 5, 'Extra Charge', 'Minor', 'Increase maximum charges by one.', 7),
(44, 5, 'Plant Food', 'Minor', 'Chance to drop healing fruit on kill.', 8),
(45, 5, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9),
(46, 6, 'Group Shroud', 'Major', 'Nearby players are cloaked too.', 1),
(47, 6, 'Burst Dash', 'Major', 'Warp forward killing Normal Enemies.', 2),
(48, 6, 'Void Sheath', 'Major', 'Dark Aether melee; kills extend duration.', 3),
(49, 6, 'Afterimage', 'Major', 'Creates a Dark Aether clone that distracts enemies.', 4),
(50, 6, 'Instant Reload', 'Minor', 'Instant reload current weapon.', 5),
(51, 6, 'Extra Charge', 'Minor', 'Increase maximum charges by one.', 6),
(52, 6, 'Extension', 'Minor', 'Duration significantly increased.', 7),
(53, 6, 'Impulse', 'Minor', 'Deal Shadow damage & gain movement speed.', 8),
(54, 6, 'Extra Slot', 'Minor', 'Equip a second minor augment.', 9);

-- --------------------------------------------------------

--
-- Table structure for table `power_ups`
--

CREATE TABLE `power_ups` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect_type` enum('Instant','Duration') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `power_ups`
--

INSERT INTO `power_ups` (`id`, `name`, `description`, `effect_type`, `duration`, `icon_url`, `sort_order`) VALUES
(1, 'Insta-Kill', 'Normal enemies die in a single hit. Stronger enemies take heavy bonus damage. Field Upgrades do not recharge from these kills. Lasts 30 seconds.', 'Duration', '30 seconds', '/assets/power_ups/instant_kill.webp', 1),
(2, 'Double Points', 'All Essence earned is doubled for a short duration. Lasts 30 seconds.', 'Duration', '30 seconds', '/assets/power_ups/double_point.webp', 2),
(3, 'Max Ammo', 'Fully replenishes ammo and equipment for all carried weapons. Instant effect.', 'Instant', 'Instant effect', '/assets/power_ups/max_ammo.webp', 3),
(4, 'Nuke', 'Eliminates all normal enemies on the map. Stronger enemies survive but still take damage. Spawning is briefly halted. Instant effect.', 'Instant', 'Instant effect', '/assets/power_ups/nuke.webp', 4),
(5, 'Fire Sale', 'All Mystery Box spots activate and cost drops to 10 Essence. Trap cost also reduced. Only appears after the first box move. Lasts 30 seconds.', 'Duration', '30 seconds', '/assets/power_ups/fire_sale.webp', 5),
(6, 'Bonus Points', 'Grants every player a burst of free Essence. Instant effect.', 'Instant', 'Instant effect', '/assets/power_ups/bonus_point.webp', 6),
(7, 'Full Power', 'Instantly restores all players\' Field Upgrades, making them ready to use.', 'Instant', 'Instant effect', '/assets/power_ups/full_power.webp', 7),
(8, 'Max Armor', 'Repairs armor fully up to the highest tier the player has unlocked. Instant effect.', 'Instant', 'Instant effect', '/assets/power_ups/max_armor.webp', 8),
(9, 'Random Perk', 'Awards a random Perk the player does not already have. Instant effect.', 'Instant', 'Instant effect', '/assets/power_ups/random_perk.webp', 9);

-- --------------------------------------------------------

--
-- Table structure for table `gobblegums`
--

CREATE TABLE `gobblegums` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rarity` enum('Rare','Epic','Legendary','Ultra','Whimsical') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `essence_value` int NOT NULL,
  `pattern` enum('Instant','Timed','Conditional') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zombies_effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doa4_effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gum_type` enum('New','Returning') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recyclable` tinyint(1) NOT NULL DEFAULT 1,
  `synergy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gobblegums`
--

-- Gobblegums INSERT statements
INSERT INTO `gobblegums` (`id`, `name`, `rarity`, `color`, `essence_value`, `pattern`, `activation_type`, `zombies_effect`, `doa4_effect`, `duration`, `short_description`, `gum_type`, `icon_url`, `recyclable`, `synergy`, `tags`, `sort_order`) VALUES
(1, 'Aftertaste', 'Rare', 'Blue', 500, 'Conditional', 'On Revive', 'Keep all your Perks after being revived.', 'On your next death, you retain your shields and chickens.', NULL, 'Retain all perks after revive.', 'New', '/assets/gobblegums/after_taste.webp', 1, 'Perkaholic', 'perk_protection,revive,survival,late_round,safety,objective_support', 1),
(2, 'Kill Joy', 'Rare', 'Blue', 500, 'Instant', 'On Use', 'Spawns an Insta-Kill Power-Up.', 'Activates Insta-Kill for 60 seconds. Bosses are unaffected.', NULL, 'Creates an Insta-Kill power-up instantly.', 'Returning', '/assets/gobblegums/kill_joy.webp', 1, 'Who''s Keeping Score?', 'insta_kill,powerup,offensive,revive_support,objective_push,essence_gain', 2),
(3, 'Cache Back', 'Rare', 'Blue', 500, 'Instant', 'On Use', 'Spawns a Max Ammo Power-Up.', 'Grants a max-level Ray Gun with unlimited ammo for 15 seconds.', NULL, 'Spawns a Max Ammo immediately.', 'Returning', '/assets/gobblegums/cache_back.webp', 1, NULL, 'max_ammo,powerup,ammo_sustain,team_support,resource_management', 3),
(4, 'Temporal Gift', 'Rare', 'Blue', 500, 'Conditional', 'On Next Time-Based Power-Up', 'The next time-based Power-Up you activate lasts longer.', 'The next Power-Up lasts twice as long and can stack with Fate of Fortune.', NULL, 'Extends the duration of your next timed Power-Up.', 'Returning', '/assets/gobblegums/temporal_gift.webp', 1, 'Fate of Fortune', 'powerup_extension,conditional,utility,solo_support,team_buff', 4),
(5, 'Stock Option', 'Rare', 'Blue', 500, 'Timed', 'On Use', 'For 60 seconds, ammo is taken directly from your stockpile instead of your weapon’s magazine.', 'Grants an Ammo pickup that increases your weapon level and prevents ammo drain for 15 seconds.', '60 seconds', 'Ammo pulls from reserve instead of the magazine.', 'Returning', '/assets/gobblegums/stock_option.webp', 1, 'Arsenal Accelerator, Insta-Kill', 'timed,ammo,fire_rate,aggressive_play,lmg_synergy,panic_button', 5),
(6, 'Anywhere But Here', 'Rare', 'Blue', 500, 'Instant', 'On Use', 'Instantly teleports you to a random location and releases a concussive blast that repels nearby zombies.', 'Grants a chicken companion for five minutes. Can be activated once every ten minutes.', NULL, 'Instantly teleport and blast away nearby zombies.', 'Returning', '/assets/gobblegums/anywhere_but_here.webp', 1, NULL, 'escape,panic_button,teleport,mobility,survival,regroup', 6),
(7, 'Power Keg', 'Rare', 'Blue', 500, 'Instant', 'On Use', 'Spawns a Full Power Power-Up, instantly restoring your Field Upgrade.', 'For 60 seconds, beneficial concussive waves periodically erupt at your location.', NULL, 'Spawns Full Power for instant Field Upgrade charge.', 'Returning', '/assets/gobblegums/power_keg.webp', 1, 'Arsenal Accelerator', 'field_upgrade,instant,powerup,team_support,revive_support,crowd_control,utility', 7),
(8, 'Tactical Diffusion', 'Rare', 'Blue', 500, 'Conditional', 'On Nuke Power-Up', 'The next Nuke Power-Up you activate does not explode and instead grants all players 2000 Essence.', 'For the next 90 seconds, each Nuke used (up to three) grants $2,000 for the Slayer Mart.', NULL, 'Disables the next Nuke and converts it into bonus Essence.', 'Returning', '/assets/gobblegums/tactical_diffusion.webp', 1, 'Double Points', 'essence_gain,conditional,nuke_conversion,economy,early_game_boost,team_support', 8),
(9, 'Arsenal Accelerator', 'Rare', 'Blue', 500, 'Timed', 'On Use', 'For 5 minutes, your Field Upgrade charges significantly faster.', 'Deploys three Energy Mines within 30 seconds.', '5 minutes', 'Speeds up Field Upgrade charge rate.', 'Returning', '/assets/gobblegums/arsenal_accelerator.webp', 1, 'Power Keg', 'field_upgrade,charge_rate,timed,team_support,solo_support,utility,objective_play', 9),
(10, 'Shields Up', 'Rare', 'Blue', 500, 'Timed', 'On Use', 'Refills your armor and doubles its strength for 3 minutes.', 'Grants a Barrel & Sawblade item lasting five minutes or until replaced or death.', '3 minutes', 'Refills armor and doubles its durability.', 'Returning', '/assets/gobblegums/shields_up.webp', 1, 'Nowhere But There!', 'armor,tank,timed,survivability,solo_support,revive_support,escape_tool', 10),
(11, 'Requipment', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 5 minutes, your Equipment slots automatically refill over time.', 'Grants a random combination of four Nukes and Boosts.', '5 minutes', 'Your equipment slowly refills over time.', 'New', '/assets/gobblegums/requipment.webp', 1, 'Vulture Aid', 'equipment_reload,utility,timed,resource_efficiency,solo_support,directed_mode_support', 11),
(12, 'Power Vacuum', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 5 minutes, kills have an increased chance to drop Power-Ups.', 'For 5 minutes, enemies have a small chance to drop useful items on death.', '5 minutes', 'Increases Power-Up drops from kills.', 'New', '/assets/gobblegums/power_vacuum.webp', 1, 'Power-Up based GobbleGums', 'powerup_farm,timed,resource_gain,team_support,round_management,loot_increase', 12),
(13, 'Respin Cycle', 'Epic', 'Purple', 1250, 'Instant', 'On Use', 'Re-spins the Mystery Box weapon to one of equal or higher rarity after it settles.', 'Awards either a helicopter or tank vehicle item.', NULL, 'Re-rolls settled Mystery Box weapon to same or higher rarity.', 'Returning', '/assets/gobblegums/respin_cycle.webp', 1, 'Crate Power, Wonderbar!', 'mystery_box,weapon_upgrade,instant,luck,early_game,essence_saving', 13),
(14, 'Dead Drop', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 5 minutes, Salvage and Equipment drop rates are greatly increased.', 'For 5 minutes, weapon drops occur roughly five times more often.', '5 minutes', 'Boosts Salvage, Equipment, and drop frequency.', 'Returning', '/assets/gobblegums/dead_drop.webp', 1, 'Vulture Aid (Picky Eater Augment)', 'salvage_farm,loot_increase,timed,resource_gain,equipment_spam,prep_tool', 14),
(15, 'Who''s Keeping Score?', 'Epic', 'Purple', 1250, 'Instant', 'On Use', 'Spawns a Double Points Power-Up.', 'For 5 minutes, treasure spawns at roughly five times the normal rate.', NULL, 'Instantly summons Double Points.', 'Returning', '/assets/gobblegums/whos_keeping_score.webp', 1, 'Kill Joy, Tactical Diffusion', 'double_points,essence_farm,powerup,early_game_boost,instant,resource_gain', 15),
(16, 'Free Fire', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 60 seconds, firing weapons consumes no ammo. Does not affect Wonder Weapons or Underbarrel Launchers.', 'For 60 seconds, firing weapons does not consume ammo.', '60 seconds', 'Shoot freely for 60 seconds with no ammo cost.', 'Returning', '/assets/gobblegums/free_fire.webp', 1, 'High-capacity weapons, Pack-a-Punch', 'ammo_free,damage_boost,timed,horde_clear,panic_button,survival', 16),
(17, 'Exit Strategy', 'Epic', 'Purple', 1250, 'Instant', 'On Use', 'Immediately triggers an Exfil vote and reduces zombie spawns during Exfil.', 'For 30 minutes, chicken eggs hatch extra coins.', NULL, 'Instantly start Exfil with reduced zombie spawns.', 'Returning', '/assets/gobblegums/exit_strategy.webp', 1, 'XP farming, Daily Challenges', 'exfil,objective_skip,instant,escape,round_management,xp_gain', 17),
(18, 'Profit Sharing', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 2 minutes, a portion of the Essence you earn is shared with nearby teammates and vice versa.', 'For 30 minutes, chicken eggs hatch additional cash shared evenly across all teammates.', '2 minutes', 'Share Essence gains with teammates nearby.', 'Returning', '/assets/gobblegums/profit_sharing.webp', 1, 'Double Points, Gift Card', 'team_support,essence_share,economy,timed,coop_boost,resource_gain', 18),
(19, 'Explosive Flourish', 'Epic', 'Purple', 1250, 'Timed', 'On Use', 'For 2 minutes, reloading triggers an explosion around you that damages nearby enemies.', 'Equips the player with a max-power RPG and grants unlimited ammo for 2 minutes.', '2 minutes', 'Reloads trigger damaging explosions around you.', 'Returning', '/assets/gobblegums/explosive_flourish.webp', 1, 'Speed Cola, Elemental Pop (Electric Cherry)', 'reload_damage,area_control,timed,panic_button,horde_control,close_range_combat', 19),
(20, 'Soda Fountain', 'Epic', 'Purple', 1250, 'Conditional', 'On Next Perk Purchase', 'The next Perk you buy grants an additional random Perk you don''t already own.', 'For up to 5 minutes, item spawns occur around four times more frequently.', NULL, 'Next perk purchase gives an extra random perk.', 'Returning', '/assets/gobblegums/soda_fountain.webp', 1, 'Perkaholic', 'perk_gain,power_spike,conditional,early_game,comeback_tool,essence_saving', 20),
(21, 'Nowhere But There', 'Epic', 'Purple', 1250, 'Instant', 'On Use', 'Instantly teleport to a random downed teammate and instantly revive all nearby players.', 'All players receive minimum respawn boosts and Nukes, downed players are revived, all Field Upgrades recharge, and Fate bonuses (Feet & Shield) are honored.', NULL, 'Teleport to a downed teammate and revive nearby allies.', 'Returning', '/assets/gobblegums/nowhere_but_there.webp', 1, 'Shields Up, Quick Revive', 'revive,team_support,instant,teleport,clutch_save,high_risk', 21),
(22, 'Round Off', 'Legendary', 'Orange', 3000, 'Conditional', 'On Round Transition', 'Prevents rounds from advancing for two rounds after the next round transition.', 'Ends the currently active round if under round 60. Has a 30-minute cooldown.', '2 rounds', 'Stops round progression for two rounds.', 'New', '/assets/gobblegums/round_off.webp', 1, 'Quest steps, Puzzle phases', 'round_control,conditional,breathing_room,solo_support,group_planning,objective_focus', 22),
(23, 'Armor Gettin’', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Instantly grants a three-plate Armor Vest and full plates.', 'Grants a one-plate Armor Vest with full plates, or if already equipped, awards a full refill of plates.', NULL, 'Instant full armor with a three-plate vest.', 'New', '/assets/gobblegums/armor_gettin.webp', 1, 'Shields Up, Jugger-Nog', 'armor,instant,tank,survival,starter_loadout,solo_friendly', 23),
(24, 'Idle Eyes', 'Legendary', 'Orange', 3000, 'Timed', 'On Use', 'For 30 seconds, all zombies ignore players and stand idle.', 'All zombies ignore players and stand idle for 30 seconds.', '30 seconds', 'Zombies ignore all players for 30 seconds.', 'Returning', '/assets/gobblegums/idle_eyes.webp', 1, 'Quick Revive, Round Off', 'crowd_control,timed,panic_button,revive_tool,objective_focus,solo_friendly', 24),
(25, 'Wall Power', 'Legendary', 'Orange', 3000, 'Conditional', 'On Next Wall Buy', 'The next weapon purchased from a wall is automatically Pack-A-Punched.', 'For one round, electric poles do not damage the player.', NULL, 'Next Wall Buy weapon comes Pack-A-Punched.', 'Returning', '/assets/gobblegums/wall_power.webp', 1, 'Cache Back', 'weapon_upgrade,conditional,early_power_spike,ammo_efficient,wallbuy_synergy,pp_support', 25),
(26, 'Flavor Hex', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Awards a random Ultra GobbleGum.', 'Awards a random Ultra GobbleGum.', NULL, 'Grants a random Ultra GobbleGum.', 'Returning', '/assets/gobblegums/flavor_hex.webp', 1, 'Ultra GobbleGums', 'random,instant,high_risk,high_reward,power_spike,luck_based', 26),
(27, 'Immolation Liquidation', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Spawns a Fire Sale Power-Up.', 'For 5 minutes, Holy Brimstone rains down onto enemies.', NULL, 'Summons a Fire Sale instantly.', 'Returning', '/assets/gobblegums/immolation_liquidation.webp', 1, 'Who''s Keeping Score?', 'fire_sale,instant,box_farming,weapon_hunting,team_coordination,early_game_power', 27),
(28, 'Support Group', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Grants ARC-XD, then Mangler Cannon, then Sentry Gun, then Disciple Injection in sequence.', 'For 5 minutes, only Cymbal Monkeys spawn as items during arena gameplay. Other item types are unaffected.', NULL, 'Grants a sequence of powerful Support items: ARC-XD → Mangler Cannon → Sentry Gun → Disciple Injection.', 'Returning', '/assets/gobblegums/support_group.webp', 1, 'Power Keg, Arsenal Accelerator', 'support_items,boss_damage,instant,power_spike,quest_tool,burst_dps', 28),
(29, 'Phoenix Up', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Instantly revives all teammates and allows them to keep all their Perks.', 'Grants yourself and all teammates one extra life.', NULL, 'Revives all teammates instantly, preserving their Perks.', 'Returning', '/assets/gobblegums/phoenix_up.webp', 1, 'Quick Revive, Nowhere But There', 'revive,team_support,instant,perk_protection,clutch_save,full_team_recovery', 29),
(30, 'Modified Chaos', 'Legendary', 'Orange', 3000, 'Timed', 'On Use', 'Greatly reduces all Ammo Mod cooldowns for 1 minute.', 'Greatly reduces all Ammo Mod cooldowns for 1 minute.', '1 minute', 'Greatly reduces all Ammo Mod cooldowns for 1 minute.', 'Returning', '/assets/gobblegums/modified_chaos.webp', 1, 'Elemental Pop (Chill Berry Augment), Ammo Mods', 'ammo_mods,damage_boost,timed,elemental_synergy,boss_fights,horde_control', 30),
(31, 'On the House', 'Legendary', 'Orange', 3000, 'Instant', 'On Use', 'Spawns a random Perk Power-Up that grants a free Perk to all players.', 'Purchasing from the Slayer Mart grants one extra random item of any value.', NULL, 'Spawns a free random Perk for the whole team.', 'Returning', '/assets/gobblegums/on_the_house.webp', 1, 'Soda Fountain, Perkaholic', 'perk_gain,team_buff,instant,free_perk,essence_saving,mid_game_power', 31),
(32, 'Wall to Wall Clearance', 'Legendary', 'Orange', 3000, 'Timed', 'On Use', 'For 30 seconds, all Wall Buy weapons cost only 10 Essence.', 'For 2 minutes, a free Nuke deploys on your position every 10 seconds.', '30 seconds', 'Wall Buys cost only 10 Essence for 30 seconds.', 'Returning', '/assets/gobblegums/wall_to_wall_clearance.webp', 1, 'Wall Power, Who’s Keeping Score?', 'economy,wallbuy_discount,team_saving,timed,early_game_power,resource_efficiency', 32),
(33, 'Crate Power', 'Legendary', 'Orange', 3000, 'Conditional', 'On Next Mystery Box Spin', 'The next weapon taken from the Mystery Box is automatically Pack-A-Punched.', 'On your next death, you do not lose your gems.', NULL, 'Next Mystery Box pull becomes Pack-A-Punched.', 'Returning', '/assets/gobblegums/crate_power.webp', 1, 'Immolation Liquidation, Time Out', 'mystery_box,weapon_upgrade,conditional,early_game_power,fire_sale_synergy,pap_boost', 33),
(34, 'Gift Card', 'Ultra', 'Red', 5000, 'Instant', 'On Use', 'Instantly grants 30,000 Essence. Cannot be combined with other bonuses.', 'Grants $30,000 to spend in the Slayer Mart.', NULL, 'Instantly gain 30,000 Essence.', 'New', '/assets/gobblegums/gift_card.webp', 1, 'Hidden Power', 'economy,instant,ultra,essence_boost,comeback,high_value', 34),
(35, 'Perkaholic', 'Ultra', 'Red', 5000, 'Instant', 'On Use', 'Grants the player every available Perk instantly.', 'Awards a random Field Upgrade, a random Ammo Mod, a Level 1 Armor Vest, and a 30-minute Chicken.', NULL, 'Instantly receive all available Perks.', 'Returning', '/assets/gobblegums/perkaholic.webp', 1, 'Hidden Power, Shields Up', 'perk_full_loadout,instant,ultra,comeback,early_power,synergy_boost', 35),
(36, 'Wonderbar!', 'Ultra', 'Red', 5000, 'Conditional', 'On Next Mystery Box Spin', 'The next weapon taken from the Mystery Box is guaranteed to be a Wonder Weapon.', 'For 30 minutes, at the start of each round, flip a coin to either become a Mutant or receive a Chicken.', NULL, 'Next Mystery Box pull becomes a Wonder Weapon.', 'Returning', '/assets/gobblegums/wonderbar.webp', 1, 'Crate Power, Respin Cycle, Immolation Liquidation', 'wonder_weapon,conditional,ultra,mystery_box,boss_fight_ready,quest_synergy,fire_sale_combo', 36),
(37, 'Time Out', 'Ultra', 'Red', 5000, 'Timed', 'On Activation', 'For 3 minutes, all Normal and Special enemies are cleared, the round ends, and no new enemies spawn during the duration.', 'For 30 minutes, within 30 seconds of each new Arena round, a free Nuke Bomb drops at your position.', '3 Minutes', 'Clears enemies and stops spawning for 3 minutes.', 'Returning', '/assets/gobblegums/time_out.webp', 1, 'Crate Power, Hidden Power, Perk purchases, Der Wunderfizz routing', 'ultra,timed,round_control,safe_window,revives,shopping_phase,der_wunderfizz', 37),
(38, 'Near Death Experience', 'Ultra', 'Red', 5000, 'Timed', 'On Activation', 'For 3 minutes or up to 5 revives, players can revive or be revived instantly by standing near each other. Revived players retain all their Perks.', 'For each Nuke dropped in the next 10 seconds, gain an extra life.', '3 Minutes (or 5 Revives)', 'Instant proximity revives that preserve all Perks.', 'Returning', '/assets/gobblegums/near_death_experience.webp', 1, 'Phoenix Up, Shields Up, Revive-focused builds, High round boss fights', 'ultra,timed,revives,perk_protection,team_support,high_round,boss_fight', 38),
(39, 'Reign Drops', 'Ultra', 'Red', 5000, 'Instant', 'On Activation', 'Spawns all core Power-Ups at once, including Insta-Kill, Max Ammo, Double Points, Full Armor, Random Perk, Fire Sale, Full Power, Bonus Points, and Nuke.', 'At the next Slayer Mart store, all items have a random discount between 20% and 50%.', NULL, 'Instantly spawns every major Power-Up at once.', 'Returning', '/assets/gobblegums/reign_drops.webp', 1, 'Main Quest steps, early-game setup, Fire Sale chains, survival emergencies', 'ultra,instant,powerups,team_support,setup,main_quest,panic_button', 39),
(40, 'Hidden Power', 'Ultra', 'Red', 5000, 'Instant', 'On Activation', 'Instantly upgrades your currently held weapon to Legendary rarity.', 'For 10 minutes, every weapon picked up has maximum power.', NULL, 'Instantly upgrades your current weapon to Legendary quality.', 'Returning', '/assets/gobblegums/hidden_power.webp', 1, 'Wall Power, Perkaholic, early-game snowball, main quest prep', 'ultra,instant,weapon_upgrade,legendary,early_power_spike,loadout_synergy', 40),
(41, 'Newtonian Negation', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies killed will float upward instead of falling normally.', 'Same humorous effect applies.', NULL, 'Zombies float upward when killed.', 'Returning', '/assets/gobblegums/newtonian_negation.webp', 1, NULL, 'whimsical,fun,cosmetic,timed,visual_effect', 41),
(42, 'Indiegestion', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies release exaggerated flatulence effects when killed.', 'Same humorous visual gag effect applies.', NULL, 'Zombies emit goofy flatulence effects when killed.', 'Returning', '/assets/gobblegums/indiegestion.webp', 1, NULL, 'whimsical,fun,cosmetic,humor,timed', 42),
(43, 'Rainburps', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies belch sparkly rainbow bubbles upon death.', 'Same humorous rainbow bubble effect applies.', NULL, 'Zombies release rainbow bubble bursts when killed.', 'Returning', '/assets/gobblegums/rainburps.webp', 1, NULL, 'whimsical,cosmetic,fun,visual_effect,timed', 43),
(44, 'Quacknarok', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies wear rubber ducky inner tubes, adding a humorous visual twist.', 'Same comedic appearance effect applies.', NULL, 'Zombies appear wearing rubber ducky float tubes.', 'Returning', '/assets/gobblegums/quacknarok.webp', 1, NULL, 'whimsical,fun,visual_effect,cosmetic,timed,duck_theme', 44),
(45, 'Die Pitched', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies emit high-pitched comedic voices as they approach and attack.', 'Same humorous high-pitch voice effect applies.', NULL, 'Zombies speak and scream in high-pitched voices.', 'Returning', '/assets/gobblegums/die_pitched.webp', 1, NULL, 'whimsical,fun,audio_effect,cosmetic,timed,high_pitch', 45),
(46, 'Holiday Cheer', 'Whimsical', 'Rainbow', 100, 'Timed', 'On Activation', 'Zombies appear with festive decorations, adding a fun holiday-themed visual flair.', 'Same festive cosmetic effect applies.', NULL, 'Gives zombies goofy holiday-themed decorations.', 'Returning', '/assets/gobblegums/holiday_cheer.webp', 1, NULL, 'whimsical,holiday,cosmetic,fun,visual_effect,timed', 46);

-- --------------------------------------------------------

--
-- Table structure for table `gobblegum_tips`
--

CREATE TABLE `gobblegum_tips` (
  `id` int NOT NULL,
  `gobblegum_id` int NOT NULL,
  `tip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gobblegum_tips`
--

-- Gobblegum Tips INSERT statements
INSERT INTO `gobblegum_tips` (`id`, `gobblegum_id`, `tip`, `sort_order`) VALUES
(1, 1, 'Provides perk insurance when combined with Perkaholic.', 1),
(2, 1, 'Great safety net for high rounds when one down can ruin the run.', 2),
(3, 1, 'Useful during puzzles or Easter Egg steps where a down can cost progress.', 3),
(4, 2, 'Combo with Double Points or Who''s Keeping Score? to generate large Essence bursts.', 1),
(5, 2, 'Perfect emergency tool to secure revives when your team is overwhelmed.', 2),
(6, 2, 'Use before difficult objectives to gain a temporary offensive advantage.', 3),
(7, 3, 'Coordinate with your team to avoid wasting a Max Ammo when one may already be active.', 1),
(8, 3, 'Use strategically instead of spending Essence at Ammo Caches, especially on expensive Pack-a-Punch weapons.', 2),
(9, 3, 'Ideal for camo grinding or challenges on weapons with small ammo reserves.', 3),
(10, 4, 'Use just before picking up a strong timed Power-Up like Insta-Kill for maximum benefit.', 1),
(11, 4, 'Extend Fire Sale duration to give your team more time to roll the Mystery Box.', 2),
(12, 4, 'A great solo boost since extended Power-Ups greatly improve survival windows.', 3),
(13, 5, 'Great with LMGs or ARs with large reserve ammo for nonstop firing.', 1),
(14, 5, 'Use when trapped in tight spaces to shoot continuously without reloading.', 2),
(15, 5, 'Prevent reload downtime during powerful buffs like Arsenal Accelerator or Insta-Kill.', 3),
(16, 6, 'Use when you''re isolated from your squad to quickly reposition and rejoin the team.', 1),
(17, 6, 'Escape overwhelming hordes and secure breathing room thanks to the concussive blast on arrival.', 2),
(18, 6, 'A free mobility tool when you''re far from fast travel or don’t want to spend Essence.', 3),
(19, 7, 'Combine with Arsenal Accelerator to rapidly chain multiple Field Upgrades.', 1),
(20, 7, 'Use during tense moments to quickly access supportive Field Upgrades for revives.', 2),
(21, 7, 'Grants near-instant access to tools like Frost Blast or Energy Mine for strong area control.', 3),
(22, 8, 'Use before picking up a Nuke to avoid losing potential Essence and gain guaranteed income instead.', 1),
(23, 8, 'Combine with Double Points to maximize the bonus Essence payout.', 2),
(24, 8, 'Great to use early in a match to accelerate your weapon and perk upgrades.', 3),
(25, 9, 'Use immediately after deploying a Field Upgrade to start recharging it faster.', 1),
(26, 9, 'Excellent for solo runs where your Field Upgrade acts as your lifeline.', 2),
(27, 9, 'During Directed mode or Easter Egg steps, keep your Field Upgrade charged for quick problem solving.', 3),
(28, 10, 'Use during desperate retreats to survive heavy damage while escaping large hordes.', 1),
(29, 10, 'Pair with Nowhere But There! to safely survive the chaos when teleporting into a downed teammate''s location.', 2),
(30, 10, 'Excellent for solo players who rely on strong armor to avoid consuming Self-Revives.', 3),
(31, 11, 'Lets you stay stocked on equipment without taking chip damage from looting.', 1),
(32, 11, 'Save Salvage by letting Requipment refill basic items automatically.', 2),
(33, 11, 'Great for Decoy-heavy strategies in Directed mode or story-focused objectives.', 3),
(34, 12, 'Use when low on Power-Up focused GobbleGums like Kill Joy or Cache Back to restock naturally.', 1),
(35, 12, 'Great for helping teammates survive since anyone can pick up the extra Power-Ups you spawn.', 2),
(36, 12, 'Activate shortly after a round begins to maximize the five-minute window.', 3),
(37, 13, 'Combine with Crate Power and Wonderbar! to secure higher-tier or Wonder Weapons reliably.', 1),
(38, 13, 'The Mystery Box re-closes and re-spins before settling, so be patient.', 2),
(39, 13, 'Use in early rounds or when low on Essence to avoid wasting points on bad box rolls.', 3),
(40, 14, 'Activate a round before difficult objectives to farm Salvage for Ammo Mods and Support items.', 1),
(41, 14, 'With increased Equipment drops, use grenades and tacticals freely without worrying about running out.', 2),
(42, 14, 'Pairs well with the Picky Eater Vulture Aid augment for even more Equipment drops.', 3),
(43, 15, 'Activate when a large horde is present to maximize Double Points value.', 1),
(44, 15, 'Use early in the match to quickly open doors, buy perks, and upgrade weapons.', 2),
(45, 15, 'Pop before Pack-a-Punching if you''re short on Essence to secure the upgrade sooner.', 3),
(46, 16, 'Use when swarmed to mow down large groups and regain control.', 1),
(47, 16, 'Pairs extremely well with Pack-a-Punched high fire rate weapons for huge damage output.', 2),
(48, 16, 'Activate when you''re low on ammo to fight your way toward an Ammo Cache safely.', 3),
(49, 17, 'Use when rounds get too chaotic and you want a safe Exfil for bonus XP.', 1),
(50, 17, 'Great fallback when you reach the Exfil area but miss the prompt due to a round transition.', 2),
(51, 17, 'Trigger Exfil to complete Daily Challenges without advancing the Main Quest path.', 3),
(52, 18, 'Activate while grouped tightly with your full squad to maximize shared Essence gains.', 1),
(53, 18, 'Great for helping the entire team reach Pack-A-Punch or expensive wall weapon unlocks.', 2),
(54, 18, 'Stay with the group until the effect ends—splitting early wastes potential shared income.', 3),
(55, 19, 'Use when being closed in by a horde—each reload creates a shockwave that clears space.', 1),
(56, 19, 'Pairs extremely well with Speed Cola to trigger more explosive reloads in shorter intervals.', 2),
(57, 19, 'Stack with Elemental Pop’s Electric Cherry augment to deal both explosive and electric damage on reload.', 3),
(58, 20, 'Buy easily accessible Perks first so the bonus Perk is guaranteed to be something rare or harder to obtain.', 1),
(59, 20, 'A great recovery tool after losing all Perks—helps rebuild your loadout quickly.', 2),
(60, 20, 'Use when you''re slightly underpowered to get an unexpected power boost from a bonus Perk.', 3),
(61, 21, 'Best used when multiple teammates are down together—teleport in and revive them instantly.', 1),
(62, 21, 'Reload before activating since you will teleport straight into danger.', 2),
(63, 21, 'Avoid teleporting to lone downed players far from the team—it can split the group and make the situation worse.', 3),
(64, 22, 'Use when you need uninterrupted breathing room to reset, heal, or re-equip—especially in solo runs.', 1),
(65, 22, 'Activate to give your whole squad time to regroup, plan, and prepare for upcoming objectives.', 2),
(66, 22, 'Ideal for long Easter Egg attempts when you need quiet time to solve steps or organize items.', 3),
(67, 23, 'Use at the start of a match to get a three-plate vest immediately and save Essence on early armor purchases.', 1),
(68, 23, 'Great for solo runs—jump straight into tank mode without needing upgrades or crafting.', 2),
(69, 23, 'Provides a major survivability spike in DOA4 where armor plates massively improve durability.', 3),
(70, 24, 'Use during Main Quest steps that require uninterrupted interaction, especially in solo runs.', 1),
(71, 24, 'Great for emergency revives—zombies freeze long enough to bring the whole squad back safely.', 2),
(72, 24, 'Communicate before activating in squads so everyone can maximize the 30-second window.', 3),
(73, 25, 'Activate just before buying the specific Wall Buy weapon you intend to use long-term.', 1),
(74, 25, 'Choose Wall Buys positioned in high-traffic or choke-point areas to benefit from constant nearby ammo.', 2),
(75, 25, 'Pair with Cache Back for a guaranteed Max Ammo to support your powered-up Wall Buy.', 3),
(76, 26, 'Use when you need a burst of power—any Ultra GobbleGum can swing a tough situation in your favor.', 1),
(77, 26, 'Remember that you must pop the awarded Ultra GobbleGum after using Flavor Hex to activate its effect.', 2),
(78, 26, 'Activate during a calm moment to plan the best use of the Ultra GobbleGum you receive.', 3),
(79, 27, 'Activate and rush the nearest Mystery Box—Fire Sale time is short, so maximize every second.', 1),
(80, 27, 'Have teammates spread across different Mystery Boxes to avoid waiting and increase total spins.', 2),
(81, 27, 'Plan ahead by positioning your team at multiple boxes before using the GobbleGum.', 3),
(82, 28, 'Use the ARC-XD first to unlock the Mangler Cannon, then the Sentry Gun, and finally the Disciple Injection—plan the order for maximum impact.', 1),
(83, 28, 'Save Support Group for boss encounters or Main Quest steps where its sequence of Support items can deal huge burst damage.', 2),
(84, 28, 'Create space before activating—each Support item takes a few seconds to prep, and popping it while surrounded is risky.', 3),
(85, 29, 'Use when multiple teammates are down—Phoenix Up revives everyone instantly and preserves their full Perk setup.', 1),
(86, 29, 'Communicate before activating so teammates don''t waste other revives or GobbleGums unnecessarily.', 2),
(87, 29, 'No range limit—teammates are revived no matter where they are on the map, perfect for chaotic split-up moments.', 3),
(88, 30, 'Equip Ammo Mods before using Modified Chaos—its cooldown reduction only matters when an Ammo Mod is active.', 1),
(89, 30, 'Combine with Elemental Pop and its Chill Berry Minor Augment for even faster Ammo Mod procs.', 2),
(90, 30, 'Use during intense fights or boss encounters when frequent elemental procs can swing the battle.', 3),
(91, 31, 'Grab your essential Perks first so the bonus Perk has a higher chance of being a rare one.', 1),
(92, 31, 'Whoever picks up the spawned Perk Power-Up, the entire squad gets the Perk—use it to rally team strength.', 2),
(93, 31, 'Activate between rounds to avoid losing the free Perk by getting downed immediately after.', 3),
(94, 32, 'Use early in a match to save massive amounts of Essence on Wall Buy weapons for the entire squad.', 1),
(95, 32, 'Give teammates a heads-up before activating so everyone can reach their preferred Wall Buy in time.', 2),
(96, 32, 'Stack with Wall Power for an extremely cheap Pack-A-Punched Wall Buy immediately.', 3),
(97, 33, 'Use during a Fire Sale to maximize your odds of getting the perfect weapon before it becomes Pack-A-Punched.', 1),
(98, 33, 'Combine with Time Out to safely browse Mystery Box rolls without zombies interrupting you.', 2),
(99, 33, 'Best used early game before Pack-A-Punch becomes accessible, saving Essence for other upgrades.', 3),
(100, 34, 'Use early with Hidden Power to reach a Legendary Pack-A-Punch setup far sooner than normal.', 1),
(101, 34, 'Perfect comeback tool after being revived with no resources—instantly rebuild your entire loadout.', 2),
(102, 34, 'Use to recover from expensive purchases or misallocations and quickly stabilize your economy.', 3),
(103, 35, 'Use early to save massive amounts of Essence and unlock your full perk setup immediately.', 1),
(104, 35, 'Combine with Hidden Power for a guaranteed Legendary weapon after fully perk-stacking your Operator.', 2),
(105, 35, 'A perfect recovery tool—pop it after a late-game down to instantly regain your entire perk loadout.', 3),
(106, 36, 'Use before Main Quest steps that require specific Wonder Weapons so you’re guaranteed to get one from the box.', 1),
(107, 36, 'Grab the Wonder Weapon and drop it for a teammate if they''re struggling—strong squad > strong solo.', 2),
(108, 36, 'Combine with Crate Power for a guaranteed Pack-A-Punched Wonder Weapon; activate during a Fire Sale for maximum value.', 3),
(109, 37, 'Activate when things get chaotic to reset the area, revive teammates, and reorganize the squad safely.', 1),
(110, 37, 'Use at the end of a round to guarantee three minutes without enemy spawns or mid-round threats.', 2),
(111, 37, 'Use the downtime to hit Der Wunderfizz, purchase Perks, or combo with Hidden Power + Crate Power for fast setup.', 3),
(112, 38, 'Use during chaotic moments like horde rushes or boss fights to revive multiple teammates instantly without losing control.', 1),
(113, 38, 'If you go down, teammates can instantly revive you while preserving all your Perks—great for endgame survival.', 2),
(114, 38, 'Activate before entering a dangerous fight; popping it too late risks losing the ability before it helps.', 3),
(115, 39, 'Use during overwhelming situations to instantly get every core Power-Up and stabilize the fight.', 1),
(116, 39, 'Using it early in a run creates a massive advantage with Fire Sale, Bonus Points, and a Perk Power-Up all at once.', 2),
(117, 39, 'Pop it during Main Quest steps where teammates are occupied with objectives to compensate for the reduced firepower.', 3),
(118, 40, 'Equip the weapon you want upgraded in your loadout so you can transform it into a Legendary gun immediately.', 1),
(119, 40, 'Use early in the match to breeze through low rounds while saving Salvage for Ammo Mods and Crafting Table upgrades.', 2),
(120, 40, 'Combine with Wall Power for an instant Pack-A-Punched Legendary weapon, and add Perkaholic for a huge early-game power spike.', 3),
(121, 41, 'Use when you want a silly, lighthearted match—this Gum alters visuals but not gameplay.', 1),
(122, 41, 'Great for casual maps or chill sessions where you want some comic relief.', 2),
(123, 42, 'Use for a humorous match—adds silly sound and visual effects without changing gameplay.', 1),
(124, 42, 'Great for casual runs or when you want to lighten the mood with some goofy zombie deaths.', 2),
(125, 43, 'Use when you want a colorful and silly visual effect while slaying zombies.', 1),
(126, 43, 'Perfect for casual or relaxed matches where you just want fun visual flair.', 2),
(127, 44, 'Use when you want comedic relief—the zombies look ridiculous with floaty duck tubes.', 1),
(128, 44, 'Perfect for fun runs or when streaming for entertainment value.', 2),
(129, 45, 'Adds lighthearted comedy by giving zombies squeaky, high-pitched voices.', 1),
(130, 45, 'Great for relaxed sessions or streams where you want funny audio moments.', 2),
(131, 46, 'Use during casual matches to bring goofy festive decorations to the zombie horde.', 1),
(132, 46, 'Great for holiday-themed sessions or anytime you want cheerful visual fun.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `camo`
--

CREATE TABLE `camo` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('military','special','mastery','prestige1','prestige2','prestigem','prestigem1','prestigem2','prestigem3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` enum('campaign','multiplayer','zombie','prestige') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `camo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `camo`
--

INSERT INTO `camo` (`id`, `name`, `display_name`, `category`, `mode`, `camo_url`, `sort_order`) VALUES
(1, 'foliage', 'Foliage', 'military', 'campaign', '/assets/camo/foliage.webp', 1),
(2, 'desert', 'Desert', 'military', 'campaign', '/assets/camo/desert.webp', 2),
(3, 'city_digital', 'City Digital', 'military', 'campaign', '/assets/camo/city_digital.webp', 3),
(4, 'pine', 'Pine', 'military', 'campaign', '/assets/camo/pine.webp', 4),
(5, 'forest', 'Forest', 'military', 'campaign', '/assets/camo/forest.webp', 5),
(6, 'sludge', 'Sludge', 'military', 'campaign', '/assets/camo/sludge.webp', 6),
(7, 'plateau', 'Plateau', 'military', 'campaign', '/assets/camo/plateau.webp', 7),
(8, 'nocturne', 'Nocturne', 'military', 'campaign', '/assets/camo/nocturne.webp', 8),
(9, 'topaz_snake', 'Topaz Snake', 'military', 'campaign', '/assets/camo/topaz_snake.webp', 9),
(10, 'cinder', 'Cinder', 'special', 'campaign', '/assets/camo/cinder.webp', 10),
(11, 'caiman', 'Caiman', 'special', 'campaign', '/assets/camo/caiman.webp', 11),
(12, 'network', 'Network', 'special', 'campaign', '/assets/camo/network.webp', 12),
(13, 'molten_gold', 'Molten Gold', 'mastery', 'campaign', '/assets/camo/molten_gold.webp', 13),
(14, 'moonstone', 'Moonstone', 'mastery', 'campaign', '/assets/camo/moonstone.webp', 14),
(15, 'chroma_flux', 'Chroma Flux', 'mastery', 'campaign', '/assets/camo/chroma_flux.webp', 15),
(16, 'genesis', 'Genesis', 'mastery', 'campaign', '/assets/camo/genesis.webp', 16),
(17, 'underbrush', 'Underbrush', 'military', 'multiplayer', '/assets/camo/underbrush.webp', 17),
(18, 'woodland', 'Woodland', 'military', 'multiplayer', '/assets/camo/woodland.webp', 18),
(19, 'slate_digital', 'Slate Digital', 'military', 'multiplayer', '/assets/camo/slate_digital.webp', 19),
(20, 'redwood', 'Redwood', 'military', 'multiplayer', '/assets/camo/redwood.webp', 20),
(21, 'poison', 'Poison', 'military', 'multiplayer', '/assets/camo/poison.webp', 21),
(22, 'toxic', 'Toxic', 'military', 'multiplayer', '/assets/camo/toxic.webp', 22),
(23, 'mountain', 'Mountain', 'military', 'multiplayer', '/assets/camo/mountain.webp', 23),
(24, 'stalker', 'Stalker', 'military', 'multiplayer', '/assets/camo/stalker.webp', 24),
(25, 'ruby_snake', 'Ruby Snake', 'military', 'multiplayer', '/assets/camo/ruby_snake.webp', 25),
(26, 'diamondback', 'Diamondback', 'special', 'multiplayer', '/assets/camo/diamondback.webp', 26),
(27, 'raptor', 'Raptor', 'special', 'multiplayer', '/assets/camo/raptor.webp', 27),
(28, 'mainframe', 'Mainframe', 'special', 'multiplayer', '/assets/camo/mainframe.webp', 28),
(29, 'shattered_gold', 'Shattered Gold', 'mastery', 'multiplayer', '/assets/camo/shattered_gold.webp', 29),
(30, 'arclight', 'Arclight', 'mastery', 'multiplayer', '/assets/camo/arclight.webp', 30),
(31, 'tempest', 'Tempest', 'mastery', 'multiplayer', '/assets/camo/tempest.webp', 31),
(32, 'singularity', 'Singularity', 'mastery', 'multiplayer', '/assets/camo/singularity.webp', 32),
(33, 'char', 'Char', 'military', 'zombie', '/assets/camo/char.webp', 33),
(34, 'tundra', 'Tundra', 'military', 'zombie', '/assets/camo/tundra.webp', 34),
(35, 'flood_digital', 'Flood Digital', 'military', 'zombie', '/assets/camo/flood_digital.webp', 35),
(36, 'cedar', 'Cedar', 'military', 'zombie', '/assets/camo/cedar.webp', 36),
(37, 'marshland', 'Marshland', 'military', 'zombie', '/assets/camo/marshland.webp', 37),
(38, 'mire', 'Mire', 'military', 'zombie', '/assets/camo/mire.webp', 38),
(39, 'ravine', 'Ravine', 'military', 'zombie', '/assets/camo/ravine.webp', 39),
(40, 'skulk', 'Skulk', 'military', 'zombie', '/assets/camo/skulk.webp', 40),
(41, 'emerald_snake', 'Emerald Snake', 'military', 'zombie', '/assets/camo/emerald_snake.webp', 41),
(42, 'mutilate', 'Mutilate', 'special', 'zombie', '/assets/camo/mutilate.webp', 42),
(43, 'slither', 'Slither', 'special', 'zombie', '/assets/camo/slither.webp', 43),
(44, 'pathfinder', 'Pathfinder', 'special', 'zombie', '/assets/camo/pathfinder.webp', 44),
(45, 'golden_dragon', 'Golden Dragon', 'mastery', 'zombie', '/assets/camo/golden_dragon.webp', 45),
(46, 'bloodstone', 'Bloodstone', 'mastery', 'zombie', '/assets/camo/bloodstone.webp', 46),
(47, 'doomsteel', 'Doomsteel', 'mastery', 'zombie', '/assets/camo/doomsteel.webp', 47),
(48, 'infestation', 'Infestation', 'mastery', 'zombie', '/assets/camo/infestation.webp', 48),
(49, 'graffiti', 'Graffiti', 'prestige1', 'prestige', '/assets/camo/graffiti.webp', 49),
(50, 'aces', 'Aces', 'prestige2', 'prestige', '/assets/camo/aces.webp', 50),
(51, 'cobalt_circuit', 'Cobalt Circuit', 'prestigem1', 'prestige', '/assets/camo/cobalt_circuit.webp', 51),
(52, 'vermilion_cypher', 'Vermilion Cypher', 'prestigem2', 'prestige', '/assets/camo/vermilion_cypher.webp', 52),
(53, 'violet_network', 'Violet Network', 'prestigem3', 'prestige', '/assets/camo/violet_network.webp', 53),
(54, 'obscured', 'Obscured', 'prestigem', 'prestige', '/assets/camo/obscured.webp', 54),
(55, 'skull', 'Skull', 'prestige1', 'prestige', '/assets/camo/skull.webp', 55),
(56, 'dia_de_muertos', 'Dia De Muertos', 'prestige2', 'prestige', '/assets/camo/dia_de_muertos.webp', 56),
(57, 'afterlife', 'Afterlife', 'prestigem', 'prestige', '/assets/camo/afterlife.webp', 57),
(58, 'prowler', 'Prowler', 'prestige1', 'prestige', '/assets/camo/prowler.webp', 58),
(59, 'ocean', 'Ocean', 'prestige2', 'prestige', '/assets/camo/ocean.webp', 59),
(60, 'cyborg', 'Cyborg', 'prestigem', 'prestige', '/assets/camo/cyborg.webp', 60),
(61, 'strands', 'Strands', 'prestige1', 'prestige', '/assets/camo/strands.webp', 61),
(62, 'murder', 'Murder', 'prestige2', 'prestige', '/assets/camo/murder.webp', 62),
(63, 'hellfire', 'Hellfire', 'prestigem', 'prestige', '/assets/camo/hellfire.webp', 63),
(64, 'fracture', 'Fracture', 'prestige1', 'prestige', '/assets/camo/fracture.webp', 64),
(65, 'nocturnal', 'Nocturnal', 'prestige2', 'prestige', '/assets/camo/nocturnal.webp', 65),
(66, 'oni', 'Oni', 'prestigem', 'prestige', '/assets/camo/oni.webp', 66),
(67, 'carbon_fiber', 'Carbon Fiber', 'prestige1', 'prestige', '/assets/camo/carbon_fibre.webp', 67),
(68, 'shackled', 'Shackled', 'prestige2', 'prestige', '/assets/camo/shackled.webp', 68),
(69, 'lotus', 'Lotus', 'prestigem', 'prestige', '/assets/camo/lotus.webp', 69),
(70, 'aqua', 'Aqua', 'prestige1', 'prestige', '/assets/camo/aqua.webp', 70),
(71, 'azalea', 'Azalea', 'prestige2', 'prestige', '/assets/camo/azalea.webp', 71),
(72, 'tagged', 'Tagged', 'prestigem', 'prestige', '/assets/camo/tagged.webp', 72),
(73, 'kawaii', 'Kawaii', 'prestige1', 'prestige', '/assets/camo/kawaii.webp', 73),
(74, 'concrete', 'Concrete', 'prestige2', 'prestige', '/assets/camo/concrete.webp', 74),
(75, 'sealed', 'Sealed', 'prestigem', 'prestige', '/assets/camo/sealed.webp', 75),
(76, 'leopard', 'Leopard', 'prestige1', 'prestige', '/assets/camo/leopard.webp', 76),
(77, 'scorch', 'Scorch', 'prestige2', 'prestige', '/assets/camo/scorch.webp', 77),
(78, 'heatwave', 'Heatwave', 'prestigem', 'prestige', '/assets/camo/heatwave.webp', 78),
(79, 'paladin', 'Paladin', 'prestige1', 'prestige', '/assets/camo/paladin.webp', 79),
(80, 'wavelength', 'Wavelength', 'prestige2', 'prestige', '/assets/camo/wavelength.webp', 80),
(81, 'shrouded', 'Shrouded', 'prestigem', 'prestige', '/assets/camo/shrouded.webp', 81),
(82, 'comics', 'Comics', 'prestige1', 'prestige', '/assets/camo/comics.webp', 82),
(83, 'plum', 'Plum', 'prestige2', 'prestige', '/assets/camo/plum.webp', 83),
(84, 'bacon', 'Bacon', 'prestigem', 'prestige', '/assets/camo/bacon.webp', 84),
(85, 'billow', 'Billow', 'prestige1', 'prestige', '/assets/camo/billow.webp', 85),
(86, 'neon_zebra', 'Neon Zebra', 'prestige2', 'prestige', '/assets/camo/neon_zebra.webp', 86),
(87, 'spotted', 'Spotted', 'prestigem', 'prestige', '/assets/camo/spotted.webp', 87),
(88, 'trade_tools', 'Trade Tools', 'prestige1', 'prestige', '/assets/camo/trade_tools.webp', 88),
(89, 'sunset_zebra', 'Sunset Zebra', 'prestige2', 'prestige', '/assets/camo/sunset_zebra.webp', 89),
(90, 'overdrive', 'Overdrive', 'prestigem', 'prestige', '/assets/camo/overdrive.webp', 90),
(91, 'zombie', 'Zombie', 'prestige1', 'prestige', '/assets/camo/zombie.webp', 91),
(92, 'pack_a_punch', 'Pack-A-Punch', 'prestige2', 'prestige', '/assets/camo/pack_a_punch.webp', 92),
(93, 'weaponized_115', 'Weaponized 115', 'prestigem', 'prestige', '/assets/camo/weaponized_115.webp', 93),
(94, 'fissure', 'Fissure', 'prestige1', 'prestige', '/assets/camo/fissure.webp', 94),
(95, 'slither_prestige', 'Slither Prestige', 'prestige2', 'prestige', '/assets/camo/slither_prestige.webp', 95),
(96, 'hexed', 'Hexed', 'prestigem', 'prestige', '/assets/camo/hexed.webp', 96),
(97, 'invertebrate', 'Invertebrate', 'prestige1', 'prestige', '/assets/camo/invertebrate.webp', 97),
(98, 'mitosis', 'Mitosis', 'prestige2', 'prestige', '/assets/camo/mitosis.webp', 98),
(99, 'luna', 'Luna', 'prestigem', 'prestige', '/assets/camo/luna.webp', 99),
(100, 'voltaic', 'Voltaic', 'prestige1', 'prestige', '/assets/camo/voltaic.webp', 100),
(101, 'fated', 'Fated', 'prestige2', 'prestige', '/assets/camo/fated.webp', 101),
(102, 'lacerate', 'Lacerate', 'prestigem', 'prestige', '/assets/camo/lacerate.webp', 102),
(103, 'cherry_blossom', 'Cherry Blossom', 'prestige1', 'prestige', '/assets/camo/cherry_blossom.webp', 103),
(104, 'clay', 'Clay', 'prestige2', 'prestige', '/assets/camo/clay.webp', 104),
(105, 'dragon', 'Dragon', 'prestigem', 'prestige', '/assets/camo/dragon.webp', 105),
(106, 'psychedelic', 'Psychedelic', 'prestige1', 'prestige', '/assets/camo/psychedelic.webp', 106),
(107, 'uranium', 'Uranium', 'prestige2', 'prestige', '/assets/camo/uranium.webp', 107),
(108, 'marbled', 'Marbled', 'prestigem', 'prestige', '/assets/camo/marbled.webp', 108),
(109, 'shattered', 'Shattered', 'prestige1', 'prestige', '/assets/camo/shattered.webp', 109),
(110, 'cohesion', 'Cohesion', 'prestige2', 'prestige', '/assets/camo/cohesion.webp', 110),
(111, 'koi_pond', 'Koi Pond', 'prestigem', 'prestige', '/assets/camo/koi_pond.webp', 111),
(112, 'arachnid', 'Arachnid', 'prestige1', 'prestige', '/assets/camo/arachnid.webp', 112),
(113, 'sulphur', 'Sulphur', 'prestige2', 'prestige', '/assets/camo/sulphur.webp', 113),
(114, 'nightlight', 'Nightlight', 'prestigem', 'prestige', '/assets/camo/nightlight.webp', 114),
(115, 'burner', 'Burner', 'prestige1', 'prestige', '/assets/camo/burner.webp', 115),
(116, 'serenity', 'Serenity', 'prestige2', 'prestige', '/assets/camo/serenity.webp', 116),
(117, 'snake_eyes', 'Snake Eyes', 'prestigem', 'prestige', '/assets/camo/snake_eyes.webp', 117),
(118, 'ronin', 'Ronin', 'prestige1', 'prestige', '/assets/camo/ronin.webp', 118),
(119, 'jasper', 'Jasper', 'prestige2', 'prestige', '/assets/camo/jasper.webp', 119),
(120, 'aced', 'Aced', 'prestigem', 'prestige', '/assets/camo/aced.webp', 120),
(121, 'art_of_war', 'Art of War', 'prestige1', 'prestige', '/assets/camo/art_of_war.webp', 121),
(122, 'moss', 'Moss', 'prestige2', 'prestige', '/assets/camo/moss.webp', 122),
(123, 'benjamins', 'Benjamins', 'prestigem', 'prestige', '/assets/camo/benjamins.webp', 123),
(124, 'plasma', 'Plasma', 'prestige1', 'prestige', '/assets/camo/plasma.webp', 124),
(125, 'onyx', 'Onyx', 'prestige2', 'prestige', '/assets/camo/onyx.webp', 125),
(126, 'moonlit', 'Moonlit', 'prestigem', 'prestige', '/assets/camo/moonlit.webp', 126),
(127, 'equinox', 'Equinox', 'prestige1', 'prestige', '/assets/camo/equinox.webp', 127),
(128, 'asphalt', 'Asphalt', 'prestige2', 'prestige', '/assets/camo/asphalt.webp', 128),
(129, 'birdie', 'Birdie', 'prestigem', 'prestige', '/assets/camo/birdie.webp', 129),
(130, 'haze', 'Haze', 'prestige1', 'prestige', '/assets/camo/haze.webp', 130),
(131, 'blend', 'Blend', 'prestige2', 'prestige', '/assets/camo/blend.webp', 131),
(132, 'dimensions', 'Dimensions', 'prestigem', 'prestige', '/assets/camo/dimensions.webp', 132),
(133, 'vivid', 'Vivid', 'prestige1', 'prestige', '/assets/camo/vivid.webp', 133),
(134, 'tangerine', 'Tangerine', 'prestige2', 'prestige', '/assets/camo/tangerine.webp', 134),
(135, 'igneous', 'Igneous', 'prestigem', 'prestige', '/assets/camo/igneous.webp', 135),
(136, 'glyph', 'Glyph', 'prestige1', 'prestige', '/assets/camo/glyph.webp', 136),
(137, 'runoff', 'Runoff', 'prestige2', 'prestige', '/assets/camo/runoff.webp', 137),
(138, 'qwerty', 'QWERTY', 'prestigem', 'prestige', '/assets/camo/qwerty.webp', 138);

-- --------------------------------------------------------

--
-- Table structure for table `classic_prestige`
--

CREATE TABLE `classic_prestige` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlock_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classic_prestige`
--

INSERT INTO `classic_prestige` (`id`, `title`, `unlock_by`, `icon`) VALUES
(1, 'Prestige 1', 'Reach Level 55', '/assets/classic_prestige/prestige1.webp'),
(2, 'Prestige 2', 'Reach Level 55 while in Prestige 1', '/assets/classic_prestige/prestige2.webp'),
(3, 'Prestige 3', 'Reach Level 55 while in Prestige 2', '/assets/classic_prestige/prestige3.webp'),
(4, 'Prestige 4', 'Reach Level 55 while in Prestige 3', '/assets/classic_prestige/prestige4.webp'),
(5, 'Prestige 5', 'Reach Level 55 while in Prestige 4', '/assets/classic_prestige/prestige5.webp'),
(6, 'Prestige 6', 'Reach Level 55 while in Prestige 5', '/assets/classic_prestige/prestige6.webp'),
(7, 'Prestige 7', 'Reach Level 55 while in Prestige 6', '/assets/classic_prestige/prestige7.webp'),
(8, 'Prestige 8', 'Reach Level 55 while in Prestige 7', '/assets/classic_prestige/prestige8.webp'),
(9, 'Prestige 9', 'Reach Level 55 while in Prestige 8', '/assets/classic_prestige/prestige9.webp'),
(10, 'Prestige 10', 'Reach Level 55 while in Prestige 9', '/assets/classic_prestige/prestige10.webp'),
(11, 'Prestige Master', 'Reach Prestige 10 and continue leveling to Level 1000', '/assets/classic_prestige/prestigeMaster.webp');

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teams` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_map` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounds` JSON DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `display_name`, `base_image_url`, `cover_image_url`, `teams`, `modes`, `campaign_map`, `location`, `bounds`, `type`) VALUES
(1, 'blackheart', 'Blackheart', '/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp', '/assets/maps/blackheart/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'Containment', 'NA', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(2, 'cortex', 'Cortex', '/assets/maps/cortex/Cortex_Tac_Map_BLANK.webp', '/assets/maps/cortex/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Mediterranean Sea', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(3, 'exposure', 'Exposure', '/assets/maps/exposure/Exposure_Tac_Map_BLANK.webp', '/assets/maps/exposure/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Outback, Australia', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(4, 'colossus', 'Colossus', '/assets/maps/colossus/Colossus_Tac_Map_BLANK.webp', '/assets/maps/colossus/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Colossus Resort, Cayman Islands, United Kingdom', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(5, 'den', 'Den', '/assets/maps/den/Den_Tac_Map_BLANK.webp', '/assets/maps/den/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'The Guild Compound, Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(6, 'express', 'Express', '/assets/maps/express/Express_Tac_Map_BLANK.webp', '/assets/maps/express/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Tokyo, Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(7, 'flagship', 'Flagship', '/assets/maps/flagship/Flagship_Tac_Map_BLANK.webp', '/assets/maps/flagship/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'NA', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(8, 'hijacked', 'Hijacked', '/assets/maps/hijacked/Hijacked_Tac_Map_BLANK.webp', '/assets/maps/hijacked/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'Disruption', 'Tokyo, Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(9, 'homestead', 'Homestead', '/assets/maps/homestead/Homestead_Tac_Map_BLANK.webp', '/assets/maps/homestead/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Alaska, United States of America', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(10, 'imprint', 'Imprint', '/assets/maps/imprint/Imprint_Tac_Map_BLANK.webp', '/assets/maps/imprint/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Alaska, United States of America', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(11, 'paranoia', 'Paranoia', '/assets/maps/paranoia/Paranoia_Tac_Map_BLANK.webp', '/assets/maps/paranoia/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'NA', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(12, 'raid', 'Raid', '/assets/maps/raid/Raid_Tac_Map_BLANK.webp', '/assets/maps/raid/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Tokyo, Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(13, 'retrieval', 'Retrieval', '/assets/maps/retrieval/Retrieval_Tac_Map_BLANK.webp', '/assets/maps/retrieval/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Alaska, United States of America', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(14, 'scar', 'Scar', '/assets/maps/scar/Scar_Tac_Map_BLANK.webp', '/assets/maps/scar/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Silverbrook, Alaska, United States of America', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(15, 'the_forge', 'The Forge', '/assets/maps/the_forge/The_Forge_Tac_Map_BLANK.webp', '/assets/maps/the_forge/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'Disruption', 'Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(16, 'toshin', 'Toshin', '/assets/maps/toshin/Toshin_Tac_Map_BLANK.webp', '/assets/maps/toshin/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'NA', 'Japan', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}', 'core'),
(17, 'vandorn_farm', 'Ashes of the Damned', '/assets/maps/vandorn_farm/tiles/{z}/{x}/{y}.png', '/assets/maps/vandorn_farm/cover.webp', 'Zombies', 'Zombies', NULL, 'NA', '{\"southwest\": [0, 0], \"northeast\": [8192, 8192]}', 'zombie_big');

-- --------------------------------------------------------

--
-- Table structure for table `map_layers`
--

CREATE TABLE `map_layers` (
  `id` int NOT NULL,
  `map_id` int NOT NULL,
  `layer_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layer_type` enum('overlay','base') DEFAULT 'overlay',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_visible` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_layers`
--

INSERT INTO `map_layers` (`id`, `map_id`, `layer_key`, `layer_name`, `layer_type`, `image_url`, `default_visible`) VALUES
(1, 1, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/blackheart/Blackheart_Tac_Map_DOM.webp', 0),
(2, 1, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp', 0),
(3, 2, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_DOM.webp', 0),
(4, 2, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/cortex/Cortex_Tac_Map_HP.webp', 0),
(5, 3, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/exposure/Exposure_Tac_Map_DOM.webp', 0),
(6, 3, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/exposure/Exposure_Tac_Map_HP.webp', 0),
(7, 4, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/colossus/Colossus_Tac_Map_DOM.webp', 0),
(8, 4, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/colossus/Colossus_Tac_Map_HP.webp', 0),
(9, 5, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/den/Den_Tac_Map_DOM.webp', 0),
(10, 5, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/den/Den_Tac_Map_HP.webp', 0),
(11, 6, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/express/Express_Tac_Map_DOM.webp', 0),
(12, 6, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/express/Express_Tac_Map_HP.webp', 0),
(13, 7, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/flagship/Flagship_Tac_Map_DOM.webp', 0),
(14, 7, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/flagship/Flagship_Tac_Map_HP.webp', 0),
(15, 8, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/hijacked/Hijacked_Tac_Map_DOM.webp', 0),
(16, 8, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/hijacked/Hijacked_Tac_Map_HP.webp', 0),
(17, 9, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/homestead/Homestead_Tac_Map_DOM.webp', 0),
(18, 9, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/homestead/Homestead_Tac_Map_HP.webp', 0),
(19, 10, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/imprint/Imprint_Tac_Map_DOM.webp', 0),
(20, 10, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/imprint/Imprint_Tac_Map_HP.webp', 0),
(21, 11, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/paranoia/Paranoia_Tac_Map_DOM.webp', 0),
(22, 11, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/paranoia/Paranoia_Tac_Map_HP.webp', 0),
(23, 12, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/raid/Raid_Tac_Map_DOM.webp', 0),
(24, 12, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/raid/Raid_Tac_Map_HP.webp', 0),
(25, 13, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/retrieval/Retrieval_Tac_Map_DOM.webp', 0),
(26, 13, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/retrieval/Retrieval_Tac_Map_HP.webp', 0),
(27, 14, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/scar/Scar_Tac_Map_DOM.webp', 0),
(28, 14, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/scar/Scar_Tac_Map_HP.webp', 0),
(29, 15, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/the_forge/Forge_Tac_Map_DOM.webp', 0),
(30, 15, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/the_forge/Forge_Tac_Map_HP.webp', 0),
(31, 16, 'domination_zone', 'Domination Zone', 'overlay', '/assets/maps/toshin/Toshin_Tac_Map_DOM.webp', 0),
(32, 16, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/toshin/Toshin_Tac_Map_HP.webp', 0);

-- --------------------------------------------------------

--
-- Table structure for table `map_tiles`
--

CREATE TABLE `map_tiles` (
  `id` int NOT NULL,
  `map_id` int NOT NULL,
  `zoom_level` int NOT NULL,
  `tile_x` int NOT NULL,
  `tile_y` int NOT NULL,
  `tile_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_tiles`
--

INSERT INTO `map_tiles` (`id`, `map_id`, `zoom_level`, `tile_x`, `tile_y`, `tile_url`) VALUES
(1, 17, 1, 0, 0, '/assets/maps/vandorn_farm/tiles/1/0/0.png'),
(2, 17, 1, 0, 1, '/assets/maps/vandorn_farm/tiles/1/0/1.png'),
(3, 17, 1, 1, 0, '/assets/maps/vandorn_farm/tiles/1/1/0.png'),
(4, 17, 1, 1, 1, '/assets/maps/vandorn_farm/tiles/1/1/1.png'),
(5, 17, 2, 0, 0, '/assets/maps/vandorn_farm/tiles/2/0/0.png'),
(6, 17, 2, 0, 1, '/assets/maps/vandorn_farm/tiles/2/0/1.png'),
(7, 17, 2, 0, 2, '/assets/maps/vandorn_farm/tiles/2/0/2.png'),
(8, 17, 2, 0, 3, '/assets/maps/vandorn_farm/tiles/2/0/3.png'),
(9, 17, 2, 1, 0, '/assets/maps/vandorn_farm/tiles/2/1/0.png'),
(10, 17, 2, 1, 1, '/assets/maps/vandorn_farm/tiles/2/1/1.png'),
(11, 17, 2, 1, 2, '/assets/maps/vandorn_farm/tiles/2/1/2.png'),
(12, 17, 2, 1, 3, '/assets/maps/vandorn_farm/tiles/2/1/3.png'),
(13, 17, 2, 2, 0, '/assets/maps/vandorn_farm/tiles/2/2/0.png'),
(14, 17, 2, 2, 1, '/assets/maps/vandorn_farm/tiles/2/2/1.png'),
(15, 17, 2, 2, 2, '/assets/maps/vandorn_farm/tiles/2/2/2.png'),
(16, 17, 2, 2, 3, '/assets/maps/vandorn_farm/tiles/2/2/3.png'),
(17, 17, 2, 3, 0, '/assets/maps/vandorn_farm/tiles/2/3/0.png'),
(18, 17, 2, 3, 1, '/assets/maps/vandorn_farm/tiles/2/3/1.png'),
(19, 17, 2, 3, 2, '/assets/maps/vandorn_farm/tiles/2/3/2.png'),
(20, 17, 2, 3, 3, '/assets/maps/vandorn_farm/tiles/2/3/3.png'),
(21, 17, 3, 0, 0, '/assets/maps/vandorn_farm/tiles/3/0/0.png'),
(22, 17, 3, 0, 1, '/assets/maps/vandorn_farm/tiles/3/0/1.png'),
(23, 17, 3, 0, 2, '/assets/maps/vandorn_farm/tiles/3/0/2.png'),
(24, 17, 3, 0, 3, '/assets/maps/vandorn_farm/tiles/3/0/3.png'),
(25, 17, 3, 0, 4, '/assets/maps/vandorn_farm/tiles/3/0/4.png'),
(26, 17, 3, 0, 5, '/assets/maps/vandorn_farm/tiles/3/0/5.png'),
(27, 17, 3, 0, 6, '/assets/maps/vandorn_farm/tiles/3/0/6.png'),
(28, 17, 3, 0, 7, '/assets/maps/vandorn_farm/tiles/3/0/7.png'),
(29, 17, 3, 1, 0, '/assets/maps/vandorn_farm/tiles/3/1/0.png'),
(30, 17, 3, 1, 1, '/assets/maps/vandorn_farm/tiles/3/1/1.png'),
(31, 17, 3, 1, 2, '/assets/maps/vandorn_farm/tiles/3/1/2.png'),
(32, 17, 3, 1, 3, '/assets/maps/vandorn_farm/tiles/3/1/3.png'),
(33, 17, 3, 1, 4, '/assets/maps/vandorn_farm/tiles/3/1/4.png'),
(34, 17, 3, 1, 5, '/assets/maps/vandorn_farm/tiles/3/1/5.png'),
(35, 17, 3, 1, 6, '/assets/maps/vandorn_farm/tiles/3/1/6.png'),
(36, 17, 3, 1, 7, '/assets/maps/vandorn_farm/tiles/3/1/7.png'),
(37, 17, 3, 2, 0, '/assets/maps/vandorn_farm/tiles/3/2/0.png'),
(38, 17, 3, 2, 1, '/assets/maps/vandorn_farm/tiles/3/2/1.png'),
(39, 17, 3, 2, 2, '/assets/maps/vandorn_farm/tiles/3/2/2.png'),
(40, 17, 3, 2, 3, '/assets/maps/vandorn_farm/tiles/3/2/3.png'),
(41, 17, 3, 2, 4, '/assets/maps/vandorn_farm/tiles/3/2/4.png'),
(42, 17, 3, 2, 5, '/assets/maps/vandorn_farm/tiles/3/2/5.png'),
(43, 17, 3, 2, 6, '/assets/maps/vandorn_farm/tiles/3/2/6.png'),
(44, 17, 3, 2, 7, '/assets/maps/vandorn_farm/tiles/3/2/7.png'),
(45, 17, 3, 3, 0, '/assets/maps/vandorn_farm/tiles/3/3/0.png'),
(46, 17, 3, 3, 1, '/assets/maps/vandorn_farm/tiles/3/3/1.png'),
(47, 17, 3, 3, 2, '/assets/maps/vandorn_farm/tiles/3/3/2.png'),
(48, 17, 3, 3, 3, '/assets/maps/vandorn_farm/tiles/3/3/3.png'),
(49, 17, 3, 3, 4, '/assets/maps/vandorn_farm/tiles/3/3/4.png'),
(50, 17, 3, 3, 5, '/assets/maps/vandorn_farm/tiles/3/3/5.png'),
(51, 17, 3, 3, 6, '/assets/maps/vandorn_farm/tiles/3/3/6.png'),
(52, 17, 3, 3, 7, '/assets/maps/vandorn_farm/tiles/3/3/7.png'),
(53, 17, 3, 4, 0, '/assets/maps/vandorn_farm/tiles/3/4/0.png'),
(54, 17, 3, 4, 1, '/assets/maps/vandorn_farm/tiles/3/4/1.png'),
(55, 17, 3, 4, 2, '/assets/maps/vandorn_farm/tiles/3/4/2.png'),
(56, 17, 3, 4, 3, '/assets/maps/vandorn_farm/tiles/3/4/3.png'),
(57, 17, 3, 4, 4, '/assets/maps/vandorn_farm/tiles/3/4/4.png'),
(58, 17, 3, 4, 5, '/assets/maps/vandorn_farm/tiles/3/4/5.png'),
(59, 17, 3, 4, 6, '/assets/maps/vandorn_farm/tiles/3/4/6.png'),
(60, 17, 3, 4, 7, '/assets/maps/vandorn_farm/tiles/3/4/7.png'),
(61, 17, 3, 5, 0, '/assets/maps/vandorn_farm/tiles/3/5/0.png'),
(62, 17, 3, 5, 1, '/assets/maps/vandorn_farm/tiles/3/5/1.png'),
(63, 17, 3, 5, 2, '/assets/maps/vandorn_farm/tiles/3/5/2.png'),
(64, 17, 3, 5, 3, '/assets/maps/vandorn_farm/tiles/3/5/3.png'),
(65, 17, 3, 5, 4, '/assets/maps/vandorn_farm/tiles/3/5/4.png'),
(66, 17, 3, 5, 5, '/assets/maps/vandorn_farm/tiles/3/5/5.png'),
(67, 17, 3, 5, 6, '/assets/maps/vandorn_farm/tiles/3/5/6.png'),
(68, 17, 3, 5, 7, '/assets/maps/vandorn_farm/tiles/3/5/7.png'),
(69, 17, 3, 6, 0, '/assets/maps/vandorn_farm/tiles/3/6/0.png'),
(70, 17, 3, 6, 1, '/assets/maps/vandorn_farm/tiles/3/6/1.png'),
(71, 17, 3, 6, 2, '/assets/maps/vandorn_farm/tiles/3/6/2.png'),
(72, 17, 3, 6, 3, '/assets/maps/vandorn_farm/tiles/3/6/3.png'),
(73, 17, 3, 6, 4, '/assets/maps/vandorn_farm/tiles/3/6/4.png'),
(74, 17, 3, 6, 5, '/assets/maps/vandorn_farm/tiles/3/6/5.png'),
(75, 17, 3, 6, 6, '/assets/maps/vandorn_farm/tiles/3/6/6.png'),
(76, 17, 3, 6, 7, '/assets/maps/vandorn_farm/tiles/3/6/7.png'),
(77, 17, 3, 7, 0, '/assets/maps/vandorn_farm/tiles/3/7/0.png'),
(78, 17, 3, 7, 1, '/assets/maps/vandorn_farm/tiles/3/7/1.png'),
(79, 17, 3, 7, 2, '/assets/maps/vandorn_farm/tiles/3/7/2.png'),
(80, 17, 3, 7, 3, '/assets/maps/vandorn_farm/tiles/3/7/3.png'),
(81, 17, 3, 7, 4, '/assets/maps/vandorn_farm/tiles/3/7/4.png'),
(82, 17, 3, 7, 5, '/assets/maps/vandorn_farm/tiles/3/7/5.png'),
(83, 17, 3, 7, 6, '/assets/maps/vandorn_farm/tiles/3/7/6.png'),
(84, 17, 3, 7, 7, '/assets/maps/vandorn_farm/tiles/3/7/7.png'),
(85, 17, 4, 0, 0, '/assets/maps/vandorn_farm/tiles/4/0/0.png'),
(86, 17, 4, 0, 1, '/assets/maps/vandorn_farm/tiles/4/0/1.png'),
(87, 17, 4, 0, 2, '/assets/maps/vandorn_farm/tiles/4/0/2.png'),
(88, 17, 4, 0, 3, '/assets/maps/vandorn_farm/tiles/4/0/3.png'),
(89, 17, 4, 0, 4, '/assets/maps/vandorn_farm/tiles/4/0/4.png'),
(90, 17, 4, 0, 5, '/assets/maps/vandorn_farm/tiles/4/0/5.png'),
(91, 17, 4, 0, 6, '/assets/maps/vandorn_farm/tiles/4/0/6.png'),
(92, 17, 4, 0, 7, '/assets/maps/vandorn_farm/tiles/4/0/7.png'),
(93, 17, 4, 0, 8, '/assets/maps/vandorn_farm/tiles/4/0/8.png'),
(94, 17, 4, 0, 9, '/assets/maps/vandorn_farm/tiles/4/0/9.png'),
(95, 17, 4, 0, 10, '/assets/maps/vandorn_farm/tiles/4/0/10.png'),
(96, 17, 4, 0, 11, '/assets/maps/vandorn_farm/tiles/4/0/11.png'),
(97, 17, 4, 0, 12, '/assets/maps/vandorn_farm/tiles/4/0/12.png'),
(98, 17, 4, 0, 13, '/assets/maps/vandorn_farm/tiles/4/0/13.png'),
(99, 17, 4, 0, 14, '/assets/maps/vandorn_farm/tiles/4/0/14.png'),
(100, 17, 4, 0, 15, '/assets/maps/vandorn_farm/tiles/4/0/15.png'),
(101, 17, 4, 1, 0, '/assets/maps/vandorn_farm/tiles/4/1/0.png'),
(102, 17, 4, 1, 1, '/assets/maps/vandorn_farm/tiles/4/1/1.png'),
(103, 17, 4, 1, 2, '/assets/maps/vandorn_farm/tiles/4/1/2.png'),
(104, 17, 4, 1, 3, '/assets/maps/vandorn_farm/tiles/4/1/3.png'),
(105, 17, 4, 1, 4, '/assets/maps/vandorn_farm/tiles/4/1/4.png'),
(106, 17, 4, 1, 5, '/assets/maps/vandorn_farm/tiles/4/1/5.png'),
(107, 17, 4, 1, 6, '/assets/maps/vandorn_farm/tiles/4/1/6.png'),
(108, 17, 4, 1, 7, '/assets/maps/vandorn_farm/tiles/4/1/7.png'),
(109, 17, 4, 1, 8, '/assets/maps/vandorn_farm/tiles/4/1/8.png'),
(110, 17, 4, 1, 9, '/assets/maps/vandorn_farm/tiles/4/1/9.png'),
(111, 17, 4, 1, 10, '/assets/maps/vandorn_farm/tiles/4/1/10.png'),
(112, 17, 4, 1, 11, '/assets/maps/vandorn_farm/tiles/4/1/11.png'),
(113, 17, 4, 1, 12, '/assets/maps/vandorn_farm/tiles/4/1/12.png'),
(114, 17, 4, 1, 13, '/assets/maps/vandorn_farm/tiles/4/1/13.png'),
(115, 17, 4, 1, 14, '/assets/maps/vandorn_farm/tiles/4/1/14.png'),
(116, 17, 4, 1, 15, '/assets/maps/vandorn_farm/tiles/4/1/15.png'),
(117, 17, 4, 2, 0, '/assets/maps/vandorn_farm/tiles/4/2/0.png'),
(118, 17, 4, 2, 1, '/assets/maps/vandorn_farm/tiles/4/2/1.png'),
(119, 17, 4, 2, 2, '/assets/maps/vandorn_farm/tiles/4/2/2.png'),
(120, 17, 4, 2, 3, '/assets/maps/vandorn_farm/tiles/4/2/3.png'),
(121, 17, 4, 2, 4, '/assets/maps/vandorn_farm/tiles/4/2/4.png'),
(122, 17, 4, 2, 5, '/assets/maps/vandorn_farm/tiles/4/2/5.png'),
(123, 17, 4, 2, 6, '/assets/maps/vandorn_farm/tiles/4/2/6.png'),
(124, 17, 4, 2, 7, '/assets/maps/vandorn_farm/tiles/4/2/7.png'),
(125, 17, 4, 2, 8, '/assets/maps/vandorn_farm/tiles/4/2/8.png'),
(126, 17, 4, 2, 9, '/assets/maps/vandorn_farm/tiles/4/2/9.png'),
(127, 17, 4, 2, 10, '/assets/maps/vandorn_farm/tiles/4/2/10.png'),
(128, 17, 4, 2, 11, '/assets/maps/vandorn_farm/tiles/4/2/11.png'),
(129, 17, 4, 2, 12, '/assets/maps/vandorn_farm/tiles/4/2/12.png'),
(130, 17, 4, 2, 13, '/assets/maps/vandorn_farm/tiles/4/2/13.png'),
(131, 17, 4, 2, 14, '/assets/maps/vandorn_farm/tiles/4/2/14.png'),
(132, 17, 4, 2, 15, '/assets/maps/vandorn_farm/tiles/4/2/15.png'),
(133, 17, 4, 3, 0, '/assets/maps/vandorn_farm/tiles/4/3/0.png'),
(134, 17, 4, 3, 1, '/assets/maps/vandorn_farm/tiles/4/3/1.png'),
(135, 17, 4, 3, 2, '/assets/maps/vandorn_farm/tiles/4/3/2.png'),
(136, 17, 4, 3, 3, '/assets/maps/vandorn_farm/tiles/4/3/3.png'),
(137, 17, 4, 3, 4, '/assets/maps/vandorn_farm/tiles/4/3/4.png'),
(138, 17, 4, 3, 5, '/assets/maps/vandorn_farm/tiles/4/3/5.png'),
(139, 17, 4, 3, 6, '/assets/maps/vandorn_farm/tiles/4/3/6.png'),
(140, 17, 4, 3, 7, '/assets/maps/vandorn_farm/tiles/4/3/7.png'),
(141, 17, 4, 3, 8, '/assets/maps/vandorn_farm/tiles/4/3/8.png'),
(142, 17, 4, 3, 9, '/assets/maps/vandorn_farm/tiles/4/3/9.png'),
(143, 17, 4, 3, 10, '/assets/maps/vandorn_farm/tiles/4/3/10.png'),
(144, 17, 4, 3, 11, '/assets/maps/vandorn_farm/tiles/4/3/11.png'),
(145, 17, 4, 3, 12, '/assets/maps/vandorn_farm/tiles/4/3/12.png'),
(146, 17, 4, 3, 13, '/assets/maps/vandorn_farm/tiles/4/3/13.png'),
(147, 17, 4, 3, 14, '/assets/maps/vandorn_farm/tiles/4/3/14.png'),
(148, 17, 4, 3, 15, '/assets/maps/vandorn_farm/tiles/4/3/15.png'),
(149, 17, 4, 4, 0, '/assets/maps/vandorn_farm/tiles/4/4/0.png'),
(150, 17, 4, 4, 1, '/assets/maps/vandorn_farm/tiles/4/4/1.png'),
(151, 17, 4, 4, 2, '/assets/maps/vandorn_farm/tiles/4/4/2.png'),
(152, 17, 4, 4, 3, '/assets/maps/vandorn_farm/tiles/4/4/3.png'),
(153, 17, 4, 4, 4, '/assets/maps/vandorn_farm/tiles/4/4/4.png'),
(154, 17, 4, 4, 5, '/assets/maps/vandorn_farm/tiles/4/4/5.png'),
(155, 17, 4, 4, 6, '/assets/maps/vandorn_farm/tiles/4/4/6.png'),
(156, 17, 4, 4, 7, '/assets/maps/vandorn_farm/tiles/4/4/7.png'),
(157, 17, 4, 4, 8, '/assets/maps/vandorn_farm/tiles/4/4/8.png'),
(158, 17, 4, 4, 9, '/assets/maps/vandorn_farm/tiles/4/4/9.png'),
(159, 17, 4, 4, 10, '/assets/maps/vandorn_farm/tiles/4/4/10.png'),
(160, 17, 4, 4, 11, '/assets/maps/vandorn_farm/tiles/4/4/11.png'),
(161, 17, 4, 4, 12, '/assets/maps/vandorn_farm/tiles/4/4/12.png'),
(162, 17, 4, 4, 13, '/assets/maps/vandorn_farm/tiles/4/4/13.png'),
(163, 17, 4, 4, 14, '/assets/maps/vandorn_farm/tiles/4/4/14.png'),
(164, 17, 4, 4, 15, '/assets/maps/vandorn_farm/tiles/4/4/15.png'),
(165, 17, 4, 5, 0, '/assets/maps/vandorn_farm/tiles/4/5/0.png'),
(166, 17, 4, 5, 1, '/assets/maps/vandorn_farm/tiles/4/5/1.png'),
(167, 17, 4, 5, 2, '/assets/maps/vandorn_farm/tiles/4/5/2.png'),
(168, 17, 4, 5, 3, '/assets/maps/vandorn_farm/tiles/4/5/3.png'),
(169, 17, 4, 5, 4, '/assets/maps/vandorn_farm/tiles/4/5/4.png'),
(170, 17, 4, 5, 5, '/assets/maps/vandorn_farm/tiles/4/5/5.png'),
(171, 17, 4, 5, 6, '/assets/maps/vandorn_farm/tiles/4/5/6.png'),
(172, 17, 4, 5, 7, '/assets/maps/vandorn_farm/tiles/4/5/7.png'),
(173, 17, 4, 5, 8, '/assets/maps/vandorn_farm/tiles/4/5/8.png'),
(174, 17, 4, 5, 9, '/assets/maps/vandorn_farm/tiles/4/5/9.png'),
(175, 17, 4, 5, 10, '/assets/maps/vandorn_farm/tiles/4/5/10.png'),
(176, 17, 4, 5, 11, '/assets/maps/vandorn_farm/tiles/4/5/11.png'),
(177, 17, 4, 5, 12, '/assets/maps/vandorn_farm/tiles/4/5/12.png'),
(178, 17, 4, 5, 13, '/assets/maps/vandorn_farm/tiles/4/5/13.png'),
(179, 17, 4, 5, 14, '/assets/maps/vandorn_farm/tiles/4/5/14.png'),
(180, 17, 4, 5, 15, '/assets/maps/vandorn_farm/tiles/4/5/15.png'),
(181, 17, 4, 6, 0, '/assets/maps/vandorn_farm/tiles/4/6/0.png'),
(182, 17, 4, 6, 1, '/assets/maps/vandorn_farm/tiles/4/6/1.png'),
(183, 17, 4, 6, 2, '/assets/maps/vandorn_farm/tiles/4/6/2.png'),
(184, 17, 4, 6, 3, '/assets/maps/vandorn_farm/tiles/4/6/3.png'),
(185, 17, 4, 6, 4, '/assets/maps/vandorn_farm/tiles/4/6/4.png'),
(186, 17, 4, 6, 5, '/assets/maps/vandorn_farm/tiles/4/6/5.png'),
(187, 17, 4, 6, 6, '/assets/maps/vandorn_farm/tiles/4/6/6.png'),
(188, 17, 4, 6, 7, '/assets/maps/vandorn_farm/tiles/4/6/7.png'),
(189, 17, 4, 6, 8, '/assets/maps/vandorn_farm/tiles/4/6/8.png'),
(190, 17, 4, 6, 9, '/assets/maps/vandorn_farm/tiles/4/6/9.png'),
(191, 17, 4, 6, 10, '/assets/maps/vandorn_farm/tiles/4/6/10.png'),
(192, 17, 4, 6, 11, '/assets/maps/vandorn_farm/tiles/4/6/11.png'),
(193, 17, 4, 6, 12, '/assets/maps/vandorn_farm/tiles/4/6/12.png'),
(194, 17, 4, 6, 13, '/assets/maps/vandorn_farm/tiles/4/6/13.png'),
(195, 17, 4, 6, 14, '/assets/maps/vandorn_farm/tiles/4/6/14.png'),
(196, 17, 4, 6, 15, '/assets/maps/vandorn_farm/tiles/4/6/15.png'),
(197, 17, 4, 7, 0, '/assets/maps/vandorn_farm/tiles/4/7/0.png'),
(198, 17, 4, 7, 1, '/assets/maps/vandorn_farm/tiles/4/7/1.png'),
(199, 17, 4, 7, 2, '/assets/maps/vandorn_farm/tiles/4/7/2.png'),
(200, 17, 4, 7, 3, '/assets/maps/vandorn_farm/tiles/4/7/3.png'),
(201, 17, 4, 7, 4, '/assets/maps/vandorn_farm/tiles/4/7/4.png'),
(202, 17, 4, 7, 5, '/assets/maps/vandorn_farm/tiles/4/7/5.png'),
(203, 17, 4, 7, 6, '/assets/maps/vandorn_farm/tiles/4/7/6.png'),
(204, 17, 4, 7, 7, '/assets/maps/vandorn_farm/tiles/4/7/7.png'),
(205, 17, 4, 7, 8, '/assets/maps/vandorn_farm/tiles/4/7/8.png'),
(206, 17, 4, 7, 9, '/assets/maps/vandorn_farm/tiles/4/7/9.png'),
(207, 17, 4, 7, 10, '/assets/maps/vandorn_farm/tiles/4/7/10.png'),
(208, 17, 4, 7, 11, '/assets/maps/vandorn_farm/tiles/4/7/11.png'),
(209, 17, 4, 7, 12, '/assets/maps/vandorn_farm/tiles/4/7/12.png'),
(210, 17, 4, 7, 13, '/assets/maps/vandorn_farm/tiles/4/7/13.png'),
(211, 17, 4, 7, 14, '/assets/maps/vandorn_farm/tiles/4/7/14.png'),
(212, 17, 4, 7, 15, '/assets/maps/vandorn_farm/tiles/4/7/15.png'),
(213, 17, 4, 8, 0, '/assets/maps/vandorn_farm/tiles/4/8/0.png'),
(214, 17, 4, 8, 1, '/assets/maps/vandorn_farm/tiles/4/8/1.png'),
(215, 17, 4, 8, 2, '/assets/maps/vandorn_farm/tiles/4/8/2.png'),
(216, 17, 4, 8, 3, '/assets/maps/vandorn_farm/tiles/4/8/3.png'),
(217, 17, 4, 8, 4, '/assets/maps/vandorn_farm/tiles/4/8/4.png'),
(218, 17, 4, 8, 5, '/assets/maps/vandorn_farm/tiles/4/8/5.png'),
(219, 17, 4, 8, 6, '/assets/maps/vandorn_farm/tiles/4/8/6.png'),
(220, 17, 4, 8, 7, '/assets/maps/vandorn_farm/tiles/4/8/7.png'),
(221, 17, 4, 8, 8, '/assets/maps/vandorn_farm/tiles/4/8/8.png'),
(222, 17, 4, 8, 9, '/assets/maps/vandorn_farm/tiles/4/8/9.png'),
(223, 17, 4, 8, 10, '/assets/maps/vandorn_farm/tiles/4/8/10.png'),
(224, 17, 4, 8, 11, '/assets/maps/vandorn_farm/tiles/4/8/11.png'),
(225, 17, 4, 8, 12, '/assets/maps/vandorn_farm/tiles/4/8/12.png'),
(226, 17, 4, 8, 13, '/assets/maps/vandorn_farm/tiles/4/8/13.png'),
(227, 17, 4, 8, 14, '/assets/maps/vandorn_farm/tiles/4/8/14.png'),
(228, 17, 4, 8, 15, '/assets/maps/vandorn_farm/tiles/4/8/15.png'),
(229, 17, 4, 9, 0, '/assets/maps/vandorn_farm/tiles/4/9/0.png'),
(230, 17, 4, 9, 1, '/assets/maps/vandorn_farm/tiles/4/9/1.png'),
(231, 17, 4, 9, 2, '/assets/maps/vandorn_farm/tiles/4/9/2.png'),
(232, 17, 4, 9, 3, '/assets/maps/vandorn_farm/tiles/4/9/3.png'),
(233, 17, 4, 9, 4, '/assets/maps/vandorn_farm/tiles/4/9/4.png'),
(234, 17, 4, 9, 5, '/assets/maps/vandorn_farm/tiles/4/9/5.png'),
(235, 17, 4, 9, 6, '/assets/maps/vandorn_farm/tiles/4/9/6.png'),
(236, 17, 4, 9, 7, '/assets/maps/vandorn_farm/tiles/4/9/7.png'),
(237, 17, 4, 9, 8, '/assets/maps/vandorn_farm/tiles/4/9/8.png'),
(238, 17, 4, 9, 9, '/assets/maps/vandorn_farm/tiles/4/9/9.png'),
(239, 17, 4, 9, 10, '/assets/maps/vandorn_farm/tiles/4/9/10.png'),
(240, 17, 4, 9, 11, '/assets/maps/vandorn_farm/tiles/4/9/11.png'),
(241, 17, 4, 9, 12, '/assets/maps/vandorn_farm/tiles/4/9/12.png'),
(242, 17, 4, 9, 13, '/assets/maps/vandorn_farm/tiles/4/9/13.png'),
(243, 17, 4, 9, 14, '/assets/maps/vandorn_farm/tiles/4/9/14.png'),
(244, 17, 4, 9, 15, '/assets/maps/vandorn_farm/tiles/4/9/15.png'),
(245, 17, 4, 10, 0, '/assets/maps/vandorn_farm/tiles/4/10/0.png'),
(246, 17, 4, 10, 1, '/assets/maps/vandorn_farm/tiles/4/10/1.png'),
(247, 17, 4, 10, 2, '/assets/maps/vandorn_farm/tiles/4/10/2.png'),
(248, 17, 4, 10, 3, '/assets/maps/vandorn_farm/tiles/4/10/3.png'),
(249, 17, 4, 10, 4, '/assets/maps/vandorn_farm/tiles/4/10/4.png'),
(250, 17, 4, 10, 5, '/assets/maps/vandorn_farm/tiles/4/10/5.png'),
(251, 17, 4, 10, 6, '/assets/maps/vandorn_farm/tiles/4/10/6.png'),
(252, 17, 4, 10, 7, '/assets/maps/vandorn_farm/tiles/4/10/7.png'),
(253, 17, 4, 10, 8, '/assets/maps/vandorn_farm/tiles/4/10/8.png'),
(254, 17, 4, 10, 9, '/assets/maps/vandorn_farm/tiles/4/10/9.png'),
(255, 17, 4, 10, 10, '/assets/maps/vandorn_farm/tiles/4/10/10.png'),
(256, 17, 4, 10, 11, '/assets/maps/vandorn_farm/tiles/4/10/11.png'),
(257, 17, 4, 10, 12, '/assets/maps/vandorn_farm/tiles/4/10/12.png'),
(258, 17, 4, 10, 13, '/assets/maps/vandorn_farm/tiles/4/10/13.png'),
(259, 17, 4, 10, 14, '/assets/maps/vandorn_farm/tiles/4/10/14.png'),
(260, 17, 4, 10, 15, '/assets/maps/vandorn_farm/tiles/4/10/15.png'),
(261, 17, 4, 11, 0, '/assets/maps/vandorn_farm/tiles/4/11/0.png'),
(262, 17, 4, 11, 1, '/assets/maps/vandorn_farm/tiles/4/11/1.png'),
(263, 17, 4, 11, 2, '/assets/maps/vandorn_farm/tiles/4/11/2.png'),
(264, 17, 4, 11, 3, '/assets/maps/vandorn_farm/tiles/4/11/3.png'),
(265, 17, 4, 11, 4, '/assets/maps/vandorn_farm/tiles/4/11/4.png'),
(266, 17, 4, 11, 5, '/assets/maps/vandorn_farm/tiles/4/11/5.png'),
(267, 17, 4, 11, 6, '/assets/maps/vandorn_farm/tiles/4/11/6.png'),
(268, 17, 4, 11, 7, '/assets/maps/vandorn_farm/tiles/4/11/7.png'),
(269, 17, 4, 11, 8, '/assets/maps/vandorn_farm/tiles/4/11/8.png'),
(270, 17, 4, 11, 9, '/assets/maps/vandorn_farm/tiles/4/11/9.png'),
(271, 17, 4, 11, 10, '/assets/maps/vandorn_farm/tiles/4/11/10.png'),
(272, 17, 4, 11, 11, '/assets/maps/vandorn_farm/tiles/4/11/11.png'),
(273, 17, 4, 11, 12, '/assets/maps/vandorn_farm/tiles/4/11/12.png'),
(274, 17, 4, 11, 13, '/assets/maps/vandorn_farm/tiles/4/11/13.png'),
(275, 17, 4, 11, 14, '/assets/maps/vandorn_farm/tiles/4/11/14.png'),
(276, 17, 4, 11, 15, '/assets/maps/vandorn_farm/tiles/4/11/15.png'),
(277, 17, 4, 12, 0, '/assets/maps/vandorn_farm/tiles/4/12/0.png'),
(278, 17, 4, 12, 1, '/assets/maps/vandorn_farm/tiles/4/12/1.png'),
(279, 17, 4, 12, 2, '/assets/maps/vandorn_farm/tiles/4/12/2.png'),
(280, 17, 4, 12, 3, '/assets/maps/vandorn_farm/tiles/4/12/3.png'),
(281, 17, 4, 12, 4, '/assets/maps/vandorn_farm/tiles/4/12/4.png'),
(282, 17, 4, 12, 5, '/assets/maps/vandorn_farm/tiles/4/12/5.png'),
(283, 17, 4, 12, 6, '/assets/maps/vandorn_farm/tiles/4/12/6.png'),
(284, 17, 4, 12, 7, '/assets/maps/vandorn_farm/tiles/4/12/7.png'),
(285, 17, 4, 12, 8, '/assets/maps/vandorn_farm/tiles/4/12/8.png'),
(286, 17, 4, 12, 9, '/assets/maps/vandorn_farm/tiles/4/12/9.png'),
(287, 17, 4, 12, 10, '/assets/maps/vandorn_farm/tiles/4/12/10.png'),
(288, 17, 4, 12, 11, '/assets/maps/vandorn_farm/tiles/4/12/11.png'),
(289, 17, 4, 12, 12, '/assets/maps/vandorn_farm/tiles/4/12/12.png'),
(290, 17, 4, 12, 13, '/assets/maps/vandorn_farm/tiles/4/12/13.png'),
(291, 17, 4, 12, 14, '/assets/maps/vandorn_farm/tiles/4/12/14.png'),
(292, 17, 4, 12, 15, '/assets/maps/vandorn_farm/tiles/4/12/15.png'),
(293, 17, 4, 13, 0, '/assets/maps/vandorn_farm/tiles/4/13/0.png'),
(294, 17, 4, 13, 1, '/assets/maps/vandorn_farm/tiles/4/13/1.png'),
(295, 17, 4, 13, 2, '/assets/maps/vandorn_farm/tiles/4/13/2.png'),
(296, 17, 4, 13, 3, '/assets/maps/vandorn_farm/tiles/4/13/3.png'),
(297, 17, 4, 13, 4, '/assets/maps/vandorn_farm/tiles/4/13/4.png'),
(298, 17, 4, 13, 5, '/assets/maps/vandorn_farm/tiles/4/13/5.png'),
(299, 17, 4, 13, 6, '/assets/maps/vandorn_farm/tiles/4/13/6.png'),
(300, 17, 4, 13, 7, '/assets/maps/vandorn_farm/tiles/4/13/7.png'),
(301, 17, 4, 13, 8, '/assets/maps/vandorn_farm/tiles/4/13/8.png'),
(302, 17, 4, 13, 9, '/assets/maps/vandorn_farm/tiles/4/13/9.png'),
(303, 17, 4, 13, 10, '/assets/maps/vandorn_farm/tiles/4/13/10.png'),
(304, 17, 4, 13, 11, '/assets/maps/vandorn_farm/tiles/4/13/11.png'),
(305, 17, 4, 13, 12, '/assets/maps/vandorn_farm/tiles/4/13/12.png'),
(306, 17, 4, 13, 13, '/assets/maps/vandorn_farm/tiles/4/13/13.png'),
(307, 17, 4, 13, 14, '/assets/maps/vandorn_farm/tiles/4/13/14.png'),
(308, 17, 4, 13, 15, '/assets/maps/vandorn_farm/tiles/4/13/15.png'),
(309, 17, 4, 14, 0, '/assets/maps/vandorn_farm/tiles/4/14/0.png'),
(310, 17, 4, 14, 1, '/assets/maps/vandorn_farm/tiles/4/14/1.png'),
(311, 17, 4, 14, 2, '/assets/maps/vandorn_farm/tiles/4/14/2.png'),
(312, 17, 4, 14, 3, '/assets/maps/vandorn_farm/tiles/4/14/3.png'),
(313, 17, 4, 14, 4, '/assets/maps/vandorn_farm/tiles/4/14/4.png'),
(314, 17, 4, 14, 5, '/assets/maps/vandorn_farm/tiles/4/14/5.png'),
(315, 17, 4, 14, 6, '/assets/maps/vandorn_farm/tiles/4/14/6.png'),
(316, 17, 4, 14, 7, '/assets/maps/vandorn_farm/tiles/4/14/7.png'),
(317, 17, 4, 14, 8, '/assets/maps/vandorn_farm/tiles/4/14/8.png'),
(318, 17, 4, 14, 9, '/assets/maps/vandorn_farm/tiles/4/14/9.png'),
(319, 17, 4, 14, 10, '/assets/maps/vandorn_farm/tiles/4/14/10.png'),
(320, 17, 4, 14, 11, '/assets/maps/vandorn_farm/tiles/4/14/11.png'),
(321, 17, 4, 14, 12, '/assets/maps/vandorn_farm/tiles/4/14/12.png'),
(322, 17, 4, 14, 13, '/assets/maps/vandorn_farm/tiles/4/14/13.png'),
(323, 17, 4, 14, 14, '/assets/maps/vandorn_farm/tiles/4/14/14.png'),
(324, 17, 4, 14, 15, '/assets/maps/vandorn_farm/tiles/4/14/15.png'),
(325, 17, 4, 15, 0, '/assets/maps/vandorn_farm/tiles/4/15/0.png'),
(326, 17, 4, 15, 1, '/assets/maps/vandorn_farm/tiles/4/15/1.png'),
(327, 17, 4, 15, 2, '/assets/maps/vandorn_farm/tiles/4/15/2.png'),
(328, 17, 4, 15, 3, '/assets/maps/vandorn_farm/tiles/4/15/3.png'),
(329, 17, 4, 15, 4, '/assets/maps/vandorn_farm/tiles/4/15/4.png'),
(330, 17, 4, 15, 5, '/assets/maps/vandorn_farm/tiles/4/15/5.png'),
(331, 17, 4, 15, 6, '/assets/maps/vandorn_farm/tiles/4/15/6.png'),
(332, 17, 4, 15, 7, '/assets/maps/vandorn_farm/tiles/4/15/7.png'),
(333, 17, 4, 15, 8, '/assets/maps/vandorn_farm/tiles/4/15/8.png'),
(334, 17, 4, 15, 9, '/assets/maps/vandorn_farm/tiles/4/15/9.png'),
(335, 17, 4, 15, 10, '/assets/maps/vandorn_farm/tiles/4/15/10.png'),
(336, 17, 4, 15, 11, '/assets/maps/vandorn_farm/tiles/4/15/11.png'),
(337, 17, 4, 15, 12, '/assets/maps/vandorn_farm/tiles/4/15/12.png'),
(338, 17, 4, 15, 13, '/assets/maps/vandorn_farm/tiles/4/15/13.png'),
(339, 17, 4, 15, 14, '/assets/maps/vandorn_farm/tiles/4/15/14.png'),
(340, 17, 4, 15, 15, '/assets/maps/vandorn_farm/tiles/4/15/15.png'),
(341, 17, 5, 0, 0, '/assets/maps/vandorn_farm/tiles/5/0/0.png'),
(342, 17, 5, 0, 1, '/assets/maps/vandorn_farm/tiles/5/0/1.png'),
(343, 17, 5, 0, 2, '/assets/maps/vandorn_farm/tiles/5/0/2.png'),
(344, 17, 5, 0, 3, '/assets/maps/vandorn_farm/tiles/5/0/3.png'),
(345, 17, 5, 0, 4, '/assets/maps/vandorn_farm/tiles/5/0/4.png'),
(346, 17, 5, 0, 5, '/assets/maps/vandorn_farm/tiles/5/0/5.png'),
(347, 17, 5, 0, 6, '/assets/maps/vandorn_farm/tiles/5/0/6.png'),
(348, 17, 5, 0, 7, '/assets/maps/vandorn_farm/tiles/5/0/7.png'),
(349, 17, 5, 0, 8, '/assets/maps/vandorn_farm/tiles/5/0/8.png'),
(350, 17, 5, 0, 9, '/assets/maps/vandorn_farm/tiles/5/0/9.png'),
(351, 17, 5, 0, 10, '/assets/maps/vandorn_farm/tiles/5/0/10.png'),
(352, 17, 5, 0, 11, '/assets/maps/vandorn_farm/tiles/5/0/11.png'),
(353, 17, 5, 0, 12, '/assets/maps/vandorn_farm/tiles/5/0/12.png'),
(354, 17, 5, 0, 13, '/assets/maps/vandorn_farm/tiles/5/0/13.png'),
(355, 17, 5, 0, 14, '/assets/maps/vandorn_farm/tiles/5/0/14.png'),
(356, 17, 5, 0, 15, '/assets/maps/vandorn_farm/tiles/5/0/15.png'),
(357, 17, 5, 0, 16, '/assets/maps/vandorn_farm/tiles/5/0/16.png'),
(358, 17, 5, 0, 17, '/assets/maps/vandorn_farm/tiles/5/0/17.png'),
(359, 17, 5, 0, 18, '/assets/maps/vandorn_farm/tiles/5/0/18.png'),
(360, 17, 5, 0, 19, '/assets/maps/vandorn_farm/tiles/5/0/19.png'),
(361, 17, 5, 0, 20, '/assets/maps/vandorn_farm/tiles/5/0/20.png'),
(362, 17, 5, 0, 21, '/assets/maps/vandorn_farm/tiles/5/0/21.png'),
(363, 17, 5, 0, 22, '/assets/maps/vandorn_farm/tiles/5/0/22.png'),
(364, 17, 5, 0, 23, '/assets/maps/vandorn_farm/tiles/5/0/23.png'),
(365, 17, 5, 0, 24, '/assets/maps/vandorn_farm/tiles/5/0/24.png'),
(366, 17, 5, 0, 25, '/assets/maps/vandorn_farm/tiles/5/0/25.png'),
(367, 17, 5, 0, 26, '/assets/maps/vandorn_farm/tiles/5/0/26.png'),
(368, 17, 5, 0, 27, '/assets/maps/vandorn_farm/tiles/5/0/27.png'),
(369, 17, 5, 0, 28, '/assets/maps/vandorn_farm/tiles/5/0/28.png'),
(370, 17, 5, 0, 29, '/assets/maps/vandorn_farm/tiles/5/0/29.png'),
(371, 17, 5, 0, 30, '/assets/maps/vandorn_farm/tiles/5/0/30.png'),
(372, 17, 5, 0, 31, '/assets/maps/vandorn_farm/tiles/5/0/31.png'),
(373, 17, 5, 1, 0, '/assets/maps/vandorn_farm/tiles/5/1/0.png'),
(374, 17, 5, 1, 1, '/assets/maps/vandorn_farm/tiles/5/1/1.png'),
(375, 17, 5, 1, 2, '/assets/maps/vandorn_farm/tiles/5/1/2.png'),
(376, 17, 5, 1, 3, '/assets/maps/vandorn_farm/tiles/5/1/3.png'),
(377, 17, 5, 1, 4, '/assets/maps/vandorn_farm/tiles/5/1/4.png'),
(378, 17, 5, 1, 5, '/assets/maps/vandorn_farm/tiles/5/1/5.png'),
(379, 17, 5, 1, 6, '/assets/maps/vandorn_farm/tiles/5/1/6.png'),
(380, 17, 5, 1, 7, '/assets/maps/vandorn_farm/tiles/5/1/7.png'),
(381, 17, 5, 1, 8, '/assets/maps/vandorn_farm/tiles/5/1/8.png'),
(382, 17, 5, 1, 9, '/assets/maps/vandorn_farm/tiles/5/1/9.png'),
(383, 17, 5, 1, 10, '/assets/maps/vandorn_farm/tiles/5/1/10.png'),
(384, 17, 5, 1, 11, '/assets/maps/vandorn_farm/tiles/5/1/11.png'),
(385, 17, 5, 1, 12, '/assets/maps/vandorn_farm/tiles/5/1/12.png'),
(386, 17, 5, 1, 13, '/assets/maps/vandorn_farm/tiles/5/1/13.png'),
(387, 17, 5, 1, 14, '/assets/maps/vandorn_farm/tiles/5/1/14.png'),
(388, 17, 5, 1, 15, '/assets/maps/vandorn_farm/tiles/5/1/15.png'),
(389, 17, 5, 1, 16, '/assets/maps/vandorn_farm/tiles/5/1/16.png'),
(390, 17, 5, 1, 17, '/assets/maps/vandorn_farm/tiles/5/1/17.png'),
(391, 17, 5, 1, 18, '/assets/maps/vandorn_farm/tiles/5/1/18.png'),
(392, 17, 5, 1, 19, '/assets/maps/vandorn_farm/tiles/5/1/19.png'),
(393, 17, 5, 1, 20, '/assets/maps/vandorn_farm/tiles/5/1/20.png'),
(394, 17, 5, 1, 21, '/assets/maps/vandorn_farm/tiles/5/1/21.png'),
(395, 17, 5, 1, 22, '/assets/maps/vandorn_farm/tiles/5/1/22.png'),
(396, 17, 5, 1, 23, '/assets/maps/vandorn_farm/tiles/5/1/23.png'),
(397, 17, 5, 1, 24, '/assets/maps/vandorn_farm/tiles/5/1/24.png'),
(398, 17, 5, 1, 25, '/assets/maps/vandorn_farm/tiles/5/1/25.png'),
(399, 17, 5, 1, 26, '/assets/maps/vandorn_farm/tiles/5/1/26.png'),
(400, 17, 5, 1, 27, '/assets/maps/vandorn_farm/tiles/5/1/27.png'),
(401, 17, 5, 1, 28, '/assets/maps/vandorn_farm/tiles/5/1/28.png'),
(402, 17, 5, 1, 29, '/assets/maps/vandorn_farm/tiles/5/1/29.png'),
(403, 17, 5, 1, 30, '/assets/maps/vandorn_farm/tiles/5/1/30.png'),
(404, 17, 5, 1, 31, '/assets/maps/vandorn_farm/tiles/5/1/31.png'),
(405, 17, 5, 2, 0, '/assets/maps/vandorn_farm/tiles/5/2/0.png'),
(406, 17, 5, 2, 1, '/assets/maps/vandorn_farm/tiles/5/2/1.png'),
(407, 17, 5, 2, 2, '/assets/maps/vandorn_farm/tiles/5/2/2.png'),
(408, 17, 5, 2, 3, '/assets/maps/vandorn_farm/tiles/5/2/3.png'),
(409, 17, 5, 2, 4, '/assets/maps/vandorn_farm/tiles/5/2/4.png'),
(410, 17, 5, 2, 5, '/assets/maps/vandorn_farm/tiles/5/2/5.png'),
(411, 17, 5, 2, 6, '/assets/maps/vandorn_farm/tiles/5/2/6.png'),
(412, 17, 5, 2, 7, '/assets/maps/vandorn_farm/tiles/5/2/7.png'),
(413, 17, 5, 2, 8, '/assets/maps/vandorn_farm/tiles/5/2/8.png'),
(414, 17, 5, 2, 9, '/assets/maps/vandorn_farm/tiles/5/2/9.png'),
(415, 17, 5, 2, 10, '/assets/maps/vandorn_farm/tiles/5/2/10.png'),
(416, 17, 5, 2, 11, '/assets/maps/vandorn_farm/tiles/5/2/11.png'),
(417, 17, 5, 2, 12, '/assets/maps/vandorn_farm/tiles/5/2/12.png'),
(418, 17, 5, 2, 13, '/assets/maps/vandorn_farm/tiles/5/2/13.png'),
(419, 17, 5, 2, 14, '/assets/maps/vandorn_farm/tiles/5/2/14.png'),
(420, 17, 5, 2, 15, '/assets/maps/vandorn_farm/tiles/5/2/15.png'),
(421, 17, 5, 2, 16, '/assets/maps/vandorn_farm/tiles/5/2/16.png'),
(422, 17, 5, 2, 17, '/assets/maps/vandorn_farm/tiles/5/2/17.png'),
(423, 17, 5, 2, 18, '/assets/maps/vandorn_farm/tiles/5/2/18.png'),
(424, 17, 5, 2, 19, '/assets/maps/vandorn_farm/tiles/5/2/19.png'),
(425, 17, 5, 2, 20, '/assets/maps/vandorn_farm/tiles/5/2/20.png'),
(426, 17, 5, 2, 21, '/assets/maps/vandorn_farm/tiles/5/2/21.png'),
(427, 17, 5, 2, 22, '/assets/maps/vandorn_farm/tiles/5/2/22.png'),
(428, 17, 5, 2, 23, '/assets/maps/vandorn_farm/tiles/5/2/23.png'),
(429, 17, 5, 2, 24, '/assets/maps/vandorn_farm/tiles/5/2/24.png'),
(430, 17, 5, 2, 25, '/assets/maps/vandorn_farm/tiles/5/2/25.png'),
(431, 17, 5, 2, 26, '/assets/maps/vandorn_farm/tiles/5/2/26.png'),
(432, 17, 5, 2, 27, '/assets/maps/vandorn_farm/tiles/5/2/27.png'),
(433, 17, 5, 2, 28, '/assets/maps/vandorn_farm/tiles/5/2/28.png'),
(434, 17, 5, 2, 29, '/assets/maps/vandorn_farm/tiles/5/2/29.png'),
(435, 17, 5, 2, 30, '/assets/maps/vandorn_farm/tiles/5/2/30.png'),
(436, 17, 5, 2, 31, '/assets/maps/vandorn_farm/tiles/5/2/31.png'),
(437, 17, 5, 3, 0, '/assets/maps/vandorn_farm/tiles/5/3/0.png'),
(438, 17, 5, 3, 1, '/assets/maps/vandorn_farm/tiles/5/3/1.png'),
(439, 17, 5, 3, 2, '/assets/maps/vandorn_farm/tiles/5/3/2.png'),
(440, 17, 5, 3, 3, '/assets/maps/vandorn_farm/tiles/5/3/3.png'),
(441, 17, 5, 3, 4, '/assets/maps/vandorn_farm/tiles/5/3/4.png'),
(442, 17, 5, 3, 5, '/assets/maps/vandorn_farm/tiles/5/3/5.png'),
(443, 17, 5, 3, 6, '/assets/maps/vandorn_farm/tiles/5/3/6.png'),
(444, 17, 5, 3, 7, '/assets/maps/vandorn_farm/tiles/5/3/7.png'),
(445, 17, 5, 3, 8, '/assets/maps/vandorn_farm/tiles/5/3/8.png'),
(446, 17, 5, 3, 9, '/assets/maps/vandorn_farm/tiles/5/3/9.png'),
(447, 17, 5, 3, 10, '/assets/maps/vandorn_farm/tiles/5/3/10.png'),
(448, 17, 5, 3, 11, '/assets/maps/vandorn_farm/tiles/5/3/11.png'),
(449, 17, 5, 3, 12, '/assets/maps/vandorn_farm/tiles/5/3/12.png'),
(450, 17, 5, 3, 13, '/assets/maps/vandorn_farm/tiles/5/3/13.png'),
(451, 17, 5, 3, 14, '/assets/maps/vandorn_farm/tiles/5/3/14.png'),
(452, 17, 5, 3, 15, '/assets/maps/vandorn_farm/tiles/5/3/15.png'),
(453, 17, 5, 3, 16, '/assets/maps/vandorn_farm/tiles/5/3/16.png'),
(454, 17, 5, 3, 17, '/assets/maps/vandorn_farm/tiles/5/3/17.png'),
(455, 17, 5, 3, 18, '/assets/maps/vandorn_farm/tiles/5/3/18.png'),
(456, 17, 5, 3, 19, '/assets/maps/vandorn_farm/tiles/5/3/19.png'),
(457, 17, 5, 3, 20, '/assets/maps/vandorn_farm/tiles/5/3/20.png'),
(458, 17, 5, 3, 21, '/assets/maps/vandorn_farm/tiles/5/3/21.png'),
(459, 17, 5, 3, 22, '/assets/maps/vandorn_farm/tiles/5/3/22.png'),
(460, 17, 5, 3, 23, '/assets/maps/vandorn_farm/tiles/5/3/23.png'),
(461, 17, 5, 3, 24, '/assets/maps/vandorn_farm/tiles/5/3/24.png'),
(462, 17, 5, 3, 25, '/assets/maps/vandorn_farm/tiles/5/3/25.png'),
(463, 17, 5, 3, 26, '/assets/maps/vandorn_farm/tiles/5/3/26.png'),
(464, 17, 5, 3, 27, '/assets/maps/vandorn_farm/tiles/5/3/27.png'),
(465, 17, 5, 3, 28, '/assets/maps/vandorn_farm/tiles/5/3/28.png'),
(466, 17, 5, 3, 29, '/assets/maps/vandorn_farm/tiles/5/3/29.png'),
(467, 17, 5, 3, 30, '/assets/maps/vandorn_farm/tiles/5/3/30.png'),
(468, 17, 5, 3, 31, '/assets/maps/vandorn_farm/tiles/5/3/31.png'),
(469, 17, 5, 4, 0, '/assets/maps/vandorn_farm/tiles/5/4/0.png'),
(470, 17, 5, 4, 1, '/assets/maps/vandorn_farm/tiles/5/4/1.png'),
(471, 17, 5, 4, 2, '/assets/maps/vandorn_farm/tiles/5/4/2.png'),
(472, 17, 5, 4, 3, '/assets/maps/vandorn_farm/tiles/5/4/3.png'),
(473, 17, 5, 4, 4, '/assets/maps/vandorn_farm/tiles/5/4/4.png'),
(474, 17, 5, 4, 5, '/assets/maps/vandorn_farm/tiles/5/4/5.png'),
(475, 17, 5, 4, 6, '/assets/maps/vandorn_farm/tiles/5/4/6.png'),
(476, 17, 5, 4, 7, '/assets/maps/vandorn_farm/tiles/5/4/7.png'),
(477, 17, 5, 4, 8, '/assets/maps/vandorn_farm/tiles/5/4/8.png'),
(478, 17, 5, 4, 9, '/assets/maps/vandorn_farm/tiles/5/4/9.png'),
(479, 17, 5, 4, 10, '/assets/maps/vandorn_farm/tiles/5/4/10.png'),
(480, 17, 5, 4, 11, '/assets/maps/vandorn_farm/tiles/5/4/11.png'),
(481, 17, 5, 4, 12, '/assets/maps/vandorn_farm/tiles/5/4/12.png'),
(482, 17, 5, 4, 13, '/assets/maps/vandorn_farm/tiles/5/4/13.png'),
(483, 17, 5, 4, 14, '/assets/maps/vandorn_farm/tiles/5/4/14.png'),
(484, 17, 5, 4, 15, '/assets/maps/vandorn_farm/tiles/5/4/15.png'),
(485, 17, 5, 4, 16, '/assets/maps/vandorn_farm/tiles/5/4/16.png'),
(486, 17, 5, 4, 17, '/assets/maps/vandorn_farm/tiles/5/4/17.png'),
(487, 17, 5, 4, 18, '/assets/maps/vandorn_farm/tiles/5/4/18.png'),
(488, 17, 5, 4, 19, '/assets/maps/vandorn_farm/tiles/5/4/19.png'),
(489, 17, 5, 4, 20, '/assets/maps/vandorn_farm/tiles/5/4/20.png'),
(490, 17, 5, 4, 21, '/assets/maps/vandorn_farm/tiles/5/4/21.png'),
(491, 17, 5, 4, 22, '/assets/maps/vandorn_farm/tiles/5/4/22.png'),
(492, 17, 5, 4, 23, '/assets/maps/vandorn_farm/tiles/5/4/23.png'),
(493, 17, 5, 4, 24, '/assets/maps/vandorn_farm/tiles/5/4/24.png'),
(494, 17, 5, 4, 25, '/assets/maps/vandorn_farm/tiles/5/4/25.png'),
(495, 17, 5, 4, 26, '/assets/maps/vandorn_farm/tiles/5/4/26.png'),
(496, 17, 5, 4, 27, '/assets/maps/vandorn_farm/tiles/5/4/27.png'),
(497, 17, 5, 4, 28, '/assets/maps/vandorn_farm/tiles/5/4/28.png'),
(498, 17, 5, 4, 29, '/assets/maps/vandorn_farm/tiles/5/4/29.png'),
(499, 17, 5, 4, 30, '/assets/maps/vandorn_farm/tiles/5/4/30.png'),
(500, 17, 5, 4, 31, '/assets/maps/vandorn_farm/tiles/5/4/31.png'),
(501, 17, 5, 5, 0, '/assets/maps/vandorn_farm/tiles/5/5/0.png'),
(502, 17, 5, 5, 1, '/assets/maps/vandorn_farm/tiles/5/5/1.png'),
(503, 17, 5, 5, 2, '/assets/maps/vandorn_farm/tiles/5/5/2.png'),
(504, 17, 5, 5, 3, '/assets/maps/vandorn_farm/tiles/5/5/3.png'),
(505, 17, 5, 5, 4, '/assets/maps/vandorn_farm/tiles/5/5/4.png'),
(506, 17, 5, 5, 5, '/assets/maps/vandorn_farm/tiles/5/5/5.png'),
(507, 17, 5, 5, 6, '/assets/maps/vandorn_farm/tiles/5/5/6.png'),
(508, 17, 5, 5, 7, '/assets/maps/vandorn_farm/tiles/5/5/7.png'),
(509, 17, 5, 5, 8, '/assets/maps/vandorn_farm/tiles/5/5/8.png'),
(510, 17, 5, 5, 9, '/assets/maps/vandorn_farm/tiles/5/5/9.png'),
(511, 17, 5, 5, 10, '/assets/maps/vandorn_farm/tiles/5/5/10.png'),
(512, 17, 5, 5, 11, '/assets/maps/vandorn_farm/tiles/5/5/11.png'),
(513, 17, 5, 5, 12, '/assets/maps/vandorn_farm/tiles/5/5/12.png'),
(514, 17, 5, 5, 13, '/assets/maps/vandorn_farm/tiles/5/5/13.png'),
(515, 17, 5, 5, 14, '/assets/maps/vandorn_farm/tiles/5/5/14.png'),
(516, 17, 5, 5, 15, '/assets/maps/vandorn_farm/tiles/5/5/15.png'),
(517, 17, 5, 5, 16, '/assets/maps/vandorn_farm/tiles/5/5/16.png'),
(518, 17, 5, 5, 17, '/assets/maps/vandorn_farm/tiles/5/5/17.png'),
(519, 17, 5, 5, 18, '/assets/maps/vandorn_farm/tiles/5/5/18.png'),
(520, 17, 5, 5, 19, '/assets/maps/vandorn_farm/tiles/5/5/19.png'),
(521, 17, 5, 5, 20, '/assets/maps/vandorn_farm/tiles/5/5/20.png'),
(522, 17, 5, 5, 21, '/assets/maps/vandorn_farm/tiles/5/5/21.png'),
(523, 17, 5, 5, 22, '/assets/maps/vandorn_farm/tiles/5/5/22.png'),
(524, 17, 5, 5, 23, '/assets/maps/vandorn_farm/tiles/5/5/23.png'),
(525, 17, 5, 5, 24, '/assets/maps/vandorn_farm/tiles/5/5/24.png'),
(526, 17, 5, 5, 25, '/assets/maps/vandorn_farm/tiles/5/5/25.png'),
(527, 17, 5, 5, 26, '/assets/maps/vandorn_farm/tiles/5/5/26.png'),
(528, 17, 5, 5, 27, '/assets/maps/vandorn_farm/tiles/5/5/27.png'),
(529, 17, 5, 5, 28, '/assets/maps/vandorn_farm/tiles/5/5/28.png'),
(530, 17, 5, 5, 29, '/assets/maps/vandorn_farm/tiles/5/5/29.png'),
(531, 17, 5, 5, 30, '/assets/maps/vandorn_farm/tiles/5/5/30.png'),
(532, 17, 5, 5, 31, '/assets/maps/vandorn_farm/tiles/5/5/31.png'),
(533, 17, 5, 6, 0, '/assets/maps/vandorn_farm/tiles/5/6/0.png'),
(534, 17, 5, 6, 1, '/assets/maps/vandorn_farm/tiles/5/6/1.png'),
(535, 17, 5, 6, 2, '/assets/maps/vandorn_farm/tiles/5/6/2.png'),
(536, 17, 5, 6, 3, '/assets/maps/vandorn_farm/tiles/5/6/3.png'),
(537, 17, 5, 6, 4, '/assets/maps/vandorn_farm/tiles/5/6/4.png'),
(538, 17, 5, 6, 5, '/assets/maps/vandorn_farm/tiles/5/6/5.png'),
(539, 17, 5, 6, 6, '/assets/maps/vandorn_farm/tiles/5/6/6.png'),
(540, 17, 5, 6, 7, '/assets/maps/vandorn_farm/tiles/5/6/7.png'),
(541, 17, 5, 6, 8, '/assets/maps/vandorn_farm/tiles/5/6/8.png'),
(542, 17, 5, 6, 9, '/assets/maps/vandorn_farm/tiles/5/6/9.png'),
(543, 17, 5, 6, 10, '/assets/maps/vandorn_farm/tiles/5/6/10.png'),
(544, 17, 5, 6, 11, '/assets/maps/vandorn_farm/tiles/5/6/11.png'),
(545, 17, 5, 6, 12, '/assets/maps/vandorn_farm/tiles/5/6/12.png'),
(546, 17, 5, 6, 13, '/assets/maps/vandorn_farm/tiles/5/6/13.png'),
(547, 17, 5, 6, 14, '/assets/maps/vandorn_farm/tiles/5/6/14.png'),
(548, 17, 5, 6, 15, '/assets/maps/vandorn_farm/tiles/5/6/15.png'),
(549, 17, 5, 6, 16, '/assets/maps/vandorn_farm/tiles/5/6/16.png'),
(550, 17, 5, 6, 17, '/assets/maps/vandorn_farm/tiles/5/6/17.png'),
(551, 17, 5, 6, 18, '/assets/maps/vandorn_farm/tiles/5/6/18.png'),
(552, 17, 5, 6, 19, '/assets/maps/vandorn_farm/tiles/5/6/19.png'),
(553, 17, 5, 6, 20, '/assets/maps/vandorn_farm/tiles/5/6/20.png'),
(554, 17, 5, 6, 21, '/assets/maps/vandorn_farm/tiles/5/6/21.png'),
(555, 17, 5, 6, 22, '/assets/maps/vandorn_farm/tiles/5/6/22.png'),
(556, 17, 5, 6, 23, '/assets/maps/vandorn_farm/tiles/5/6/23.png'),
(557, 17, 5, 6, 24, '/assets/maps/vandorn_farm/tiles/5/6/24.png'),
(558, 17, 5, 6, 25, '/assets/maps/vandorn_farm/tiles/5/6/25.png'),
(559, 17, 5, 6, 26, '/assets/maps/vandorn_farm/tiles/5/6/26.png'),
(560, 17, 5, 6, 27, '/assets/maps/vandorn_farm/tiles/5/6/27.png'),
(561, 17, 5, 6, 28, '/assets/maps/vandorn_farm/tiles/5/6/28.png'),
(562, 17, 5, 6, 29, '/assets/maps/vandorn_farm/tiles/5/6/29.png'),
(563, 17, 5, 6, 30, '/assets/maps/vandorn_farm/tiles/5/6/30.png'),
(564, 17, 5, 6, 31, '/assets/maps/vandorn_farm/tiles/5/6/31.png'),
(565, 17, 5, 7, 0, '/assets/maps/vandorn_farm/tiles/5/7/0.png'),
(566, 17, 5, 7, 1, '/assets/maps/vandorn_farm/tiles/5/7/1.png'),
(567, 17, 5, 7, 2, '/assets/maps/vandorn_farm/tiles/5/7/2.png'),
(568, 17, 5, 7, 3, '/assets/maps/vandorn_farm/tiles/5/7/3.png'),
(569, 17, 5, 7, 4, '/assets/maps/vandorn_farm/tiles/5/7/4.png'),
(570, 17, 5, 7, 5, '/assets/maps/vandorn_farm/tiles/5/7/5.png'),
(571, 17, 5, 7, 6, '/assets/maps/vandorn_farm/tiles/5/7/6.png'),
(572, 17, 5, 7, 7, '/assets/maps/vandorn_farm/tiles/5/7/7.png'),
(573, 17, 5, 7, 8, '/assets/maps/vandorn_farm/tiles/5/7/8.png'),
(574, 17, 5, 7, 9, '/assets/maps/vandorn_farm/tiles/5/7/9.png'),
(575, 17, 5, 7, 10, '/assets/maps/vandorn_farm/tiles/5/7/10.png'),
(576, 17, 5, 7, 11, '/assets/maps/vandorn_farm/tiles/5/7/11.png'),
(577, 17, 5, 7, 12, '/assets/maps/vandorn_farm/tiles/5/7/12.png'),
(578, 17, 5, 7, 13, '/assets/maps/vandorn_farm/tiles/5/7/13.png'),
(579, 17, 5, 7, 14, '/assets/maps/vandorn_farm/tiles/5/7/14.png'),
(580, 17, 5, 7, 15, '/assets/maps/vandorn_farm/tiles/5/7/15.png'),
(581, 17, 5, 7, 16, '/assets/maps/vandorn_farm/tiles/5/7/16.png'),
(582, 17, 5, 7, 17, '/assets/maps/vandorn_farm/tiles/5/7/17.png'),
(583, 17, 5, 7, 18, '/assets/maps/vandorn_farm/tiles/5/7/18.png'),
(584, 17, 5, 7, 19, '/assets/maps/vandorn_farm/tiles/5/7/19.png'),
(585, 17, 5, 7, 20, '/assets/maps/vandorn_farm/tiles/5/7/20.png'),
(586, 17, 5, 7, 21, '/assets/maps/vandorn_farm/tiles/5/7/21.png'),
(587, 17, 5, 7, 22, '/assets/maps/vandorn_farm/tiles/5/7/22.png'),
(588, 17, 5, 7, 23, '/assets/maps/vandorn_farm/tiles/5/7/23.png'),
(589, 17, 5, 7, 24, '/assets/maps/vandorn_farm/tiles/5/7/24.png'),
(590, 17, 5, 7, 25, '/assets/maps/vandorn_farm/tiles/5/7/25.png'),
(591, 17, 5, 7, 26, '/assets/maps/vandorn_farm/tiles/5/7/26.png'),
(592, 17, 5, 7, 27, '/assets/maps/vandorn_farm/tiles/5/7/27.png'),
(593, 17, 5, 7, 28, '/assets/maps/vandorn_farm/tiles/5/7/28.png'),
(594, 17, 5, 7, 29, '/assets/maps/vandorn_farm/tiles/5/7/29.png'),
(595, 17, 5, 7, 30, '/assets/maps/vandorn_farm/tiles/5/7/30.png'),
(596, 17, 5, 7, 31, '/assets/maps/vandorn_farm/tiles/5/7/31.png'),
(597, 17, 5, 8, 0, '/assets/maps/vandorn_farm/tiles/5/8/0.png'),
(598, 17, 5, 8, 1, '/assets/maps/vandorn_farm/tiles/5/8/1.png'),
(599, 17, 5, 8, 2, '/assets/maps/vandorn_farm/tiles/5/8/2.png'),
(600, 17, 5, 8, 3, '/assets/maps/vandorn_farm/tiles/5/8/3.png'),
(601, 17, 5, 8, 4, '/assets/maps/vandorn_farm/tiles/5/8/4.png'),
(602, 17, 5, 8, 5, '/assets/maps/vandorn_farm/tiles/5/8/5.png'),
(603, 17, 5, 8, 6, '/assets/maps/vandorn_farm/tiles/5/8/6.png'),
(604, 17, 5, 8, 7, '/assets/maps/vandorn_farm/tiles/5/8/7.png'),
(605, 17, 5, 8, 8, '/assets/maps/vandorn_farm/tiles/5/8/8.png'),
(606, 17, 5, 8, 9, '/assets/maps/vandorn_farm/tiles/5/8/9.png'),
(607, 17, 5, 8, 10, '/assets/maps/vandorn_farm/tiles/5/8/10.png'),
(608, 17, 5, 8, 11, '/assets/maps/vandorn_farm/tiles/5/8/11.png'),
(609, 17, 5, 8, 12, '/assets/maps/vandorn_farm/tiles/5/8/12.png'),
(610, 17, 5, 8, 13, '/assets/maps/vandorn_farm/tiles/5/8/13.png'),
(611, 17, 5, 8, 14, '/assets/maps/vandorn_farm/tiles/5/8/14.png'),
(612, 17, 5, 8, 15, '/assets/maps/vandorn_farm/tiles/5/8/15.png'),
(613, 17, 5, 8, 16, '/assets/maps/vandorn_farm/tiles/5/8/16.png'),
(614, 17, 5, 8, 17, '/assets/maps/vandorn_farm/tiles/5/8/17.png'),
(615, 17, 5, 8, 18, '/assets/maps/vandorn_farm/tiles/5/8/18.png'),
(616, 17, 5, 8, 19, '/assets/maps/vandorn_farm/tiles/5/8/19.png'),
(617, 17, 5, 8, 20, '/assets/maps/vandorn_farm/tiles/5/8/20.png'),
(618, 17, 5, 8, 21, '/assets/maps/vandorn_farm/tiles/5/8/21.png'),
(619, 17, 5, 8, 22, '/assets/maps/vandorn_farm/tiles/5/8/22.png'),
(620, 17, 5, 8, 23, '/assets/maps/vandorn_farm/tiles/5/8/23.png'),
(621, 17, 5, 8, 24, '/assets/maps/vandorn_farm/tiles/5/8/24.png'),
(622, 17, 5, 8, 25, '/assets/maps/vandorn_farm/tiles/5/8/25.png'),
(623, 17, 5, 8, 26, '/assets/maps/vandorn_farm/tiles/5/8/26.png'),
(624, 17, 5, 8, 27, '/assets/maps/vandorn_farm/tiles/5/8/27.png'),
(625, 17, 5, 8, 28, '/assets/maps/vandorn_farm/tiles/5/8/28.png'),
(626, 17, 5, 8, 29, '/assets/maps/vandorn_farm/tiles/5/8/29.png'),
(627, 17, 5, 8, 30, '/assets/maps/vandorn_farm/tiles/5/8/30.png'),
(628, 17, 5, 8, 31, '/assets/maps/vandorn_farm/tiles/5/8/31.png'),
(629, 17, 5, 9, 0, '/assets/maps/vandorn_farm/tiles/5/9/0.png'),
(630, 17, 5, 9, 1, '/assets/maps/vandorn_farm/tiles/5/9/1.png'),
(631, 17, 5, 9, 2, '/assets/maps/vandorn_farm/tiles/5/9/2.png'),
(632, 17, 5, 9, 3, '/assets/maps/vandorn_farm/tiles/5/9/3.png'),
(633, 17, 5, 9, 4, '/assets/maps/vandorn_farm/tiles/5/9/4.png'),
(634, 17, 5, 9, 5, '/assets/maps/vandorn_farm/tiles/5/9/5.png'),
(635, 17, 5, 9, 6, '/assets/maps/vandorn_farm/tiles/5/9/6.png'),
(636, 17, 5, 9, 7, '/assets/maps/vandorn_farm/tiles/5/9/7.png'),
(637, 17, 5, 9, 8, '/assets/maps/vandorn_farm/tiles/5/9/8.png'),
(638, 17, 5, 9, 9, '/assets/maps/vandorn_farm/tiles/5/9/9.png'),
(639, 17, 5, 9, 10, '/assets/maps/vandorn_farm/tiles/5/9/10.png'),
(640, 17, 5, 9, 11, '/assets/maps/vandorn_farm/tiles/5/9/11.png'),
(641, 17, 5, 9, 12, '/assets/maps/vandorn_farm/tiles/5/9/12.png'),
(642, 17, 5, 9, 13, '/assets/maps/vandorn_farm/tiles/5/9/13.png'),
(643, 17, 5, 9, 14, '/assets/maps/vandorn_farm/tiles/5/9/14.png'),
(644, 17, 5, 9, 15, '/assets/maps/vandorn_farm/tiles/5/9/15.png'),
(645, 17, 5, 9, 16, '/assets/maps/vandorn_farm/tiles/5/9/16.png'),
(646, 17, 5, 9, 17, '/assets/maps/vandorn_farm/tiles/5/9/17.png'),
(647, 17, 5, 9, 18, '/assets/maps/vandorn_farm/tiles/5/9/18.png'),
(648, 17, 5, 9, 19, '/assets/maps/vandorn_farm/tiles/5/9/19.png'),
(649, 17, 5, 9, 20, '/assets/maps/vandorn_farm/tiles/5/9/20.png'),
(650, 17, 5, 9, 21, '/assets/maps/vandorn_farm/tiles/5/9/21.png'),
(651, 17, 5, 9, 22, '/assets/maps/vandorn_farm/tiles/5/9/22.png'),
(652, 17, 5, 9, 23, '/assets/maps/vandorn_farm/tiles/5/9/23.png'),
(653, 17, 5, 9, 24, '/assets/maps/vandorn_farm/tiles/5/9/24.png'),
(654, 17, 5, 9, 25, '/assets/maps/vandorn_farm/tiles/5/9/25.png'),
(655, 17, 5, 9, 26, '/assets/maps/vandorn_farm/tiles/5/9/26.png'),
(656, 17, 5, 9, 27, '/assets/maps/vandorn_farm/tiles/5/9/27.png'),
(657, 17, 5, 9, 28, '/assets/maps/vandorn_farm/tiles/5/9/28.png'),
(658, 17, 5, 9, 29, '/assets/maps/vandorn_farm/tiles/5/9/29.png'),
(659, 17, 5, 9, 30, '/assets/maps/vandorn_farm/tiles/5/9/30.png'),
(660, 17, 5, 9, 31, '/assets/maps/vandorn_farm/tiles/5/9/31.png'),
(661, 17, 5, 10, 0, '/assets/maps/vandorn_farm/tiles/5/10/0.png'),
(662, 17, 5, 10, 1, '/assets/maps/vandorn_farm/tiles/5/10/1.png'),
(663, 17, 5, 10, 2, '/assets/maps/vandorn_farm/tiles/5/10/2.png'),
(664, 17, 5, 10, 3, '/assets/maps/vandorn_farm/tiles/5/10/3.png'),
(665, 17, 5, 10, 4, '/assets/maps/vandorn_farm/tiles/5/10/4.png'),
(666, 17, 5, 10, 5, '/assets/maps/vandorn_farm/tiles/5/10/5.png'),
(667, 17, 5, 10, 6, '/assets/maps/vandorn_farm/tiles/5/10/6.png'),
(668, 17, 5, 10, 7, '/assets/maps/vandorn_farm/tiles/5/10/7.png'),
(669, 17, 5, 10, 8, '/assets/maps/vandorn_farm/tiles/5/10/8.png'),
(670, 17, 5, 10, 9, '/assets/maps/vandorn_farm/tiles/5/10/9.png'),
(671, 17, 5, 10, 10, '/assets/maps/vandorn_farm/tiles/5/10/10.png'),
(672, 17, 5, 10, 11, '/assets/maps/vandorn_farm/tiles/5/10/11.png'),
(673, 17, 5, 10, 12, '/assets/maps/vandorn_farm/tiles/5/10/12.png'),
(674, 17, 5, 10, 13, '/assets/maps/vandorn_farm/tiles/5/10/13.png'),
(675, 17, 5, 10, 14, '/assets/maps/vandorn_farm/tiles/5/10/14.png'),
(676, 17, 5, 10, 15, '/assets/maps/vandorn_farm/tiles/5/10/15.png'),
(677, 17, 5, 10, 16, '/assets/maps/vandorn_farm/tiles/5/10/16.png'),
(678, 17, 5, 10, 17, '/assets/maps/vandorn_farm/tiles/5/10/17.png'),
(679, 17, 5, 10, 18, '/assets/maps/vandorn_farm/tiles/5/10/18.png'),
(680, 17, 5, 10, 19, '/assets/maps/vandorn_farm/tiles/5/10/19.png'),
(681, 17, 5, 10, 20, '/assets/maps/vandorn_farm/tiles/5/10/20.png'),
(682, 17, 5, 10, 21, '/assets/maps/vandorn_farm/tiles/5/10/21.png'),
(683, 17, 5, 10, 22, '/assets/maps/vandorn_farm/tiles/5/10/22.png'),
(684, 17, 5, 10, 23, '/assets/maps/vandorn_farm/tiles/5/10/23.png'),
(685, 17, 5, 10, 24, '/assets/maps/vandorn_farm/tiles/5/10/24.png'),
(686, 17, 5, 10, 25, '/assets/maps/vandorn_farm/tiles/5/10/25.png'),
(687, 17, 5, 10, 26, '/assets/maps/vandorn_farm/tiles/5/10/26.png'),
(688, 17, 5, 10, 27, '/assets/maps/vandorn_farm/tiles/5/10/27.png'),
(689, 17, 5, 10, 28, '/assets/maps/vandorn_farm/tiles/5/10/28.png'),
(690, 17, 5, 10, 29, '/assets/maps/vandorn_farm/tiles/5/10/29.png'),
(691, 17, 5, 10, 30, '/assets/maps/vandorn_farm/tiles/5/10/30.png'),
(692, 17, 5, 10, 31, '/assets/maps/vandorn_farm/tiles/5/10/31.png'),
(693, 17, 5, 11, 0, '/assets/maps/vandorn_farm/tiles/5/11/0.png'),
(694, 17, 5, 11, 1, '/assets/maps/vandorn_farm/tiles/5/11/1.png'),
(695, 17, 5, 11, 2, '/assets/maps/vandorn_farm/tiles/5/11/2.png'),
(696, 17, 5, 11, 3, '/assets/maps/vandorn_farm/tiles/5/11/3.png'),
(697, 17, 5, 11, 4, '/assets/maps/vandorn_farm/tiles/5/11/4.png'),
(698, 17, 5, 11, 5, '/assets/maps/vandorn_farm/tiles/5/11/5.png'),
(699, 17, 5, 11, 6, '/assets/maps/vandorn_farm/tiles/5/11/6.png'),
(700, 17, 5, 11, 7, '/assets/maps/vandorn_farm/tiles/5/11/7.png'),
(701, 17, 5, 11, 8, '/assets/maps/vandorn_farm/tiles/5/11/8.png'),
(702, 17, 5, 11, 9, '/assets/maps/vandorn_farm/tiles/5/11/9.png'),
(703, 17, 5, 11, 10, '/assets/maps/vandorn_farm/tiles/5/11/10.png'),
(704, 17, 5, 11, 11, '/assets/maps/vandorn_farm/tiles/5/11/11.png'),
(705, 17, 5, 11, 12, '/assets/maps/vandorn_farm/tiles/5/11/12.png'),
(706, 17, 5, 11, 13, '/assets/maps/vandorn_farm/tiles/5/11/13.png'),
(707, 17, 5, 11, 14, '/assets/maps/vandorn_farm/tiles/5/11/14.png'),
(708, 17, 5, 11, 15, '/assets/maps/vandorn_farm/tiles/5/11/15.png'),
(709, 17, 5, 11, 16, '/assets/maps/vandorn_farm/tiles/5/11/16.png'),
(710, 17, 5, 11, 17, '/assets/maps/vandorn_farm/tiles/5/11/17.png'),
(711, 17, 5, 11, 18, '/assets/maps/vandorn_farm/tiles/5/11/18.png'),
(712, 17, 5, 11, 19, '/assets/maps/vandorn_farm/tiles/5/11/19.png'),
(713, 17, 5, 11, 20, '/assets/maps/vandorn_farm/tiles/5/11/20.png'),
(714, 17, 5, 11, 21, '/assets/maps/vandorn_farm/tiles/5/11/21.png'),
(715, 17, 5, 11, 22, '/assets/maps/vandorn_farm/tiles/5/11/22.png'),
(716, 17, 5, 11, 23, '/assets/maps/vandorn_farm/tiles/5/11/23.png'),
(717, 17, 5, 11, 24, '/assets/maps/vandorn_farm/tiles/5/11/24.png'),
(718, 17, 5, 11, 25, '/assets/maps/vandorn_farm/tiles/5/11/25.png'),
(719, 17, 5, 11, 26, '/assets/maps/vandorn_farm/tiles/5/11/26.png'),
(720, 17, 5, 11, 27, '/assets/maps/vandorn_farm/tiles/5/11/27.png'),
(721, 17, 5, 11, 28, '/assets/maps/vandorn_farm/tiles/5/11/28.png'),
(722, 17, 5, 11, 29, '/assets/maps/vandorn_farm/tiles/5/11/29.png'),
(723, 17, 5, 11, 30, '/assets/maps/vandorn_farm/tiles/5/11/30.png'),
(724, 17, 5, 11, 31, '/assets/maps/vandorn_farm/tiles/5/11/31.png'),
(725, 17, 5, 12, 0, '/assets/maps/vandorn_farm/tiles/5/12/0.png'),
(726, 17, 5, 12, 1, '/assets/maps/vandorn_farm/tiles/5/12/1.png'),
(727, 17, 5, 12, 2, '/assets/maps/vandorn_farm/tiles/5/12/2.png'),
(728, 17, 5, 12, 3, '/assets/maps/vandorn_farm/tiles/5/12/3.png'),
(729, 17, 5, 12, 4, '/assets/maps/vandorn_farm/tiles/5/12/4.png'),
(730, 17, 5, 12, 5, '/assets/maps/vandorn_farm/tiles/5/12/5.png'),
(731, 17, 5, 12, 6, '/assets/maps/vandorn_farm/tiles/5/12/6.png'),
(732, 17, 5, 12, 7, '/assets/maps/vandorn_farm/tiles/5/12/7.png'),
(733, 17, 5, 12, 8, '/assets/maps/vandorn_farm/tiles/5/12/8.png'),
(734, 17, 5, 12, 9, '/assets/maps/vandorn_farm/tiles/5/12/9.png'),
(735, 17, 5, 12, 10, '/assets/maps/vandorn_farm/tiles/5/12/10.png'),
(736, 17, 5, 12, 11, '/assets/maps/vandorn_farm/tiles/5/12/11.png'),
(737, 17, 5, 12, 12, '/assets/maps/vandorn_farm/tiles/5/12/12.png'),
(738, 17, 5, 12, 13, '/assets/maps/vandorn_farm/tiles/5/12/13.png'),
(739, 17, 5, 12, 14, '/assets/maps/vandorn_farm/tiles/5/12/14.png'),
(740, 17, 5, 12, 15, '/assets/maps/vandorn_farm/tiles/5/12/15.png'),
(741, 17, 5, 12, 16, '/assets/maps/vandorn_farm/tiles/5/12/16.png'),
(742, 17, 5, 12, 17, '/assets/maps/vandorn_farm/tiles/5/12/17.png'),
(743, 17, 5, 12, 18, '/assets/maps/vandorn_farm/tiles/5/12/18.png'),
(744, 17, 5, 12, 19, '/assets/maps/vandorn_farm/tiles/5/12/19.png'),
(745, 17, 5, 12, 20, '/assets/maps/vandorn_farm/tiles/5/12/20.png'),
(746, 17, 5, 12, 21, '/assets/maps/vandorn_farm/tiles/5/12/21.png'),
(747, 17, 5, 12, 22, '/assets/maps/vandorn_farm/tiles/5/12/22.png'),
(748, 17, 5, 12, 23, '/assets/maps/vandorn_farm/tiles/5/12/23.png'),
(749, 17, 5, 12, 24, '/assets/maps/vandorn_farm/tiles/5/12/24.png'),
(750, 17, 5, 12, 25, '/assets/maps/vandorn_farm/tiles/5/12/25.png'),
(751, 17, 5, 12, 26, '/assets/maps/vandorn_farm/tiles/5/12/26.png'),
(752, 17, 5, 12, 27, '/assets/maps/vandorn_farm/tiles/5/12/27.png'),
(753, 17, 5, 12, 28, '/assets/maps/vandorn_farm/tiles/5/12/28.png'),
(754, 17, 5, 12, 29, '/assets/maps/vandorn_farm/tiles/5/12/29.png'),
(755, 17, 5, 12, 30, '/assets/maps/vandorn_farm/tiles/5/12/30.png'),
(756, 17, 5, 12, 31, '/assets/maps/vandorn_farm/tiles/5/12/31.png'),
(757, 17, 5, 13, 0, '/assets/maps/vandorn_farm/tiles/5/13/0.png'),
(758, 17, 5, 13, 1, '/assets/maps/vandorn_farm/tiles/5/13/1.png'),
(759, 17, 5, 13, 2, '/assets/maps/vandorn_farm/tiles/5/13/2.png'),
(760, 17, 5, 13, 3, '/assets/maps/vandorn_farm/tiles/5/13/3.png'),
(761, 17, 5, 13, 4, '/assets/maps/vandorn_farm/tiles/5/13/4.png'),
(762, 17, 5, 13, 5, '/assets/maps/vandorn_farm/tiles/5/13/5.png'),
(763, 17, 5, 13, 6, '/assets/maps/vandorn_farm/tiles/5/13/6.png'),
(764, 17, 5, 13, 7, '/assets/maps/vandorn_farm/tiles/5/13/7.png'),
(765, 17, 5, 13, 8, '/assets/maps/vandorn_farm/tiles/5/13/8.png'),
(766, 17, 5, 13, 9, '/assets/maps/vandorn_farm/tiles/5/13/9.png'),
(767, 17, 5, 13, 10, '/assets/maps/vandorn_farm/tiles/5/13/10.png'),
(768, 17, 5, 13, 11, '/assets/maps/vandorn_farm/tiles/5/13/11.png'),
(769, 17, 5, 13, 12, '/assets/maps/vandorn_farm/tiles/5/13/12.png'),
(770, 17, 5, 13, 13, '/assets/maps/vandorn_farm/tiles/5/13/13.png'),
(771, 17, 5, 13, 14, '/assets/maps/vandorn_farm/tiles/5/13/14.png'),
(772, 17, 5, 13, 15, '/assets/maps/vandorn_farm/tiles/5/13/15.png'),
(773, 17, 5, 13, 16, '/assets/maps/vandorn_farm/tiles/5/13/16.png'),
(774, 17, 5, 13, 17, '/assets/maps/vandorn_farm/tiles/5/13/17.png'),
(775, 17, 5, 13, 18, '/assets/maps/vandorn_farm/tiles/5/13/18.png'),
(776, 17, 5, 13, 19, '/assets/maps/vandorn_farm/tiles/5/13/19.png'),
(777, 17, 5, 13, 20, '/assets/maps/vandorn_farm/tiles/5/13/20.png'),
(778, 17, 5, 13, 21, '/assets/maps/vandorn_farm/tiles/5/13/21.png'),
(779, 17, 5, 13, 22, '/assets/maps/vandorn_farm/tiles/5/13/22.png'),
(780, 17, 5, 13, 23, '/assets/maps/vandorn_farm/tiles/5/13/23.png'),
(781, 17, 5, 13, 24, '/assets/maps/vandorn_farm/tiles/5/13/24.png'),
(782, 17, 5, 13, 25, '/assets/maps/vandorn_farm/tiles/5/13/25.png'),
(783, 17, 5, 13, 26, '/assets/maps/vandorn_farm/tiles/5/13/26.png'),
(784, 17, 5, 13, 27, '/assets/maps/vandorn_farm/tiles/5/13/27.png'),
(785, 17, 5, 13, 28, '/assets/maps/vandorn_farm/tiles/5/13/28.png'),
(786, 17, 5, 13, 29, '/assets/maps/vandorn_farm/tiles/5/13/29.png'),
(787, 17, 5, 13, 30, '/assets/maps/vandorn_farm/tiles/5/13/30.png'),
(788, 17, 5, 13, 31, '/assets/maps/vandorn_farm/tiles/5/13/31.png'),
(789, 17, 5, 14, 0, '/assets/maps/vandorn_farm/tiles/5/14/0.png'),
(790, 17, 5, 14, 1, '/assets/maps/vandorn_farm/tiles/5/14/1.png'),
(791, 17, 5, 14, 2, '/assets/maps/vandorn_farm/tiles/5/14/2.png'),
(792, 17, 5, 14, 3, '/assets/maps/vandorn_farm/tiles/5/14/3.png'),
(793, 17, 5, 14, 4, '/assets/maps/vandorn_farm/tiles/5/14/4.png'),
(794, 17, 5, 14, 5, '/assets/maps/vandorn_farm/tiles/5/14/5.png'),
(795, 17, 5, 14, 6, '/assets/maps/vandorn_farm/tiles/5/14/6.png'),
(796, 17, 5, 14, 7, '/assets/maps/vandorn_farm/tiles/5/14/7.png'),
(797, 17, 5, 14, 8, '/assets/maps/vandorn_farm/tiles/5/14/8.png'),
(798, 17, 5, 14, 9, '/assets/maps/vandorn_farm/tiles/5/14/9.png'),
(799, 17, 5, 14, 10, '/assets/maps/vandorn_farm/tiles/5/14/10.png'),
(800, 17, 5, 14, 11, '/assets/maps/vandorn_farm/tiles/5/14/11.png'),
(801, 17, 5, 14, 12, '/assets/maps/vandorn_farm/tiles/5/14/12.png'),
(802, 17, 5, 14, 13, '/assets/maps/vandorn_farm/tiles/5/14/13.png'),
(803, 17, 5, 14, 14, '/assets/maps/vandorn_farm/tiles/5/14/14.png'),
(804, 17, 5, 14, 15, '/assets/maps/vandorn_farm/tiles/5/14/15.png'),
(805, 17, 5, 14, 16, '/assets/maps/vandorn_farm/tiles/5/14/16.png'),
(806, 17, 5, 14, 17, '/assets/maps/vandorn_farm/tiles/5/14/17.png'),
(807, 17, 5, 14, 18, '/assets/maps/vandorn_farm/tiles/5/14/18.png'),
(808, 17, 5, 14, 19, '/assets/maps/vandorn_farm/tiles/5/14/19.png'),
(809, 17, 5, 14, 20, '/assets/maps/vandorn_farm/tiles/5/14/20.png'),
(810, 17, 5, 14, 21, '/assets/maps/vandorn_farm/tiles/5/14/21.png'),
(811, 17, 5, 14, 22, '/assets/maps/vandorn_farm/tiles/5/14/22.png'),
(812, 17, 5, 14, 23, '/assets/maps/vandorn_farm/tiles/5/14/23.png'),
(813, 17, 5, 14, 24, '/assets/maps/vandorn_farm/tiles/5/14/24.png'),
(814, 17, 5, 14, 25, '/assets/maps/vandorn_farm/tiles/5/14/25.png'),
(815, 17, 5, 14, 26, '/assets/maps/vandorn_farm/tiles/5/14/26.png'),
(816, 17, 5, 14, 27, '/assets/maps/vandorn_farm/tiles/5/14/27.png'),
(817, 17, 5, 14, 28, '/assets/maps/vandorn_farm/tiles/5/14/28.png'),
(818, 17, 5, 14, 29, '/assets/maps/vandorn_farm/tiles/5/14/29.png'),
(819, 17, 5, 14, 30, '/assets/maps/vandorn_farm/tiles/5/14/30.png'),
(820, 17, 5, 14, 31, '/assets/maps/vandorn_farm/tiles/5/14/31.png'),
(821, 17, 5, 15, 0, '/assets/maps/vandorn_farm/tiles/5/15/0.png'),
(822, 17, 5, 15, 1, '/assets/maps/vandorn_farm/tiles/5/15/1.png'),
(823, 17, 5, 15, 2, '/assets/maps/vandorn_farm/tiles/5/15/2.png'),
(824, 17, 5, 15, 3, '/assets/maps/vandorn_farm/tiles/5/15/3.png'),
(825, 17, 5, 15, 4, '/assets/maps/vandorn_farm/tiles/5/15/4.png'),
(826, 17, 5, 15, 5, '/assets/maps/vandorn_farm/tiles/5/15/5.png'),
(827, 17, 5, 15, 6, '/assets/maps/vandorn_farm/tiles/5/15/6.png'),
(828, 17, 5, 15, 7, '/assets/maps/vandorn_farm/tiles/5/15/7.png'),
(829, 17, 5, 15, 8, '/assets/maps/vandorn_farm/tiles/5/15/8.png'),
(830, 17, 5, 15, 9, '/assets/maps/vandorn_farm/tiles/5/15/9.png'),
(831, 17, 5, 15, 10, '/assets/maps/vandorn_farm/tiles/5/15/10.png'),
(832, 17, 5, 15, 11, '/assets/maps/vandorn_farm/tiles/5/15/11.png'),
(833, 17, 5, 15, 12, '/assets/maps/vandorn_farm/tiles/5/15/12.png'),
(834, 17, 5, 15, 13, '/assets/maps/vandorn_farm/tiles/5/15/13.png'),
(835, 17, 5, 15, 14, '/assets/maps/vandorn_farm/tiles/5/15/14.png'),
(836, 17, 5, 15, 15, '/assets/maps/vandorn_farm/tiles/5/15/15.png'),
(837, 17, 5, 15, 16, '/assets/maps/vandorn_farm/tiles/5/15/16.png'),
(838, 17, 5, 15, 17, '/assets/maps/vandorn_farm/tiles/5/15/17.png'),
(839, 17, 5, 15, 18, '/assets/maps/vandorn_farm/tiles/5/15/18.png'),
(840, 17, 5, 15, 19, '/assets/maps/vandorn_farm/tiles/5/15/19.png'),
(841, 17, 5, 15, 20, '/assets/maps/vandorn_farm/tiles/5/15/20.png'),
(842, 17, 5, 15, 21, '/assets/maps/vandorn_farm/tiles/5/15/21.png'),
(843, 17, 5, 15, 22, '/assets/maps/vandorn_farm/tiles/5/15/22.png'),
(844, 17, 5, 15, 23, '/assets/maps/vandorn_farm/tiles/5/15/23.png'),
(845, 17, 5, 15, 24, '/assets/maps/vandorn_farm/tiles/5/15/24.png'),
(846, 17, 5, 15, 25, '/assets/maps/vandorn_farm/tiles/5/15/25.png'),
(847, 17, 5, 15, 26, '/assets/maps/vandorn_farm/tiles/5/15/26.png'),
(848, 17, 5, 15, 27, '/assets/maps/vandorn_farm/tiles/5/15/27.png'),
(849, 17, 5, 15, 28, '/assets/maps/vandorn_farm/tiles/5/15/28.png'),
(850, 17, 5, 15, 29, '/assets/maps/vandorn_farm/tiles/5/15/29.png'),
(851, 17, 5, 15, 30, '/assets/maps/vandorn_farm/tiles/5/15/30.png'),
(852, 17, 5, 15, 31, '/assets/maps/vandorn_farm/tiles/5/15/31.png'),
(853, 17, 5, 16, 0, '/assets/maps/vandorn_farm/tiles/5/16/0.png'),
(854, 17, 5, 16, 1, '/assets/maps/vandorn_farm/tiles/5/16/1.png'),
(855, 17, 5, 16, 2, '/assets/maps/vandorn_farm/tiles/5/16/2.png'),
(856, 17, 5, 16, 3, '/assets/maps/vandorn_farm/tiles/5/16/3.png'),
(857, 17, 5, 16, 4, '/assets/maps/vandorn_farm/tiles/5/16/4.png'),
(858, 17, 5, 16, 5, '/assets/maps/vandorn_farm/tiles/5/16/5.png'),
(859, 17, 5, 16, 6, '/assets/maps/vandorn_farm/tiles/5/16/6.png'),
(860, 17, 5, 16, 7, '/assets/maps/vandorn_farm/tiles/5/16/7.png'),
(861, 17, 5, 16, 8, '/assets/maps/vandorn_farm/tiles/5/16/8.png'),
(862, 17, 5, 16, 9, '/assets/maps/vandorn_farm/tiles/5/16/9.png'),
(863, 17, 5, 16, 10, '/assets/maps/vandorn_farm/tiles/5/16/10.png'),
(864, 17, 5, 16, 11, '/assets/maps/vandorn_farm/tiles/5/16/11.png'),
(865, 17, 5, 16, 12, '/assets/maps/vandorn_farm/tiles/5/16/12.png'),
(866, 17, 5, 16, 13, '/assets/maps/vandorn_farm/tiles/5/16/13.png'),
(867, 17, 5, 16, 14, '/assets/maps/vandorn_farm/tiles/5/16/14.png'),
(868, 17, 5, 16, 15, '/assets/maps/vandorn_farm/tiles/5/16/15.png'),
(869, 17, 5, 16, 16, '/assets/maps/vandorn_farm/tiles/5/16/16.png'),
(870, 17, 5, 16, 17, '/assets/maps/vandorn_farm/tiles/5/16/17.png'),
(871, 17, 5, 16, 18, '/assets/maps/vandorn_farm/tiles/5/16/18.png'),
(872, 17, 5, 16, 19, '/assets/maps/vandorn_farm/tiles/5/16/19.png'),
(873, 17, 5, 16, 20, '/assets/maps/vandorn_farm/tiles/5/16/20.png'),
(874, 17, 5, 16, 21, '/assets/maps/vandorn_farm/tiles/5/16/21.png'),
(875, 17, 5, 16, 22, '/assets/maps/vandorn_farm/tiles/5/16/22.png'),
(876, 17, 5, 16, 23, '/assets/maps/vandorn_farm/tiles/5/16/23.png'),
(877, 17, 5, 16, 24, '/assets/maps/vandorn_farm/tiles/5/16/24.png'),
(878, 17, 5, 16, 25, '/assets/maps/vandorn_farm/tiles/5/16/25.png'),
(879, 17, 5, 16, 26, '/assets/maps/vandorn_farm/tiles/5/16/26.png'),
(880, 17, 5, 16, 27, '/assets/maps/vandorn_farm/tiles/5/16/27.png'),
(881, 17, 5, 16, 28, '/assets/maps/vandorn_farm/tiles/5/16/28.png'),
(882, 17, 5, 16, 29, '/assets/maps/vandorn_farm/tiles/5/16/29.png'),
(883, 17, 5, 16, 30, '/assets/maps/vandorn_farm/tiles/5/16/30.png'),
(884, 17, 5, 16, 31, '/assets/maps/vandorn_farm/tiles/5/16/31.png'),
(885, 17, 5, 17, 0, '/assets/maps/vandorn_farm/tiles/5/17/0.png'),
(886, 17, 5, 17, 1, '/assets/maps/vandorn_farm/tiles/5/17/1.png'),
(887, 17, 5, 17, 2, '/assets/maps/vandorn_farm/tiles/5/17/2.png'),
(888, 17, 5, 17, 3, '/assets/maps/vandorn_farm/tiles/5/17/3.png'),
(889, 17, 5, 17, 4, '/assets/maps/vandorn_farm/tiles/5/17/4.png'),
(890, 17, 5, 17, 5, '/assets/maps/vandorn_farm/tiles/5/17/5.png'),
(891, 17, 5, 17, 6, '/assets/maps/vandorn_farm/tiles/5/17/6.png'),
(892, 17, 5, 17, 7, '/assets/maps/vandorn_farm/tiles/5/17/7.png'),
(893, 17, 5, 17, 8, '/assets/maps/vandorn_farm/tiles/5/17/8.png'),
(894, 17, 5, 17, 9, '/assets/maps/vandorn_farm/tiles/5/17/9.png'),
(895, 17, 5, 17, 10, '/assets/maps/vandorn_farm/tiles/5/17/10.png'),
(896, 17, 5, 17, 11, '/assets/maps/vandorn_farm/tiles/5/17/11.png'),
(897, 17, 5, 17, 12, '/assets/maps/vandorn_farm/tiles/5/17/12.png'),
(898, 17, 5, 17, 13, '/assets/maps/vandorn_farm/tiles/5/17/13.png'),
(899, 17, 5, 17, 14, '/assets/maps/vandorn_farm/tiles/5/17/14.png'),
(900, 17, 5, 17, 15, '/assets/maps/vandorn_farm/tiles/5/17/15.png'),
(901, 17, 5, 17, 16, '/assets/maps/vandorn_farm/tiles/5/17/16.png'),
(902, 17, 5, 17, 17, '/assets/maps/vandorn_farm/tiles/5/17/17.png'),
(903, 17, 5, 17, 18, '/assets/maps/vandorn_farm/tiles/5/17/18.png'),
(904, 17, 5, 17, 19, '/assets/maps/vandorn_farm/tiles/5/17/19.png'),
(905, 17, 5, 17, 20, '/assets/maps/vandorn_farm/tiles/5/17/20.png'),
(906, 17, 5, 17, 21, '/assets/maps/vandorn_farm/tiles/5/17/21.png'),
(907, 17, 5, 17, 22, '/assets/maps/vandorn_farm/tiles/5/17/22.png'),
(908, 17, 5, 17, 23, '/assets/maps/vandorn_farm/tiles/5/17/23.png'),
(909, 17, 5, 17, 24, '/assets/maps/vandorn_farm/tiles/5/17/24.png'),
(910, 17, 5, 17, 25, '/assets/maps/vandorn_farm/tiles/5/17/25.png'),
(911, 17, 5, 17, 26, '/assets/maps/vandorn_farm/tiles/5/17/26.png'),
(912, 17, 5, 17, 27, '/assets/maps/vandorn_farm/tiles/5/17/27.png'),
(913, 17, 5, 17, 28, '/assets/maps/vandorn_farm/tiles/5/17/28.png'),
(914, 17, 5, 17, 29, '/assets/maps/vandorn_farm/tiles/5/17/29.png'),
(915, 17, 5, 17, 30, '/assets/maps/vandorn_farm/tiles/5/17/30.png'),
(916, 17, 5, 17, 31, '/assets/maps/vandorn_farm/tiles/5/17/31.png'),
(917, 17, 5, 18, 0, '/assets/maps/vandorn_farm/tiles/5/18/0.png'),
(918, 17, 5, 18, 1, '/assets/maps/vandorn_farm/tiles/5/18/1.png'),
(919, 17, 5, 18, 2, '/assets/maps/vandorn_farm/tiles/5/18/2.png'),
(920, 17, 5, 18, 3, '/assets/maps/vandorn_farm/tiles/5/18/3.png'),
(921, 17, 5, 18, 4, '/assets/maps/vandorn_farm/tiles/5/18/4.png'),
(922, 17, 5, 18, 5, '/assets/maps/vandorn_farm/tiles/5/18/5.png'),
(923, 17, 5, 18, 6, '/assets/maps/vandorn_farm/tiles/5/18/6.png'),
(924, 17, 5, 18, 7, '/assets/maps/vandorn_farm/tiles/5/18/7.png'),
(925, 17, 5, 18, 8, '/assets/maps/vandorn_farm/tiles/5/18/8.png'),
(926, 17, 5, 18, 9, '/assets/maps/vandorn_farm/tiles/5/18/9.png'),
(927, 17, 5, 18, 10, '/assets/maps/vandorn_farm/tiles/5/18/10.png'),
(928, 17, 5, 18, 11, '/assets/maps/vandorn_farm/tiles/5/18/11.png'),
(929, 17, 5, 18, 12, '/assets/maps/vandorn_farm/tiles/5/18/12.png'),
(930, 17, 5, 18, 13, '/assets/maps/vandorn_farm/tiles/5/18/13.png'),
(931, 17, 5, 18, 14, '/assets/maps/vandorn_farm/tiles/5/18/14.png'),
(932, 17, 5, 18, 15, '/assets/maps/vandorn_farm/tiles/5/18/15.png'),
(933, 17, 5, 18, 16, '/assets/maps/vandorn_farm/tiles/5/18/16.png'),
(934, 17, 5, 18, 17, '/assets/maps/vandorn_farm/tiles/5/18/17.png'),
(935, 17, 5, 18, 18, '/assets/maps/vandorn_farm/tiles/5/18/18.png'),
(936, 17, 5, 18, 19, '/assets/maps/vandorn_farm/tiles/5/18/19.png'),
(937, 17, 5, 18, 20, '/assets/maps/vandorn_farm/tiles/5/18/20.png'),
(938, 17, 5, 18, 21, '/assets/maps/vandorn_farm/tiles/5/18/21.png'),
(939, 17, 5, 18, 22, '/assets/maps/vandorn_farm/tiles/5/18/22.png'),
(940, 17, 5, 18, 23, '/assets/maps/vandorn_farm/tiles/5/18/23.png'),
(941, 17, 5, 18, 24, '/assets/maps/vandorn_farm/tiles/5/18/24.png'),
(942, 17, 5, 18, 25, '/assets/maps/vandorn_farm/tiles/5/18/25.png'),
(943, 17, 5, 18, 26, '/assets/maps/vandorn_farm/tiles/5/18/26.png'),
(944, 17, 5, 18, 27, '/assets/maps/vandorn_farm/tiles/5/18/27.png'),
(945, 17, 5, 18, 28, '/assets/maps/vandorn_farm/tiles/5/18/28.png'),
(946, 17, 5, 18, 29, '/assets/maps/vandorn_farm/tiles/5/18/29.png'),
(947, 17, 5, 18, 30, '/assets/maps/vandorn_farm/tiles/5/18/30.png'),
(948, 17, 5, 18, 31, '/assets/maps/vandorn_farm/tiles/5/18/31.png'),
(949, 17, 5, 19, 0, '/assets/maps/vandorn_farm/tiles/5/19/0.png'),
(950, 17, 5, 19, 1, '/assets/maps/vandorn_farm/tiles/5/19/1.png'),
(951, 17, 5, 19, 2, '/assets/maps/vandorn_farm/tiles/5/19/2.png'),
(952, 17, 5, 19, 3, '/assets/maps/vandorn_farm/tiles/5/19/3.png'),
(953, 17, 5, 19, 4, '/assets/maps/vandorn_farm/tiles/5/19/4.png'),
(954, 17, 5, 19, 5, '/assets/maps/vandorn_farm/tiles/5/19/5.png'),
(955, 17, 5, 19, 6, '/assets/maps/vandorn_farm/tiles/5/19/6.png'),
(956, 17, 5, 19, 7, '/assets/maps/vandorn_farm/tiles/5/19/7.png'),
(957, 17, 5, 19, 8, '/assets/maps/vandorn_farm/tiles/5/19/8.png'),
(958, 17, 5, 19, 9, '/assets/maps/vandorn_farm/tiles/5/19/9.png'),
(959, 17, 5, 19, 10, '/assets/maps/vandorn_farm/tiles/5/19/10.png'),
(960, 17, 5, 19, 11, '/assets/maps/vandorn_farm/tiles/5/19/11.png'),
(961, 17, 5, 19, 12, '/assets/maps/vandorn_farm/tiles/5/19/12.png'),
(962, 17, 5, 19, 13, '/assets/maps/vandorn_farm/tiles/5/19/13.png'),
(963, 17, 5, 19, 14, '/assets/maps/vandorn_farm/tiles/5/19/14.png'),
(964, 17, 5, 19, 15, '/assets/maps/vandorn_farm/tiles/5/19/15.png'),
(965, 17, 5, 19, 16, '/assets/maps/vandorn_farm/tiles/5/19/16.png'),
(966, 17, 5, 19, 17, '/assets/maps/vandorn_farm/tiles/5/19/17.png'),
(967, 17, 5, 19, 18, '/assets/maps/vandorn_farm/tiles/5/19/18.png'),
(968, 17, 5, 19, 19, '/assets/maps/vandorn_farm/tiles/5/19/19.png'),
(969, 17, 5, 19, 20, '/assets/maps/vandorn_farm/tiles/5/19/20.png'),
(970, 17, 5, 19, 21, '/assets/maps/vandorn_farm/tiles/5/19/21.png'),
(971, 17, 5, 19, 22, '/assets/maps/vandorn_farm/tiles/5/19/22.png'),
(972, 17, 5, 19, 23, '/assets/maps/vandorn_farm/tiles/5/19/23.png'),
(973, 17, 5, 19, 24, '/assets/maps/vandorn_farm/tiles/5/19/24.png'),
(974, 17, 5, 19, 25, '/assets/maps/vandorn_farm/tiles/5/19/25.png'),
(975, 17, 5, 19, 26, '/assets/maps/vandorn_farm/tiles/5/19/26.png'),
(976, 17, 5, 19, 27, '/assets/maps/vandorn_farm/tiles/5/19/27.png'),
(977, 17, 5, 19, 28, '/assets/maps/vandorn_farm/tiles/5/19/28.png'),
(978, 17, 5, 19, 29, '/assets/maps/vandorn_farm/tiles/5/19/29.png'),
(979, 17, 5, 19, 30, '/assets/maps/vandorn_farm/tiles/5/19/30.png'),
(980, 17, 5, 19, 31, '/assets/maps/vandorn_farm/tiles/5/19/31.png'),
(981, 17, 5, 20, 0, '/assets/maps/vandorn_farm/tiles/5/20/0.png'),
(982, 17, 5, 20, 1, '/assets/maps/vandorn_farm/tiles/5/20/1.png'),
(983, 17, 5, 20, 2, '/assets/maps/vandorn_farm/tiles/5/20/2.png'),
(984, 17, 5, 20, 3, '/assets/maps/vandorn_farm/tiles/5/20/3.png'),
(985, 17, 5, 20, 4, '/assets/maps/vandorn_farm/tiles/5/20/4.png'),
(986, 17, 5, 20, 5, '/assets/maps/vandorn_farm/tiles/5/20/5.png'),
(987, 17, 5, 20, 6, '/assets/maps/vandorn_farm/tiles/5/20/6.png'),
(988, 17, 5, 20, 7, '/assets/maps/vandorn_farm/tiles/5/20/7.png'),
(989, 17, 5, 20, 8, '/assets/maps/vandorn_farm/tiles/5/20/8.png'),
(990, 17, 5, 20, 9, '/assets/maps/vandorn_farm/tiles/5/20/9.png'),
(991, 17, 5, 20, 10, '/assets/maps/vandorn_farm/tiles/5/20/10.png'),
(992, 17, 5, 20, 11, '/assets/maps/vandorn_farm/tiles/5/20/11.png'),
(993, 17, 5, 20, 12, '/assets/maps/vandorn_farm/tiles/5/20/12.png'),
(994, 17, 5, 20, 13, '/assets/maps/vandorn_farm/tiles/5/20/13.png'),
(995, 17, 5, 20, 14, '/assets/maps/vandorn_farm/tiles/5/20/14.png'),
(996, 17, 5, 20, 15, '/assets/maps/vandorn_farm/tiles/5/20/15.png'),
(997, 17, 5, 20, 16, '/assets/maps/vandorn_farm/tiles/5/20/16.png'),
(998, 17, 5, 20, 17, '/assets/maps/vandorn_farm/tiles/5/20/17.png'),
(999, 17, 5, 20, 18, '/assets/maps/vandorn_farm/tiles/5/20/18.png'),
(1000, 17, 5, 20, 19, '/assets/maps/vandorn_farm/tiles/5/20/19.png'),
(1001, 17, 5, 20, 20, '/assets/maps/vandorn_farm/tiles/5/20/20.png'),
(1002, 17, 5, 20, 21, '/assets/maps/vandorn_farm/tiles/5/20/21.png'),
(1003, 17, 5, 20, 22, '/assets/maps/vandorn_farm/tiles/5/20/22.png'),
(1004, 17, 5, 20, 23, '/assets/maps/vandorn_farm/tiles/5/20/23.png'),
(1005, 17, 5, 20, 24, '/assets/maps/vandorn_farm/tiles/5/20/24.png'),
(1006, 17, 5, 20, 25, '/assets/maps/vandorn_farm/tiles/5/20/25.png'),
(1007, 17, 5, 20, 26, '/assets/maps/vandorn_farm/tiles/5/20/26.png'),
(1008, 17, 5, 20, 27, '/assets/maps/vandorn_farm/tiles/5/20/27.png'),
(1009, 17, 5, 20, 28, '/assets/maps/vandorn_farm/tiles/5/20/28.png'),
(1010, 17, 5, 20, 29, '/assets/maps/vandorn_farm/tiles/5/20/29.png'),
(1011, 17, 5, 20, 30, '/assets/maps/vandorn_farm/tiles/5/20/30.png'),
(1012, 17, 5, 20, 31, '/assets/maps/vandorn_farm/tiles/5/20/31.png'),
(1013, 17, 5, 21, 0, '/assets/maps/vandorn_farm/tiles/5/21/0.png'),
(1014, 17, 5, 21, 1, '/assets/maps/vandorn_farm/tiles/5/21/1.png'),
(1015, 17, 5, 21, 2, '/assets/maps/vandorn_farm/tiles/5/21/2.png'),
(1016, 17, 5, 21, 3, '/assets/maps/vandorn_farm/tiles/5/21/3.png'),
(1017, 17, 5, 21, 4, '/assets/maps/vandorn_farm/tiles/5/21/4.png'),
(1018, 17, 5, 21, 5, '/assets/maps/vandorn_farm/tiles/5/21/5.png'),
(1019, 17, 5, 21, 6, '/assets/maps/vandorn_farm/tiles/5/21/6.png'),
(1020, 17, 5, 21, 7, '/assets/maps/vandorn_farm/tiles/5/21/7.png'),
(1021, 17, 5, 21, 8, '/assets/maps/vandorn_farm/tiles/5/21/8.png'),
(1022, 17, 5, 21, 9, '/assets/maps/vandorn_farm/tiles/5/21/9.png'),
(1023, 17, 5, 21, 10, '/assets/maps/vandorn_farm/tiles/5/21/10.png'),
(1024, 17, 5, 21, 11, '/assets/maps/vandorn_farm/tiles/5/21/11.png'),
(1025, 17, 5, 21, 12, '/assets/maps/vandorn_farm/tiles/5/21/12.png'),
(1026, 17, 5, 21, 13, '/assets/maps/vandorn_farm/tiles/5/21/13.png'),
(1027, 17, 5, 21, 14, '/assets/maps/vandorn_farm/tiles/5/21/14.png'),
(1028, 17, 5, 21, 15, '/assets/maps/vandorn_farm/tiles/5/21/15.png'),
(1029, 17, 5, 21, 16, '/assets/maps/vandorn_farm/tiles/5/21/16.png'),
(1030, 17, 5, 21, 17, '/assets/maps/vandorn_farm/tiles/5/21/17.png'),
(1031, 17, 5, 21, 18, '/assets/maps/vandorn_farm/tiles/5/21/18.png'),
(1032, 17, 5, 21, 19, '/assets/maps/vandorn_farm/tiles/5/21/19.png'),
(1033, 17, 5, 21, 20, '/assets/maps/vandorn_farm/tiles/5/21/20.png'),
(1034, 17, 5, 21, 21, '/assets/maps/vandorn_farm/tiles/5/21/21.png'),
(1035, 17, 5, 21, 22, '/assets/maps/vandorn_farm/tiles/5/21/22.png'),
(1036, 17, 5, 21, 23, '/assets/maps/vandorn_farm/tiles/5/21/23.png'),
(1037, 17, 5, 21, 24, '/assets/maps/vandorn_farm/tiles/5/21/24.png'),
(1038, 17, 5, 21, 25, '/assets/maps/vandorn_farm/tiles/5/21/25.png'),
(1039, 17, 5, 21, 26, '/assets/maps/vandorn_farm/tiles/5/21/26.png'),
(1040, 17, 5, 21, 27, '/assets/maps/vandorn_farm/tiles/5/21/27.png'),
(1041, 17, 5, 21, 28, '/assets/maps/vandorn_farm/tiles/5/21/28.png'),
(1042, 17, 5, 21, 29, '/assets/maps/vandorn_farm/tiles/5/21/29.png'),
(1043, 17, 5, 21, 30, '/assets/maps/vandorn_farm/tiles/5/21/30.png'),
(1044, 17, 5, 21, 31, '/assets/maps/vandorn_farm/tiles/5/21/31.png'),
(1045, 17, 5, 22, 0, '/assets/maps/vandorn_farm/tiles/5/22/0.png'),
(1046, 17, 5, 22, 1, '/assets/maps/vandorn_farm/tiles/5/22/1.png'),
(1047, 17, 5, 22, 2, '/assets/maps/vandorn_farm/tiles/5/22/2.png'),
(1048, 17, 5, 22, 3, '/assets/maps/vandorn_farm/tiles/5/22/3.png'),
(1049, 17, 5, 22, 4, '/assets/maps/vandorn_farm/tiles/5/22/4.png'),
(1050, 17, 5, 22, 5, '/assets/maps/vandorn_farm/tiles/5/22/5.png'),
(1051, 17, 5, 22, 6, '/assets/maps/vandorn_farm/tiles/5/22/6.png'),
(1052, 17, 5, 22, 7, '/assets/maps/vandorn_farm/tiles/5/22/7.png'),
(1053, 17, 5, 22, 8, '/assets/maps/vandorn_farm/tiles/5/22/8.png'),
(1054, 17, 5, 22, 9, '/assets/maps/vandorn_farm/tiles/5/22/9.png'),
(1055, 17, 5, 22, 10, '/assets/maps/vandorn_farm/tiles/5/22/10.png'),
(1056, 17, 5, 22, 11, '/assets/maps/vandorn_farm/tiles/5/22/11.png'),
(1057, 17, 5, 22, 12, '/assets/maps/vandorn_farm/tiles/5/22/12.png'),
(1058, 17, 5, 22, 13, '/assets/maps/vandorn_farm/tiles/5/22/13.png'),
(1059, 17, 5, 22, 14, '/assets/maps/vandorn_farm/tiles/5/22/14.png'),
(1060, 17, 5, 22, 15, '/assets/maps/vandorn_farm/tiles/5/22/15.png'),
(1061, 17, 5, 22, 16, '/assets/maps/vandorn_farm/tiles/5/22/16.png'),
(1062, 17, 5, 22, 17, '/assets/maps/vandorn_farm/tiles/5/22/17.png'),
(1063, 17, 5, 22, 18, '/assets/maps/vandorn_farm/tiles/5/22/18.png'),
(1064, 17, 5, 22, 19, '/assets/maps/vandorn_farm/tiles/5/22/19.png'),
(1065, 17, 5, 22, 20, '/assets/maps/vandorn_farm/tiles/5/22/20.png'),
(1066, 17, 5, 22, 21, '/assets/maps/vandorn_farm/tiles/5/22/21.png'),
(1067, 17, 5, 22, 22, '/assets/maps/vandorn_farm/tiles/5/22/22.png'),
(1068, 17, 5, 22, 23, '/assets/maps/vandorn_farm/tiles/5/22/23.png'),
(1069, 17, 5, 22, 24, '/assets/maps/vandorn_farm/tiles/5/22/24.png'),
(1070, 17, 5, 22, 25, '/assets/maps/vandorn_farm/tiles/5/22/25.png'),
(1071, 17, 5, 22, 26, '/assets/maps/vandorn_farm/tiles/5/22/26.png'),
(1072, 17, 5, 22, 27, '/assets/maps/vandorn_farm/tiles/5/22/27.png'),
(1073, 17, 5, 22, 28, '/assets/maps/vandorn_farm/tiles/5/22/28.png'),
(1074, 17, 5, 22, 29, '/assets/maps/vandorn_farm/tiles/5/22/29.png'),
(1075, 17, 5, 22, 30, '/assets/maps/vandorn_farm/tiles/5/22/30.png'),
(1076, 17, 5, 22, 31, '/assets/maps/vandorn_farm/tiles/5/22/31.png'),
(1077, 17, 5, 23, 0, '/assets/maps/vandorn_farm/tiles/5/23/0.png'),
(1078, 17, 5, 23, 1, '/assets/maps/vandorn_farm/tiles/5/23/1.png'),
(1079, 17, 5, 23, 2, '/assets/maps/vandorn_farm/tiles/5/23/2.png'),
(1080, 17, 5, 23, 3, '/assets/maps/vandorn_farm/tiles/5/23/3.png'),
(1081, 17, 5, 23, 4, '/assets/maps/vandorn_farm/tiles/5/23/4.png'),
(1082, 17, 5, 23, 5, '/assets/maps/vandorn_farm/tiles/5/23/5.png'),
(1083, 17, 5, 23, 6, '/assets/maps/vandorn_farm/tiles/5/23/6.png'),
(1084, 17, 5, 23, 7, '/assets/maps/vandorn_farm/tiles/5/23/7.png'),
(1085, 17, 5, 23, 8, '/assets/maps/vandorn_farm/tiles/5/23/8.png'),
(1086, 17, 5, 23, 9, '/assets/maps/vandorn_farm/tiles/5/23/9.png'),
(1087, 17, 5, 23, 10, '/assets/maps/vandorn_farm/tiles/5/23/10.png'),
(1088, 17, 5, 23, 11, '/assets/maps/vandorn_farm/tiles/5/23/11.png'),
(1089, 17, 5, 23, 12, '/assets/maps/vandorn_farm/tiles/5/23/12.png'),
(1090, 17, 5, 23, 13, '/assets/maps/vandorn_farm/tiles/5/23/13.png'),
(1091, 17, 5, 23, 14, '/assets/maps/vandorn_farm/tiles/5/23/14.png'),
(1092, 17, 5, 23, 15, '/assets/maps/vandorn_farm/tiles/5/23/15.png'),
(1093, 17, 5, 23, 16, '/assets/maps/vandorn_farm/tiles/5/23/16.png'),
(1094, 17, 5, 23, 17, '/assets/maps/vandorn_farm/tiles/5/23/17.png'),
(1095, 17, 5, 23, 18, '/assets/maps/vandorn_farm/tiles/5/23/18.png'),
(1096, 17, 5, 23, 19, '/assets/maps/vandorn_farm/tiles/5/23/19.png'),
(1097, 17, 5, 23, 20, '/assets/maps/vandorn_farm/tiles/5/23/20.png'),
(1098, 17, 5, 23, 21, '/assets/maps/vandorn_farm/tiles/5/23/21.png'),
(1099, 17, 5, 23, 22, '/assets/maps/vandorn_farm/tiles/5/23/22.png'),
(1100, 17, 5, 23, 23, '/assets/maps/vandorn_farm/tiles/5/23/23.png'),
(1101, 17, 5, 23, 24, '/assets/maps/vandorn_farm/tiles/5/23/24.png'),
(1102, 17, 5, 23, 25, '/assets/maps/vandorn_farm/tiles/5/23/25.png'),
(1103, 17, 5, 23, 26, '/assets/maps/vandorn_farm/tiles/5/23/26.png'),
(1104, 17, 5, 23, 27, '/assets/maps/vandorn_farm/tiles/5/23/27.png'),
(1105, 17, 5, 23, 28, '/assets/maps/vandorn_farm/tiles/5/23/28.png'),
(1106, 17, 5, 23, 29, '/assets/maps/vandorn_farm/tiles/5/23/29.png'),
(1107, 17, 5, 23, 30, '/assets/maps/vandorn_farm/tiles/5/23/30.png'),
(1108, 17, 5, 23, 31, '/assets/maps/vandorn_farm/tiles/5/23/31.png'),
(1109, 17, 5, 24, 0, '/assets/maps/vandorn_farm/tiles/5/24/0.png'),
(1110, 17, 5, 24, 1, '/assets/maps/vandorn_farm/tiles/5/24/1.png'),
(1111, 17, 5, 24, 2, '/assets/maps/vandorn_farm/tiles/5/24/2.png'),
(1112, 17, 5, 24, 3, '/assets/maps/vandorn_farm/tiles/5/24/3.png'),
(1113, 17, 5, 24, 4, '/assets/maps/vandorn_farm/tiles/5/24/4.png'),
(1114, 17, 5, 24, 5, '/assets/maps/vandorn_farm/tiles/5/24/5.png'),
(1115, 17, 5, 24, 6, '/assets/maps/vandorn_farm/tiles/5/24/6.png'),
(1116, 17, 5, 24, 7, '/assets/maps/vandorn_farm/tiles/5/24/7.png'),
(1117, 17, 5, 24, 8, '/assets/maps/vandorn_farm/tiles/5/24/8.png'),
(1118, 17, 5, 24, 9, '/assets/maps/vandorn_farm/tiles/5/24/9.png'),
(1119, 17, 5, 24, 10, '/assets/maps/vandorn_farm/tiles/5/24/10.png'),
(1120, 17, 5, 24, 11, '/assets/maps/vandorn_farm/tiles/5/24/11.png'),
(1121, 17, 5, 24, 12, '/assets/maps/vandorn_farm/tiles/5/24/12.png'),
(1122, 17, 5, 24, 13, '/assets/maps/vandorn_farm/tiles/5/24/13.png'),
(1123, 17, 5, 24, 14, '/assets/maps/vandorn_farm/tiles/5/24/14.png'),
(1124, 17, 5, 24, 15, '/assets/maps/vandorn_farm/tiles/5/24/15.png'),
(1125, 17, 5, 24, 16, '/assets/maps/vandorn_farm/tiles/5/24/16.png'),
(1126, 17, 5, 24, 17, '/assets/maps/vandorn_farm/tiles/5/24/17.png'),
(1127, 17, 5, 24, 18, '/assets/maps/vandorn_farm/tiles/5/24/18.png'),
(1128, 17, 5, 24, 19, '/assets/maps/vandorn_farm/tiles/5/24/19.png'),
(1129, 17, 5, 24, 20, '/assets/maps/vandorn_farm/tiles/5/24/20.png'),
(1130, 17, 5, 24, 21, '/assets/maps/vandorn_farm/tiles/5/24/21.png'),
(1131, 17, 5, 24, 22, '/assets/maps/vandorn_farm/tiles/5/24/22.png'),
(1132, 17, 5, 24, 23, '/assets/maps/vandorn_farm/tiles/5/24/23.png'),
(1133, 17, 5, 24, 24, '/assets/maps/vandorn_farm/tiles/5/24/24.png'),
(1134, 17, 5, 24, 25, '/assets/maps/vandorn_farm/tiles/5/24/25.png'),
(1135, 17, 5, 24, 26, '/assets/maps/vandorn_farm/tiles/5/24/26.png'),
(1136, 17, 5, 24, 27, '/assets/maps/vandorn_farm/tiles/5/24/27.png'),
(1137, 17, 5, 24, 28, '/assets/maps/vandorn_farm/tiles/5/24/28.png'),
(1138, 17, 5, 24, 29, '/assets/maps/vandorn_farm/tiles/5/24/29.png'),
(1139, 17, 5, 24, 30, '/assets/maps/vandorn_farm/tiles/5/24/30.png'),
(1140, 17, 5, 24, 31, '/assets/maps/vandorn_farm/tiles/5/24/31.png'),
(1141, 17, 5, 25, 0, '/assets/maps/vandorn_farm/tiles/5/25/0.png'),
(1142, 17, 5, 25, 1, '/assets/maps/vandorn_farm/tiles/5/25/1.png'),
(1143, 17, 5, 25, 2, '/assets/maps/vandorn_farm/tiles/5/25/2.png'),
(1144, 17, 5, 25, 3, '/assets/maps/vandorn_farm/tiles/5/25/3.png'),
(1145, 17, 5, 25, 4, '/assets/maps/vandorn_farm/tiles/5/25/4.png'),
(1146, 17, 5, 25, 5, '/assets/maps/vandorn_farm/tiles/5/25/5.png'),
(1147, 17, 5, 25, 6, '/assets/maps/vandorn_farm/tiles/5/25/6.png'),
(1148, 17, 5, 25, 7, '/assets/maps/vandorn_farm/tiles/5/25/7.png'),
(1149, 17, 5, 25, 8, '/assets/maps/vandorn_farm/tiles/5/25/8.png'),
(1150, 17, 5, 25, 9, '/assets/maps/vandorn_farm/tiles/5/25/9.png'),
(1151, 17, 5, 25, 10, '/assets/maps/vandorn_farm/tiles/5/25/10.png'),
(1152, 17, 5, 25, 11, '/assets/maps/vandorn_farm/tiles/5/25/11.png'),
(1153, 17, 5, 25, 12, '/assets/maps/vandorn_farm/tiles/5/25/12.png'),
(1154, 17, 5, 25, 13, '/assets/maps/vandorn_farm/tiles/5/25/13.png'),
(1155, 17, 5, 25, 14, '/assets/maps/vandorn_farm/tiles/5/25/14.png'),
(1156, 17, 5, 25, 15, '/assets/maps/vandorn_farm/tiles/5/25/15.png'),
(1157, 17, 5, 25, 16, '/assets/maps/vandorn_farm/tiles/5/25/16.png'),
(1158, 17, 5, 25, 17, '/assets/maps/vandorn_farm/tiles/5/25/17.png'),
(1159, 17, 5, 25, 18, '/assets/maps/vandorn_farm/tiles/5/25/18.png'),
(1160, 17, 5, 25, 19, '/assets/maps/vandorn_farm/tiles/5/25/19.png'),
(1161, 17, 5, 25, 20, '/assets/maps/vandorn_farm/tiles/5/25/20.png'),
(1162, 17, 5, 25, 21, '/assets/maps/vandorn_farm/tiles/5/25/21.png'),
(1163, 17, 5, 25, 22, '/assets/maps/vandorn_farm/tiles/5/25/22.png'),
(1164, 17, 5, 25, 23, '/assets/maps/vandorn_farm/tiles/5/25/23.png'),
(1165, 17, 5, 25, 24, '/assets/maps/vandorn_farm/tiles/5/25/24.png'),
(1166, 17, 5, 25, 25, '/assets/maps/vandorn_farm/tiles/5/25/25.png'),
(1167, 17, 5, 25, 26, '/assets/maps/vandorn_farm/tiles/5/25/26.png'),
(1168, 17, 5, 25, 27, '/assets/maps/vandorn_farm/tiles/5/25/27.png'),
(1169, 17, 5, 25, 28, '/assets/maps/vandorn_farm/tiles/5/25/28.png'),
(1170, 17, 5, 25, 29, '/assets/maps/vandorn_farm/tiles/5/25/29.png'),
(1171, 17, 5, 25, 30, '/assets/maps/vandorn_farm/tiles/5/25/30.png'),
(1172, 17, 5, 25, 31, '/assets/maps/vandorn_farm/tiles/5/25/31.png'),
(1173, 17, 5, 26, 0, '/assets/maps/vandorn_farm/tiles/5/26/0.png'),
(1174, 17, 5, 26, 1, '/assets/maps/vandorn_farm/tiles/5/26/1.png'),
(1175, 17, 5, 26, 2, '/assets/maps/vandorn_farm/tiles/5/26/2.png'),
(1176, 17, 5, 26, 3, '/assets/maps/vandorn_farm/tiles/5/26/3.png'),
(1177, 17, 5, 26, 4, '/assets/maps/vandorn_farm/tiles/5/26/4.png'),
(1178, 17, 5, 26, 5, '/assets/maps/vandorn_farm/tiles/5/26/5.png'),
(1179, 17, 5, 26, 6, '/assets/maps/vandorn_farm/tiles/5/26/6.png'),
(1180, 17, 5, 26, 7, '/assets/maps/vandorn_farm/tiles/5/26/7.png'),
(1181, 17, 5, 26, 8, '/assets/maps/vandorn_farm/tiles/5/26/8.png'),
(1182, 17, 5, 26, 9, '/assets/maps/vandorn_farm/tiles/5/26/9.png'),
(1183, 17, 5, 26, 10, '/assets/maps/vandorn_farm/tiles/5/26/10.png'),
(1184, 17, 5, 26, 11, '/assets/maps/vandorn_farm/tiles/5/26/11.png'),
(1185, 17, 5, 26, 12, '/assets/maps/vandorn_farm/tiles/5/26/12.png'),
(1186, 17, 5, 26, 13, '/assets/maps/vandorn_farm/tiles/5/26/13.png'),
(1187, 17, 5, 26, 14, '/assets/maps/vandorn_farm/tiles/5/26/14.png'),
(1188, 17, 5, 26, 15, '/assets/maps/vandorn_farm/tiles/5/26/15.png'),
(1189, 17, 5, 26, 16, '/assets/maps/vandorn_farm/tiles/5/26/16.png'),
(1190, 17, 5, 26, 17, '/assets/maps/vandorn_farm/tiles/5/26/17.png'),
(1191, 17, 5, 26, 18, '/assets/maps/vandorn_farm/tiles/5/26/18.png'),
(1192, 17, 5, 26, 19, '/assets/maps/vandorn_farm/tiles/5/26/19.png'),
(1193, 17, 5, 26, 20, '/assets/maps/vandorn_farm/tiles/5/26/20.png'),
(1194, 17, 5, 26, 21, '/assets/maps/vandorn_farm/tiles/5/26/21.png'),
(1195, 17, 5, 26, 22, '/assets/maps/vandorn_farm/tiles/5/26/22.png'),
(1196, 17, 5, 26, 23, '/assets/maps/vandorn_farm/tiles/5/26/23.png'),
(1197, 17, 5, 26, 24, '/assets/maps/vandorn_farm/tiles/5/26/24.png'),
(1198, 17, 5, 26, 25, '/assets/maps/vandorn_farm/tiles/5/26/25.png'),
(1199, 17, 5, 26, 26, '/assets/maps/vandorn_farm/tiles/5/26/26.png'),
(1200, 17, 5, 26, 27, '/assets/maps/vandorn_farm/tiles/5/26/27.png'),
(1201, 17, 5, 26, 28, '/assets/maps/vandorn_farm/tiles/5/26/28.png'),
(1202, 17, 5, 26, 29, '/assets/maps/vandorn_farm/tiles/5/26/29.png'),
(1203, 17, 5, 26, 30, '/assets/maps/vandorn_farm/tiles/5/26/30.png'),
(1204, 17, 5, 26, 31, '/assets/maps/vandorn_farm/tiles/5/26/31.png'),
(1205, 17, 5, 27, 0, '/assets/maps/vandorn_farm/tiles/5/27/0.png'),
(1206, 17, 5, 27, 1, '/assets/maps/vandorn_farm/tiles/5/27/1.png'),
(1207, 17, 5, 27, 2, '/assets/maps/vandorn_farm/tiles/5/27/2.png'),
(1208, 17, 5, 27, 3, '/assets/maps/vandorn_farm/tiles/5/27/3.png'),
(1209, 17, 5, 27, 4, '/assets/maps/vandorn_farm/tiles/5/27/4.png'),
(1210, 17, 5, 27, 5, '/assets/maps/vandorn_farm/tiles/5/27/5.png'),
(1211, 17, 5, 27, 6, '/assets/maps/vandorn_farm/tiles/5/27/6.png'),
(1212, 17, 5, 27, 7, '/assets/maps/vandorn_farm/tiles/5/27/7.png'),
(1213, 17, 5, 27, 8, '/assets/maps/vandorn_farm/tiles/5/27/8.png'),
(1214, 17, 5, 27, 9, '/assets/maps/vandorn_farm/tiles/5/27/9.png'),
(1215, 17, 5, 27, 10, '/assets/maps/vandorn_farm/tiles/5/27/10.png'),
(1216, 17, 5, 27, 11, '/assets/maps/vandorn_farm/tiles/5/27/11.png'),
(1217, 17, 5, 27, 12, '/assets/maps/vandorn_farm/tiles/5/27/12.png'),
(1218, 17, 5, 27, 13, '/assets/maps/vandorn_farm/tiles/5/27/13.png'),
(1219, 17, 5, 27, 14, '/assets/maps/vandorn_farm/tiles/5/27/14.png'),
(1220, 17, 5, 27, 15, '/assets/maps/vandorn_farm/tiles/5/27/15.png'),
(1221, 17, 5, 27, 16, '/assets/maps/vandorn_farm/tiles/5/27/16.png'),
(1222, 17, 5, 27, 17, '/assets/maps/vandorn_farm/tiles/5/27/17.png'),
(1223, 17, 5, 27, 18, '/assets/maps/vandorn_farm/tiles/5/27/18.png'),
(1224, 17, 5, 27, 19, '/assets/maps/vandorn_farm/tiles/5/27/19.png'),
(1225, 17, 5, 27, 20, '/assets/maps/vandorn_farm/tiles/5/27/20.png'),
(1226, 17, 5, 27, 21, '/assets/maps/vandorn_farm/tiles/5/27/21.png'),
(1227, 17, 5, 27, 22, '/assets/maps/vandorn_farm/tiles/5/27/22.png'),
(1228, 17, 5, 27, 23, '/assets/maps/vandorn_farm/tiles/5/27/23.png'),
(1229, 17, 5, 27, 24, '/assets/maps/vandorn_farm/tiles/5/27/24.png'),
(1230, 17, 5, 27, 25, '/assets/maps/vandorn_farm/tiles/5/27/25.png'),
(1231, 17, 5, 27, 26, '/assets/maps/vandorn_farm/tiles/5/27/26.png'),
(1232, 17, 5, 27, 27, '/assets/maps/vandorn_farm/tiles/5/27/27.png'),
(1233, 17, 5, 27, 28, '/assets/maps/vandorn_farm/tiles/5/27/28.png'),
(1234, 17, 5, 27, 29, '/assets/maps/vandorn_farm/tiles/5/27/29.png'),
(1235, 17, 5, 27, 30, '/assets/maps/vandorn_farm/tiles/5/27/30.png'),
(1236, 17, 5, 27, 31, '/assets/maps/vandorn_farm/tiles/5/27/31.png'),
(1237, 17, 5, 28, 0, '/assets/maps/vandorn_farm/tiles/5/28/0.png'),
(1238, 17, 5, 28, 1, '/assets/maps/vandorn_farm/tiles/5/28/1.png'),
(1239, 17, 5, 28, 2, '/assets/maps/vandorn_farm/tiles/5/28/2.png'),
(1240, 17, 5, 28, 3, '/assets/maps/vandorn_farm/tiles/5/28/3.png'),
(1241, 17, 5, 28, 4, '/assets/maps/vandorn_farm/tiles/5/28/4.png'),
(1242, 17, 5, 28, 5, '/assets/maps/vandorn_farm/tiles/5/28/5.png'),
(1243, 17, 5, 28, 6, '/assets/maps/vandorn_farm/tiles/5/28/6.png'),
(1244, 17, 5, 28, 7, '/assets/maps/vandorn_farm/tiles/5/28/7.png'),
(1245, 17, 5, 28, 8, '/assets/maps/vandorn_farm/tiles/5/28/8.png'),
(1246, 17, 5, 28, 9, '/assets/maps/vandorn_farm/tiles/5/28/9.png'),
(1247, 17, 5, 28, 10, '/assets/maps/vandorn_farm/tiles/5/28/10.png'),
(1248, 17, 5, 28, 11, '/assets/maps/vandorn_farm/tiles/5/28/11.png'),
(1249, 17, 5, 28, 12, '/assets/maps/vandorn_farm/tiles/5/28/12.png'),
(1250, 17, 5, 28, 13, '/assets/maps/vandorn_farm/tiles/5/28/13.png'),
(1251, 17, 5, 28, 14, '/assets/maps/vandorn_farm/tiles/5/28/14.png'),
(1252, 17, 5, 28, 15, '/assets/maps/vandorn_farm/tiles/5/28/15.png'),
(1253, 17, 5, 28, 16, '/assets/maps/vandorn_farm/tiles/5/28/16.png'),
(1254, 17, 5, 28, 17, '/assets/maps/vandorn_farm/tiles/5/28/17.png'),
(1255, 17, 5, 28, 18, '/assets/maps/vandorn_farm/tiles/5/28/18.png'),
(1256, 17, 5, 28, 19, '/assets/maps/vandorn_farm/tiles/5/28/19.png'),
(1257, 17, 5, 28, 20, '/assets/maps/vandorn_farm/tiles/5/28/20.png'),
(1258, 17, 5, 28, 21, '/assets/maps/vandorn_farm/tiles/5/28/21.png'),
(1259, 17, 5, 28, 22, '/assets/maps/vandorn_farm/tiles/5/28/22.png'),
(1260, 17, 5, 28, 23, '/assets/maps/vandorn_farm/tiles/5/28/23.png'),
(1261, 17, 5, 28, 24, '/assets/maps/vandorn_farm/tiles/5/28/24.png'),
(1262, 17, 5, 28, 25, '/assets/maps/vandorn_farm/tiles/5/28/25.png'),
(1263, 17, 5, 28, 26, '/assets/maps/vandorn_farm/tiles/5/28/26.png'),
(1264, 17, 5, 28, 27, '/assets/maps/vandorn_farm/tiles/5/28/27.png'),
(1265, 17, 5, 28, 28, '/assets/maps/vandorn_farm/tiles/5/28/28.png'),
(1266, 17, 5, 28, 29, '/assets/maps/vandorn_farm/tiles/5/28/29.png'),
(1267, 17, 5, 28, 30, '/assets/maps/vandorn_farm/tiles/5/28/30.png'),
(1268, 17, 5, 28, 31, '/assets/maps/vandorn_farm/tiles/5/28/31.png'),
(1269, 17, 5, 29, 0, '/assets/maps/vandorn_farm/tiles/5/29/0.png'),
(1270, 17, 5, 29, 1, '/assets/maps/vandorn_farm/tiles/5/29/1.png'),
(1271, 17, 5, 29, 2, '/assets/maps/vandorn_farm/tiles/5/29/2.png'),
(1272, 17, 5, 29, 3, '/assets/maps/vandorn_farm/tiles/5/29/3.png'),
(1273, 17, 5, 29, 4, '/assets/maps/vandorn_farm/tiles/5/29/4.png'),
(1274, 17, 5, 29, 5, '/assets/maps/vandorn_farm/tiles/5/29/5.png'),
(1275, 17, 5, 29, 6, '/assets/maps/vandorn_farm/tiles/5/29/6.png'),
(1276, 17, 5, 29, 7, '/assets/maps/vandorn_farm/tiles/5/29/7.png'),
(1277, 17, 5, 29, 8, '/assets/maps/vandorn_farm/tiles/5/29/8.png'),
(1278, 17, 5, 29, 9, '/assets/maps/vandorn_farm/tiles/5/29/9.png'),
(1279, 17, 5, 29, 10, '/assets/maps/vandorn_farm/tiles/5/29/10.png'),
(1280, 17, 5, 29, 11, '/assets/maps/vandorn_farm/tiles/5/29/11.png'),
(1281, 17, 5, 29, 12, '/assets/maps/vandorn_farm/tiles/5/29/12.png'),
(1282, 17, 5, 29, 13, '/assets/maps/vandorn_farm/tiles/5/29/13.png'),
(1283, 17, 5, 29, 14, '/assets/maps/vandorn_farm/tiles/5/29/14.png'),
(1284, 17, 5, 29, 15, '/assets/maps/vandorn_farm/tiles/5/29/15.png'),
(1285, 17, 5, 29, 16, '/assets/maps/vandorn_farm/tiles/5/29/16.png'),
(1286, 17, 5, 29, 17, '/assets/maps/vandorn_farm/tiles/5/29/17.png'),
(1287, 17, 5, 29, 18, '/assets/maps/vandorn_farm/tiles/5/29/18.png'),
(1288, 17, 5, 29, 19, '/assets/maps/vandorn_farm/tiles/5/29/19.png'),
(1289, 17, 5, 29, 20, '/assets/maps/vandorn_farm/tiles/5/29/20.png'),
(1290, 17, 5, 29, 21, '/assets/maps/vandorn_farm/tiles/5/29/21.png'),
(1291, 17, 5, 29, 22, '/assets/maps/vandorn_farm/tiles/5/29/22.png'),
(1292, 17, 5, 29, 23, '/assets/maps/vandorn_farm/tiles/5/29/23.png'),
(1293, 17, 5, 29, 24, '/assets/maps/vandorn_farm/tiles/5/29/24.png'),
(1294, 17, 5, 29, 25, '/assets/maps/vandorn_farm/tiles/5/29/25.png'),
(1295, 17, 5, 29, 26, '/assets/maps/vandorn_farm/tiles/5/29/26.png'),
(1296, 17, 5, 29, 27, '/assets/maps/vandorn_farm/tiles/5/29/27.png'),
(1297, 17, 5, 29, 28, '/assets/maps/vandorn_farm/tiles/5/29/28.png'),
(1298, 17, 5, 29, 29, '/assets/maps/vandorn_farm/tiles/5/29/29.png'),
(1299, 17, 5, 29, 30, '/assets/maps/vandorn_farm/tiles/5/29/30.png'),
(1300, 17, 5, 29, 31, '/assets/maps/vandorn_farm/tiles/5/29/31.png'),
(1301, 17, 5, 30, 0, '/assets/maps/vandorn_farm/tiles/5/30/0.png'),
(1302, 17, 5, 30, 1, '/assets/maps/vandorn_farm/tiles/5/30/1.png'),
(1303, 17, 5, 30, 2, '/assets/maps/vandorn_farm/tiles/5/30/2.png'),
(1304, 17, 5, 30, 3, '/assets/maps/vandorn_farm/tiles/5/30/3.png'),
(1305, 17, 5, 30, 4, '/assets/maps/vandorn_farm/tiles/5/30/4.png'),
(1306, 17, 5, 30, 5, '/assets/maps/vandorn_farm/tiles/5/30/5.png'),
(1307, 17, 5, 30, 6, '/assets/maps/vandorn_farm/tiles/5/30/6.png'),
(1308, 17, 5, 30, 7, '/assets/maps/vandorn_farm/tiles/5/30/7.png'),
(1309, 17, 5, 30, 8, '/assets/maps/vandorn_farm/tiles/5/30/8.png'),
(1310, 17, 5, 30, 9, '/assets/maps/vandorn_farm/tiles/5/30/9.png'),
(1311, 17, 5, 30, 10, '/assets/maps/vandorn_farm/tiles/5/30/10.png'),
(1312, 17, 5, 30, 11, '/assets/maps/vandorn_farm/tiles/5/30/11.png'),
(1313, 17, 5, 30, 12, '/assets/maps/vandorn_farm/tiles/5/30/12.png'),
(1314, 17, 5, 30, 13, '/assets/maps/vandorn_farm/tiles/5/30/13.png'),
(1315, 17, 5, 30, 14, '/assets/maps/vandorn_farm/tiles/5/30/14.png'),
(1316, 17, 5, 30, 15, '/assets/maps/vandorn_farm/tiles/5/30/15.png'),
(1317, 17, 5, 30, 16, '/assets/maps/vandorn_farm/tiles/5/30/16.png'),
(1318, 17, 5, 30, 17, '/assets/maps/vandorn_farm/tiles/5/30/17.png'),
(1319, 17, 5, 30, 18, '/assets/maps/vandorn_farm/tiles/5/30/18.png'),
(1320, 17, 5, 30, 19, '/assets/maps/vandorn_farm/tiles/5/30/19.png'),
(1321, 17, 5, 30, 20, '/assets/maps/vandorn_farm/tiles/5/30/20.png'),
(1322, 17, 5, 30, 21, '/assets/maps/vandorn_farm/tiles/5/30/21.png'),
(1323, 17, 5, 30, 22, '/assets/maps/vandorn_farm/tiles/5/30/22.png'),
(1324, 17, 5, 30, 23, '/assets/maps/vandorn_farm/tiles/5/30/23.png'),
(1325, 17, 5, 30, 24, '/assets/maps/vandorn_farm/tiles/5/30/24.png'),
(1326, 17, 5, 30, 25, '/assets/maps/vandorn_farm/tiles/5/30/25.png'),
(1327, 17, 5, 30, 26, '/assets/maps/vandorn_farm/tiles/5/30/26.png'),
(1328, 17, 5, 30, 27, '/assets/maps/vandorn_farm/tiles/5/30/27.png'),
(1329, 17, 5, 30, 28, '/assets/maps/vandorn_farm/tiles/5/30/28.png'),
(1330, 17, 5, 30, 29, '/assets/maps/vandorn_farm/tiles/5/30/29.png'),
(1331, 17, 5, 30, 30, '/assets/maps/vandorn_farm/tiles/5/30/30.png'),
(1332, 17, 5, 30, 31, '/assets/maps/vandorn_farm/tiles/5/30/31.png'),
(1333, 17, 5, 31, 0, '/assets/maps/vandorn_farm/tiles/5/31/0.png'),
(1334, 17, 5, 31, 1, '/assets/maps/vandorn_farm/tiles/5/31/1.png'),
(1335, 17, 5, 31, 2, '/assets/maps/vandorn_farm/tiles/5/31/2.png'),
(1336, 17, 5, 31, 3, '/assets/maps/vandorn_farm/tiles/5/31/3.png'),
(1337, 17, 5, 31, 4, '/assets/maps/vandorn_farm/tiles/5/31/4.png'),
(1338, 17, 5, 31, 5, '/assets/maps/vandorn_farm/tiles/5/31/5.png'),
(1339, 17, 5, 31, 6, '/assets/maps/vandorn_farm/tiles/5/31/6.png'),
(1340, 17, 5, 31, 7, '/assets/maps/vandorn_farm/tiles/5/31/7.png'),
(1341, 17, 5, 31, 8, '/assets/maps/vandorn_farm/tiles/5/31/8.png'),
(1342, 17, 5, 31, 9, '/assets/maps/vandorn_farm/tiles/5/31/9.png'),
(1343, 17, 5, 31, 10, '/assets/maps/vandorn_farm/tiles/5/31/10.png'),
(1344, 17, 5, 31, 11, '/assets/maps/vandorn_farm/tiles/5/31/11.png'),
(1345, 17, 5, 31, 12, '/assets/maps/vandorn_farm/tiles/5/31/12.png'),
(1346, 17, 5, 31, 13, '/assets/maps/vandorn_farm/tiles/5/31/13.png'),
(1347, 17, 5, 31, 14, '/assets/maps/vandorn_farm/tiles/5/31/14.png'),
(1348, 17, 5, 31, 15, '/assets/maps/vandorn_farm/tiles/5/31/15.png'),
(1349, 17, 5, 31, 16, '/assets/maps/vandorn_farm/tiles/5/31/16.png'),
(1350, 17, 5, 31, 17, '/assets/maps/vandorn_farm/tiles/5/31/17.png'),
(1351, 17, 5, 31, 18, '/assets/maps/vandorn_farm/tiles/5/31/18.png'),
(1352, 17, 5, 31, 19, '/assets/maps/vandorn_farm/tiles/5/31/19.png'),
(1353, 17, 5, 31, 20, '/assets/maps/vandorn_farm/tiles/5/31/20.png'),
(1354, 17, 5, 31, 21, '/assets/maps/vandorn_farm/tiles/5/31/21.png'),
(1355, 17, 5, 31, 22, '/assets/maps/vandorn_farm/tiles/5/31/22.png'),
(1356, 17, 5, 31, 23, '/assets/maps/vandorn_farm/tiles/5/31/23.png'),
(1357, 17, 5, 31, 24, '/assets/maps/vandorn_farm/tiles/5/31/24.png'),
(1358, 17, 5, 31, 25, '/assets/maps/vandorn_farm/tiles/5/31/25.png'),
(1359, 17, 5, 31, 26, '/assets/maps/vandorn_farm/tiles/5/31/26.png'),
(1360, 17, 5, 31, 27, '/assets/maps/vandorn_farm/tiles/5/31/27.png'),
(1361, 17, 5, 31, 28, '/assets/maps/vandorn_farm/tiles/5/31/28.png'),
(1362, 17, 5, 31, 29, '/assets/maps/vandorn_farm/tiles/5/31/29.png'),
(1363, 17, 5, 31, 30, '/assets/maps/vandorn_farm/tiles/5/31/30.png'),
(1364, 17, 5, 31, 31, '/assets/maps/vandorn_farm/tiles/5/31/31.png');

-- --------------------------------------------------------

--
-- Table structure for table `map_markers`
--

CREATE TABLE `map_markers` (
  `id` int NOT NULL,
  `map_id` int NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marker_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coord_x` decimal(10,2) NOT NULL,
  `coord_y` decimal(10,2) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_on_load` tinyint(1) DEFAULT 0,
  `properties` JSON DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_markers`
--

INSERT INTO `map_markers` (`id`, `map_id`, `category`, `marker_type`, `name`, `coord_x`, `coord_y`, `icon_url`, `hide_on_load`, `properties`) VALUES
(1, 1, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 697.00, 959.00, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(2, 1, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1022.00, 731.00, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(3, 1, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1452.00, 1141.00, '/assets/maps/blackheart/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(4, 1, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1022.00, 1060.00, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(5, 1, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 468.00, 1236.00, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(6, 1, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1426.00, 720.00, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(7, 1, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 633.00, 679.00, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(8, 1, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1353.00, 1303.00, '/assets/maps/blackheart/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(9, 1, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 937.00, 1208.00, '/assets/maps/blackheart/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(10, 1, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 582.00, 729.00, '/assets/maps/blackheart/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(11, 1, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn Point', 1744.00, 980.00, '/assets/maps/blackheart/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(12, 1, 'multiplayer_mainSpawnLocation', 'spawn', 'Guild Spawn', 364.00, 966.00, '/assets/maps/blackheart/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(13, 1, 'poiLabel', 'poi', 'Drill', 1028.00, 1175.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(14, 1, 'poiLabel', 'poi', 'Diving Bell', 1025.00, 748.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(15, 1, 'poiLabel', 'poi', 'Grinder Pit', 1025.00, 1383.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(16, 1, 'poiLabel', 'poi', 'Seabed Mining Vehicle', 364.00, 1012.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(17, 1, 'poiLabel', 'poi', 'Barge', 1639.00, 1041.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(18, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 786.00, 1460.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(19, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1219.00, 983.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(20, 2, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 782.00, 746.00, '/assets/maps/cortex/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(21, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 783.00, 1094.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(22, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1003.00, 750.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(23, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 830.00, 1492.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(24, 2, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1266.00, 1135.00, '/assets/maps/cortex/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(25, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1386.00, 1134.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(26, 2, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 805.00, 1189.00, '/assets/maps/cortex/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(27, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 976.00, 572.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(28, 2, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1066.00, 1641.00, '/assets/maps/cortex/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(29, 2, 'poiLabel', 'poi', 'Entrance', 961.00, 462.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(30, 2, 'poiLabel', 'poi', 'Vat Chamber', 655.00, 1136.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(31, 2, 'poiLabel', 'poi', 'Underpass', 1213.00, 1224.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(32, 2, 'poiLabel', 'poi', 'Skybridge', 1335.00, 1424.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(33, 2, 'poiLabel', 'poi', 'Maintenance', 1071.00, 1742.00, '/assets/maps/cortex/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Exposure Map Markers
(34, 3, 'poiLabel', 'poi', 'Loading', 380.00, 1014.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(35, 3, 'poiLabel', 'poi', 'Solar Panels', 1026.00, 789.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(36, 3, 'poiLabel', 'poi', 'Tower', 1026.00, 1188.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(37, 3, 'poiLabel', 'poi', 'Drone', 1026.00, 1384.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(38, 3, 'poiLabel', 'poi', 'Entrance', 1672.00, 1014.00, '/assets/maps/exposure/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(39, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 609.00, 1186.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(40, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1026.00, 1038.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(41, 3, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1455.00, 875.00, '/assets/maps/exposure/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(42, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1066.00, 1082.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(43, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1066.00, 707.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(44, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1346.00, 1041.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(45, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 799.00, 1072.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(46, 3, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1066.00, 1318.00, '/assets/maps/exposure/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(47, 3, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1139.00, 1190.00, '/assets/maps/exposure/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(48, 3, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1399.00, 806.00, '/assets/maps/exposure/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(49, 3, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 237.00, 1017.00, '/assets/maps/exposure/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(50, 3, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1818.00, 1028.00, '/assets/maps/exposure/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Imprint Map Markers
(51, 10, 'poiLabel', 'poi', 'Drones', 420.00, 1023.00, '/assets/maps/imprint/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(52, 10, 'poiLabel', 'poi', 'Cooling', 1025.00, 634.00, '/assets/maps/imprint/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(53, 10, 'poiLabel', 'poi', 'Robotics', 1025.00, 1030.00, '/assets/maps/imprint/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(54, 10, 'poiLabel', 'poi', 'Rollers', 1592.00, 1003.00, '/assets/maps/imprint/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(55, 10, 'poiLabel', 'poi', 'Scaffolding', 1025.00, 1320.00, '/assets/maps/imprint/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(56, 10, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 477.00, 1163.00, '/assets/maps/imprint/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(57, 10, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1025.00, 870.00, '/assets/maps/imprint/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(58, 10, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1585.00, 735.00, '/assets/maps/imprint/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(59, 10, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1071.00, 917.00, '/assets/maps/imprint/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(60, 10, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1468.00, 1295.00, '/assets/maps/imprint/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(61, 10, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 846.00, 962.00, '/assets/maps/imprint/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(62, 10, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1245.00, 609.00, '/assets/maps/imprint/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(63, 10, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 549.00, 696.00, '/assets/maps/imprint/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(64, 10, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1050.00, 940.00, '/assets/maps/imprint/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(65, 10, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 793.00, 1287.00, '/assets/maps/imprint/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(66, 10, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1785.00, 968.00, '/assets/maps/imprint/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(67, 10, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 226.00, 1021.00, '/assets/maps/imprint/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- The Forge Map Markers
(68, 15, 'poiLabel', 'poi', 'Driveway', 860.00, 482.00, '/assets/maps/the_forge/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(69, 15, 'poiLabel', 'poi', 'Demo', 1256.00, 786.00, '/assets/maps/the_forge/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(70, 15, 'poiLabel', 'poi', 'Observation', 1044.00, 1366.00, '/assets/maps/the_forge/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(71, 15, 'poiLabel', 'poi', 'Range', 970.00, 905.00, '/assets/maps/the_forge/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(72, 15, 'poiLabel', 'poi', 'Monument', 1276.00, 1492.00, '/assets/maps/the_forge/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(73, 15, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1004.00, 1517.00, '/assets/maps/the_forge/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(74, 15, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1027.00, 983.00, '/assets/maps/the_forge/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(75, 15, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1242.00, 580.00, '/assets/maps/the_forge/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(76, 15, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1065.00, 1020.00, '/assets/maps/the_forge/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(77, 15, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 785.00, 824.00, '/assets/maps/the_forge/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(78, 15, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1384.00, 1138.00, '/assets/maps/the_forge/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(79, 15, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 842.00, 1292.00, '/assets/maps/the_forge/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(80, 15, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1338.00, 546.00, '/assets/maps/the_forge/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(81, 15, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 897.00, 1036.00, '/assets/maps/the_forge/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(82, 15, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1299.00, 1284.00, '/assets/maps/the_forge/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(83, 15, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1017.00, 298.00, '/assets/maps/the_forge/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(84, 15, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1251.00, 1736.00, '/assets/maps/the_forge/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Toshin Map Markers
(85, 16, 'poiLabel', 'poi', 'Parking', 336.00, 1065.00, '/assets/maps/toshin/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(86, 16, 'poiLabel', 'poi', 'Apartment', 564.00, 1363.00, '/assets/maps/toshin/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(87, 16, 'poiLabel', 'poi', 'Station', 1040.00, 818.00, '/assets/maps/toshin/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(88, 16, 'poiLabel', 'poi', 'Monorail', 1040.00, 1336.00, '/assets/maps/toshin/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(89, 16, 'poiLabel', 'poi', 'Park', 1604.00, 1227.00, '/assets/maps/toshin/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(90, 16, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 403.00, 911.00, '/assets/maps/toshin/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(91, 16, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1044.00, 1175.00, '/assets/maps/toshin/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(92, 16, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1604.00, 1049.00, '/assets/maps/toshin/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(93, 16, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1085.00, 1223.00, '/assets/maps/toshin/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(94, 16, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 715.00, 1373.00, '/assets/maps/toshin/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(95, 16, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1277.00, 1164.00, '/assets/maps/toshin/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(96, 16, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 883.00, 816.00, '/assets/maps/toshin/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(97, 16, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1310.00, 806.00, '/assets/maps/toshin/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(98, 16, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1218.00, 1371.00, '/assets/maps/toshin/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(99, 16, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 171.00, 1096.00, '/assets/maps/toshin/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(100, 16, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1731.00, 1247.00, '/assets/maps/toshin/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Colossus Map Markers
(101, 4, 'poiLabel', 'poi', 'Fueling', 984.00, 453.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(102, 4, 'poiLabel', 'poi', 'Maintenance', 995.00, 727.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(103, 4, 'poiLabel', 'poi', 'Loading Bay', 995.00, 1220.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(104, 4, 'poiLabel', 'poi', 'Atrium', 810.00, 977.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(105, 4, 'poiLabel', 'poi', 'Lifeboat', 1290.00, 1022.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(106, 4, 'poiLabel', 'poi', 'Baggage Claim', 995.00, 1500.00, '/assets/maps/colossus/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(107, 4, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1157.00, 598.00, '/assets/maps/colossus/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(108, 4, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 704.00, 932.00, '/assets/maps/colossus/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(109, 4, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1162.00, 1263.00, '/assets/maps/colossus/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(110, 4, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1008.00, 977.00, '/assets/maps/colossus/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(111, 4, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 812.00, 1273.00, '/assets/maps/colossus/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(112, 4, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1308.00, 974.00, '/assets/maps/colossus/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(113, 4, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 808.00, 682.00, '/assets/maps/colossus/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(114, 4, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 710.00, 1067.00, '/assets/maps/colossus/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(115, 4, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1223.00, 1271.00, '/assets/maps/colossus/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(116, 4, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 972.00, 293.00, '/assets/maps/colossus/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(117, 4, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 958.00, 1698.00, '/assets/maps/colossus/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Flagship Map Markers
(118, 7, 'poiLabel', 'poi', 'Lock Gate', 432.00, 1150.00, '/assets/maps/flagship/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(119, 7, 'poiLabel', 'poi', 'Welding', 1066.00, 797.00, '/assets/maps/flagship/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(120, 7, 'poiLabel', 'poi', 'Underside', 1066.00, 1073.00, '/assets/maps/flagship/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(121, 7, 'poiLabel', 'poi', 'Dismantling', 1066.00, 1363.00, '/assets/maps/flagship/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(122, 7, 'poiLabel', 'poi', 'Site Management', 1661.00, 1010.00, '/assets/maps/flagship/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(123, 7, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1388.00, 854.00, '/assets/maps/flagship/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(124, 7, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1061.00, 923.00, '/assets/maps/flagship/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(125, 7, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 748.00, 873.00, '/assets/maps/flagship/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(126, 7, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1102.00, 965.00, '/assets/maps/flagship/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(127, 7, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1430.00, 1019.00, '/assets/maps/flagship/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(128, 7, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1099.00, 731.00, '/assets/maps/flagship/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(129, 7, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 769.00, 1038.00, '/assets/maps/flagship/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(130, 7, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1100.00, 1318.00, '/assets/maps/flagship/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(131, 7, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1045.00, 942.00, '/assets/maps/flagship/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(132, 7, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 703.00, 941.00, '/assets/maps/flagship/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(133, 7, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1742.00, 1080.00, '/assets/maps/flagship/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(134, 7, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 298.00, 1123.00, '/assets/maps/flagship/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Raid Map Markers
(135, 12, 'poiLabel', 'poi', 'Garden', 603.00, 987.00, '/assets/maps/raid/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(136, 12, 'poiLabel', 'poi', 'Pool', 1046.00, 760.00, '/assets/maps/raid/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(137, 12, 'poiLabel', 'poi', 'Courtyard', 1048.00, 1057.00, '/assets/maps/raid/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(138, 12, 'poiLabel', 'poi', 'Circle Drive', 1048.00, 1415.00, '/assets/maps/raid/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(139, 12, 'poiLabel', 'poi', 'Garage', 1581.00, 996.00, '/assets/maps/raid/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(140, 12, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 494.00, 896.00, '/assets/maps/raid/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(141, 12, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1045.00, 1146.00, '/assets/maps/raid/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(142, 12, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1507.00, 871.00, '/assets/maps/raid/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(143, 12, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1082.00, 1337.00, '/assets/maps/raid/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(144, 12, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 829.00, 958.00, '/assets/maps/raid/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(145, 12, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1718.00, 956.00, '/assets/maps/raid/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(146, 12, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 611.00, 601.00, '/assets/maps/raid/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(147, 12, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1084.00, 971.00, '/assets/maps/raid/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(148, 12, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 969.00, 1207.00, '/assets/maps/raid/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(149, 12, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 920.00, 639.00, '/assets/maps/raid/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(150, 12, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 366.00, 930.00, '/assets/maps/raid/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(151, 12, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1679.00, 886.00, '/assets/maps/raid/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Homestead Map Markers
(152, 9, 'poiLabel', 'poi', 'Ambush', 628.00, 462.00, '/assets/maps/homestead/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(153, 9, 'poiLabel', 'poi', 'Cabin', 961.00, 905.00, '/assets/maps/homestead/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(154, 9, 'poiLabel', 'poi', 'Water', 703.00, 1375.00, '/assets/maps/homestead/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(155, 9, 'poiLabel', 'poi', 'Boathouse', 1248.00, 1378.00, '/assets/maps/homestead/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(156, 9, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1078.00, 1101.00, '/assets/maps/homestead/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(157, 9, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 980.00, 765.00, '/assets/maps/homestead/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(158, 9, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 682.00, 583.00, '/assets/maps/homestead/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(159, 9, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1021.00, 801.00, '/assets/maps/homestead/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(160, 9, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 716.00, 1022.00, '/assets/maps/homestead/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(161, 9, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1137.00, 880.00, '/assets/maps/homestead/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(162, 9, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 780.00, 586.00, '/assets/maps/homestead/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(163, 9, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 1342.00, 1068.00, '/assets/maps/homestead/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(164, 9, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1321.00, 1068.00, '/assets/maps/homestead/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(165, 9, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 656.00, 998.00, '/assets/maps/homestead/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(166, 9, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1267.00, 1563.00, '/assets/maps/homestead/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(167, 9, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 429.00, 357.00, '/assets/maps/homestead/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Retrieval Map Markers
(168, 13, 'poiLabel', 'poi', 'River', 510.00, 985.00, '/assets/maps/retrieval/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(169, 13, 'poiLabel', 'poi', 'Hillside', 952.00, 790.00, '/assets/maps/retrieval/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(170, 13, 'poiLabel', 'poi', 'Wing', 976.00, 1103.00, '/assets/maps/retrieval/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(171, 13, 'poiLabel', 'poi', 'Shoreline', 985.00, 1283.00, '/assets/maps/retrieval/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(172, 13, 'poiLabel', 'poi', 'Glacier', 1496.00, 1078.00, '/assets/maps/retrieval/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(173, 13, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 732.00, 918.00, '/assets/maps/retrieval/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(174, 13, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1060.00, 1067.00, '/assets/maps/retrieval/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(175, 13, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1368.00, 1007.00, '/assets/maps/retrieval/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(176, 13, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1097.00, 1113.00, '/assets/maps/retrieval/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(177, 13, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 775.00, 961.00, '/assets/maps/retrieval/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(178, 13, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1257.00, 1231.00, '/assets/maps/retrieval/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(179, 13, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1132.00, 782.00, '/assets/maps/retrieval/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(180, 13, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1247.00, 1261.00, '/assets/maps/retrieval/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(181, 13, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1067.00, 929.00, '/assets/maps/retrieval/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(182, 13, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 355.00, 914.00, '/assets/maps/retrieval/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(183, 13, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1674.00, 1150.00, '/assets/maps/retrieval/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Den Map Markers
(184, 5, 'poiLabel', 'poi', 'Driveway', 1084.00, 400.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(185, 5, 'poiLabel', 'poi', 'Courtyard', 1068.00, 1083.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(186, 5, 'poiLabel', 'poi', 'Helipad', 737.00, 1060.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(187, 5, 'poiLabel', 'poi', 'Dojo', 738.00, 1237.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(188, 5, 'poiLabel', 'poi', 'Roof', 1368.00, 1018.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(189, 5, 'poiLabel', 'poi', 'Throne', 1083.00, 1514.00, '/assets/maps/den/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(190, 5, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1294.00, 637.00, '/assets/maps/den/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(191, 5, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1064.00, 978.00, '/assets/maps/den/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(192, 5, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 816.00, 1343.00, '/assets/maps/den/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(193, 5, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1104.00, 1022.00, '/assets/maps/den/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(194, 5, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1342.00, 776.00, '/assets/maps/den/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(195, 5, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 814.00, 1020.00, '/assets/maps/den/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(196, 5, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1358.00, 1423.00, '/assets/maps/den/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(197, 5, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1310.00, 1253.00, '/assets/maps/den/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(198, 5, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 736.00, 1014.00, '/assets/maps/den/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(199, 5, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1052.00, 323.00, '/assets/maps/den/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(200, 5, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 1080.00, 1670.00, '/assets/maps/den/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Scar Map Markers
(201, 14, 'poiLabel', 'poi', 'Shops', 605.00, 780.00, '/assets/maps/scar/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(202, 14, 'poiLabel', 'poi', 'Crash Site', 1105.00, 775.00, '/assets/maps/scar/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(203, 14, 'poiLabel', 'poi', 'Main Street', 1185.00, 1060.00, '/assets/maps/scar/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(204, 14, 'poiLabel', 'poi', 'Motel', 894.00, 1362.00, '/assets/maps/scar/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(205, 14, 'poiLabel', 'poi', 'Houses', 1517.00, 1446.00, '/assets/maps/scar/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(206, 14, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1420.00, 1224.00, '/assets/maps/scar/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(207, 14, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1063.00, 986.00, '/assets/maps/scar/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(208, 14, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 592.00, 873.00, '/assets/maps/scar/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(209, 14, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1105.00, 1021.00, '/assets/maps/scar/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(210, 14, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 905.00, 1388.00, '/assets/maps/scar/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(211, 14, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1161.00, 681.00, '/assets/maps/scar/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(212, 14, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1456.00, 1260.00, '/assets/maps/scar/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(213, 14, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 5', 832.00, 778.00, '/assets/maps/scar/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"5\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(214, 14, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 807.00, 1256.00, '/assets/maps/scar/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(215, 14, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 816.00, 717.00, '/assets/maps/scar/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(216, 14, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1592.00, 1458.00, '/assets/maps/scar/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(217, 14, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 536.00, 695.00, '/assets/maps/scar/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Express Map Markers
(218, 6, 'poiLabel', 'poi', 'Tracks', 512.00, 988.00, '/assets/maps/express/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(219, 6, 'poiLabel', 'poi', 'Terminal', 1030.00, 744.00, '/assets/maps/express/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(220, 6, 'poiLabel', 'poi', 'Ticketing', 1030.00, 1028.00, '/assets/maps/express/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(221, 6, 'poiLabel', 'poi', 'Train', 1030.00, 1245.00, '/assets/maps/express/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(222, 6, 'poiLabel', 'poi', 'Tracks', 1539.00, 980.00, '/assets/maps/express/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(223, 6, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 625.00, 1000.00, '/assets/maps/express/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(224, 6, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1030.00, 1072.00, '/assets/maps/express/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(225, 6, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 1430.00, 1003.00, '/assets/maps/express/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(226, 6, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1064.00, 968.00, '/assets/maps/express/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(227, 6, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 1387.00, 795.00, '/assets/maps/express/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(228, 6, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1065.00, 1325.00, '/assets/maps/express/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(229, 6, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 755.00, 793.00, '/assets/maps/express/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(230, 6, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1127.00, 1310.00, '/assets/maps/express/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(231, 6, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 1030.00, 888.00, '/assets/maps/express/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(232, 6, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1624.00, 890.00, '/assets/maps/express/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(233, 6, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 432.00, 905.00, '/assets/maps/express/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Hijacked Map Markers
(234, 8, 'poiLabel', 'poi', 'Stern Deck', 493.00, 1026.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(235, 8, 'poiLabel', 'poi', 'Center Deck', 1071.00, 1074.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(236, 8, 'poiLabel', 'poi', 'Cabins', 838.00, 957.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(237, 8, 'poiLabel', 'poi', 'Engine', 1001.00, 956.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(238, 8, 'poiLabel', 'poi', 'Bow Deck', 1578.00, 1026.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(239, 8, 'poiLabel', 'poi', 'Cabins', 1325.00, 975.00, '/assets/maps/hijacked/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(240, 8, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1183.00, 981.00, '/assets/maps/hijacked/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(241, 8, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1066.00, 987.00, '/assets/maps/hijacked/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(242, 8, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 687.00, 980.00, '/assets/maps/hijacked/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(243, 8, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 1', 1102.00, 1023.00, '/assets/maps/hijacked/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"1\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(244, 8, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 2', 806.00, 1053.00, '/assets/maps/hijacked/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"2\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(245, 8, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 3', 1130.00, 969.00, '/assets/maps/hijacked/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"3\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(246, 8, 'multiplayer_objective_hardpoint', 'hardpoint', 'Hardpoint 4', 1310.00, 1050.00, '/assets/maps/hijacked/Marker_Objective_Hardpoint.svg', 0, '{\"label\": \"4\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(247, 8, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site A', 1002.00, 923.00, '/assets/maps/hijacked/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(248, 8, 'multiplayer_objective_searchAndDestroy', 'snd', 'Search and Destroy Site B', 748.00, 1090.00, '/assets/maps/hijacked/Marker_Objective_SearchAndDestroy.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(249, 8, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1660.00, 1027.00, '/assets/maps/hijacked/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(250, 8, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 402.00, 1027.00, '/assets/maps/hijacked/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
-- Paranoia Map Markers
(251, 11, 'poiLabel', 'poi', 'Waiting Room', 1498.00, 1133.00, '/assets/maps/paranoia/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(252, 11, 'poiLabel', 'poi', 'Walkway', 1030.00, 1088.00, '/assets/maps/paranoia/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(253, 11, 'poiLabel', 'poi', 'Reception', 817.00, 978.00, '/assets/maps/paranoia/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(254, 11, 'multiplayer_objective_domination', 'domination', 'Domination Zone A', 1338.00, 1080.00, '/assets/maps/paranoia/Marker_Objective_Domination.svg', 0, '{\"label\": \"A\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(255, 11, 'multiplayer_objective_domination', 'domination', 'Domination Zone B', 1027.00, 1005.00, '/assets/maps/paranoia/Marker_Objective_Domination.svg', 0, '{\"label\": \"B\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(256, 11, 'multiplayer_objective_domination', 'domination', 'Domination Zone C', 675.00, 938.00, '/assets/maps/paranoia/Marker_Objective_Domination.svg', 0, '{\"label\": \"C\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(257, 11, 'multiplayer_mainSpawnLocation', 'spawn', 'JSOC Spawn', 1669.00, 1250.00, '/assets/maps/paranoia/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"JSOC\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),
(258, 11, 'multiplayer_mainSpawnLocation', 'spawn', 'GUILD Spawn', 417.00, 842.00, '/assets/maps/paranoia/Marker_MainSpawnLocations.svg', 0, '{\"team\": \"Guild\", \"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}'),

-- Vandorn Farm Zombie Map Markers (97 total)
(1000, 17, 'poiLabel', 'poi', 'Ashwood', 4376, 4600, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1001, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (CODA 9 Pistol)', 3969, 498, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1002, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 4048, 4668, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1003, 17, 'zombies_exfil', 'exfil', 'Exfil', 4051, 4697, '/assets/maps/vandorn_farm/ExfilRadio.svg', 0, '[]'),
(1004, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (M34 Novaline)', 4139, 4586, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1005, 17, 'zombies_traps', 'trap', 'Trap', 4057, 4460, '/assets/maps/vandorn_farm/Traps.svg', 0, '[]'),
(1006, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 4392, 4672, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1007, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 4097, 4589, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1008, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 4743, 4669, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1009, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (X9 Maverick)', 4173, 4632, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1010, 17, 'zombies_craftingTables', 'crafting', 'Crafting Table', 4012, 4463, '/assets/maps/vandorn_farm/CraftingTable.svg', 0, '[]'),
(1011, 17, 'zombies_perk_juggernog', 'perk', 'Jugger-Nog', 4126, 4519, '/assets/maps/vandorn_farm/ui_icon_perks_zm_juggernaut_lg.png', 0, '[]'),
(1012, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 4587, 4788, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1013, 17, 'zombies_perk_doubleTap', 'perk', 'Double Tap', 4687, 4673, '/assets/maps/vandorn_farm/ui_icon_perks_double_tap_lg.png', 0, '[]'),
(1014, 17, 'zombies_mysteryBoxes', 'mystery_box', 'Mystery Box', 4389, 4550, '/assets/maps/vandorn_farm/MysteryBox.svg', 0, '[]'),
(1015, 17, 'zombies_arsenals', 'arsenal', 'Arsenal', 4754, 4543, '/assets/maps/vandorn_farm/Arsenal.svg', 0, '[]'),
(1016, 17, 'zombies_armorVests', 'armor', 'Armor Vest', 4596, 4493, '/assets/maps/vandorn_farm/Armor.svg', 0, '[]'),
(1017, 17, 'zombies_perk_vultureAid', 'perk', 'Vulture Aid', 4730, 4384, '/assets/maps/vandorn_farm/ui_icon_perks_vulture_aid_lg.png', 0, '[]'),
(1018, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (VS Recon)', 4590, 4630, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1019, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Akita)', 4716, 4322, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1020, 17, 'zombies_powerDoors', 'power', 'Power Door', 4566, 4893, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1021, 17, 'zombies_powerDoors', 'power', 'Power Door', 4478, 4188, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1022, 17, 'zombies_powerDoors', 'power', 'Power Door', 4259, 4203, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1023, 17, 'zombies_powerDoors', 'power', 'Power Door', 4261, 4881, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1024, 17, 'poiLabel', 'poi', 'Blackwater Lake', 3819, 2537, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1025, 17, 'zombies_armorVests', 'armor', 'Armor Vest', 3690, 2466, '/assets/maps/vandorn_farm/Armor.svg', 0, '[]'),
(1026, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Dravec 45)', 3695, 2695, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1027, 17, 'zombies_perk_speedCola', 'perk', 'Speed Cola', 3697, 2591, '/assets/maps/vandorn_farm/ui_icon_perks_zm_speedloader_lg.png', 0, '[]'),
(1028, 17, 'zombies_gobbleGumMachines', 'gobble_gum', 'GobbleGum Machine', 3683, 2722, '/assets/maps/vandorn_farm/GobbleGum.svg', 0, '[]'),
(1029, 17, 'zombies_arsenals', 'arsenal', 'Arsenal', 3659, 2684, '/assets/maps/vandorn_farm/Arsenal.svg', 0, '[]'),
(1030, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 3591, 2580, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1031, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 3771, 2725, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1032, 17, 'zombies_perk_meleeMacchiato', 'perk', 'Melee Macchiato', 3738, 2729, '/assets/maps/vandorn_farm/ui_icon_perks_melee_macchiato_lg.png', 0, '[]'),
(1033, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 3819, 2804, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1034, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (M10 Breacher)', 3597, 2784, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1035, 17, 'zombies_craftingTables', 'crafting', 'Crafting Table', 3563, 2763, '/assets/maps/vandorn_farm/CraftingTable.svg', 0, '[]'),
(1036, 17, 'zombies_mysteryBoxes', 'mystery_box', 'Mystery Box', 3476, 2616, '/assets/maps/vandorn_farm/MysteryBox.svg', 0, '[]'),
(1037, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (M8A1)', 3526, 2469, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1038, 17, 'zombies_exfil', 'exfil', 'Exfil', 3978, 2707, '/assets/maps/vandorn_farm/ExfilRadio.svg', 0, '[]'),
(1039, 17, 'zombies_powerDoors', 'power', 'Power Door', 3715, 3030, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1040, 17, 'poiLabel', 'poi', 'Janus Towers Plaza', 4049, 692, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1041, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (CODA 9)', 3969, 498, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1042, 17, 'zombies_gobbleGumMachines', 'gobble_gum', 'GobbleGum Machine', 4118, 550, '/assets/maps/vandorn_farm/GobbleGum.svg', 0, '[]'),
(1043, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 4044, 883, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1044, 17, 'zombies_perk_quickRevive', 'perk', 'Quick Revive', 4227, 885, '/assets/maps/vandorn_farm/ui_icon_perks_zm_quickrevive_lg.png', 0, '[]'),
(1045, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 3962, 624, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1046, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Warden 308)', 3915, 758, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1047, 17, 'poiLabel', 'poi', 'Vandorn Farm', 5089, 2438, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1048, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 4910, 2344, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1049, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Echo 12)', 4746, 2376, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1050, 17, 'zombies_armorVests', 'armor', 'Armor Vest', 4680, 2457, '/assets/maps/vandorn_farm/Armor.svg', 0, '[]'),
(1051, 17, 'zombies_gobbleGumMachines', 'gobble_gum', 'GobbleGum Machine', 4745, 2582, '/assets/maps/vandorn_farm/GobbleGum.svg', 0, '[]'),
(1052, 17, 'zombies_perk_staminUp', 'perk', 'Stamin-UP', 4750, 2643, '/assets/maps/vandorn_farm/ui_icon_perks_zm_staminup_lg.png', 0, '[]'),
(1053, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Peacekeeper MK1)', 4678, 2683, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1054, 17, 'zombies_traps', 'trap', 'Saw Blade Trap', 4936, 2536, '/assets/maps/vandorn_farm/Traps.svg', 0, '[]'),
(1055, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Ryden 45K)', 4952, 2631, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1056, 17, 'zombies_traps', 'trap', 'Crafting Table', 5018, 2632, '/assets/maps/vandorn_farm/Traps.svg', 0, '[]'),
(1057, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 5046, 2681, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1058, 17, 'zombies_exfil', 'exfil', 'Exfil', 4627, 2509, '/assets/maps/vandorn_farm/ExfilRadio.svg', 0, '[]'),
(1059, 17, 'zombies_perk_deathPerception', 'perk', 'Death Perception', 4981, 2734, '/assets/maps/vandorn_farm/ui_icon_perks_zm_deathperception_lg.png', 0, '[]'),
(1060, 17, 'zombies_mysteryBoxes', 'mystery_box', 'Mystery Box', 4649, 2422, '/assets/maps/vandorn_farm/MysteryBox.svg', 0, '[]'),
(1061, 17, 'zombies_powerDoors', 'power', 'Power Door', 5212, 2630, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1062, 17, 'zombies_arsenals', 'arsenal', 'Arsenal', 4706, 2654, '/assets/maps/vandorn_farm/Arsenal.svg', 0, '[]'),
(1063, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (MK.78)', 4712, 2622, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1064, 17, 'poiLabel', 'poi', 'Exit 115', 3448, 7555, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1065, 17, 'poiLabel', 'poi', 'Zarya Cosmodrome', 5052, 6675, '/assets/maps/vandorn_farm/Marker_POIs.svg', 0, '[]'),
(1066, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 3515, 7261, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1067, 17, 'zombies_perk_elementalPop', 'perk', 'Elemental Pop', 3410, 7328, '/assets/maps/vandorn_farm/ui_icon_perks_zm_elemental_pop_lg.png', 0, '[]'),
(1068, 17, 'zombies_traps', 'trap', 'Saw Blade Trap', 3556, 7341, '/assets/maps/vandorn_farm/Traps.svg', 0, '[]'),
(1069, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (AK-27)', 3545, 7375, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1070, 17, 'zombies_gobbleGumMachines', 'gobble_gum', 'GobbleGum Machine', 3406, 7403, '/assets/maps/vandorn_farm/GobbleGum.svg', 0, '[]'),
(1071, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 3482, 7666, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1072, 17, 'zombies_arsenals', 'arsenal', 'Arsenal', 3643, 7414, '/assets/maps/vandorn_farm/Arsenal.svg', 0, '[]'),
(1073, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (Shadow SK)', 3265, 7418, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1074, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 3270, 7473, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1075, 17, 'zombies_craftingTables', 'crafting', 'Crafting Table', 3340, 7585, '/assets/maps/vandorn_farm/CraftingTable.svg', 0, '[]'),
(1076, 17, 'zombies_perk_deadshotDaiquiri', 'perk', 'Deadshot Daiquiri', 3313, 7642, '/assets/maps/vandorn_farm/ui_icon_perks_zm_deadshot_lg.png', 0, '[]'),
(1077, 17, 'zombies_armorVests', 'armor', 'Armor Vest', 3349, 7673, '/assets/maps/vandorn_farm/Armor.svg', 0, '[]'),
(1078, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (XM325)', 3635, 7635, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1079, 17, 'zombies_exfil', 'exfil', 'Exfil', 3623, 7728, '/assets/maps/vandorn_farm/ExfilRadio.svg', 0, '[]'),
(1080, 17, 'zombies_powerDoors', 'power', 'Power Door', 3482, 7106, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]'),
(1081, 17, 'zombies_armorVests', 'armor', 'Armor Vest', 5238, 6384, '/assets/maps/vandorn_farm/Armor.svg', 0, '[]'),
(1082, 17, 'zombies_perk_wispTea', 'perk', 'Wisp Tea', 5219, 6443, '/assets/maps/vandorn_farm/ui_icon_perks_wisp_tea_lg.png', 0, '[]'),
(1083, 17, 'zombies_fastTravel', 'fast_travel', 'Fast Travel', 5132, 6464, '/assets/maps/vandorn_farm/FastTravel.svg', 0, '[]'),
(1084, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 5153, 6528, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1085, 17, 'zombies_gobbleGumMachines', 'gobble_gum', 'GobbleGum Machine', 5154, 6568, '/assets/maps/vandorn_farm/GobbleGum.svg', 0, '[]'),
(1086, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 5012, 6819, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1087, 17, 'zombies_ammo', 'ammo', 'Ammo Cache', 5412, 6761, '/assets/maps/vandorn_farm/Ammo.svg', 0, '[]'),
(1088, 17, 'zombies_mysteryBoxes', 'mystery_box', 'Mystery Box', 5104, 6632, '/assets/maps/vandorn_farm/MysteryBox.svg', 0, '[]'),
(1089, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (XR-3 ION)', 5423, 6674, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1090, 17, 'zombies_arsenals', 'arsenal', 'Arsenal', 5435, 6814, '/assets/maps/vandorn_farm/Arsenal.svg', 0, '[]'),
(1091, 17, 'zombies_perk_phdFlopper', 'perk', 'PhD Flopper', 5370, 6861, '/assets/maps/vandorn_farm/ui_icon_perks_zm_phdslider_lg.png', 0, '[]'),
(1092, 17, 'zombies_craftingTables', 'crafting', 'Crafting Table', 5188, 6628, '/assets/maps/vandorn_farm/CraftingTable.svg', 0, '[]'),
(1093, 17, 'zombies_exfil', 'exfil', 'Exfil', 5074, 6757, '/assets/maps/vandorn_farm/ExfilRadio.svg', 0, '[]'),
(1094, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (M15 Mod 0)', 5013, 6758, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1095, 17, 'zombies_wallBuys', 'wall_buy', 'Wall Buy (DS20 Mirage)', 5248, 6703, '/assets/maps/vandorn_farm/WallBuy.svg', 0, '[]'),
(1096, 17, 'zombies_powerDoors', 'power', 'Power Door', 5448, 6306, '/assets/maps/vandorn_farm/PowerDoor.svg', 0, '[]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_versions`
--
ALTER TABLE `data_versions`
  ADD PRIMARY KEY (`category`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_modes`
--
ALTER TABLE `game_modes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perks`
--
ALTER TABLE `perks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `combat_specialties`
--
ALTER TABLE `combat_specialties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `weapons_mp`
--
ALTER TABLE `weapons_mp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `weapon_camo`
--
ALTER TABLE `weapon_camo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weapon_camo_unique` (`weapon_id`, `camo_id`),
  ADD KEY `weapon_id` (`weapon_id`),
  ADD KEY `camo_id` (`camo_id`);

--
-- Indexes for table `wildcards`
--
ALTER TABLE `wildcards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `scorestreaks`
--
ALTER TABLE `scorestreaks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tacticals_mp`
--
ALTER TABLE `tacticals_mp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lethals`
--
ALTER TABLE `lethals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `field_upgrades`
--
ALTER TABLE `field_upgrades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Indexes for table `ammo_mods`
--
ALTER TABLE `ammo_mods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ammo_mod_augments`
--
ALTER TABLE `ammo_mod_augments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ammo_mod_id` (`ammo_mod_id`);

--
-- Indexes for table `field_upgrades_zm`
--
ALTER TABLE `field_upgrades_zm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `field_upgrade_zm_augments`
--
ALTER TABLE `field_upgrade_zm_augments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_upgrade_id` (`field_upgrade_id`);

--
-- Indexes for table `power_ups`
--
ALTER TABLE `power_ups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Indexes for table `map_layers`
--
ALTER TABLE `map_layers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `map_id` (`map_id`);

--
-- Indexes for table `map_tiles`
--
ALTER TABLE `map_tiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `map_id` (`map_id`),
  ADD KEY `zoom_level` (`zoom_level`);

--
-- Indexes for table `map_markers`
--
ALTER TABLE `map_markers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `map_id` (`map_id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `game_modes`
--
ALTER TABLE `game_modes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `perks`
--
ALTER TABLE `perks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `combat_specialties`
--
ALTER TABLE `combat_specialties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `weapons_mp`
--
ALTER TABLE `weapons_mp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `weapon_camo`
--
ALTER TABLE `weapon_camo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `wildcards`
--
ALTER TABLE `wildcards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `scorestreaks`
--
ALTER TABLE `scorestreaks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tacticals_mp`
--
ALTER TABLE `tacticals_mp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `lethals`
--
ALTER TABLE `lethals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `field_upgrades`
--
ALTER TABLE `field_upgrades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `ammo_mods`
--
ALTER TABLE `ammo_mods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ammo_mod_augments`
--
ALTER TABLE `ammo_mod_augments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `field_upgrades_zm`
--
ALTER TABLE `field_upgrades_zm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `field_upgrade_zm_augments`
--
ALTER TABLE `field_upgrade_zm_augments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `power_ups`
--
ALTER TABLE `power_ups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `map_layers`
--
ALTER TABLE `map_layers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `map_tiles`
--
ALTER TABLE `map_tiles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1365;

--
-- AUTO_INCREMENT for table `map_markers`
--
ALTER TABLE `map_markers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1097;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `perk_a_cola_augments`
--
ALTER TABLE `perk_a_cola_augments`
  ADD CONSTRAINT `perk_a_cola_augments_ibfk_1` FOREIGN KEY (`perk_id`) REFERENCES `perk_a_cola` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ammo_mod_augments`
--
ALTER TABLE `ammo_mod_augments`
  ADD CONSTRAINT `ammo_mod_augments_ibfk_1` FOREIGN KEY (`ammo_mod_id`) REFERENCES `ammo_mods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_upgrade_zm_augments`
--
ALTER TABLE `field_upgrade_zm_augments`
  ADD CONSTRAINT `field_upgrade_zm_augments_ibfk_1` FOREIGN KEY (`field_upgrade_id`) REFERENCES `field_upgrades_zm` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `map_layers`
--
ALTER TABLE `map_layers`
  ADD CONSTRAINT `map_layers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `map_tiles`
--
ALTER TABLE `map_tiles`
  ADD CONSTRAINT `map_tiles_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `map_markers`
--
ALTER TABLE `map_markers`
  ADD CONSTRAINT `map_markers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
--
-- Indexes for table `gobblegums`
--
ALTER TABLE `gobblegums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `gobblegum_tips`
--
ALTER TABLE `gobblegum_tips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gobblegum_id` (`gobblegum_id`);

--
-- Indexes for table `camo`
--
ALTER TABLE `camo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `classic_prestige`
--
ALTER TABLE `classic_prestige`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `gobblegums`
--
ALTER TABLE `gobblegums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `gobblegum_tips`
--
ALTER TABLE `gobblegum_tips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `camo`
--
ALTER TABLE `camo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- Constraints for table `gobblegum_tips`
--
ALTER TABLE `gobblegum_tips`
  ADD CONSTRAINT `gobblegum_tips_ibfk_1` FOREIGN KEY (`gobblegum_id`) REFERENCES `gobblegums` (`id`) ON DELETE CASCADE;

