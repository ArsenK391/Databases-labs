--1
CREATE OR REPLACE FUNCTION increase_value(input_value INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN  input_value + 10;
END;
$$ LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

--3
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(series_value INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

--4
CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
RETURNS TABLE(employee_id INTEGER, employee_name VARCHAR, department VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, department
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

--5
CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(product_id INTEGER, product_name VARCHAR, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, price
    FROM products
    WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

--6
CREATE OR REPLACE FUNCTION calculate_bonus(salary NUMERIC, bonus_percentage NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN salary * (bonus_percentage / 100);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INTEGER, bonus_percentage NUMERIC)
RETURNS VOID AS $$
DECLARE
    current_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO current_salary FROM employees WHERE id = emp_id;
    bonus := calculate_bonus(current_salary, bonus_percentage);
    UPDATE employees SET salary = current_salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;

--7
CREATE OR REPLACE FUNCTION complex_calculation(num1 INTEGER, num2 INTEGER, input_text VARCHAR)
RETURNS TEXT AS $$
DECLARE
    string_result VARCHAR;
    numeric_result INTEGER;
BEGIN
    -- Subblock 1: String Manipulation
    BEGIN
        string_result := CONCAT('Processed: ', input_text);
    END;

    -- Subblock 2: Numeric Calculation
    BEGIN
        numeric_result := num1 * num2 + 10;
    END;

    -- Combine Results
    RETURN CONCAT(string_result, ' | Computation Result: ', numeric_result);
END;
$$ LANGUAGE plpgsql;
