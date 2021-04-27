-- 4. ���������� ����� ���������� ������ ������ ����� ������� ������������� (������� ������ �������� 10 ����� ������� �������������).

USE vk_for_exp;

DESC profiles ;
DESC likes ;



SELECT COUNT(*) as total_likes FROM likes WHERE user_id IN (
	SELECT user_id FROM likes WHERE user_id IN (
		SELECT * FROM (
			SELECT user_id FROM profiles ORDER by birthday DESC LIMIT 10
		) as user_id		
	)
)
;
	