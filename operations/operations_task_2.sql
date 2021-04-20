-- Тема Операции, задание 2
-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались
-- значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Геннадий', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Наталья', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('Александр', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('Сергей', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('Иван', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('Мария', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');
 
 
DESC users; 
--создадим временные столбцы
ALTER TABLE users ADD (tempcol_created DATETIME, tempcol_updated DATETIME);
--конвертируем строку в дату и записываем во временных столбцах
UPDATE users SET 
	tempcol_created = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), 
	tempcol_updated = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
--удаляем старые столбцы
ALTER TABLE users DROP COLUMN created_at, DROP COLUMN updated_at;

ALTER TABLE users
	RENAME COLUMN tempcol_created TO created_at,
	RENAME COLUMN tempcol_updated TO updated_at;