CREATE DATABASE IF NOT EXISTS `node_practice`; 
USE `node_practice`;
DROP TABLE `users`; 

CREATE TABLE IF NOT EXISTS `users` (
	email VARCHAR(255) PRIMARY KEY, 
	created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO `users` (email)
VALUES 
	('gabe.rodriguez.ctr@gmail.com'),
	('rodriguez.tara@gmail.com'), 
	('kennedy@hotmial.com'); 

DESC `users`; 

SELECT * 
FROM users;