

 
 -- 1 ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
 
  SELECT 
	users.id, users.name, orders.id
FROM 
	users
JOIN
	orders
ON
	users.id = orders.user_id;

-- 2 �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

SELECT 
	products.id, products.name, catalogs.id, catalogs.name 
FROM 
	products
JOIN
	catalogs
ON
	products.catalog_id = catalogs.id;
	
-- ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
-- ���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
-- �������� ������ ������ flights � �������� ���������� �������.

SELECT
	id,
	(SELECT name FROM cities WHERE cities.label = flights.`from`),
	(SELECT name FROM cities WHERE cities.label = flights.`to`)
FROM
	flights;


	