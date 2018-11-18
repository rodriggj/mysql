USE node_practice; 

#1 - Find the earliest user
SELECT 
	DATE_FORMAT(MIN(created_at), "%M %D %Y") AS 'Earliest Date'
FROM users; 

#2 - Find email of earliest user
SELECT 
	email, 
	created_at
FROM users
ORDER BY created_at ASC
LIMIT 1; 

#3 -- find count by month
SELECT 
	MONTHNAME(created_at) AS showdate, 
	COUNT(*) AS qty
FROM users
GROUP BY showdate
ORDER BY qty DESC;

#4 -- find yahoo emails
SELECT 
	COUNT(*) AS 'yahoo email'
FROM users
WHERE email LIKE '%yahoo%'; 

#5 -- find all email domains 
SELECT 
	CASE 
		WHEN email LIKE '%yahoo.com' THEN 'yahoo'
		WHEN email LIKE '%gmail.com' THEN  'gmail'
		WHEN email LIKE '%hotmail.com' THEN 'hotmail'
		ELSE 'other'
	END AS provider,
	COUNT(*)
FROM users
GROUP BY provider
ORDER BY provider ASC;