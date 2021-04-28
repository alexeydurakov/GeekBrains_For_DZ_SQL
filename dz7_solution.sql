

 
 -- 1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 
  SELECT 
	users.id, users.name, orders.id
FROM 
	users
JOIN
	orders
ON
	users.id = orders.user_id;

-- 2 Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	products.id, products.name, catalogs.id, catalogs.name 
FROM 
	products
JOIN
	catalogs
ON
	products.catalog_id = catalogs.id;
	
-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

SELECT
	id,
	(SELECT name FROM cities WHERE cities.label = flights.`from`),
	(SELECT name FROM cities WHERE cities.label = flights.`to`)
FROM
	flights;


	