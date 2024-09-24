WITH deleted_rows AS(
    DELETE FROM countries_new
    WHERE country_id IN (SELECT country_id FROM countries)
    RETURNING *
)
SELECT *
FROM deleted_rows