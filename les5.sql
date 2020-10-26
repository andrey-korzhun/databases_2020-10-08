-- ������������ ������� �� ���� ����������, ����������, ���������� � �����������

USE shop;

/*1. ����� � ������� users ���� created_at � updated_at ��������� ��������������.
��������� �� �������� ����� � ��������. */

INSERT INTO users(created_at, updated_at) VALUES (NOW(), NOW());

/*2.������� users ���� �������� ��������������. ������ created_at � updated_at
���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10.
���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.*/

UPDATE users SET created_at = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"),
updated_at = STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i");

ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

/*3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����:
0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������.
���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value.
������ ������� ������ ������ ���������� � �����, ����� ���� �������.*/

SELECT * FROM storehouses_products ORDER BY value = 0, value;

/*4. �� ������� users ���������� ������� �������������, ���������� � ������� � ���.
������ ������ � ���� ������ ���������� �������� (may, august)*/

SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('May','August');

/*5. �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
������������ ������ � �������, �������� � ������ IN.*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- ������������ ������� ���� ���������� �������

/*1. ����������� ������� ������� ������������� � ������� users.*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;

/*2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������.
������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.*/

INSERT INTO users (name, birthday_at) VALUES
  ('�����', '1988-03-22'),
  ('�����', '1993-05-10'),
  ('��������', '1992-03-22');

SELECT COUNT(name) birthdays, DAYNAME(CONCAT(CONCAT(YEAR(NOW()),'-'), SUBSTRING(birthday_at, 6,5))) dayweek 
	from users
    GROUP BY dayweek;

/*3. ����������� ������������ ����� � ������� �������.*/
   
SELECT SUM(id) FROM shop.users;
