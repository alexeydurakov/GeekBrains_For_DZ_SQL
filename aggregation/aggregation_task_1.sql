-- ���� ���������, ������� 1
-- ����������� ������� ������� ������������� � ������� users

-- ������� users ������� ��� ������� 2 ���� ��������

SELECT * FROM users;
DESC users;
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())),0) AS AVG_Age FROM users;