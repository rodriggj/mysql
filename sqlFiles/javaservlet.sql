DROP DATABASE servlet_project;
CREATE DATABASE servlet_project; 
USE servlet_project;  

CREATE TABLE IF NOT EXISTS `students` (
		`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
		`fn` VARCHAR(65) NOT NULL, 
		`ln` VARCHAR(65) NOT NULL, 
		`email` VARCHAR(115) NOT NULL
	);

INSERT INTO `students` (`fn`,`ln`,`email`) 
VALUES 
	('Gabe','Rodriguez', 'gabe@hotmail.com'), 
	('Tara','Rodriguez', 'tara@gmail.com'),
	('Kennedy','Rodriguez', 'kdubs@yahoo.com'),
	('Chloe','Rodriguez', 'chloe-bear@hotmail.com'),
	('Ava','Rodriguez', 'avers@gmail.com');

SELECT * FROM `students`;