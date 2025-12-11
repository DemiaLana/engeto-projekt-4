-- Create primary table: contains prices and payroll data
CREATE TABLE t_svitlana_project_sql_primary_final (
    year INT,
    data_type VARCHAR(50),
    value NUMERIC,
    value_type INT,
    unit_code INT,
    calculation_type INT,
    industry VARCHAR(255),
    price_category VARCHAR(50),
    district VARCHAR(50),
    region VARCHAR(50),
    product_date DATE,
    payroll_quarter INT
);

-- Insert price data from Czechia prices table
INSERT INTO t_svitlana_project_sql_primary_final (year, data_type, value, price_category, product_date)
SELECT
    EXTRACT(YEAR FROM p.date_from) AS year,
    'price' AS data_type,
    p.value AS value,
    pc.name AS price_category,
    p.date_from AS product_date
FROM czechia_price p
JOIN czechia_price_category pc 
    ON p.category_code = pc.code;

-- Insert payroll data from Czechia payroll table
INSERT INTO t_svitlana_project_sql_primary_final (year, data_type, industry, value)
SELECT
    p.payroll_year AS year,
    'salary' AS data_type,
    i.name AS industry,
    p.value AS value
FROM czechia_payroll p
JOIN czechia_payroll_industry_branch i
    ON p.industry_branch_code = i.code
WHERE p.value_type_code = 5958; -- average salary