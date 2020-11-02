/*
������� 1
������� � ��������� ������� ������ � ������.
*/

USE vk;

-- ������� ������
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ������� ����� ������
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

 -- ��������� �����
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

-- ��������
SELECT * FROM likes LIMIT 10;

-- �������� ������� ������
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (1, 1, 2, 'Eligendi libero dolor fuga est dolorem et est quibusdam.', 'Molestiae inventore ex assumenda eius vel ipsam fuga non. Aut sit maiores est animi ea quisquam. Cumque totam est explicabo rerum voluptas. Ipsum laboriosam ut iste quo veniam et soluta.', 2, 0, 1, '2020-04-29 22:14:25', '2020-10-16 07:09:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (2, 7, 1, 'Ab velit ad dolor libero voluptatem.', 'Et tempore fugiat totam nihil. Nobis totam eum quidem itaque excepturi omnis sint. Impedit qui fuga placeat deleniti ut quia.', 6, 0, 0, '2020-09-23 14:48:00', '2020-10-18 19:04:47');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (3, 4, 8, 'Eveniet et nemo accusamus ipsam et quod.', 'Facilis id consequuntur saepe qui cum expedita. Est consequuntur et et non non. Aspernatur sed quia occaecati et qui facere quibusdam dolor. Iusto aperiam voluptatibus molestiae.', 5, 1, 0, '2019-12-17 17:56:06', '2020-10-17 18:28:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (4, 5, 4, 'Vero rerum quasi quam quidem expedita consequatur deserunt.', 'Quas in earum possimus exercitationem delectus. Corporis alias sint ipsum est facere. Rerum asperiores in nemo. Et odio facilis dicta in.', 3, 1, 0, '2020-03-25 00:27:03', '2020-10-11 22:10:39');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (5, 4, 6, 'Itaque sunt officia tempore eum et iure aspernatur.', 'Sit non error sunt rerum soluta dolorem. Vero quos nihil quasi temporibus possimus harum possimus pariatur. Iusto occaecati aut est sint.', 6, 1, 1, '2019-12-18 18:01:34', '2020-10-26 20:01:08');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (6, 4, 7, 'Aut dolor veniam sunt ipsum.', 'Tempore praesentium iste quasi cum ex. Libero est mollitia minima vitae officiis cum vitae. Dolor id eaque id omnis vel cupiditate.', 2, 1, 0, '2019-11-07 05:17:57', '2020-10-23 17:20:38');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (7, 2, 5, 'Quam quia impedit consectetur consequatur perspiciatis voluptates blanditiis consequatur.', 'Doloremque voluptatibus quas dolor nulla consequuntur est et. Amet voluptatem reiciendis quis. Quod tempora est officiis aperiam tempore et. Tempore ea tempora sapiente asperiores.', 5, 0, 0, '2019-12-21 19:11:16', '2020-10-25 20:59:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (8, 5, 2, 'Sit sed quia totam ut saepe eaque non.', 'Repellat quae et et soluta. Eos fugit aut omnis adipisci. Doloribus vel consectetur id nihil nesciunt quas esse quos. Quaerat molestias ullam vitae voluptate atque eos et.', 9, 1, 1, '2020-02-08 01:56:23', '2020-10-31 07:58:01');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (9, 1, 8, 'Porro id ea dolorum.', 'Molestiae magnam nam blanditiis sapiente. Tempore sit eos repellendus voluptatum exercitationem.', 8, 0, 1, '2019-11-14 04:44:21', '2020-10-11 20:30:36');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (10, 4, 9, 'Molestiae quia minus rerum et possimus.', 'Earum laudantium rem qui delectus. Amet ex amet nam id aut. Minus sed enim ipsa et dolorum vel.', 8, 1, 0, '2020-03-21 14:51:54', '2020-10-27 03:26:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (11, 4, 5, 'Ipsum illum perferendis dolores laboriosam incidunt.', 'Officia consequatur aut eveniet explicabo hic aspernatur. Voluptas assumenda id provident ipsam voluptatibus dolor voluptas. Velit voluptatem porro nobis voluptates non eveniet consequatur.', 6, 0, 1, '2020-03-03 05:01:48', '2020-10-12 00:33:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (12, 6, 6, 'Enim consequatur ab optio laborum.', 'Eaque sed dolores ut sequi eligendi. Consequatur facere quo dicta dicta ea. Delectus praesentium in doloribus architecto laborum. Temporibus deserunt in autem aut.', 1, 0, 1, '2020-08-23 11:59:00', '2020-10-28 05:02:36');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (13, 7, 4, 'Soluta amet doloremque molestias.', 'Ad dolore aut laborum nobis. Consectetur odio et dicta repudiandae. Laudantium quis qui et velit quia aut dolor.', 2, 1, 0, '2020-03-11 07:31:59', '2020-11-02 11:57:35');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (14, 7, 9, 'Nostrum ex consequatur modi distinctio ex.', 'Inventore minus in tempore tempora ea. Cum pariatur inventore consequuntur rerum cumque pariatur quia. Beatae ex ea enim dolor et.', 9, 0, 0, '2020-06-08 07:17:46', '2020-10-08 12:49:27');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (15, 4, 1, 'Quaerat ut quaerat fugiat dolorum aut quod unde.', 'Rem ullam dolorum eum quibusdam dolorum. Sit cupiditate aperiam nulla unde. Sit aliquam recusandae perferendis vel temporibus non. Perferendis sequi quia sequi dolores dolore.', 4, 1, 0, '2020-07-06 10:44:04', '2020-10-13 03:08:35');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (16, 2, 8, 'Assumenda dolore vero non excepturi non et.', 'Et iure iure dolor suscipit nam adipisci. Saepe pariatur laudantium sit qui at veniam consequuntur. Excepturi dolorem dolor ratione dolorum rerum laboriosam.', 2, 0, 0, '2020-07-06 00:09:02', '2020-10-31 05:31:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (17, 9, 7, 'Dignissimos voluptatem qui atque ea.', 'Magnam odit eum aut et animi consequatur sapiente eos. Fugit officia qui et enim sit. Non quidem non doloribus et voluptas veniam soluta. Soluta rerum sit dolorem aperiam ea aut.', 9, 0, 1, '2020-09-23 01:02:03', '2020-10-11 08:14:10');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (18, 9, 6, 'Corrupti sunt quae iure consequuntur occaecati atque.', 'Vitae voluptatem facilis ea molestias harum. Cupiditate odit saepe laudantium enim et at sint. Sed est et itaque pariatur.', 8, 1, 0, '2020-05-25 22:24:23', '2020-10-05 19:03:40');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (19, 7, 5, 'Vero cumque distinctio provident sed modi et libero.', 'Labore earum quidem tempore omnis laudantium voluptas. Accusamus natus eius praesentium non labore ut. Ratione dolores ipsum iste molestias officia est.', 6, 0, 0, '2020-05-15 23:48:43', '2020-10-30 19:29:59');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (20, 8, 1, 'Et provident dolorem eos aut exercitationem velit.', 'Qui neque sed ut fugiat reiciendis voluptatem. Aperiam occaecati quis cum blanditiis earum voluptates. Nobis eligendi placeat cumque adipisci quo et quas modi. Iste cupiditate repudiandae autem exercitationem blanditiis vero dolores.', 5, 1, 1, '2019-11-08 02:51:02', '2020-10-24 05:59:42');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (21, 9, 3, 'Tempora ducimus officiis officia est occaecati libero soluta.', 'Sunt ullam eos iure architecto rerum excepturi sequi. Ut excepturi excepturi illum et. In voluptatem nisi molestiae dolor. Eaque molestiae doloribus beatae veniam.', 2, 1, 0, '2020-03-06 00:15:34', '2020-10-26 08:28:20');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (22, 5, 2, 'Nobis in sit labore sed adipisci praesentium pariatur pariatur.', 'Aut sed et labore. Et labore accusantium veritatis non et. Vero nulla odio suscipit. Iste modi qui voluptate quos.', 5, 1, 0, '2020-04-08 09:48:33', '2020-10-03 20:27:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (23, 4, 6, 'Optio velit mollitia deserunt aut veritatis et vel.', 'Neque magni laudantium enim sunt est nostrum praesentium. Et animi sed deserunt recusandae corporis. Velit et tempora ex ut est. Nemo consequatur accusantium eveniet ut eos impedit eveniet.', 1, 0, 1, '2020-02-21 20:04:29', '2020-10-27 13:02:29');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (24, 2, 9, 'Qui et ab fugiat et sit quidem ipsum.', 'Rerum quae quia consectetur reprehenderit aut. Earum nemo ratione consequuntur soluta et ipsam. Consequuntur enim pariatur ipsam asperiores non. Magnam ut consectetur quisquam repellat corporis.', 5, 1, 0, '2020-08-25 04:01:35', '2020-10-12 12:05:52');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (25, 9, 3, 'Et omnis error et.', 'Praesentium nisi ut enim enim quia. Ipsa neque nihil commodi quo voluptatem in.', 7, 1, 0, '2020-03-15 12:31:33', '2020-10-22 18:53:57');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (26, 6, 4, 'Nemo ut soluta tempora eligendi repudiandae.', 'Repellendus accusantium aperiam et. Aut necessitatibus blanditiis vel non cumque ullam voluptas. Corrupti suscipit veritatis sint id. Occaecati consectetur et sequi quo maiores maiores. Impedit dolores ut eligendi omnis unde et.', 6, 0, 1, '2019-11-11 20:47:36', '2020-11-02 01:40:49');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (27, 8, 9, 'Ut ratione nihil eius voluptatem iusto perspiciatis nihil.', 'Nulla soluta reiciendis illo distinctio. Dolorum provident aut explicabo quas asperiores. Est incidunt facere exercitationem. Odio cum in enim tenetur tempore hic nostrum.', 3, 1, 1, '2020-05-08 01:39:23', '2020-10-18 00:54:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (28, 4, 8, 'Nisi numquam omnis autem iure aperiam nesciunt asperiores.', 'Id molestiae ab reiciendis. At impedit numquam fuga sit mollitia et aliquam. Blanditiis ut adipisci debitis aut. Dolor voluptatibus numquam deleniti sed dolorem aut voluptas.', 4, 1, 1, '2020-09-22 09:59:19', '2020-10-25 08:30:14');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (29, 7, 2, 'Nihil quia ab delectus aut fugit voluptatem soluta.', 'Aut amet et officiis quia amet exercitationem aut. Consequuntur velit impedit omnis ut omnis. Quis expedita dignissimos laudantium repudiandae.', 4, 1, 0, '2020-09-04 20:23:00', '2020-10-20 04:17:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (30, 5, 9, 'Vel dolorum odio dolores aut aut.', 'Error molestiae et sit qui vel. Vel voluptatibus distinctio sequi nostrum est. Est eaque nostrum natus.', 8, 0, 1, '2019-11-07 21:20:59', '2020-10-26 03:04:05');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (31, 5, 4, 'Harum et quam facere ullam.', 'Quisquam dolor harum velit consequuntur. Animi et iure id enim pariatur. Est nesciunt et nam molestiae quia nobis. Veritatis placeat consequatur eaque tempore dolores quas minus.', 2, 1, 1, '2020-07-10 01:34:19', '2020-10-02 19:05:17');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (32, 7, 4, 'Sunt soluta quae autem qui laborum maiores consequatur.', 'Molestiae voluptatibus at ad. Sit quo quo vitae magnam illum rerum. Id cum quis et quas. Non a et tenetur non quis officiis.', 1, 0, 1, '2019-12-31 05:08:04', '2020-10-05 22:29:47');

/*
������� 2
������� ��� ����������� ������� ����� � ��������� ���������.
*/

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_users_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk
  FOREIGN KEY (community_id) REFERENCES communities(id)
    ON DELETE CASCADE;

ALTER TABLE media MODIFY COLUMN media_type_id INT UNSIGNED;

ALTER TABLE media
  ADD CONSTRAINT media_media_types_id_fk
  FOREIGN KEY (media_type_id) REFERENCES media_types(id)
    ON DELETE SET NULL;

ALTER TABLE media MODIFY COLUMN user_id INT UNSIGNED;

ALTER TABLE media
  ADD CONSTRAINT media_users_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE SET NULL;

ALTER TABLE posts
  ADD CONSTRAINT posts_users_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE posts
  ADD CONSTRAINT posts_community_id_fk
  FOREIGN KEY (community_id) REFERENCES communities(id)
    ON DELETE CASCADE;

ALTER TABLE posts
  ADD CONSTRAINT posts_media_id_fk
  FOREIGN KEY (media_id) REFERENCES media(id)
    ON DELETE SET NULL;

ALTER TABLE likes
  ADD CONSTRAINT likes_users_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE likes
  ADD CONSTRAINT likes_target_type_id_fk
  FOREIGN KEY (target_type_id) REFERENCES target_types(id)
    ON DELETE CASCADE;

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
  FOREIGN KEY (from_user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE messages
  ADD CONSTRAINT messages_to_user_id_fk
  FOREIGN KEY (to_user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE friendships MODIFY COLUMN status_id INT UNSIGNED;

ALTER TABLE friendships
  ADD CONSTRAINT friendship_status_id_fk
  FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
    ON DELETE SET NULL;

ALTER TABLE friendships
  ADD CONSTRAINT friendship_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;

ALTER TABLE friendships
  ADD CONSTRAINT friendship_friend_id_fk
  FOREIGN KEY (friend_id) REFERENCES users(id)
    ON DELETE CASCADE;

   
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_fk
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_users_fk_1
    FOREIGN KEY (user_id) REFERENCES users(id);   
   
 ALTER TABLE likes
  ADD CONSTRAINT likes_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT likes_fk_1
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
   
/*
 ������� 3
���������� ����� ���������� ������ ������ ����� �������
������������� (������� ������ �������� 10 ����� �������
�������������).
*/

SELECT COUNT(*)
FROM likes
WHERE target_type_id = (
  SELECT id FROM target_types WHERE name = 'users'
)
AND target_id IN (
  SELECT user_id
  FROM (
    SELECT
        user_id,
        ROW_NUMBER() OVER (ORDER BY birthday DESC) AS n_youngest
    FROM profiles
  ) youngest_people
  WHERE n_youngest <= 10
)




/*
 ������� 4
���������� ��� ������ �������� ������ (�����) - �������
��� �������?
*/

SELECT
    gender,
    n_likes
FROM (
    SELECT p.gender, COUNT(*) n_likes
    FROM profiles p, likes l
    WHERE p.user_id = l.user_id  -- �������� ���� JOIN ������������
    GROUP BY p.gender
) gender_likes
ORDER BY n_likes DESC LIMIT 1




/*
 ������� 5
����� 10 �������������, ������� ��������� ����������
���������� � ������������� ���������� ����.
*/


SELECT
    id,
    CONCAT(first_name, ' ', last_name) full_name,
      (SELECT COUNT(*) FROM likes WHERE user_id = u.id)
    + (SELECT 2 * COUNT(*) FROM friendships WHERE user_id = u.id)
    + (SELECT 2 * COUNT(*) FROM friendships WHERE friend_id = u.id)
    + (SELECT 2 * COUNT(*) FROM media WHERE user_id = u.id)
    + (SELECT 5 * COUNT(*) FROM posts WHERE user_id = u.id) n_activity
FROM users u
ORDER BY n_activity LIMIT 10;