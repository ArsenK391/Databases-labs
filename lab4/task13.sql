DELETE FROM boxes
USING warehouses
WHERE boxes.warehouse = warehouses.code AND warehouses.location = 'New York'
RETURNING *;