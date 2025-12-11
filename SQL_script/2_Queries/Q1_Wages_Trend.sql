SELECT
    year,
    AVG(value) AS avg_salary,
    AVG(value) - LAG(AVG(value)) OVER (ORDER BY year) AS diff,
    CASE
        WHEN LAG(AVG(value)) OVER (ORDER BY year) IS NULL THEN 'first year'
        WHEN AVG(value) > LAG(AVG(value)) OVER (ORDER BY year) THEN '↑ grow'
        WHEN AVG(value) < LAG(AVG(value)) OVER (ORDER BY year) THEN '↓ drop'
        ELSE 'no change'
    END AS trend
FROM t_svitlana_demianiuk_project_sql_primary_final
WHERE data_type = 'salary'
GROUP BY year
ORDER BY year;