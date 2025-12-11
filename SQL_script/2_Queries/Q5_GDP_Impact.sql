WITH primary_avg AS (
    SELECT
        year,
        AVG(value) FILTER (WHERE data_type = 'price') AS avg_price,
        AVG(value) FILTER (WHERE data_type = 'salary') AS avg_salary
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE year BETWEEN 2000 AND 2021
    GROUP BY year
),
macro_gdp AS (
    SELECT
        year,
        SUM(gdp) AS total_gdp
    FROM t_svitlana_demianiuk_project_sql_secondary_final
    WHERE year BETWEEN 2000 AND 2021
    GROUP BY year
),
combined AS (
    SELECT
        p.year,
        p.avg_price,
        p.avg_salary,
        m.total_gdp,
        LAG(p.avg_price) OVER (ORDER BY p.year) AS prev_price,
        LAG(p.avg_salary) OVER (ORDER BY p.year) AS prev_salary,
        LAG(m.total_gdp) OVER (ORDER BY p.year) AS prev_gdp
    FROM primary_avg p
    JOIN macro_gdp m USING(year)
)
SELECT
    year,
    ROUND( ((avg_price - prev_price)/prev_price * 100)::numeric, 2) AS price_growth_pct,
    ROUND( ((avg_salary - prev_salary)/prev_salary * 100)::numeric, 2) AS salary_growth_pct,
    ROUND( ((total_gdp - prev_gdp)/prev_gdp * 100)::numeric, 2) AS gdp_growth_pct
FROM combined
ORDER BY year;