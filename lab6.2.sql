CREATE DATABASE lab6;

CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50),
  salary INTEGER,
  department_id INTEGER REFERENCES departments
);

SELECT employees.first_name,
       employees.last_name,
       departments.department_id,
       departments.department_name
  FROM employees INNER JOIN departments USING (department_id);

SELECT employees.first_name,
       employees.last_name,
       departments.department_id,
       departments.department_name
  FROM employees INNER JOIN departments ON departments.department_id = employees.department_id
    AND employees.department_id IN (40, 80);

SELECT employees.first_name,
       employees.last_name,
       departments.department_id,
       departments.department_name,
       locations.city,
       locations.state_province
  FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
    INNER JOIN locations ON departments.location_id = locations.location_id;

SELECT employees.first_name,
       employees.last_name,
       departments.department_id,
       departments.department_name
  FROM departments LEFT JOIN employees ON departments.department_id = employees.department_id;

SELECT employees.first_name,
       employees.last_name,
       departments.department_id,
       departments.department_name
  FROM departments RIGHT JOIN employees ON departments.department_id = employees.department_id;