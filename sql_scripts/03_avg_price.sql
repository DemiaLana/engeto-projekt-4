-- Dotaz 3: Průměrné ceny podle let (pouze primární tabulka)
SELECT
    year,
    ROUND(AVG(value) FILTER (WHERE data_type='price')::numeric, 2) AS avg_price
FROM t_svitlana_demianiuk_project_sql_primary_final
GROUP BY year
ORDER BY year;
