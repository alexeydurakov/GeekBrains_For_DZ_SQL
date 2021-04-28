USE shop;

DESC orders ;

-- подготовка  к выполнению дз, упражнения 1, 2

-- добавляем внешние ключи
ALTER TABLE
 	orders 
 CHANGE COLUMN
	user_id user_id BIGINT(20) UNSIGNED NOT NULL;

ALTER TABLE orders 
  ADD CONSTRAINT orders_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE
 	discounts 
 CHANGE COLUMN
	user_id user_id BIGINT(20) UNSIGNED NOT NULL;

ALTER TABLE discounts 
  ADD CONSTRAINT discounts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE
 	orders_products 
 CHANGE COLUMN
	order_id order_id BIGINT(20) UNSIGNED NOT NULL;

ALTER TABLE orders_products 
  ADD CONSTRAINT orders_products_user_id_fk 
    FOREIGN KEY (order_id) REFERENCES orders(id)
      ON DELETE CASCADE;

     
ALTER TABLE
 	orders_products 
 CHANGE COLUMN
	product_id product_id BIGINT(20) UNSIGNED NOT NULL;  

ALTER TABLE orders_products 
  ADD CONSTRAINT orders_products_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
      ON DELETE CASCADE;

ALTER TABLE
 	products 
 CHANGE COLUMN
	catalog_id catalog_id BIGINT(20) UNSIGNED NOT NULL;  

ALTER TABLE products 
  ADD CONSTRAINT products_catalog_id_fk 
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
      ON DELETE CASCADE;

ALTER TABLE
 	discounts 
 CHANGE COLUMN
	product_id product_id BIGINT(20) UNSIGNED NOT NULL; 

ALTER TABLE discounts 
  ADD CONSTRAINT discounts_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
      ON DELETE CASCADE;
     
ALTER TABLE
 	storehouses_products 
 CHANGE COLUMN
	product_id product_id BIGINT(20) UNSIGNED NOT NULL; 

ALTER TABLE
 	storehouses_products 
 CHANGE COLUMN
	storehouse_id storehouse_id BIGINT(20) UNSIGNED NOT NULL; 

ALTER TABLE storehouses_products 
  ADD CONSTRAINT storehouses_products_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
      ON DELETE CASCADE;

ALTER TABLE storehouses_products 
  ADD CONSTRAINT storehouses_storehouse_id_fk 
    FOREIGN KEY (storehouse_id) REFERENCES storehouses(id)
      ON DELETE CASCADE;
          
-- заполняем таблицы orders и orders_product

INSERT INTO orders 
	SELECT
	id,
	FLOOR(1 + (RAND() * 6)),
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
	FROM users;

INSERT INTO
 	orders_products(order_id, product_id, total)
 	VALUES
 	(1 , 2 , 1),
 	(1 , 4 , 1),
 	(2 , 1 , 2),
 	(2 , 5 , 1),
 	(3 , 5 , 3),
 	(3 , 7 , 1),
 	(4 , 4 , 1),
 	(5 , 1 , 1),
 	(5 , 2 , 1),
 	(6 , 3 , 1),
 	(6 , 6 , 1);
 
 
 -- подготовка  к выполнению дз, упражнения 3
 
 CREATE TABLE IF NOT EXISTS flights(
 	id SERIAL PRIMARY KEY,
	`from` VARCHAR(20) NOT NULL, 
 	`to` VARCHAR(20) NOT NULL
);

CREATE TABLE  IF NOT EXISTS cities(
	label VARCHAR(20) PRIMARY KEY, 
	name VARCHAR(20)
);

	
INSERT INTO flights VALUES
 	(NULL, 'moscow', 'omsk'),
 	(NULL, 'novgorod', 'kazan'),
 	(NULL, 'irkutsk', 'moscow'),
	(NULL, 'omsk', 'irkutsk'),
	(NULL, 'moscow', 'kazan');

INSERT INTO cities VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');

ALTER TABLE flights
	ADD CONSTRAINT flights_from_label_fk
		FOREIGN KEY(`from`) REFERENCES cities(label);

ALTER TABLE flights
 	ADD CONSTRAINT flights_to_label_fk
 		FOREIGN KEY(`to`) REFERENCES cities(label);