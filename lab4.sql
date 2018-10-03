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

INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', DEFAULT, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760 ,'2012-09-10' ,3002, 5001);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15),
                            (5002, 'Nail Knite', 'Paris', 0.13),
                            (5005, 'Pit Alex', 'London', 0.11),
                            (5006, 'Mc Lyon', 'Paris', 0.14),
                            (5003, 'Lauson Hen', DEFAULT, 0.12),
                            (5007, 'Paul Adam', 'Rome', 0.13);

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