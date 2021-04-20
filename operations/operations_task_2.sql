-- ���� ��������, ������� 2
-- ������� users ���� �������� ��������������.
-- ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ����������
-- �������� � ������� "20.10.2017 8:10".
-- ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = '����������';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('��������', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('�������', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('���������', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('������', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('����', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('�����', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');
 
 
DESC users; 
--�������� ��������� �������
ALTER TABLE users ADD (tempcol_created DATETIME, tempcol_updated DATETIME);
--������������ ������ � ���� � ���������� �� ��������� ��������
UPDATE users SET 
	tempcol_created = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), 
	tempcol_updated = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
--������� ������ �������
ALTER TABLE users DROP COLUMN created_at, DROP COLUMN updated_at;

ALTER TABLE users
	RENAME COLUMN tempcol_created TO created_at,
	RENAME COLUMN tempcol_updated TO updated_at;