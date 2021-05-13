-- 2 Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах (сумма количестива пользователей во всех группах делённая на количество групп)
-- самый молодой пользователь в группе (желательно вывести имя и фамилию)
-- самый старший пользователь в группе (желательно вывести имя и фамилию)
-- количество пользователей в группе
-- всего пользователей в системе (количество пользователей в таблице users)
-- отношение в процентах для последних двух значений (общее количество пользователей в группе / всего пользователей в системе) * 100


SELECT DISTINCT communities.id, communities.name,
  (SELECT count(*) FROM communities) as avr_users,
  FIRST_VALUE(communities_users.user_id) OVER w ORDER BY profiles.birthday DESC as min_age,
  FIRST_VALUE(communities_users.user_id) OVER w ORDER BY profiles.birthday as max_age,
  COUNT(communities_users.user_id) OVER w  as users_comm,
  (SELECT count(*) FROM users) as users_total,  
  (COUNT(communities_users.user_id) OVER w / (SELECT count(*) FROM users)*100) as '%%'
FROM communities_users
	JOIN communities 
		ON (communities.id = communities_users.community_id)
	JOIN users 
		ON (users.id = communities_users.user_id)
	JOIN profiles 
		ON (communities_users.user_id=profiles.user_id)
WINDOW w AS PARTITION BY communities_users.community_id
ORDER by id 
;