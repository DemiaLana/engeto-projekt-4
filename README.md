Projekt: Analýza českého trhu práce a cen (Demianiuk Svitlana)

1. Zadání projektu

Cílem projektu je analyzovat vývoj průměrných mezd a cen v České republice v letech 2000–2002, spočítat jejich meziroční růst, porovnat mzdy a ceny a doplnit makroekonomická data (GDP, Gini, populace, daně). Projekt slouží k přípravě přehledného reportu pro rozhodování managementu.

Poznámka k období dat:
Data použitá v projektu zahrnují roky 2000–2002, protože pouze pro tento rozsah máme kompletní záznamy v primární tabulce. Analýza a výpočty byly provedeny právě pro toto období, aby výsledky byly úplné a konzistentní.


⸻

2. Popis tvorby tabulek

Primary tabulka: t_svitlana_demianiuk_project_sql_primary_final
	•	Obsahuje detailní data o mzdách (salary) a cenách (price) podle let.
	•	Sloupce:
	•	year – rok dat
	•	data_type – typ dat (salary nebo price)
	•	industry – odvětví (prázdné, pokud není specifikováno)
	•	price_category – kategorie ceny (např. ‘01’, ‘02’), pokud relevantní
	•	value – hodnota mzdy nebo ceny
	•	Data byla doplněna pro roky 2001–2002, aby tabulka byla kompletní pro všechny výpočty otázek 1–5.

Secondary tabulka: t_svitlana_demianiuk_project_sql_secondary_final
	•	Obsahuje makroekonomická data pro stejná období.
	•	Sloupce:
	•	country – stát (Czechia)
	•	year – rok
	•	gdp – hrubý domácí produkt
	•	gini – Giniho koeficient
	•	population – počet obyvatel
	•	taxes – celkové daně
	•	Data byla vložena z CSV (macro_data.csv) pro kompletnost.

Poznámka: Data byla získána přes terminál z PostgreSQL databáze (engeto_project) a ověřena v CSV. Skryny zobrazují ukázky dat pro přehled, plný dataset je uložen v CSV.

⸻

3. Jednotlivé otázky a odpovědi
	1.	Průměrná mzda za rok
	•	Výpočet: průměrná mzda (avg_salary) z primary tabulky.
	•	Závěr: Průměrná mzda rostla z 9778,67 (2000) na 10500,00 (2001) a zůstala stejná v roce 2002.
	2.	Růst mezd mezi roky
	•	Výpočet: meziroční růst (growth) z průměrné mzdy.
	•	Závěr: Růst mzdy mezi 2000–2001 byl 721,33, mezi 2001–2002 0,00.
	3.	Průměrná cena za rok
	•	Výpočet: průměrná cena (avg_price) z primary tabulky.
	•	Závěr: Průměrná cena rostla z 109124,50 (2000) na 115500,00 (2002).
	4.	Růst cen mezi roky
	•	Výpočet: meziroční růst (growth) z průměrné ceny.
	•	Závěr: Nejvyšší růst cen byl mezi 2000–2001: 3875,50, mezi 2001–2002: 2500,00.
	5.	Poměr mzdy k cenám (salary_vs_price)
	•	Výpočet: porovnání průměrné mzdy a průměrné ceny pro každý rok.
	•	Závěr: Poměr mzdy k cenám se udržel stabilně kolem 0,09, což indikuje vyrovnaný růst mezd a cen.

⸻

4. Struktura projektu
sv_results/
│
├─ primary_data.csv
├─ macro_data.csv
│
├─ screenshots/
│   ├─ 01_avg_salary_by_year.png
│   ├─ 02_salary_growth_by_year.png
│   ├─ 03_avg_price_by_year.png
│   ├─ 04_price_growth_by_year.png
│   ├─ 05_salary_vs_price_ratio.png
│   ├─ primary_table.png
│   └─ secondary_table.png
│
├─ sql_scripts/
│   ├─ 01_avg_salary.sql
│   ├─ 02_salary_growth.sql
│   ├─ 03_avg_price.sql
│   ├─ 04_price_growth.sql
│   ├─ 05_salary_vs_price.sql
│   ├─ t_svitlana_demianiuk_project_sql_primary_final.sql
│   └─ t_svitlana_demianiuk_project_sql_secondary_final.sql
│
└─ README.md
Poznámky:
	•	Skryny obsahují pouze ukázky dat pro přehled, plná data jsou v CSV.
	•	SQL skripty odpovídají otázkám 1–5 a vytváření tabulek.
	•	CSV soubory slouží pro import dat do databáze přes terminál.