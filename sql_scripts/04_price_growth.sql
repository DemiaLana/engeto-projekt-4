-- Dotaz 4: Růst cen v procentech (pouze primární tabulka)
WITH avg_price AS (
    SELECT year, ROUND(AVG(avg_price)::numeric,2) AS avg_price
    FROM t_svitlana_demianiuk_project_SQL_primary_final
    GROUP BY year
)
SELECT
    year,
    LAG(avg_price) OVER (ORDER BY year) AS prev_price,
    avg_price,
    ROUND(((avg_price - LAG(avg_price) OVER (ORDER BY year)) / NULLIF(LAG(avg_price) OVER (ORDER BY year),0) * 100)::numeric, 2) AS price_growth_pct
FROM avg_price
ORDER BY year;