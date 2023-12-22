
SET SEARCH_PATH = interplanetary_hunters_db;

-- Получение суммарной скорости охотников на каждой планете, чтобы определить, на какой планете охотники обладают наибольшей общей скоростью.
SELECT p.name AS planet_name, SUM(h.speed) AS total_speed
FROM planets p
JOIN biomes b ON p.planet_id = b.planet_id
JOIN hunters h ON b.biome_id = h.biome_id
GROUP BY p.name
ORDER BY total_speed DESC;

-- Ранжирование охотников по количеству успешных охот на разных планетах, чтобы определить, на каких планетах охотники проявляют себя лучше.
SELECT h.name AS hunter_name, p.name AS planet_name, COUNT(*) AS successful_hunts
FROM actions a
JOIN hunters h ON a.hunter_id = h.hunter_id
JOIN biomes b ON a.mob_id = b.biome_id
JOIN planets p ON b.planet_id = p.planet_id
WHERE a.success = true
GROUP BY h.name, p.name
ORDER BY successful_hunts DESC;

-- Получение списка охотников, которые не смогли поймать мобов, чтобы определить, кто из охотников не справляется со своей работой.
SELECT DISTINCT h.*
FROM hunters h
LEFT JOIN actions a ON h.hunter_id = a.hunter_id AND a.success = true
WHERE a.hunter_id IS NULL
ORDER BY h.hunter_id;


-- SELECT всех охотников
SELECT * FROM hunters;

-- Получение списка охотников, которые не смогли поймать мобов с использованием оконной функции
WITH HunterSuccessCounts AS (
    SELECT
        h.hunter_id,
        COUNT(a.success) OVER (PARTITION BY h.hunter_id) AS successful_hunts_count
    FROM hunters h
    LEFT JOIN actions a ON h.hunter_id = a.hunter_id AND a.success = true
)
SELECT
    h.*
FROM hunters h
JOIN HunterSuccessCounts hsc ON h.hunter_id = hsc.hunter_id
WHERE hsc.successful_hunts_count IS NULL OR hsc.successful_hunts_count = 0
ORDER BY h.hunter_id;
