-- Sample Data for Testing
-- This file contains sample data to help you get started

-- ============================================
-- SAMPLE WEAPONS
-- ============================================
INSERT INTO weapons (name, category, unlock_level, damage_range_min, damage_range_max, fire_rate, magazine_size, reload_time, ads_time, mobility, range_value, accuracy, control, description) VALUES
('XM4', 'Assault Rifle', 4, 28, 35, 750, 30, 2.5, 0.25, 75, 70, 80, 75, 'Fully automatic assault rifle. Reliable damage with moderate recoil.'),
('AK-47', 'Assault Rifle', 10, 30, 40, 600, 30, 2.8, 0.28, 70, 75, 75, 65, 'High damage assault rifle with heavy recoil. Best for mid-range combat.'),
('MP5', 'SMG', 1, 25, 30, 800, 30, 2.0, 0.20, 85, 50, 85, 80, 'Highly mobile SMG with fast fire rate. Excellent for close-quarters combat.'),
('Type 63', 'Marksman', 15, 45, 60, 300, 20, 2.3, 0.30, 65, 85, 70, 70, 'Semi-automatic marksman rifle. High damage at range.'),
('Stoner 63', 'LMG', 20, 30, 38, 650, 75, 4.5, 0.40, 55, 80, 75, 70, 'Belt-fed light machine gun with large magazine capacity.');

-- ============================================
-- SAMPLE MAPS
-- ============================================
INSERT INTO maps (name, mode, size, description, tips) VALUES
('Nuketown', 'Multiplayer', 'Small', 'Iconic small map set in a nuclear test site suburb.', 'Control the center. Use the houses for cover. Watch out for grenades at spawn.'),
('Raid', 'Multiplayer', 'Medium', 'Luxury mansion with multiple engagement areas.', 'Pool area is a hot zone. Use the side routes to flank. Verticality matters.'),
('Cartel', 'Multiplayer', 'Medium', 'Nicaraguan drug operation facility.', 'Use the vegetation for cover. Center bridge is dangerous. Flanking routes are key.');

-- ============================================
-- SAMPLE PERKS
-- ============================================
INSERT INTO perks (name, slot, unlock_level, description, effect) VALUES
('Flak Jacket', 'Perk 1', 1, 'Take less damage from explosives and fire.', 'Reduces explosive damage by 85%'),
('Tactical Mask', 'Perk 1', 5, 'Reduces effectiveness of enemy Tactical equipment.', 'Reduces flashbang and stun duration by 60%'),
('Ghost', 'Perk 2', 10, 'Undetectable by enemy Spy Planes while moving.', 'Invisible to UAVs when moving'),
('Scavenger', 'Perk 2', 12, 'Replenish ammo from fallen enemies.', 'Pick up ammo from enemy bodies'),
('Ninja', 'Perk 3', 15, 'Move more quietly and detect enemy footsteps.', 'Reduced movement noise, amplified enemy audio');

-- ============================================
-- SAMPLE EQUIPMENT
-- ============================================
INSERT INTO equipment (name, type, unlock_level, description, damage) VALUES
('Frag Grenade', 'Lethal', 1, 'Cookable fragmentation grenade with a 4 second fuse.', 100),
('Semtex', 'Lethal', 3, 'Timed sticky grenade.', 100),
('Stun Grenade', 'Tactical', 1, 'Slows enemy movement and aiming.', 0),
('Smoke Grenade', 'Tactical', 5, 'Deploys a smoke screen that blocks vision.', 0),
('Field Mic', 'Field Upgrade', 8, 'Detects and reveals enemy movement in a small area.', 0);

-- ============================================
-- SAMPLE SCORESTREAKS
-- ============================================
INSERT INTO scorestreaks (name, score_required, unlock_level, description, duration) VALUES
('UAV', 500, 1, 'Reveals enemy positions on the minimap.', 30.0),
('Care Package', 700, 1, 'Call in a random Scorestreak care package.', NULL),
('Sentry Turret', 900, 5, 'Automated turret that fires at enemies.', 60.0),
('Napalm Strike', 1100, 10, 'Aerial strike that covers an area in napalm.', 15.0),
('Attack Helicopter', 1300, 15, 'Attack helicopter escorts player.', 45.0);

-- ============================================
-- SAMPLE GUIDES
-- ============================================
INSERT INTO guides (title, category, content, author, is_featured) VALUES
('Beginner\'s Guide to Call of Duty', 'Beginner', 'Welcome to Call of Duty! This guide will help you understand the basics of movement, aiming, and game modes.', 'Admin', 1),
('Best Assault Rifle Loadouts', 'Weapon Guide', 'Optimize your AR loadouts with these top-tier class setups for different playstyles.', 'Admin', 0),
('How to Control Recoil', 'Tips & Tricks', 'Master recoil control with these essential tips and techniques.', 'Admin', 0);

-- ============================================
-- SAMPLE ATTACHMENTS
-- ============================================
INSERT INTO attachments (name, category, unlock_level, description, pros, cons) VALUES
('Reflex Optic', 'Optic', 5, 'Precision reflex sight.', '+Clear sight picture', '-Slight ADS penalty'),
('Suppressor', 'Muzzle', 10, 'Silences weapon and hides muzzle flash.', '+Weapon silenced\n+No skull on death', '-Reduced range'),
('Extended Mag', 'Magazine', 8, 'Increased magazine capacity.', '+50% more ammo', '-Slower reload'),
('Foregrip', 'Underbarrel', 12, 'Improved recoil control.', '+Better recoil control', '-Slight mobility penalty'),
('Fast Mag', 'Magazine', 15, 'Faster reload speed.', '+50% faster reload', 'None');
