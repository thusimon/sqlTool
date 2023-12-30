-- find oldest 5 users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- what day of the week do most user register
SELECT DAYNAME(created_at) AS week_of_day, COUNT(DAY(created_at)) AS registers
FROM users
GROUP BY week_of_day
ORDER BY registers DESC;

-- find user who never posted a photo
SELECT username FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

-- who posted the most liked photo
-- sub query seems faster
SELECT * FROM users
WHERE id = (SELECT photos.user_id FROM photos
	JOIN likes
		ON likes.photo_id = photos.id
	GROUP BY photos.id
	ORDER BY COUNT(*) DESC
	LIMIT 1);
    
SELECT users.username AS username, COUNT(*) AS count FROM users
JOIN photos ON photos.user_id = users.id
JOIN likes ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY count DESC
LIMIT 1;

-- how many times does the average user post
SELECT (SELECT COUNT(*) FROM photos)
  / (SELECT COUNT(*) FROM users) AS avg_post;

-- the top 5 used hashtags
SELECT tag_name, COUNT(*) AS total FROM tags
JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- find users who liked every photo, they might be bots
SELECT users.id AS user_id, users.username AS username, COUNT(*) AS total FROM likes
JOIN users ON users.id = likes.user_id
GROUP BY likes.user_id HAVING total=(SELECT COUNT(*) FROM photos);
