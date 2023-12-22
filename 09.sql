
SET SEARCH_PATH = interplanetary_hunters_db;

-- 1 простой пример
CREATE OR REPLACE FUNCTION set_default_level_on_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.level IS NULL THEN
        NEW.level := 1;
    END IF;
    IF NEW.speed IS NULL THEN
        NEW.speed := 1;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_set_default_level_on_insert ON hunters;
CREATE TRIGGER trigger_set_default_level_on_insert
BEFORE INSERT ON hunters
FOR EACH ROW
EXECUTE FUNCTION set_default_level_on_insert();

-- level == 1
INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (1, 2, 1, 'Bob', NULL, NULL);

-- level == 2
INSERT INTO hunters (user_id, biome_id, planet_of_birth_id, name, level, speed)
VALUES (1, 2, 1, 'Bob2', 2, 2);

-- delete
DELETE FROM hunters
WHERE (user_id, biome_id, planet_of_birth_id, name) = (
    SELECT user_id, biome_id, planet_of_birth_id, name
    FROM hunters
    ORDER BY hunter_id DESC
    LIMIT 1
);


-- 2 сложный пример
CREATE OR REPLACE FUNCTION set_success_on_insert_complex()
RETURNS TRIGGER AS $$
DECLARE
    h_speed INTEGER;
    m_speed INTEGER;
    h_biome INTEGER;
    m_biome INTEGER;
BEGIN
    IF NEW.success IS NULL THEN

        NEW.success := true;
        SELECT speed INTO h_speed FROM hunters WHERE hunter_id = NEW.hunter_id;
        SELECT speed INTO m_speed FROM mobs WHERE mob_id = NEW.mob_id;
        SELECT biome_id INTO h_biome FROM hunters WHERE hunter_id = NEW.hunter_id;
        SELECT biome_id INTO m_biome FROM mobs WHERE mob_id = NEW.mob_id;

        IF h_biome <> m_biome THEN
            NEW.success := false;
        END IF;

        -- Проверка наличия оружия дальнего действия у охотника для взаимодействия с летающим мобом
        IF (SELECT species FROM mobs WHERE mob_id = NEW.mob_id) = 'flying' THEN
            IF NOT EXISTS (
                SELECT 1
                FROM weapons w
                JOIN hunters h ON w.hunter_id = h.hunter_id
                WHERE h.hunter_id = NEW.hunter_id
                AND w.class = 'long-range'
            ) THEN
                NEW.success := false;
            END IF;
        END IF;

        IF NEW.type = 'kill' AND h_speed <= m_speed THEN
            NEW.success := false;
        ELSIF NEW.type = 'catch' AND h_speed < m_speed THEN
            NEW.success := false;
        END IF;
    END IF;

    RETURN NEW;
EXCEPTION
    WHEN others THEN
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_set_success_on_insert_complex ON actions;
CREATE TRIGGER trigger_set_success_on_insert_complex
BEFORE INSERT ON actions
FOR EACH ROW
EXECUTE FUNCTION set_success_on_insert_complex();

-- success == false
INSERT INTO actions (mob_id, hunter_id, time, type, success)
VALUES (1, 1, CURRENT_TIMESTAMP, 'kill', NULL);

-- success == true
INSERT INTO actions (mob_id, hunter_id, time, type, success)
VALUES (6, 4, CURRENT_TIMESTAMP, 'kill', NULL);

-- delete
DELETE FROM actions
WHERE (mob_id, hunter_id, time) = (
    SELECT mob_id, hunter_id, time
    FROM actions
    ORDER BY time DESC
    LIMIT 1
);
