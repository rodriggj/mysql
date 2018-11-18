DROP DATABASE `closets`;
CREATE DATABASE closets; 
USE closets;  

CREATE TABLE IF NOT EXISTS `shirts`(
	`shirt_id` INT AUTO_INCREMENT NOT NUll PRIMARY KEY, 
	`article` VARCHAR(65) NOT NULL DEFAULT 't-shirt', 
	`color` VARCHAR(100) NOT NULL, 
	`size` VARCHAR(5) NOT NULL DEFAULT 'S', 
	`last_worn` INT NOT NULL DEFAULT 5
);

INSERT INTO `shirts` (`article`, `color`, `size`, `last_worn`) 
	VALUES
		('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo-shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('polo-shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);

SELECT * FROM shirts; 

#Fisrt Task: ADD SINGLE NEW SHIRT ('polo shirt', 'purple', 'M', 50)
SELECT * FROM shirts; 
INSERT INTO `shirts` (`article`, `color`, `size`, `last_worn`)
	VALUES
		('polo-shirt', 'purple', 'M', 50);
SELECT * FROM shirts; 

#Second Task: SELECT ALL SHIRTS BUT ONLY DISPLAY article & color
SELECT article, color FROM shirts; 

#Third Task: SELECT ALL MEDIUM SHIRTS AND DISPLAY ALL COLS
SELECT * FROM shirts WHERE size = 'M'; 

#Fourth Task: UPDATE ALL POLO SHIRTS, CHANGE SIZE TO last_worn
SELECT article, size FROM shirts WHERE size='M' and article='polo-shirt';
UPDATE shirts SET size='L' WHERE article = 'polo-shirt' AND size='M';
SELECT article, size FROM shirts WHERE article='polo-shirt'; 

#Fifth Task: UPDATE ALL SHIRTS WORN 15 DAYS AGO TO WORN 0 DAYS AGO
SELECT * FROM shirts WHERE last_worn <= 15; 
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15; 
SELECT * FROM shirts WHERE last_worn <= 15; 

#Sixth Task: UPDATE ALL WHITE SHIRTS TO SIZE XS
SELECT * FROM shirts WHERE color = 'white'; 
UPDATE shirts SET size = 'XS' WHERE color = 'white'; 
UPDATE shirts SET color = 'off-white' WHERE color = 'white';
SELECT * FROM shirts WHERE color = 'off-white'; 

#Seventh Task: DELETE ALL OLD SHIRTS
SELECT * FROM shirts;
DELETE FROM shirts WHERE last_worn >= 200; 
SELECT * FROM shirts;

#Eight Task: DELETE ALL TANK TOPS
SELECT * FROM shirts;
DELETE FROM shirts WHERE article='tank top'; 
SELECT * FROM shirts;

#Ninth Task: DELETE ALL SHIRTS 
SELECT * FROM shirts; 
DELETE FROM shirts WHERE shirt_id > 0; 
SELECT * FROM shirts; 

#Tenthy Task: DELETE DATABASE
#already accounted for in my script run this from CLI
