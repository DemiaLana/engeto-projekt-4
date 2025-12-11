-- File: t_svitlana_project_sql_secondary_final.sql

-- Create secondary table: contains macroeconomic indicators by country
CREATE TABLE t_svitlana_project_sql_secondary_final (
    country TEXT,
    year BIGINT,
    gdp DOUBLE PRECISION,
    population DOUBLE PRECISION,
    gini DOUBLE PRECISION,
    taxes DOUBLE PRECISION,
    fertility DOUBLE PRECISION,
    mortality_under5 DOUBLE PRECISION
);

-- Insert selected columns from economies table
INSERT INTO t_svitlana_project_sql_secondary_final (country, year, gdp, population, gini, taxes, fertility, mortality_under5)
SELECT 
    e.country,
    e.year,
    e.gdp,
    e.population,
    e.gini,
    e.taxes,
    e.fertility,
    e.mortaliy_under5  -- note: check column name spelling in economies table
FROM economies e
JOIN countries c
    ON e.country = c.country; 