SELECT name, lastname
FROM employees
WHERE department = (
    SELECT code FROM departments ORDER BY budget ASC LIMIT 1
    ) 