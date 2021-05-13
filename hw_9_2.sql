-- ѕрактическое задание по теме Ујдминистрирование MySQLФ 

-- 1 —оздайте двух пользователей которые имеют доступ к базе данных shop. 
-- ѕервому пользователю shop_read должны быть доступны только запросы на чтение данных, 


CREATE USER shop_read;
GRANT SELECT ON *.* TO 'shop_read'@'localhost';


-- второму пользователю shop Ч любые операции в пределах базы данных shop.
CREATE USER shop;
GRANT ALL ON shop.* TO shop;
GRANT GRANT OPTION ON shop.* TO 'shop'@'localhost';		

-- 2(по желанию) ѕусть имеетс€ таблица accounts содержаща€ три столбца id, name, password, содержащие первичный ключ, им€ пользовател€ и его пароль. 
-- —оздайте представление username таблицы accounts, предоставл€ющий доступ к столбца id и name. 
-- —оздайте пользовател€ user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представлени€ username.

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

