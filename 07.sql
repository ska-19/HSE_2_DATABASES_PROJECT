-- create schema
DROP SCHEMA IF EXISTS view_interplanetary_hunters CASCADE;
CREATE SCHEMA view_interplanetary_hunters;

SET SEARCH_PATH = interplanetary_hunters_db;

-- Создание представления для таблицы planets
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_planets CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_planets AS
SELECT
    name || '_' || planet_id AS planet_name
FROM interplanetary_hunters_db.planets;

-- Создание представления для таблицы biomes
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_biomes CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_biomes AS
SELECT
    biome_id AS num_biome,
    planet_id AS num_planet,
    type AS biome_type
FROM interplanetary_hunters_db.biomes;

-- Создание представления для таблицы hunters
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_hunters CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_hunters AS
SELECT
    hunter_id AS num_hunter,
    user_id AS num_user,
    biome_id AS num_biome,
    planet_of_birth_id AS num_planet_of_birth,
    name AS hunter_name,
    level,
    speed
FROM interplanetary_hunters_db.hunters;

-- Создание представления для таблицы weapons
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_weapons CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_weapons AS
SELECT
    weapon_id AS num_weapon,
    hunter_id  AS num_hunter,
    power
FROM interplanetary_hunters_db.weapons;

-- Создание представления для таблицы mobs
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_mobs CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_mobs AS
SELECT
    mob_id AS num_mob,
    biome_id AS num_biome,
    planet_of_birth_id AS num_planet_of_birth,
    species AS mob_species,
    name AS mob_name,
    speed AS mob_speed
FROM interplanetary_hunters_db.mobs;

-- Создание представления для таблицы actions
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_actions CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_actions AS
SELECT
    mob_id AS num_mob,
    hunter_id AS num_hunter,
    time AS action_time,
    type AS action_type,
    success
FROM interplanetary_hunters_db.actions;

-- Создание представления для таблицы users
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_users CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_users AS
SELECT
    user_id AS num_user,
    first_name || ' ' || last_name AS "full_name",
    CONCAT(SUBSTRING(email FROM 1 FOR 1), '******', SUBSTRING(email FROM POSITION('@' IN email))) AS masked_email
FROM interplanetary_hunters_db.users;
