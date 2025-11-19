Projekt: Analýza českého trhu práce a cen (Demianiuk Svitlana)

1. Zadání projektu

Cílem projektu je analyzovat vývoj průměrných mezd a cen v České republice v letech 2000–2002, spočítat jejich meziroční růst, porovnat mzdy a ceny a doplnit makroekonomická data (GDP, Gini, populace, daně). Projekt slouží k přípravě přehledného reportu pro rozhodování managementu.

Poznámka k období dat
- Data použitá v projektu zahrnují roky 2000–2002, protože pouze pro tento rozsah máme kompletní záznamy v primární tabulce. Analýza a výpočty byly provedeny právě pro toto období, aby výsledky byly úplné a konzistentní.

---

2. Popis tvorby tabulek

Primary tabulka: `t_svitlana_demianiuk_project_sql_primary_final`

- Obsahuje detailní data o mzdách (`salary`) a cenách (`price`) podle let.
- Sloupce:
  - `year` — rok dat
  - `data_type` — typ dat (`salary` nebo `price`)
  - `industry` — odvětví (prázdné, pokud není specifikováno)
  - `price_category` — kategorie ceny (např. `01`, `02`), pokud relevantní
  - `value` — hodnota mzdy nebo ceny
- Data byla doplněna pro roky 2001–2002, aby tabulka byla kompletní pro všechny výpočty otázek 1–5.

Secondary tabulka: `t_svitlana_demianiuk_project_sql_secondary_final`

- Obsahuje makroekonomická data pro stejná období.
- Sloupce:
  - `country` — stát (Czechia)
  - `year` — rok
  - `gdp` — hrubý domácí produkt
  - `gini` — Giniho koeficient
  - `population` — počet obyvatel
  - `taxes` — celkové daně
- Data byla vložena z CSV (`macro_data.csv`) pro kompletnost.

Poznámka: Data byla získána přes terminál z PostgreSQL databáze (`engeto_project`) a ověřena v CSV. Snímky zobrazují ukázky dat pro přehled; plný dataset je uložen v CSV.

---

3. Jednotlivé otázky a odpovědi

1) Průměrná mzda za rok

- Výpočet: průměrná mzda (`avg_salary`) z primary tabulky.
- Závěr: Průměrná mzda rostla z **9778,67** (2000) na **10500,00** (2001) a zůstala stejná v roce 2002.
- Manažerské shrnutí: Průměrná mzda vzrostla v roce 2001 a v roce 2002 stagnovala; doporučeno sledovat další vývoj mezd a nákladů práce.

2) Růst mezd mezi roky

- Výpočet: meziroční růst (`growth`) z průměrné mzdy.
- Závěr: Růst mzdy mezi 2000–2001 byl **721,33**, mezi 2001–2002 **0,00**.
- Manažerské shrnutí: Zvýšení bylo jednorázové v roce 2001; pro plánování rozpočtu se nepočítejme s dalším růstem bez dodatečných dat.

3) Průměrná cena za rok

- Výpočet: průměrná cena (`avg_price`) z primary tabulky.
- Závěr: Průměrná cena rostla z **109124,50** (2000) na **115500,00** (2002).
- Manažerské shrnutí: Ceny vykazují postupný nárůst; zvažte vliv na marže a kupní sílu zákazníků.

4) Růst cen mezi roky

- Výpočet: meziroční růst (`growth`) z průměrné ceny.
- Závěr: Nejvyšší růst cen byl mezi 2000–2001: **3875,50**, mezi 2001–2002: **2500,00**.
- Manažerské shrnutí: Inflace byla silnější v prvním kroku období; doporučeno monitorovat náklady vstupů.

5) Poměr mzdy k cenám (`salary_vs_price`)

- Výpočet: porovnání průměrné mzdy a průměrné ceny pro každý rok.
- Závěr: Poměr mzdy k cenám se udržel stabilně kolem **0,09**, což indikuje vyrovnaný růst mezd a cen.
- Manažerské shrnutí: Stabilní poměr znamená vyrovnaný vývoj kupní síly; pravidelné sledování zajistí včasnou reakci.

---

4. Struktura projektu

```
README.md
screenshots/
├─ 01_avg_salary_by_year.png
├─ 02_salary_growth_by_year.png
├─ 03_avg_price_by_year.png
├─ 04_price_growth_by_year.png
├─ 05_salary_vs_price_ratio.png
├─ primary_table.png
└─ secondary_table.png
sql_scripts/
├─ 01_avg_salary.sql
├─ 02_salary_growth.sql
├─ 03_avg_price.sql
├─ 04_price_growth.sql
├─ 05_salary_vs_price.sql
├─ t_svitlana_demianiuk_project_sql_primary_final.sql
└─ t_svitlana_demianiuk_project_sql_secondary_final.sql
sv_results/
├─ primary_data.csv
└─ macro_data.csv
```

Poznámky:

- Snímky obsahují pouze ukázky dat pro přehled; plná data jsou v CSV.
- SQL skripty odpovídají otázkám 1–5 a tvorbě tabulek.
- CSV soubory slouží pro import dat do databáze přes terminál.

---

ENGLISH VERSION

Project: Analysis of the Czech labour market and prices (Demianiuk Svitlana)

1. Project brief

The project analyses the development of average wages and prices in the Czech Republic for the years 2000–2002. The goal is to calculate annual averages, year-on-year growth, compare wages and prices, and complement the results with macroeconomic data (GDP, Gini, population, taxes). The outputs are provided as SQL scripts, CSV files and charts.

Note on the data period
- The data used cover the years 2000–2002 because only for this range the primary table contains complete records. All analysis and calculations were performed for this period to keep results complete and consistent.

---

2. Tables description

Primary table: `t_svitlana_demianiuk_project_sql_primary_final`

- Contains detailed data on wages (`salary`) and prices (`price`) by year.
- Columns:
  - `year` — year
  - `data_type` — type (`salary` or `price`)
  - `industry` — industry (may be empty)
  - `price_category` — price category (e.g. `01`, `02`) if applicable
  - `value` — numeric value (wage or price)
- Data for 2001–2002 were added so the table is complete for the calculations in questions 1–5.

Secondary table: `t_svitlana_demianiuk_project_sql_secondary_final`

- Contains macroeconomic data for the same period.
- Columns: `country`, `year`, `gdp`, `gini`, `population`, `taxes`.
- Data were imported from the CSV file (`macro_data.csv`) for completeness.

Note: Data were exported from a PostgreSQL database (`engeto_project`) via terminal and validated in CSV. The screenshots show sample outputs; the full dataset is in the CSV files.

---

3. Questions and answers

1) Average wage per year

- Calculation: average wage (`avg_salary`) from the primary table.
- Conclusion: Average wage increased from **9778,67** (2000) to **10500,00** (2001) and remained the same in 2002.
- Manager's note: Average wage rose in 2001 and plateaued in 2002; monitor labor cost trends for budgeting.

2) Wage growth between years

- Calculation: year‑on‑year growth (`growth`) of the average wage.
- Conclusion: Wage growth was **721,33** (2000→2001) and **0,00** (2001→2002).
- Manager's note: The increase appears one‑off in 2001; do not assume continued growth without more data.

3) Average price per year

- Calculation: average price (`avg_price`) from the primary table.
- Conclusion: Average price increased from **109124,50** (2000) to **115500,00** (2002).
- Manager's note: Prices show a steady rise; assess impact on margins and customer purchasing power.

4) Price growth between years

- Calculation: year‑on‑year growth (`growth`) of the average price.
- Conclusion: Highest price growth was **3875,50** (2000→2001) and **2500,00** (2001→2002).
- Manager's note: Inflation peaked in 2000→2001; monitor input costs and pricing strategy.

5) Wage vs. price ratio (`salary_vs_price`)

- Calculation: comparison of average wage and average price per year.
- Conclusion: The wage‑to‑price ratio remained stable around **0,09**, indicating balanced growth of wages and prices.
- Manager's note: Stable ratio suggests maintained purchasing power; continue regular monitoring.

---

4. Project structure

```
README.md
screenshots/
├─ 01_avg_salary_by_year.png
├─ 02_salary_growth_by_year.png
├─ 03_avg_price_by_year.png
├─ 04_price_growth_by_year.png
├─ 05_salary_vs_price_ratio.png
├─ primary_table.png
└─ secondary_table.png
sql_scripts/
├─ 01_avg_salary.sql
├─ 02_salary_growth.sql
├─ 03_avg_price.sql
├─ 04_price_growth.sql
├─ 05_salary_vs_price.sql
├─ t_svitlana_demianiuk_project_sql_primary_final.sql
└─ t_svitlana_demianiuk_project_sql_secondary_final.sql
sv_results/
├─ primary_data.csv
└─ macro_data.csv
```

Notes:

- Screenshots show sample outputs; full data are in the CSV files.
- SQL scripts correspond to questions 1–5 and table creation.
- CSV files are used for importing data into the database via terminal.
