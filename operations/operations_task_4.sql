 -- ���� ��������, ������� 4
-- (�� �������) �� ������� users ���������� ������� �������������, ���������� �
-- ������� � ���. ������ ������ � ���� ������ ���������� �������� ('may', 'august')

-- ������� users ������� ��� ������� 2 ���� ��������

SELECT
    name, birthday_at, 
    CASE 
        WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
        WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
    END AS mounth
FROM
    users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;
