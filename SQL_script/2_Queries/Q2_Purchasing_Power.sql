WITH prices AS (
    SELECT 
        year,
        MAX(CASE WHEN price_category = 'Chléb konzumní kmínový' THEN value END) AS bread_price,
        MAX(CASE WHEN price_category = 'Mléko polotučné pasterované' THEN value END) AS milk_price
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE data_type = 'price'
      AND year IN (2006, 2018)
    GROUP BY year
),
salaries AS (
    SELECT 
        year,
        SUM(value) AS total_salary
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE data_type = 'salary'
      AND year IN (2006, 2018)
    GROUP BY year
)
SELECT
    MAX(CASE WHEN c.year = 2006 THEN c.total_salary / c.bread_price END) AS bread_2006_kg,
    MAX(CASE WHEN c.year = 2018 THEN c.total_salary / c.bread_price END) AS bread_2018_kg,
    MAX(CASE WHEN c.year = 2006 THEN c.total_salary / c.milk_price END) AS milk_2006_liters,
    MAX(CASE WHEN c.year = 2018 THEN c.total_salary / c.milk_price END) AS milk_2018_liters
FROM (
    SELECT s.year, s.total_salary, p.bread_price, p.milk_price
    FROM salaries s
    JOIN prices p ON s.year = p.year
) c;