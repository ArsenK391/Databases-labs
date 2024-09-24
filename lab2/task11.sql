CREATE TABLE countries_new(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INT,
    population INT
)

INSERT INTO countries_new(country_name, region_id, population)
SELECT country_name, region_id, population
FROM countries 