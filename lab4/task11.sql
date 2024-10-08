UPDATE boxes
SET value = value * 0.85
WHERE code = (SELECT code FROM boxes ORDER BY value DESC OFFSET 2 LIMIT 1);