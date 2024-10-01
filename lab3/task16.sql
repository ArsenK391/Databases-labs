UPDATE departments
SET budget = budget * 0.9
WHERE code = (
    SELECT code FROM departments ORDER BY budget ASC LIMIT 1
    ) 