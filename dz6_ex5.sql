-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).
DESC media;
DESC likes ;
DESC messages ;
SELECT id, SUM(count) as sum FROM (
	SELECT user_id as id, COUNT(*) as count FROM media GROUP by user_id
		UNION
	SELECT user_id as id, COUNT(*) as count FROM likes GROUP by user_id
		UNION
	SELECT from_user_id as id, COUNT(*) as count FROM messages GROUP by from_user_id
) as temp_sum GROUP BY id ORDER BY sum  ASC LIMIT 10;


