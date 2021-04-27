-- 1. ������� � ��������� ������� ������ � ������.

USE vk_for_exp;

-- �������� ������� ������
CREATE TABLE likes(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
	user_id INT UNSIGNED NOT NULL COMMENT "id ������������, ������� ������� ����",
	target_id INT UNSIGNED NOT NULL COMMENT "������������� ������� ������������� ���� ��������� ������� �������� ����",
	target_type ENUM ('messages', 'users', 'posts', 'media') NOT NULL COMMENT "��� ��������� ������� ��������� ����",
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� �����"
);

-- ���������� ������� ������
-- �������� ��������� ������� ��� ����� ������
DROP TABLE IF EXISTS target_types;
CREATE TEMPORARY TABLE target_types(
	name VARCHAR(100) NOT NULL UNIQUE
);

-- �������� ��������� �������
INSERT INTO target_types (name) VALUES
('messages'),
('users'),
('posts'),
('media');

-- �������� ������� ������
INSERT INTO likes
	SELECT
	id,
	FLOOR(1 + (RAND() * 100)),
	FLOOR(1 + (RAND() *100)),
	(SELECT name FROM target_types ORDER BY RAND() LIMIT 1),
	CURRENT_TIMESTAMP
	FROM messages; 

-- �������� ������� ������
CREATE TABLE posts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
	user_id INT UNSIGNED NOT NULL COMMENT "id ������������, ������� ������� ����",
	comunity_id INT UNSIGNED COMMENT "������� �������������� ������ ���� ����������",
	head VARCHAR(255) COMMENT "��������� �����",
	body TEXT NOT NULL COMMENT "���� �����",
	media_id INT UNSIGNED COMMENT "��������� ����� ����",
	is_public BOOLEAN DEFAULT TRUE COMMENT "�������� �� ���� ���������",
	is_archived BOOLEAN DEFAULT FALSE COMMENT "�������� �� ���� ��������������",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


	
