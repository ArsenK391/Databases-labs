--1
CREATE DATABASE lab6;

--2
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
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
('123 Elm St', '12345', 'New York', 'NY'),
('456 Maple Ave', '67890', 'San Francisco', 'CA'),
('789 Oak Dr', '10112', 'Chicago', 'IL');

INSERT INTO departments (department_name, budget, location_id)
VALUES
('HR', 50000, 1),
('Finance', 75000, 2),
('Engineering', 100000, 3),
('Marketing', 60000, 1);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', 55000, 1),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 62000, 2),
('Bob', 'Johnson', 'bob.johnson@example.com', '555-8765', 75000, 3),
('Alice', 'Williams', 'alice.williams@example.com', '555-4321', 68000, NULL), -- No department
('Charlie', 'Brown', 'charlie.brown@example.com', '555-0001', 72000, 3);

--3
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id;

--4
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id
WHERE e.department_id IN (80, 40);

--5
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d on e.department_id = d.department_id
JOIN locations l on d.location_id = l.location_id;

--6
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e on d.department_id = e.department_id;

--7
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d on e.department_id = d.department_id;
