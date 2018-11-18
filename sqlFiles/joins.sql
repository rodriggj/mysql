CREATE DATABASE IF NOT EXISTS `joins`;
USE `joins`;
DROP TABLE `orders`, `customers`;

CREATE TABLE customers(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
    order_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT NOW(),
    amount DECIMAL(8,2) DEFAULT '0.00',
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

DESC `customers`;
DESC `orders`;

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

 INSERT INTO orders (order_date, amount, customer_id)
 VALUES ('2016/02/10', 99.99, 1),
        ('2017/11/11', 35.50, 1),
        ('2014/12/12', 800.67, 2),
        ('2015/01/03', 12.50, 2),
        ('1999/04/11', 450.25, 5);

/*INNER JOIN*/
/*SELECT * FROM customers;
SELECT * FROM orders;*/

/*SELECT first_name, last_name, order_id, amount  FROM customers, orders
WHERE customers.id = orders.customer_id;*/

/*SELECT * FROM customers
  JOIN orders
    ON customers.id = orders.customer_id;*/

/*SELECT first_name, last_name, amount FROM customers
  JOIN orders
    ON customers.id = orders.customer_id;*/

/*SELECT first_name, last_name, order_date, sum(amount) AS total
FROM customers
JOIN orders
  ON customers.id=orders.customer_id
GROUP BY orders.order_id
ORDER BY amount ASC;*/

#LEFT JOIN
/*SELECT * FROM customers
  LEFT JOIN orders
    ON customers.id = orders.customer_id;*/

/*SELECT first_name, last_name, order_date, sum(amount) AS total
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY orders.order_date, customers.first_name, customers.last_name
ORDER BY orders.order_date, total ASC;*/

SELECT first_name, last_name, order_date, IFNULL(SUM(amount),0) AS total
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY orders.order_date, customers.first_name, customers.last_name
ORDER BY orders.order_date, total;
