-- Практическое задание по теме “Транзакции, переменные, представления”


-- 1 В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

USE sample;
SELECT * FROM users;

START TRANSACTION;
INSERT INTO sample.users (name) SELECT shop.users.name FROM shop.users WHERE shop.users.id = 1;
COMMIT;

SELECT * FROM users;


-- 2 Создайте представление, которое выводит название name товарной позиции из таблицы products 
-- и соответствующее название каталога name из таблицы catalogs.

USE shop;

CREATE OR REPLACE VIEW v AS
	SELECT products.name AS prod_name, catalogs.name AS cat_name
		FROM products, catalogs
			WHERE products.catalog_id = catalogs.id; 
		
		
-- 3 по желанию) Пусть имеется таблица с календарным полем created_at. 
-- В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
-- если дата присутствует в исходном таблице и 0, если она отсутствует.	



-- 4о желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DELETE FROM table_with_date
WHERE created_at NOT IN (
	SELECT * FROM (
		SELECT *
			FROM table_with_date
				ORDER BY created_at DESC
					LIMIT 5) 
) ORDER BY created_at DESC;
			