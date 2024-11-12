--1
CREATE INDEX idx_countries_name ON countries(name);

--2
CREATE INDEX idx_employees_name_surname ON employees(name, surname);

--3
CREATE UNIQUE INDEX idx_employees_salary_range ON employees(salary);

--4
CREATE INDEX idx_employees_name_substring ON employees(substring(name from 1 for 4));

--5
CREATE INDEX idx_employees_departments_salary_budget
ON employees(department_id, salary)
WHERE salary < 80000;

CREATE INDEX idx_departments_budget
ON departments(department_id, budget)
WHERE budget > 120000;
