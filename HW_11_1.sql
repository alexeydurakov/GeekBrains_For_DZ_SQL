-- 1 �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, catalogs � products 
-- � ������� logs ���������� ����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � ���������� ���� name.

USE for_hw;

CREATE TABLE Logs
	(
		created_at DATETIME NOT NULL,
		table_name VARCHAR(45) NOT NULL,
		str_id INT UNSIGNED NOT NULL,
		name_value VARCHAR(255) NOT NULL
	) ENGINE = Archive;
	
CREATE TRIGGER users_insrt AFTER INSERT ON users
	FOR EACH ROW
	BEGIN 
		INSERT INTO logs (created_at, table_name, str_id, name_value) VALUES (NOW(), "users", NEW.id, NEW.name)
	END;

CREATE TRIGGER users_insrt AFTER INSERT ON catalogs
	FOR EACH ROW
	BEGIN 
		INSERT INTO logs (created_at, table_name, str_id, name_value) VALUES (NOW(), "catalogs", NEW.id, NEW.name)
	END;

CREATE TRIGGER users_insrt AFTER INSERT ON products
	FOR EACH ROW
	BEGIN 
		INSERT INTO logs (created_at, table_name, str_id, name_value) VALUES (NOW(), "products", NEW.id, NEW.name)
	END;
	
