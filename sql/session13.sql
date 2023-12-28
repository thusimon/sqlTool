CREATE TABLE customers(
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders(
  id INT PRIMARY KEY AUTO_INCREMENT,
  date DATE,
  amount DECIMAL(8, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT * FROM orders
WHERE customer_id = (SELECT id FROM customers WHERE email='george@gmail.com');

-- To perform a (kind of useless) cross join:
SELECT * FROM customers, orders;

SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;

-- JOIN by default is INNER JOIN
SELECT date, amount, email, customers.id AS CustomerId FROM orders
INNER JOIN customers ON customers.id = orders.customer_id;

SELECT first_name, last_name, email, SUM(amount) AS Total, customers.id AS CustomerId FROM orders
JOIN customers ON customers.id = orders.customer_id
GROUP BY customers.first_name, customers.last_name
ORDER BY Total DESC;

-- LEFT JOIN is useful to find out complete information of the left table
-- e.g, INNER JOIN can not show who didn't place any orders
SELECT first_name, last_name, date, amount FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS Total FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY Total DESC;

-- same result as INNER JOIN because each order must have a customer_id
-- but if not, you can imagine that we show all the orders
-- and the names columns will have NULL values
SELECT first_name, last_name, date, amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customer_id)
REFERENCES customers(id)
ON DELETE CASCADE; -- if customer is deleted, his order will also be deleted

DESC orders;
SHOW CREATE TABLE orders;
