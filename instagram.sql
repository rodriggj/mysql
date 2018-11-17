CREATE DATABASE IF NOT EXISTS `instagram-clone`;
USE `instagram-clone`;
DROP TABLES users, photos, comments, likes, follows, tags, photo_tags;

CREATE TABLE IF NOT EXISTS `users` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS `photos` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  caption VARCHAR(255),
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
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE IF NOT EXISTS `follows` (
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE IF NOT EXISTS `tags` (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS `photo_tags` (
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  PRIMARY KEY (photo_id, tag_id)
);

SHOW TABLES;
DESC users;
DESC photos;
DESC comments;
DESC likes;
DESC follows;
DESC tags;
DESC photo_tags;

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
  ('Cool',1, 2),
  ('Foobar', 1, 4);

INSERT INTO likes (user_id, photo_id)
VALUES
  (1,3),
  (2,2),
  (3,5),
  (3,2),
  (2,1);

INSERT INTO follows (follower_id, followee_id)
VALUES
  (2,1),
  (3,2),
  (1,3);

INSERT INTO tags (tag_name)
VALUES
  ('#cool'),
  ('#cute'),
  ('#rad'),
  ('#rad-sauce');

INSERT INTO photo_tags (photo_id, tag_id)
VALUES
  (1,2),
  (1,1),
  (5,3);


SELECT
  users.id,
  comments.comment_text,
  users.id AS user_id,
  photos.id AS photo_id,
  photos.created_at,
  follows.followee_id,
  tags.tag_name
FROM users
INNER JOIN photos
  ON users.id = photos.user_id
INNER JOIN comments
  ON photos.id = comments.photo_id
INNER JOIN likes
  ON likes.user_id = comments.user_id
INNER JOIN follows
  ON users.id = follows.follower_id
INNER JOIN photo_tags
  ON photos.id = photo_tags.photo_id
INNER JOIN tags
  ON photo_tags.tag_id = tags.id
GROUP BY users.id, comments.comment_text, photos.id, follows.followee_id, tags.id
ORDER BY users.id ASC;


/*
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
*/
