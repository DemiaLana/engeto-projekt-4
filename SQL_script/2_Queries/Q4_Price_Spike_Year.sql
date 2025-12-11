WITH yearly_prices AS (
    SELECT year, AVG(value) AS avg_price
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE data_type = 'price'
    GROUP BY year
),
yearly_salaries AS (
    SELECT year, AVG(value) AS avg_salary
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE data_type = 'salary'
    GROUP BY year
),
growth AS (
    SELECT
        p.year,
        ((p.avg_price - LAG(p.avg_price) OVER (ORDER BY p.year))
            / LAG(p.avg_price) OVER (ORDER BY p.year)) * 100 AS price_growth,
        ((s.avg_salary - LAG(s.avg_salary) OVER (ORDER BY s.year))
            / LAG(s.avg_salary) OVER (ORDER BY s.year)) * 100 AS salary_growth
    FROM yearly_prices p
    JOIN yearly_salaries s USING (year)
)
SELECT
    year,
    ROUND(price_growth,2) AS price_growth_pct,
    ROUND(salary_growth,2) AS salary_growth_pct,
    ROUND(price_growth - salary_growth,2) AS diff_pct
FROM growth
ORDER BY year;