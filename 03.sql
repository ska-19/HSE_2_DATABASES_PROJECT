CREATE SCHEMA interplanetary_hunters_db;

SET SEARCH_PATH = interplanetary_hunters_db;

-- Создание таблиц

-- Таблица пользователей
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users
(
    user_id    serial PRIMARY KEY NOT NULL,
    first_name varchar(20) CHECK (first_name != ''),
    last_name  varchar(20) CHECK (last_name != ''),
    email      text CHECK (email ~ '^[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+$')
);

-- Таблица планет
DROP TABLE IF EXISTS planets CASCADE;
CREATE TABLE planets
(
    planet_id serial PRIMARY KEY NOT NULL,
    name      varchar(20) CHECK (name != '')
);

-- Таблица биомов
DROP TABLE IF EXISTS biomes CASCADE;
CREATE TABLE biomes
(
    biome_id  serial PRIMARY KEY NOT NULL,
    planet_id integer REFERENCES planets (planet_id),
    type      varchar(20) CHECK (type != '')
);

-- Таблица охотников
DROP TABLE IF EXISTS hunters CASCADE;
CREATE TABLE hunters
(
    hunter_id          serial PRIMARY KEY NOT NULL,
    user_id            integer REFERENCES users (user_id),
    biome_id           integer REFERENCES biomes (biome_id),
    planet_of_birth_id integer REFERENCES planets (planet_id),
    name               varchar(20) CHECK (name != ''),
    level              integer CHECK (level > 0),
    speed              integer CHECK (speed > 0)
);

-- Таблица оружия
DROP TABLE IF EXISTS weapons CASCADE;
CREATE TABLE weapons
(
    weapon_id serial PRIMARY KEY NOT NULL,
    hunter_id integer REFERENCES hunters (hunter_id),
    power     integer CHECK (power > 0),
    class     varchar(20) CHECK (class != '')
);

-- Таблица мобов
DROP TABLE IF EXISTS mobs CASCADE;
CREATE TABLE mobs
(
    mob_id             serial PRIMARY KEY NOT NULL,
    biome_id           integer REFERENCES biomes (biome_id),
    planet_of_birth_id integer REFERENCES planets (planet_id),
    species            varchar(20) CHECK (species != ''),
    name               varchar(20) CHECK (name != ''),
    speed              integer CHECK (speed > 0)
);

-- Таблица охоты
DROP TABLE IF EXISTS hunts CASCADE;
CREATE TABLE hunts
(
    mob_id    integer REFERENCES mobs (mob_id),
    hunter_id integer REFERENCES hunters (hunter_id),
    time      timestamp,
    type      varchar(20) CHECK (type != ''),
    success   boolean CHECK (success = true OR success = false),
    PRIMARY KEY (mob_id, hunter_id, time)
);
