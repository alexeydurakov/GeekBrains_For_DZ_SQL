-- 3. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

USE vk_for_exp;

DESC profiles ;
DESC likes ;

SELECT COUNT(*) AS count, gender FROM likes, profiles
WHERE likes.user_id = profiles.user_id
GROUP BY gender;