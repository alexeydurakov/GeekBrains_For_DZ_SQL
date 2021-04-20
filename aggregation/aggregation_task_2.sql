-- Тема Агрегация, задание 2
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

-- Таблица users создана для задания 2 темы Операции

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_birthday,
    COUNT(*) AS amount_birthdays
FROM
    users
GROUP BY 
    week_day_birthday
ORDER BY
	amount_birthdays DESC;