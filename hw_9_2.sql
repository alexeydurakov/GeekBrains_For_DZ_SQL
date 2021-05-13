-- ������������ ������� �� ���� ������������������ MySQL� 

-- 1 �������� ���� ������������� ������� ����� ������ � ���� ������ shop. 
-- ������� ������������ shop_read ������ ���� �������� ������ ������� �� ������ ������, 


CREATE USER shop_read;
GRANT SELECT ON *.* TO 'shop_read'@'localhost';


-- ������� ������������ shop � ����� �������� � �������� ���� ������ shop.
CREATE USER shop;
GRANT ALL ON shop.* TO shop;
GRANT GRANT OPTION ON shop.* TO 'shop'@'localhost';		

-- 2(�� �������) ����� ������� ������� accounts ���������� ��� ������� id, name, password, ���������� ��������� ����, ��� ������������ � ��� ������. 
-- �������� ������������� username ������� accounts, ��������������� ������ � ������� id � name. 
-- �������� ������������ user_read, ������� �� �� ���� ������� � ������� accounts, ������, ��� �� ��������� ������ �� ������������� username.

USE for_hw;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45),
	password VARCHAR(45)
);

INSERT INTO accounts VALUES
	(NULL, 'James Barton', 'qwerty'),
	(NULL, 'Price Rojas', '1234'),
	(NULL, 'Nero Fuller', '2005');
	
CREATE OR REPLACE VIEW username(u_id, u_name) AS SELECT id, name FROM accounts;

CREATE USER shop_read;

GRANT SELECT ON for_hw.username TO 'shop_read'@'localhost';

