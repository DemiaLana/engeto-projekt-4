-- Dotaz 1: Průměrná mzda podle let (pouze primární tabulka)
SELECT
    year,
    ROUND(AVG(value) FILTER (WHERE data_type = 'salary')::numeric, 2) AS avg_salary
FROM t_svitlana_demianiuk_project_sql_primary_final
GROUP BY year
ORDER BY year;
