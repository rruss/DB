CREATE DATABASE lab5;

CREATE TABLE customers(
  customer_id integer PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade NUMERIC,
  salesman_id integer references salesman(salesman_id)
);

CREATE TABLE salesman(
  salesman_id integer PRIMARY KEY,
  name varchar(255),
  city varchar(255),
  commission double precision
);

CREATE TABLE orders(
  ord_no integer PRIMARY KEY,
  purch_amt double precision,
  ord_date varchar(255),
  costumer_id integer references customers(customer_id),
  salesman_id integer references salesman(salesman_id)
);

SELECT *FROM salesman;
SELECT *FROM customers;
SELECT *FROM orders;

SELECT sum(purch_amt) FROM orders;

SELECT avg(purch_amt) FROM orders;

SELECT count(DISTINCT cust_name) FROM customers;

SELECT purch_amt FROM orders ORDER BY purch_amt asc limit 1;

SELECT *FROM customers WHERE cust_name LIKE '%b';

SELECT *FROM orders WHERE costumer_id = (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT *FROM customers WHERE customer_id = (SELECT costumer_id FROM orders WHERE purch_amt > 10);

SELECT sum(grade) FROM customers;

SELECT count(*) FROM customers;

SELECT grade FROM customers ORDER BY grade desc limit 1;