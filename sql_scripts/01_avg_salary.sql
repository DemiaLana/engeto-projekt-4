-- Dotaz 1: Průměrná mzda podle let (pouze primární tabulka)
SELECT
    year,
    ROUND(AVG(avg_salary)::numeric, 2) AS avg_salary
FROM t_svitlana_demianiuk_project_SQL_primary_final
GROUP BY year
ORDER BY year;