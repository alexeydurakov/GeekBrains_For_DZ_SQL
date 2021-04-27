-- 1. Создать и заполнить таблицы лайков и постов.

USE vk_for_exp;

-- Создание таблицы лайков
CREATE TABLE likes(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	user_id INT UNSIGNED NOT NULL COMMENT "id пользователя, который поствил лайк",
	target_id INT UNSIGNED NOT NULL COMMENT "идентификатор который соответствует типу сущьности которой поставли лайк",
	target_type ENUM ('messages', 'users', 'posts', 'media') NOT NULL COMMENT "тип сущьности которой поставили лайк",
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "время создания лайка"
);

-- Заполнение таблици лайков
-- создадим временную таблицу для типов постов
DROP TABLE IF EXISTS target_types;
CREATE TEMPORARY TABLE target_types(
	name VARCHAR(100) NOT NULL UNIQUE
);

-- заполним временную таблицу
INSERT INTO target_types (name) VALUES
('messages'),
('users'),
('posts'),
('media');

-- заполним таблицу лайков
INSERT INTO likes
	SELECT
	id,
	FLOOR(1 + (RAND() * 100)),
	FLOOR(1 + (RAND() *100)),
	(SELECT name FROM target_types ORDER BY RAND() LIMIT 1),
	CURRENT_TIMESTAMP
	FROM messages; 

-- Создадим таблицу постов
CREATE TABLE posts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	user_id INT UNSIGNED NOT NULL COMMENT "id пользователя, который поствил лайк",
	comunity_id INT UNSIGNED COMMENT "признак принадлежности какому либо сообществу",
	head VARCHAR(255) COMMENT "Заголовок поста",
	body TEXT NOT NULL COMMENT "тело поста",
	media_id INT UNSIGNED COMMENT "приложить медиа файл",
	is_public BOOLEAN DEFAULT TRUE COMMENT "является ли пост публичным",
	is_archived BOOLEAN DEFAULT FALSE COMMENT "является ли пост архивированным",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


	
