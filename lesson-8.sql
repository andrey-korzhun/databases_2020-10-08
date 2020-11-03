USE vk;

-- ��� ��������?
SELECT CASE(p.gender)
	WHEN 'F' THEN 'Woman'
	WHEN 'M' THEN 'Man'
	WHEN 'A' THEN 'Alien'
	END AS Gender,
	COUNT(*) AS 'Total likes'
		FROM likes AS l
			JOIN profiles AS p
		  	  ON l.user_id = p.user_id
		GROUP BY p.gender
		ORDER BY 'Total likes' DESC;
   
   
-- 10 ����� �������...
 SELECT users.id, first_name, last_name, profiles.birthday,
 	COUNT(*) AS total_likes
  	FROM users
  		JOIN likes
      	  ON users.id = likes.target_id    
    	JOIN profiles
      	  ON users.id = profiles.user_id
  	GROUP BY profiles.user_id
  	ORDER BY profiles.birthday DESC
  	LIMIT 10;
    
  
  -- 10 ����������...
SELECT
	CONCAT(first_name, ' ', last_name) AS User,
	COUNT(likes.user_id) + COUNT(media.user_id) +
	COUNT(messages.from_user_id) AS 'Overall activity' 
	FROM users
		LEFT JOIN likes
	  	  ON likes.user_id = users.id
		LEFT JOIN media
	  	  ON media.user_id = users.id
		LEFT JOIN messages
	  	  ON messages.from_user_id = users.id
	GROUP BY users.id
	ORDER BY 'Overall activity'
	LIMIT 10;
