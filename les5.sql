-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

USE shop;

/*1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
Заполните их текущими датой и временем. */

INSERT INTO users(created_at, updated_at) VALUES (NOW(), NOW());

/*2.Таблица users была неудачно спроектирована. Записи created_at и updated_at
были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10.
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/

UPDATE users SET created_at = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"),
updated_at = STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i");

ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
0, если товар закончился и выше нуля, если на складе имеются запасы.
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
Однако нулевые запасы должны выводиться в конце, после всех записей.*/

SELECT * FROM storehouses_products ORDER BY value = 0, value;

/*4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
Месяцы заданы в виде списка английских названий (may, august)*/

SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('May','August');

/*5. Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
Отсортируйте записи в порядке, заданном в списке IN.*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- Практическое задание теме «Агрегация данных»

/*1. Подсчитайте средний возраст пользователей в таблице users.*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;

/*2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

INSERT INTO users (name, birthday_at) VALUES
  ('Антон', '1988-03-22'),
  ('Павел', '1993-05-10'),
  ('Светлана', '1992-03-22');

SELECT COUNT(name) birthdays, DAYNAME(CONCAT(CONCAT(YEAR(NOW()),'-'), SUBSTRING(birthday_at, 6,5))) dayweek 
	from users
    GROUP BY dayweek;

/*3. Подсчитайте произведение чисел в столбце таблицы.*/
   
SELECT SUM(id) FROM shop.users;
