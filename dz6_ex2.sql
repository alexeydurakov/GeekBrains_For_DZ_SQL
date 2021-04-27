-- 2. Создать все необходимые внешние ключи и диаграмму отношений.

USE vk_for_exp;

DESC profiles;
DESC users; 

ALTER TABLE profiles 
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;

DESC messages;	

ALTER TABLE messages 
	ADD CONSTRAINT messages_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT messages_to_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id)
			ON DELETE CASCADE;
		
ALTER TABLE messages DROP FOREIGN KEY messages_user_id_fk;
ALTER TABLE messages DROP FOREIGN KEY messages_to_id_fk;

DESC friendship;
DESC friendship_statuses;

ALTER TABLE friendship
	ADD CONSTRAINT friendship_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT friendship_friend_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;	

ALTER TABLE friendship
	ADD CONSTRAINT friendship_friendship_status_id_fk
		FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
			ON DELETE CASCADE;	

DESC communities;
DESC communities_users;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;
		
ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
			ON DELETE CASCADE;

-- выдает ошибку, пока проставил связь руками на диаграмме
-- SQL Error [1452] [23000]: Cannot add or update a child row: a foreign key constraint fails 
-- (`vk_for_exp`.`#sql-1464_15`, CONSTRAINT `communities_users_community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE)	
		
DESC media;
DESC media_types;

ALTER TABLE media 
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;

ALTER TABLE media
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
			ON DELETE CASCADE;			

DESC posts;

ALTER TABLE posts
	ADD CONSTRAINT posts_media_id_fk
		FOREIGN KEY (media_id) REFERENCES media(id)
			ON DELETE CASCADE;

ALTER TABLE posts 
	ADD CONSTRAINT posts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE;

ALTER TABLE posts 
	ADD CONSTRAINT posts_comunity_id_fk
		FOREIGN KEY (comunity_id) REFERENCES communities(id)
			ON DELETE CASCADE;

DESC likes;

ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
		ADD CONSTRAINT likes_target_id_fk
		FOREIGN KEY (target_id) REFERENCES users(id)
			ON DELETE CASCADE;
			