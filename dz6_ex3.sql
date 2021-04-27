-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

USE vk_for_exp;

DESC profiles ;
DESC likes ;

SELECT COUNT(*) AS count, gender FROM likes, profiles
WHERE likes.target_id = profiles.user_id
GROUP BY gender;