-- Create primary table
CREATE TABLE t_svitlana_demianiuk_project_sql_primary_final (
    year INT,
    data_type TEXT,
    industry TEXT,
    price_category TEXT,
    value NUMERIC
);

-- Insert actual data
INSERT INTO t_svitlana_demianiuk_project_sql_primary_final (year, data_type, industry, price_category, value) VALUES
(2000, 'salary', NULL, NULL, 8793),
(2000, 'salary', NULL, NULL, 9942),
(2000, 'salary', NULL, NULL, 10601),
(2000, 'price', NULL, NULL, 108249),
(2000, 'price', NULL, NULL, 110000),
(2001, 'salary', NULL, NULL, 10000),
(2001, 'salary', NULL, NULL, 10500),
(2001, 'salary', NULL, NULL, 11000),
(2001, 'price', NULL, '01', 111000),
(2001, 'price', NULL, '02', 115000),
(2002, 'salary', NULL, NULL, 10200),
(2002, 'salary', NULL, NULL, 10800),
(2002, 'price', NULL, '01', 113000),
(2002, 'price', NULL, '02', 118000);