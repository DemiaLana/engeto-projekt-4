-- Dotaz 2: Růst mezd v procentech (pouze primární tabulka)
WITH avg_salary AS (
    SELECT year, ROUND(AVG(avg_salary)::numeric,2) AS avg_salary
    FROM t_svitlana_demianiuk_project_SQL_primary_final
    GROUP BY year
)
SELECT
    year,
    LAG(avg_salary) OVER (ORDER BY year) AS prev_salary,
    avg_salary,
    ROUND(((avg_salary - LAG(avg_salary) OVER (ORDER BY year)) / NULLIF(LAG(avg_salary) OVER (ORDER BY year),0) * 100)::numeric, 2) AS growth_pct
FROM avg_salary
ORDER BY year;