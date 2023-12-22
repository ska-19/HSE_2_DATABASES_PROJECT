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
VALUES (1, 1, 1, 'Yaso', 1, 1);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (2, 2, 2, 'Zed', 1, 2);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (2, 1, 3, 'Keil', 1, 3);

INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (3, 1, 4, 'Luna', 2, 4);

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
-- INSERT INTO mobs (biome_id, planet_of_birth_id, species, name, speed)



-- Add to the hunts table
-- INSERT INTO hunts (mob_id, hunter_id, time, type, success)
