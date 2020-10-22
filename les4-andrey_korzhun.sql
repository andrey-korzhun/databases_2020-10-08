-- Andrey Korznun
-- Lesson 4
-- Create, read, update and delete

USE vk;
SHOW TABLES;

-- Profile statuses
DROP TABLE IF EXISTS `profile_statuses`;
CREATE TABLE profile_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Id",
  name VARCHAR(30) NOT NULL UNIQUE COMMENT "Status name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT "Update time"
) COMMENT "Profile statuses";


-- Profiles
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "User link", 
  gender CHAR(1) NOT NULL COMMENT "Sex",
  birthday DATE COMMENT "Birthday",
  photo_id INT UNSIGNED COMMENT "Photo link",
  status VARCHAR(30) COMMENT "Current status",
  city VARCHAR(130) COMMENT "City",
  -- The reason why COUNTRY field DELETED is CITY field
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT "Update time"
) COMMENT "Profiles";


ALTER TABLE profiles ADD COLUMN status_id INT UNSIGNED NOT NULL
COMMENT "Status id" AFTER photo_id;
ALTER TABLE profiles MODIFY COLUMN gender ENUM('A', 'F', 'M') NOT NULL
COMMENT "A - alternative sexual orientation or alien";

-- Countries
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Country id",
  name VARCHAR(50) NOT NULL UNIQUE COMMENT "Country name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Countries";

-- Cities
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  country_id INT UNSIGNED NOT NULL COMMENT "Идентификатор страны",
  name VARCHAR(50) NOT NULL UNIQUE COMMENT "Название города",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Cities";

-- Friendship
DESC friendships;

-- ALTER TABLE friendships ADD COLUMN requested_at INT;
-- ALTER TABLE friendships DROP COLUMN requested_at;

SHOW TABLES;

SELECT * FROM users LIMIT 10;

DESC users;

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;                  

DESC profiles;

SELECT * FROM profiles LIMIT 10;

UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

SELECT * FROM profile_statuses;

INSERT INTO profile_statuses (name) VALUES ('active'), ('pending'), ('disabled'); 

UPDATE profiles SET status_id = 1;

UPDATE profiles SET status_id = 2 WHERE user_id IN (3, 56, 78, 83, 22);
UPDATE profiles SET status_id = 3 WHERE user_id IN (32, 6, 81, 88, 43);

ALTER TABLE profiles DROP COLUMN status;

ALTER TABLE profiles ADD COLUMN city_id INT UNSIGNED AFTER city;

ALTER TABLE cities MODIFY COLUMN country_id INT UNSIGNED;
INSERT INTO cities (name) SELECT DISTINCT city FROM old_profiles;

INSERT INTO countries (name) SELECT DISTINCT country FROM old_profiles;

SELECT COUNT(*) FROM countries;
UPDATE cities SET country_id = FLOOR(1 + RAND() * 82);
ALTER TABLE cities MODIFY COLUMN country_id INT UNSIGNED NOT NULL;

SELECT COUNT(*) FROM cities;
UPDATE profiles SET city_id = FLOOR(1 + RAND() * 100);

ALTER TABLE profiles DROP column city;
-- ALTER TABLE profiles DROP column country;

DESC messages;

SELECT * FROM messages LIMIT 10;

UPDATE messages SET 
  from_user_id = FLOOR(1 + RAND() * 100),
  to_user_id = FLOOR(1 + RAND() * 100);

DESC media;

SELECT * FROM media LIMIT 10;

UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

CREATE TEMPORARY TABLE extensions (name VARCHAR(10));

INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png');

SELECT * FROM extensions;

UPDATE media SET filename = CONCAT(
  'http://dropbox.net/vk/',
  filename,
  (SELECT last_name FROM users ORDER BY RAND() LIMIT 1),
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  

ALTER TABLE media MODIFY COLUMN metadata JSON;

SELECT * FROM media_types;

DELETE FROM media_types;

INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

TRUNCATE media_types;

UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);

DESC friendships;

SELECT * FROM friendships LIMIT 10;

UPDATE friendships SET 
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);

UPDATE friendships SET friend_id = friend_id + 1 WHERE user_id = friend_id;

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
  
UPDATE friendships SET status_id = FLOOR(1 + RAND() * 3); 

SELECT * FROM communities;

DELETE FROM communities WHERE id > 20;

SELECT * FROM communities_users;

UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 20);
