CREATE DATABASE IF NOT EXISTS `instagram-clone`;
USE `instagram-clone`;
DROP TABLES users, photos, comments, likes;

CREATE TABLE IF NOT EXISTS `users` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS `photos` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS `comments` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE IF NOT EXISTS  `likes` (
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

SHOW TABLES;
DESC users;
DESC photos;
DESC comments;
DESC likes;

INSERT INTO users (username)
VALUES
  ('rodriggj'),
  ('rodriguez.tara'),
  ('kdubs');

INSERT INTO photos (image_url, user_id)
VALUES
  ('/photo1/tree', 1),
  ('/photo2/fish', 2),
  ('/photo3/lamp', 1),
  ('/photo4/hedgehog', 1),
  ('/photo5/soda', 3);

INSERT INTO comments (comment_text, user_id, photo_id)
VALUES
  ('Yo this is wiggity wack', 1, 3),
  ('Dirty pic yo', 2, 2),
  ('Busted', 3, 5),
  ('Cool',1,3),
  ('Foobar', 1, 4);

INSERT INTO likes (user_id, photo_id)
VALUES
  (1,3),
  (2,2),
  (3,5),
  (1,3),
  (1,4);

SELECT
  users.id,
  comments.comment_text,
  users.id AS user_id,
  photos.id AS photo_id,
  photos.created_at
FROM users
INNER JOIN photos
  ON users.id = photos.user_id
INNER JOIN comments
  ON photos.id = comments.photo_id
INNER JOIN likes
  ON likes.user_id = comments.user_id
GROUP BY users.id, comments.comment_text, photos.id
ORDER BY users.id ASC;
