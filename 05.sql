
SET SEARCH_PATH = interplanetary_hunters_db;

-- CRUD for users table
-- Inserting
INSERT INTO users (first_name, last_name, email)
VALUES ('Jine', 'Doe', 'jinedoe@example.com');

-- Selecting
SELECT * FROM users WHERE last_name = 'Smith';

-- Updating
UPDATE users
SET email = 'jine@example.com'
WHERE first_name = 'Jine';

-- Deleting
DELETE FROM users WHERE first_name = 'Jine';

-- CRUD for planets table
-- Inserting
INSERT INTO planets (name)
VALUES ('Mars_2');

-- Selecting
SELECT * FROM planets WHERE name = 'Mars_2';

-- Updating
UPDATE planets
SET name = 'Red Planet'
WHERE name LIKE 'Mars%';

-- Deleting
DELETE FROM planets WHERE name = 'Saturn';
