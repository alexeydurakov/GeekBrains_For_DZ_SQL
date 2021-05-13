-- ������������ ������� �� ���� �����������, ����������, ��������������


-- 1 � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.

USE sample;
SELECT * FROM users;

START TRANSACTION;
INSERT INTO sample.users (name) SELECT shop.users.name FROM shop.users WHERE shop.users.id = 1;
COMMIT;

SELECT * FROM users;


-- 2 �������� �������������, ������� ������� �������� name �������� ������� �� ������� products 
-- � ��������������� �������� �������� name �� ������� catalogs.

USE shop;

CREATE OR REPLACE VIEW v AS
	SELECT products.name AS prod_name, catalogs.name AS cat_name
		FROM products, catalogs
			WHERE products.catalog_id = catalogs.id; 
		
		
-- 3 �� �������) ����� ������� ������� � ����������� ����� created_at. 
-- � ��� ��������� ���������� ����������� ������ �� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. 
-- ��������� ������, ������� ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, 
-- ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.	



-- 4� �������) ����� ������� ����� ������� � ����������� ����� created_at. 
-- �������� ������, ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.

DELETE FROM table_with_date
WHERE created_at NOT IN (
	SELECT * FROM (
		SELECT *
			FROM table_with_date
				ORDER BY created_at DESC
					LIMIT 5) 
) ORDER BY created_at DESC;
			