UPDATE  employees
SET department = (SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Research') 