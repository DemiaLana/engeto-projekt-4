WITH price_yearly AS (
    SELECT
        year,
        price_category,
        AVG(value) AS avg_price
    FROM t_svitlana_demianiuk_project_sql_primary_final
    WHERE data_type = 'price'
    GROUP BY year, price_category
),
pct_change AS (
    SELECT
        p.price_category,
        p.year,
        ((p.avg_price - LAG(p.avg_price) OVER (PARTITION BY p.price_category ORDER BY p.year))
            / LAG(p.avg_price) OVER (PARTITION BY p.price_category ORDER BY p.year)) * 100
            AS pct_growth
    FROM price_yearly p
)
SELECT
    price_category,
    ROUND(AVG(pct_growth), 2) AS avg_pct_growth
FROM pct_change
WHERE pct_growth IS NOT NULL
GROUP BY price_category
ORDER BY avg_pct_growth ASC
LIMIT 1;