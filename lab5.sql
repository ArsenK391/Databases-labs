--1
CREATE DATABASE lab5;

--2
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

--3
SELECT SUM(purch_amt) FROM orders;

--4
SELECT AVG(purch_amt) FROM orders;

--5
SELECT COUNT(cust_name) FROM customers
WHERE cust_name IS NOT NULL;

--6
SELECT MIN(purch_amt) FROM orders;

--7
SELECT * FROM customers
WHERE cust_name LIKE '%b';

--8
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE city = 'New York'
);

--9
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE purch_amt > 10
);

--10
SELECT SUM(grade) FROM customers;

--11
SELECT * FROM customers
WHERE cust_name IS NOT NULL;

--12
SELECT MAX(grade) FROM customers;