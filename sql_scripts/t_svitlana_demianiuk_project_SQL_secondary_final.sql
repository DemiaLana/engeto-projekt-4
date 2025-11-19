-- Create secondary table
CREATE TABLE t_svitlana_demianiuk_project_sql_secondary_final (
    country TEXT,
    year INT,
    gdp NUMERIC,
    gini NUMERIC,
    population BIGINT,
    taxes NUMERIC
);

-- Insert actual data 
INSERT INTO t_svitlana_demianiuk_project_sql_secondary_final (country, year, gdp, gini, population, taxes) VALUES
('Czechia', 2000, 120000, 25, 1000000, 20000),
('Czechia', 2001, 125000, 26, 1010000, 21000),
('Czechia', 2002, 130000, 27, 1020000, 22000);