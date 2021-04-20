-- Тема Агрегация, задание 1
-- Подсчитайте средний возраст пользователей в таблице users

-- Таблица users создана для задания 2 темы Операции

SELECT * FROM users;
DESC users;
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())),0) AS AVG_Age FROM users;