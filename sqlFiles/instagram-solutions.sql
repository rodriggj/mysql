SHOW DATABASES;
USE ig_clone;

# 1. Finding 5 oldest customers
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

# 2. Most Popular Registration date
SELECT
  DAYNAME(created_at) AS day,
  COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

#3. Define who has never posted a photo
SELECT
  username AS user
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL;

#4. Who got the most likes on a photo
SELECT
  photos.id,
  users.username,
  photos.image_url,
  COUNT(*) AS Likes
FROM photos
INNER JOIN users
  ON photos.user_id = users.id
LEFT JOIN likes
  ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY Likes DESC
LIMIT 5;

#5. How many times do average users post -> total number of photos/total number of users
SELECT
  (SELECT count(*) FROM photos)/(SELECT count(*) FROM users)
AS 'Avg Post / User';
