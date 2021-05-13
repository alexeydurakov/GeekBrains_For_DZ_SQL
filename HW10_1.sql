
-- 1 Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.

USE vk_for_exp;


CREATE INDEX profiles_birthday_gender_idx ON profiles(birthday, gender);
CREATE INDEX profiles_city_idx ON profiles(city);

CREATE INDEX users_last_name_first_name_idx ON users(last_name, first_name);
CREATE INDEX users_email_idx ON users(email);
CREATE INDEX users_phone_idx ON users(phone);

CREATE INDEX messages_body_idx ON messages(body);

CREATE INDEX media_filename_idx ON media(filename);