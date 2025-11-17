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
('icons', 1, 1, '2025-11-14 16:04:00', 'Icons and emblems'),
('map_layers', 1, 1, '2025-11-16 00:00:00', 'Map overlay layers'),
('map_markers', 1, 1, '2025-11-16 00:00:00', 'Interactive map markers and POIs'),
('maps', 1, 1, '2025-11-16 00:00:00', 'Interactive map base data'),
('operators', 1, 1, '2025-11-14 00:39:23', 'Playable characters');

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
  `bounds` JSON DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `display_name`, `base_image_url`, `cover_image_url`, `teams`, `modes`, `campaign_map`, `location`, `bounds`) VALUES
(1, 'blackheart', 'Blackheart', '/assets/maps/blackheart/Blackheart_Tac_Map_BLANK1.webp', '/assets/maps/blackheart/cover.webp', 'JSOC vs The Guilds', 'All (except Skirmish)', 'Containment', 'NA', '{\"southwest\": [0, 0], \"northeast\": [2048, 2048]}');

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
(2, 1, 'hardpoint_zone', 'Hardpoint Zone', 'overlay', '/assets/maps/blackheart/Blackheart_Tac_Map_HP.webp', 0);

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
(17, 1, 'poiLabel', 'poi', 'Barge', 1639.00, 1041.00, '/assets/maps/blackheart/Marker_POIs.svg', 0, '{\"mode\": \"multiplayer\", \"gameSelection\": \"bo7\"}');

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
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `map_layers`
--
ALTER TABLE `map_layers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `map_markers`
--
ALTER TABLE `map_markers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `map_layers`
--
ALTER TABLE `map_layers`
  ADD CONSTRAINT `map_layers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `map_markers`
--
ALTER TABLE `map_markers`
  ADD CONSTRAINT `map_markers_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
