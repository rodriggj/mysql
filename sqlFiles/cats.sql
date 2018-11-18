SHOW DATABASES; 
USE cats; 
SHOW TABLES;
DROP TABLE `cats`;

CREATE TABLE IF NOT EXISTS `cats` (
	`cat_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(65) NOT NULL, 
	`breed` VARCHAR(65) NOT NULL, 
	`age`INT NOT NULL
	); 

INSERT INTO `cats` (`name`, `breed`,`age`)
VALUES 
	('Ringo', 'Tabby', 4), 
	('Cindy', 'Maine Coon', 10), 
	('Dumbledore', 'Maine Coon', 11), 
	('Egg', 'Persian', 4), 
	('Misty', 'Tabby', 13), 
	('George Michael', 'Ragdoll', 9), 
	('Jackson', 'Sphynx', 7); 

DESC `cats`; 

SELECT * FROM `cats`; 

#UPDATE excercise=====================================================
SELECT cat_id FROM cats; 
SELECT name, breed FROM cats; 
SELECT name, age FROM cats WHERE breed="Tabby";
SELECT cat_id, age FROM cats WHERE cat_id=age; 


SELECT name FROM cats WHERE name="Jackson";
UPDATE cats SET name="Jack" WHERE name="Jackson";
SELECT name FROM cats; 

SELECT name, breed FROM cats WHERE name ="Ringo";
UPDATE cats SET breed = "British Shorthair" WHERE name = "Ringo";
SELECT name, breed FROM cats WHERE name = "Ringo";

SELECT * FROM cats; 
UPDATE cats SET age = 12 WHERE breed="Maine Coon";
SELECT * FROM cats WHERE breed = "Maine Coon";

#DELETE excercise=====================================================
#DELETE cats whos age is 4
SELECT * FROM cats; 
SELECT * FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = 4; 
SELECT * FROM cats; 

#DELETE cats whos cat_id = age
SELECT * FROM cats; 
SELECT * FROM cats WHERE cat_id = age; 
DELETE FROM cats WHERE cat_id = age; 
SELECT * FROM cats; 

#DELETE All CATS! 
SELECT * FROM cats; 
DELETE FROM cats WHERE cat_id > 0; 
SELECT * FROM cats; 
