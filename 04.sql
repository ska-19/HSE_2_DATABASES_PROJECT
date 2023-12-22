
SET SEARCH_PATH = interplanetary_hunters_db;

-- Add to the users table
INSERT INTO users (first_name, last_name, email)
VALUES ('John', 'Doe', 'zxc@gmail.com');

INSERT INTO users (first_name, last_name, email)
VALUES ('Bob', 'Smith', 'bobs@gmail.com');

INSERT INTO users (first_name, last_name, email)
VALUES ('Sally', 'Smith', 'sallys@gmail.com');

INSERT INTO users (first_name, last_name, email)
VALUES ('Joe', 'Kane', 'cxz@gmail.com');

INSERT INTO users (first_name, last_name, email)
VALUES ('Linda', 'Mills', 'lm@icloud.com');


-- Add to the planets table
INSERT INTO planets (name)
VALUES ('Mercury');

INSERT INTO planets (name)
VALUES ('Venus');

INSERT INTO planets (name)
VALUES ('Earth');

INSERT INTO planets (name)
VALUES ('Mars');

INSERT INTO planets (name)
VALUES ('Jupiter');

INSERT INTO planets (name)
VALUES ('Saturn');


-- Add to the biomes table
INSERT INTO biomes (planet_id, type)
VALUES (1, 'Desert');

INSERT INTO biomes (planet_id, type)
VALUES (1, 'Volcanic');

INSERT INTO biomes (planet_id, type)
VALUES (2, 'Desert');

INSERT INTO biomes (planet_id, type)
VALUES (2, 'Volcanic');

INSERT INTO biomes (planet_id, type)
VALUES (3, 'Forest');


-- Add to the hunters table
INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (1, 5, 3, 'Yaso', 1, 1);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (2, 5, 3, 'Zed', 1, 2);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (2, 1, 1, 'Keil', 1, 3);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (3, 1, 1, 'Luna', 2, 4);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (1, 2, 1, 'LuLu', 2, 5);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (1, 2, 1, 'Zulu', 2, 6);


-- Add to the weapons table
INSERT INTO weapons (hunter_id, power, class)
VALUES (1, 1, 'Sword');

INSERT INTO weapons (hunter_id, power, class)
VALUES (2, 2, 'Sword');

INSERT INTO weapons (hunter_id, power, class)
VALUES (3, 10, 'Net');

INSERT INTO weapons (hunter_id, power, class)
VALUES (4, 1, 'long-range');

INSERT INTO weapons (hunter_id, power, class)
VALUES (5, 5, 'Sword');


-- Add to the mobs table
INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (5, 3, 'walking', 'Zombie', 2);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (5, 3, 'jumping', 'Green Slime', 1);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (5, 3, 'jumping', 'Blue Slime', 1);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (5, 3, 'walking', 'Possessed Armor', 4);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (1, 1, 'flying', 'Vulture', 3);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (1, 1, 'jumping', 'Sand Slime', 1);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (1, 1, 'walking', 'Mummy', 5);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (2, 1, 'flying', 'Lava Bat', 5);

INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)
VALUES (2, 1, 'jumping', 'Lava Slime', 2);


-- Add to the hunts table
INSERT INTO hunts (mob_id, hunter_id, time, type, success)
VALUES (1, 1, '4420-01-01', 'catch', false);

INSERT INTO hunts (mob_id, hunter_id, time, type, success)
VALUES (2, 2, '4420-01-22', 'kill', true);

INSERT INTO hunts (mob_id, hunter_id, time, type, success)
VALUES (5, 3, '4420-01-23', 'catch', true);

INSERT INTO hunts (mob_id, hunter_id, time, type, success)
VALUES (6, 4, '4420-01-25', 'kill', true);

INSERT INTO hunts (mob_id, hunter_id, time, type, success)
VALUES (8, 5, '4420-01-26', 'kill', false);
