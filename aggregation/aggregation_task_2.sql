-- ���� ���������, ������� 2
-- ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������.
-- ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.

-- ������� users ������� ��� ������� 2 ���� ��������

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_birthday,
    COUNT(*) AS amount_birthdays
FROM
    users
GROUP BY 
    week_day_birthday
ORDER BY
	amount_birthdays DESC;