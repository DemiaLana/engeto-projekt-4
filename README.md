# Analýza vývoje mezd a cen v Česku
**Autor:** Svitlana Demianiuk  
**Nástroje:** PostgreSQL, DBeaver  

## Úvod
V této části jsem analyzovala vývoj průměrných mezd a cen potravin v České republice.  
Pomocí SQL dotazů jsem postupně vypočítala průměrné mzdy a jejich meziroční růst, průměrné ceny a jejich změny a následně porovnala růst mezd s růstem cen.  
Cílem bylo zjistit, zda existuje období, kdy růst cen potravin převýšil růst mezd o více než 10 %.  

---

## Dotaz 1 – Průměrná mzda podle let
**Popis:** Výpočet průměrné roční mzdy v České republice podle dat z tabulky `czechia_payroll`.

```sql
SELECT 
    payroll_year, 
    ROUND(AVG(value)::numeric, 2) AS avg_salary
FROM czechia_payroll p
JOIN czechia_payroll_value_type vt ON vt.code = p.value_type_code
WHERE vt.code = 5958
GROUP BY payroll_year
ORDER BY payroll_year;
```
[01_avg_salary.csv](csv.project/01_avg_salary.csv)

---

## Dotaz 2 – Růst mezd v procentech
**Popis:** Výpočet procentuálního růstu průměrné mzdy oproti předchozímu roku.

```sql
WITH avg_salary AS (
    SELECT payroll_year, ROUND(AVG(value)::numeric, 2) AS avg_salary
    FROM czechia_payroll p
    JOIN czechia_payroll_value_type vt ON vt.code = p.value_type_code
    WHERE vt.code = 5958
    GROUP BY payroll_year
)
SELECT 
    payroll_year,
    LAG(avg_salary) OVER (ORDER BY payroll_year) AS prev_salary,
    avg_salary,
    ROUND(
        ((avg_salary - LAG(avg_salary) OVER (ORDER BY payroll_year))
         / NULLIF(LAG(avg_salary) OVER (ORDER BY payroll_year), 0) * 100)::numeric,
        2
    ) AS growth_pct
FROM avg_salary
ORDER BY payroll_year;
```
 [02_salary_growth.csv](csv.project/02_salary_growth.csv)

---

## Dotaz 3 – Průměrné ceny podle let
**Popis:** Zjišťuje průměrné ceny potravin v jednotlivých letech na základě tabulky `czechia_price`.

```sql
SELECT 
    DATE_PART('year', date_from)::int AS year, 
    ROUND(AVG(value)::numeric, 2) AS avg_price
FROM czechia_price
GROUP BY year
ORDER BY year;
```
 [03_avg_price.csv](csv.project/03_avg_price.csv)

---

## Dotaz 4 – Růst cen v procentech
**Popis:** Počítá procentuální změnu průměrných cen mezi jednotlivými roky.  
*(Výsledek je prázdný – pro dané roky nejsou dostupná úplná data.)*

```sql
WITH avg_price AS (
    SELECT DATE_PART('year', date_from)::int AS year, ROUND(AVG(value)::numeric, 2) AS avg_price
    FROM czechia_price
    GROUP BY year
)
SELECT 
    year,
    LAG(avg_price) OVER (ORDER BY year) AS prev_price,
    avg_price,
    ROUND(
        ((avg_price - LAG(avg_price) OVER (ORDER BY year))
         / NULLIF(LAG(avg_price) OVER (ORDER BY year), 0) * 100)::numeric,
        2
    ) AS price_growth_pct
FROM avg_price;
```
 

---

## Dotaz 5 – Porovnání růstu mezd a cen
**Popis:** Porovnává růst mezd a růst cen, aby se zjistilo, zda existuje rok, kdy růst cen potravin překročil růst mezd o více než 10 %.  

```sql
WITH avg_salary AS (
    SELECT payroll_year::int AS year, ROUND(AVG(value)::numeric, 2) AS avg_salary
    FROM czechia_payroll p
    JOIN czechia_payroll_value_type vt ON vt.code = p.value_type_code
    WHERE vt.code = 5958
    GROUP BY payroll_year
),
salary_growth AS (
    SELECT year AS payroll_year,
           LAG(avg_salary) OVER (ORDER BY year) AS prev_salary,
           avg_salary,
           ROUND(((avg_salary - LAG(avg_salary) OVER (ORDER BY year))
                 / NULLIF(LAG(avg_salary) OVER (ORDER BY year), 0) * 100)::numeric, 2) AS salary_growth_pct
    FROM avg_salary
),
avg_price AS (
    SELECT DATE_PART('year', date_from)::int AS year, ROUND(AVG(value)::numeric, 2) AS avg_price
    FROM czechia_price
    GROUP BY year
),
price_growth AS (
    SELECT year,
           LAG(avg_price) OVER (ORDER BY year) AS prev_price,
           avg_price,
           ROUND(((avg_price - LAG(avg_price) OVER (ORDER BY year))
                 / NULLIF(LAG(avg_price) OVER (ORDER BY year), 0) * 100)::numeric, 2) AS price_growth_pct
    FROM avg_price
)
SELECT 
    s.payroll_year,
    s.salary_growth_pct,
    p.price_growth_pct,
    ROUND((p.price_growth_pct - s.salary_growth_pct)::numeric, 2) AS difference_pct
FROM salary_growth s
JOIN price_growth p ON s.payroll_year = p.year
ORDER BY s.payroll_year;
```
[05_salary_vs_price.csv](csv.project/05_salary_vs_price.csv)

---

## Finální tabulky
### t_svitlana_demianiuk_project_SQL_primary_final  
Hlavní tabulka obsahující průměrné mzdy a ceny podle odvětví a roku.  

### t_svitlana_demianiuk_project_SQL_secondary_final  
Doplňková tabulka s makroekonomickými údaji (HDP, GINI, populace, daně) pro vybrané evropské země.  

[t_svitlana_demianiuk_project_sql_primary_final.csv](csv.project/t_svitlana_demianiuk_project_sql_primary_final.csv)

[t_svitlana_demianiuk_project_sql_secondary_final.csv](csv.project/t_svitlana_demianiuk_project_sql_secondary_final.csv)
---

## Závěr
Z analýzy vyplynulo, že v dostupných datech se neobjevil žádný rok, kdy by růst cen potravin převýšil růst mezd o více než 10 %.  
To znamená, že tempo růstu mezd v České republice většinou udrželo krok s inflací potravin, i když rozdíly mezi jednotlivými roky mohou být značné.  

---

## Struktura repozitáře
```
svitlana-demianiuk-sql-analysis/
│
├── README.md
├── project_czechia_analysis.sql
├── /csv.project/
│   ├── 01_avg_salary.csv
│   ├── 02_salary_growth.csv
│   ├── 03_avg_price.csv
│   ├── 04_price_growth.csv
│   ├── 05_salary_vs_price.csv
│   ├── t_svitlana_demianiuk_project_SQL_primary_final.csv
│   └── t_svitlana_demianiuk_project_SQL_secondary_final.csv
└── /screenshots/
    ├── 01_avg_salary.png
    ├── 02_salary_growth.png
    ├── 03_avg_price.png
    ├── 04_price_growth.png
    └── 05_salary_vs_price.png
```
