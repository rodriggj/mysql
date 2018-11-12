#CREATE USER 'rodriggj'@'localhost' IDENTIFIED BY 'gTkca4evr!';
DROP TABLE `users`;

CREATE DATABASE IF NOT EXISTS `test`;
USE `test`;

CREATE TABLE IF NOT EXISTS `users`  (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fn` VARCHAR(65) NOT NULL,
  `ln` VARCHAR(65) NOT NULL
);

SHOW TABLES;
DESC `users`;

INSERT INTO `users` (fn, ln)
  VALUES
    ('Gabe', 'Rodriguez'),
    ('Tara', 'Rodriguez'),
    ('Chloe', 'Rodriguez');

SELECT * FROM users;
