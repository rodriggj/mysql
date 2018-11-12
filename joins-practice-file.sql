set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE IF NOT EXISTS `joins-practice`;
USE `joins-practice`;
DROP TABLE papers, students;

CREATE TABLE IF NOT EXISTS `students` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(110) NOT NULL
);

CREATE TABLE IF NOT EXISTS `papers` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(110) NOT NULL,
  grade FLOAT(8,2) NOT NULL,
  student_id INT,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

#SHOW TABLES;
#DESC students;
#DESC papers;

INSERT INTO `students` (first_name)
VALUES
  ('Caleb'),
  ('Samatha'),
  ('Raj'),
  ('Carlos'),
  ('Lisa');

#SELECT * FROM students;

INSERT INTO `papers` (student_id, title, grade)
VALUES
  (1, 'My First Book Report', 60),
  (1, 'My Second Book Report', 75),
  (2, 'Russian Lit Through The Ages', 94),
  (2, 'De Montaigne And The Art Of The Essay', 98),
  (4, 'Borges And Magical Realism', 89);

#SELECT * FROM papers;

#1st task
SELECT first_name, title, grade
FROM students
INNER JOIN papers
  ON students.id = papers.student_id;

#2nd task
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id;

#3rd task
SELECT
  first_name,
  IFNULL(title,'MISSING') AS title,
  IFNULL(grade, 0) AS grade
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id;

#4th task
SELECT
  first_name,
  IFNULL(AVG(grade),0) AS Average
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY first_name
ORDER BY Average DESC;

#5th task
SELECT
  first_name,
  IFNULL(AVG(grade),0) AS Average,
#  IF(grade>60, "Passing", "Failing") AS Passing_Status
  CASE
    WHEN Avg(grade) IS NULL THEN 'Failing'
    WHEN Avg(grade) >= 75 THEN 'Passing'
    ELSE 'Failing'
    end AS passing_status
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY students.id
ORDER BY Average DESC;
