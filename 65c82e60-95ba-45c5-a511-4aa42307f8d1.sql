CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  firstname varchar(50) NOT NULL ,
  lastname varchar(50) NOT NULL
);
;-- -. . -..- - / . -. - .-. -.--
Select*FROM Users;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ADD COLUMN isadmin int;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin TYPE boolean;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin DROP DEFAULT;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin SET DATA TYPE boolean;
;-- -. . -..- - / . -. - .-. -.--
    ALTER COLUMN isadmin TYPE bool USING isadmin::boolean;
;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin TYPE bool USING isadmin::boolean;
;-- -. . -..- - / . -. - .-. -.--
Select*FROM users;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT false;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users ADD CONSTRAINT use PRIMARY KEY(id);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE tasks(
  id SERIAL,
  name varchar(50),
  user_id int
);
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE tasks;
;-- -. . -..- - / . -. - .-. -.--
DROP table countries;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE countries(
  country_id SERIAL,
  country_name varchar(255),
  region_id int,
  population int
);
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (100, Palau, 123, 987654321);
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (100, "Palau", 123, 987654321);
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (100, 'Palau', 123, 987654321);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE countries ADD CONSTRAINT use PRIMARY KEY(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE countries ADD CONSTRAINT use PRIMARY KEY(country_id);
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (102, 'Monaco');
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (region_id NULL);
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (region_id NULL , population NULL );
;-- -. . -..- - / . -. - .-. -.--
INSERT into countries VALUES (region_id NULL );
;-- -. . -..- - / . -. - .-. -.--
update countries set region_id=null;
;-- -. . -..- - / . -. - .-. -.--
insert into countries (country_id, country_name, region_id, population)
values (107, 'Kazakhstan', 077, 17000000),
       (56, 'Russia', 308, 2600),
       (79, 'US', 911, 3710);
;-- -. . -..- - / . -. - .-. -.--
alter table countries
    alter column country_name set default 'Kazakhstan';
;-- -. . -..- - / . -. - .-. -.--
insert into countries values (99, default , 013, 1000000);
;-- -. . -..- - / . -. - .-. -.--
insert into countries (country_id , country_name)
values (default , default , default , default );
;-- -. . -..- - / . -. - .-. -.--
insert into countries values (default , default , default , default );
;-- -. . -..- - / . -. - .-. -.--
create table countries_new(
  like countries
);
;-- -. . -..- - / . -. - .-. -.--
insert into countries_new
select * from countries;
;-- -. . -..- - / . -. - .-. -.--
update countries_new set region_id = 1
where region_id is null;
;-- -. . -..- - / . -. - .-. -.--
update countries_new set population = population * 1.1
    returning country_name, population as "New Population";
;-- -. . -..- - / . -. - .-. -.--
delete from countries
where population < 100000;
;-- -. . -..- - / . -. - .-. -.--
SELECT *from countries;
;-- -. . -..- - / . -. - .-. -.--
delete from countries_new
as cn using countries as co
where cn.country_id=co.country_id
returning *;
;-- -. . -..- - / . -. - .-. -.--
SELECT *from countries_new;
;-- -. . -..- - / . -. - .-. -.--
delete from countries
returning *;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255),

);
;-- -. . -..- - / . -. - .-. -.--
SELECT *lastname;
;-- -. . -..- - / . -. - .-. -.--
SELECT lastname from customers;
;-- -. . -..- - / . -. - .-. -.--
SELECT lastname from employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT lastname FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE lastname = "Smith";
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE lastname = 'Smith' or 'Doe';
;-- -. . -..- - / . -. - .-. -.--
SELECT SUM(department) FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(department) FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(department = 14) FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(department) FROM employees WHERE department = 14;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department,
       COUNT(department) FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department and 
    COUNT(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department,
    COUNT(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department and count(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department, count(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY count(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT count(department);
;-- -. . -..- - / . -. - .-. -.--
SELECT count();
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(*);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    department FROM employees GROUP BY (count(department));
;-- -. . -..- - / . -. - .-. -.--
SELECT
       COUNT(department) FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT department FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT department FROM employees,
       COUNT(department) GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(department) FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT department FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT department from employees where department > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT department from employees where department > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT department from employees where (COUNT(department)) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department from employees where count(department) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department from employees where count(department) > 2 group by department;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(department)
from employees GROUP BY department limit 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(department)
from employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(department)
from employees GROUP BY department limit 3;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(department)
from employees GROUP BY department HAVING count(department) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(department)
from departments GROUP BY department HAVING count(department) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       count(budget)
from departments OFFSET 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       count(budget)
from departments GROUP BY budget offset 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       count(budget)
from departments GROUP BY budget limit 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       count(budget)
from departments ORDER BY budget desc limit 1 offset 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name
from departments ORDER BY budget desc limit 1 offset 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name
from departments ORDER BY budget asc limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       lastname
from employees ORDER BY budget asc limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       lastname
from employees WHERE department = (SELECT code from departments) ORDER BY (budget) asc limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name,
       lastname
from employees WHERE department = (SELECT code from departments ORDER BY budget asc limit 1);
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM customers
UNION SELECT name
from employees where city = 'Almaty';
;-- -. . -..- - / . -. - .-. -.--
SELECT department from departments where budget > 60000 ORDER BY budget desc, code asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT name from departments where budget > 60000 ORDER BY budget desc, code asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT *from departments where budget > 60000 ORDER BY budget desc, code asc;
;-- -. . -..- - / . -. - .-. -.--
UPDATE departments SET budget = budget * 1.1;
;-- -. . -..- - / . -. - .-. -.--
UPDATE departments SET budget = budget * 0.9;
;-- -. . -..- - / . -. - .-. -.--
UPDATE employees SET department = (SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Research');
;-- -. . -..- - / . -. - .-. -.--
DELETE from employees * where department = (SELECT code FROM departments where "*".name = 'IT');
;-- -. . -..- - / . -. - .-. -.--
DELETE from employees where department = (SELECT code FROM departments where "*".name = 'IT');
;-- -. . -..- - / . -. - .-. -.--
DELETE from employees where department = (SELECT code FROM departments where name = 'IT');
;-- -. . -..- - / . -. - .-. -.--
DELETE from employees;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE lab1;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE users(
  id SERIAL,
  firstname varchar(50),
  lastname varchar(50)
);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ADD COLUMN isadmin int;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin TYPE boolean;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin TYPE bool USING isadmin::boolean;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin TYPE boolean USING isadmin::boolean;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ADD PRIMARY KEY(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ADD CONSTRAINT use PRIMARY KEY(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    ADD CONSTRAINT a PRIMARY KEY(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE users
    DROP id;
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE users;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM users;
;-- -. . -..- - / . -. - .-. -.--
DROP DATABASE lab1;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE lab2;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name varchar(255),
  region_id int,
  population int
);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries (country_name) VALUES ('KZ');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries (region_id) VALUES (null);
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries WHERE country_id = 3;
;-- -. . -..- - / . -. - .-. -.--
UPDATE countries SET region_id = null;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries (country_name, region_id, population) VALUES 
       ('RF', 123, 12000),
       ('US', 465, 13000),
       ('UK', 789, 14000);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT VALUE ('Kazakhstan');
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT ('Kazakhstan');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries VALUES (default , 159, 10000);
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries WHERE region_id = 10000;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries VALUES (default ,default , 159, 10000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries VALUES (default , default , default , default );
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE countries_new(
  LIKE countries
);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO countries_new SELECT *FROM countries;
;-- -. . -..- - / . -. - .-. -.--
UPDATE countries_new SET region_id = 1 WHERE region_id = NULL;
;-- -. . -..- - / . -. - .-. -.--
UPDATE countries_new SET region_id = 1 WHERE region_id isnull;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM countries_new;
;-- -. . -..- - / . -. - .-. -.--
UPDATE countries_new SET population = population * 1.1 RETURNING population as New_Population;
;-- -. . -..- - / . -. - .-. -.--
UPDATE countries_new SET population = population * 1.1 RETURNING population as "New Population";
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries WHERE population < 100000;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM countries;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries_new WHERE region_id = (SELECT country_id FROM countries);
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries_new WHERE region_id = (SELECT countries.region_id) RETURNING region_id;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries_new WHERE country_id = (SELECT country_id from countries) RETURNING country_id;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries_new as c2 using countries as c3 where c2.country_id = c3.country_id returning *;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries_new as c2 using countries as c3 where c2.country_id = c3.country_id returning country_id;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM countries RETURNING *;
;-- -. . -..- - / . -. - .-. -.--
DROP DATABASE lab2;
;-- -. . -..- - / . -. - .-. -.--
DROP DATABASE lab3;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE lab3;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');
;-- -. . -..- - / . -. - .-. -.--
SELECT lastname FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT lastname from employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE lastname = 'Smith';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE lastname = 'Smith' or lastname = 'Doe';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE department = 14;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees WHERE department = 37 or department = 77;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(budget) FROM departments;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(employees) FROM employees;
;-- -. . -..- - / . -. - .-. -.--
SELECT department,
       count(employees) FROM employees GROUP BY department;
;-- -. . -..- - / . -. - .-. -.--
SELECT department FROM employees WHERE count(employees) GROUP BY department > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department FROM employees WHERE count(employees) GROUP BY department HAVING count(department) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT department FROM employees GROUP BY department HAVING count(department) > 2;
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM departments ORDER BY budget desc offset 1 limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name, lastname FROM employees where department = (SELECT code FROM departments ORDER BY budget asc limit 1);
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM employees UNION SELECT name FROM customers WHERE city = 'Almaty';
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM employees WHERE city = 'Almaty' UNION SELECT name FROM customers WHERE city = 'Almaty';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM departments WHERE budget > 60000 ORDER BY budget asc, code desc;
;-- -. . -..- - / . -. - .-. -.--
UPDATE departments set budget = budget * 0.9 WHERE budget = (SELECT budget FROM departments ORDER BY budget asc limit 1);
;-- -. . -..- - / . -. - .-. -.--
(SELECT budget FROM departments ORDER BY budget asc limit 1);
;-- -. . -..- - / . -. - .-. -.--
UPDATE employees set department = (SELECT code FROM departments WHERE name = (SELECT name FROM employees WHERE name = 'IT'))
  WHERE department = (SELECT code FROM departments WHERE name = (SELECT name FROM employees WHERE name = 'Research'));
;-- -. . -..- - / . -. - .-. -.--
UPDATE employees set department = (SELECT code FROM departments WHERE name = 'IT')
  WHERE department = (SELECT code FROM departments WHERE name = 'Research');
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM employees WHERE department = (SELECT code FROM departments WHERE name = 'IT');
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM employees;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM employees;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE quzi1;
;-- -. . -..- - / . -. - .-. -.--
DROP DATABASE quzi1;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE quiz1;
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT name, price FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM products WHERE price >= 200;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM products WHERE price > 60 and price < 120;
;-- -. . -..- - / . -. - .-. -.--
SELECT name, price FROM products WHERE price >= 180 ORDER BY price desc, name asc;
;-- -. . -..- - / . -. - .-. -.--
SELECT manufacturer, avg(price) FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT manufacturer, avg(price) FROM products GROUP BY manufacturer;
;-- -. . -..- - / . -. - .-. -.--
SELECT code FROM products WHERE avg(price) >= 150;
;-- -. . -..- - / . -. - .-. -.--
SELECT code FROM products GROUP BY price HAVING avg(price) >= 150;
;-- -. . -..- - / . -. - .-. -.--
SELECT manufacturer, avg(price) FROM products GROUP BY manufacturer HAVING avg(price) >= 150;
;-- -. . -..- - / . -. - .-. -.--
SELECT name, price FROM products ORDER BY price asc limit 1;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO products (name, price, manufacturer) VALUES ('Loudspeakers', 70, 2);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO products VALUES ('Loudspeakers', 70, 2);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO manufacturers VALUES (2, 'Creative Labs');
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM manufacturers;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO products VALUES (default , 'Loudspeakers', 70, 2);
;-- -. . -..- - / . -. - .-. -.--
UPDATE products SET price = price * 0.9;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM products;
;-- -. . -..- - / . -. - .-. -.--
UPDATE products SET price = price * 0.9 WHERE price >= 120;
;-- -. . -..- - / . -. - .-. -.--
DROP table manufacturers;
;-- -. . -..- - / . -. - .-. -.--
DROP table products;
;-- -. . -..- - / . -. - .-. -.--
drop table manufacturers;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE manufacturers(
  code SERIAL PRIMARY KEY ,
  name VARCHAR(255)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE products(
  code SERIAL PRIMARY KEY ,
  name VARCHAR(255),
  price NUMERIC,
  manufacturer INTEGER REFERENCES manufacturers
);
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT name FROM manufacturers;
;-- -. . -..- - / . -. - .-. -.--
SELECT code, manufacturer FROM products LIMIT 3;
;-- -. . -..- - / . -. - .-. -.--
SELECT name, price FROM products WHERE price >= 200;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM products WHERE manufacturer = (SELECT code FROM manufacturers WHERE name = 'Sony');
;-- -. . -..- - / . -. - .-. -.--
SELECT name, price FROM products WHERE price <= 110 ORDER BY price asc , manufacturer desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT manufacturers FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT manufacturer FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT name FROM products WHERE manufacturer is DISTINCT FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT ON(manufacturer) FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT ON(manufacturer) *FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT ON(manufacturer) name FROM products;
;-- -. . -..- - / . -. - .-. -.--
SELECT manufacturer, count(name) FROM products GROUP BY manufacturer;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE (SELECT count(name) FROM products WHERE count(name) < 1);
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE (SELECT count(name) FROM products WHERE count(name)) < 1;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE code NOT IN (SELECT manufacturer from products WHERE count(manufacturer) >= 1);
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE code NOT IN (SELECT manufacturer from products WHERE count(manufacturer) >= 1) RETURNING *;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE code NOT IN (SELECT manufacturer from products WHERE count(*) >= 1) RETURNING *;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM manufacturers WHERE code NOT IN (SELECT manufacturer from products GROUP BY manufacturer HAVING count(*) >= 1) RETURNING *;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT ON(manufacturer) * FROM products as "New Product";
;-- -. . -..- - / . -. - .-. -.--
Drop DATABASE quiz1;
;-- -. . -..- - / . -. - .-. -.--
Drop DATABASE lab3;
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE lab5;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE customers(
  customer_id integer PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade NUMERIC,
  salesman_id integer PRIMARY KEY 
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE customers(
  customer_id integer PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade NUMERIC,
  salesman_id integer
);
;-- -. . -..- - / . -. - .-. -.--
Insert into customers values(3002,'Nick Rimando','New York',100,5001),
      (3005,'Graham Zusi','California',200,5002),
      (3001,'Brad Guzan','London',default,5005),
      (3004,'Fabian Johns','Paris',300,5006),
      (3007,'Brad Davis','New York',200,5001),
      (3009,'Geoff Camero','Berlin',100,5003),
      (3008,'Julian Green','London',300,5002);
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE grade > 100;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE city = 'New York' AND grade > 100;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE city = 'New York' OR grade > 100;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE city = 'Paris' OR city = 'Rome';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE cust_name = 'B%';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE cust_name LIKE 'B%';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE customers;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE salesman(
  salesman_id integer PRIMARY KEY,
  name varchar(255),
  city varchar(255),
  commission double precision
);
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM salesman;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE customers(
  customer_id integer PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade NUMERIC,
  salesman_id integer references salesman(salesman_id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE orders(
  ord_no integer PRIMARY KEY,
  purch_amt double precision,
  ord_date varchar(255),
  costumer_id integer references customers(customer_id),
  salesman_id integer references salesman(salesman_id)
);
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM orders;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(purch_amt) FROM orders;
;-- -. . -..- - / . -. - .-. -.--
SELECT avg(purch_amt) FROM orders;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(DISTINCT cust_name) FROM customers;
;-- -. . -..- - / . -. - .-. -.--
SELECT purch_amt FROM orders ORDER BY purch_amt asc limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE cust_name LIKE '%b';
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM orders WHERE costumer_id = (SELECT customer_id FROM customers WHERE city = 'New York');
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(grade) FROM customers;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(*) FROM customers;
;-- -. . -..- - / . -. - .-. -.--
SELECT grade FROM customers ORDER BY grade desc limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE customer_id = (SELECT costumer_id FROM orders GROUP BY purch_amt HAVING count(purch_amt) > 10);
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE customer_id = (SELECT costumer_id FROM orders WHERE count(purch_amt) > 10);
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE customer_id = (SELECT costumer_id FROM orders WHERE purch_amt > 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT *FROM customers WHERE customer_id = (SELECT costumer_id FROM orders WHERE purch_amt > 10);