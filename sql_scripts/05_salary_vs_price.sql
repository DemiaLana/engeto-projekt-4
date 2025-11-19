-- Dotaz 5: Porovnání růstu mezd a cen (pouze primární tabulka)
WITH salary_growth AS (
    SELECT year, ROUND(((AVG(value) FILTER (WHERE data_type='salary') - LAG(AVG(value) FILTER (WHERE data_type='salary')) OVER (ORDER BY year)) / NULLIF(LAG(AVG(value) FILTER (WHERE data_type='salary')) OVER (ORDER BY year),0) * 100)::numeric,2) AS salary_growth_pct
    FROM t_svitlana_demianiuk_project_sql_primary_final
    GROUP BY year
),
price_growth AS (
    SELECT year, ROUND(((AVG(value) FILTER (WHERE data_type='price') - LAG(AVG(value) FILTER (WHERE data_type='price')) OVER (ORDER BY year)) / NULLIF(LAG(AVG(value) FILTER (WHERE data_type='price')) OVER (ORDER BY year),0) * 100)::numeric,2) AS price_growth_pct
    FROM t_svitlana_demianiuk_project_sql_primary_final
    GROUP BY year
)
SELECT
    s.year,
    s.salary_growth_pct,
    p.price_growth_pct,
    ROUND((p.price_growth_pct - s.salary_growth_pct)::numeric, 2) AS difference_pct
FROM salary_growth s
JOIN price_growth p USING (year)
ORDER BY s.year;
