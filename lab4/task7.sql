SELECT warehouse, COUNT(*) AS box_count
FROM boxes
GROUP BY warehouse;