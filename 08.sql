SET SEARCH_PATH = interplanetary_hunters_db;

-- Сводная информация о мобах и успешных охотниках:
--
-- В этом представлении мы объединим информацию о мобах с данными об успешных охотниках и их оружии.
-- Используем оконные функции для подсчета общего числа успешных охот для каждого охотника.
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_mob_hunter_summary CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_mob_hunter_summary AS
SELECT
    m.mob_id,
    m.species AS mob_species,
    m.name AS mob_name,
    m.speed AS mob_speed,
    a.hunter_id,
    h.name AS hunter_name,
    h.level AS hunter_level,
    w.weapon_id,
    w.power AS weapon_power,
    COUNT(a.success) OVER (PARTITION BY a.hunter_id) AS total_successful_hunts
FROM
    interplanetary_hunters_db.mobs m
LEFT JOIN
    interplanetary_hunters_db.actions a ON m.mob_id = a.mob_id
LEFT JOIN
    interplanetary_hunters_db.hunters h ON a.hunter_id = h.hunter_id
LEFT JOIN
    interplanetary_hunters_db.weapons w ON h.hunter_id = w.hunter_id;

-- Детализация успешных охот по времени:
--
-- В этом представлении мы предоставим детализированную информацию о успешных охотах, включая дату и время каждой успешной охоты.
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_successful_hunts_details CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_successful_hunts_details AS
SELECT
    a.hunter_id,
    h.name AS hunter_name,
    a.mob_id,
    m.name AS mob_name,
    a.time AS hunt_time
FROM
    interplanetary_hunters_db.actions a
JOIN
    interplanetary_hunters_db.hunters h ON a.hunter_id = h.hunter_id
JOIN
    interplanetary_hunters_db.mobs m ON a.mob_id = m.mob_id
WHERE
    a.success = true;



-- Статистика по успешным охотам охотников на каждой планете:
--
-- В данном представлении мы создадим сводную статистику по успешным охотам охотников на каждой планете, включая общее количество успешных охот, средний уровень охотников и количество мобов каждого вида.
DROP VIEW IF EXISTS view_interplanetary_hunters.vw_success_hunt_stats CASCADE;
CREATE VIEW view_interplanetary_hunters.vw_success_hunt_stats AS
SELECT
    p.name AS planet_name,
    COUNT(DISTINCT a.hunter_id) AS total_successful_hunters,
    COUNT(a.success) AS total_successful_hunts,
    AVG(h.speed) AS avg_hunter_speed,
    COUNT(DISTINCT m.species) AS total_mob_species
FROM
    interplanetary_hunters_db.planets p
LEFT JOIN
    interplanetary_hunters_db.biomes b ON p.planet_id = b.planet_id
LEFT JOIN
    interplanetary_hunters_db.hunters h ON b.biome_id = h.biome_id
LEFT JOIN
    interplanetary_hunters_db.actions a ON h.hunter_id = a.hunter_id AND a.success = true
LEFT JOIN
    interplanetary_hunters_db.mobs m ON a.mob_id = m.mob_id
GROUP BY
    p.name;
