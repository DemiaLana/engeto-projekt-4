# README – SQL Projekt

## 1. Popis projektu

Cílem projektu je analyzovat dostupná makroekonomická a mikroekonomická data České republiky a ověřit, zda existuje souvislost mezi vývojem HDP, mzdami a cenami základních potravin.

Projekt pracuje se dvěma vlastními tabulkami vytvořenými z veřejných datových sad:

primární tabulka – obsahuje ceny potravin a mzdy podle odvětví v jednotlivých letech,

sekundární tabulka – obsahuje makroekonomické ukazatele (HDP, populace, Gini, daně, fertilita, úmrtnost dětí).

Nad těmito tabulkami jsou následně zpracovány analytické SQL dotazy odpovídající pěti výzkumným otázkám.

## 2. Popis tvorby tabulek

### 2.1. Primární tabulka – t_svitlana_demianiuk_project_sql_primary_final

Primární tabulka slouží k uchování dat o:

- cenách potravin (z tabulek `czechia_price` a `czechia_price_category`),
- mzdách podle odvětví (z tabulek `czechia_payroll` a `czechia_payroll_industry_branch`).

### 2.2. Sekundární tabulka – t_svitlana_demianiuk_project_sql_secondary_final

Sekundární tabulka ukládá makrodata (HDP, populace, Gini, daně, fertilita, úmrtnost dětí) z tabulky `economies`, připojené podle tabulky `countries` pro zajištění validity dat.

## 3. Otázky a odpovědi

1. Rostou mzdy ve všech odvětvích, nebo v některých klesají?

Analýza ukazuje, že průměrná mzda většinu sledovaných let roste. Pouze v roce 2013 dochází k poklesu (–412 Kč). Ve všech ostatních letech je zaznamenán růst mezd, i když jeho intenzita se liší.

Celkový trend: dlouhodobý růst mezd.

Jediný pokles: rok 2013.

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

- 2006: přibližně 391 000 kg chleba a 437 000 litrů mléka.
- 2018: přibližně 408 000 kg chleba a 499 000 litrů mléka.

Kupní síla tedy mezi roky 2006 a 2018 mírně vzrostla, i když ceny potravin rostly.

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

Nejpomalejší růst dlouhodobě vykazuje cukr, s nejnižšími meziročními skoky cen.

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Na základě analyzovaných dat neexistuje žádný rok, ve kterém by meziroční růst cen potravin převýšil růst mezd o více než 10 %.

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Na základě dat lze říci, že mezi HDP, cenami potravin a mzdami existuje slabá, ale viditelná souvislost, i když není dokonale přímá.

- 2000–2005: HDP roste stabilně, mzdy i ceny rostou mírně.
- 2006–2008: rychlejší růst HDP doprovází výraznější růst mezd i cen.
- 2009: během krize klesá HDP i ceny potravin, což ukazuje na jasnou korelaci.
- 2010–2012: postupné zotavení – HDP, mzdy i ceny znovu rostou.
- 2013–2016: ceny rostou jen minimálně, mzdy mírně, HDP pokračuje stabilně nahoru.
- 2017–2018: skokový růst mezd i cen je v souladu s vyšším výkonem ekonomiky.
- 2020: prudký pokles HDP (pandemie) – růst mezd zpomaluje, data cen jsou omezená.

Závěr: HDP má částečný vliv – v obdobích ekonomického růstu zpravidla rostou i mzdy a často i ceny potravin. V krizových letech (např. 2009, 2020) je propad ekonomiky vidět i v poklesu cen nebo zpomalení růstu mezd. Vztah však není lineární a ceny reagují pomaleji než mzdy a HDP.

---

# README – English translation

## 1. Project description

The aim of the project is to analyze available macroeconomic and microeconomic data for the Czech Republic and verify whether there is a relationship between GDP development, wages, and prices of basic foodstuffs.

The project uses two derived tables created from public datasets:

- primary table – contains food prices and wages by industry across years,
- secondary table – contains macroeconomic indicators (GDP, population, Gini, taxes, fertility, child mortality).

Analytical SQL queries corresponding to five research questions are executed on top of these tables.

## 2. Table creation description

### 2.1. Primary table – t_svitlana_demianiuk_project_sql_primary_final

The primary table stores data on:

- food prices (from `czechia_price` and `czechia_price_category` tables),
- wages by industry (from `czechia_payroll` and `czechia_payroll_industry_branch` tables).

### 2.2. Secondary table – t_svitlana_demianiuk_project_sql_secondary_final

The secondary table stores macro data (GDP, population, Gini, taxes, fertility, child mortality) from the `economies` table, joined to the `countries` table to ensure data validity.

## 3. Questions and answers

1. Do wages increase in all industries, or do some decline?

The analysis shows that average wages increase in most observed years. Only in 2013 is there a decline (–412 CZK). In all other years wages increase, though the intensity varies.

Overall trend: long-term wage growth.

Only decline: year 2013.

2. How many liters of milk and kilograms of bread can be bought in the first and last comparable period in the available price and wage data?

- 2006: approximately 391,000 kg of bread and 437,000 liters of milk.
- 2018: approximately 408,000 kg of bread and 499,000 liters of milk.

Purchasing power therefore slightly increased between 2006 and 2018, although food prices rose.

3. Which food category is increasing the slowest (has the lowest annual percentage increase)?

Sugar shows the slowest long-term growth, with the smallest year-on-year price jumps.

4. Is there a year when the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?

Based on analyzed data, there is no year in which year-on-year food price growth exceeded wage growth by more than 10%.

5. Does GDP affect changes in wages and food prices? That is, if GDP increases significantly in one year, does it show up as stronger growth in food prices or wages in the same or following year?

Based on data, there is a weak but visible relationship between GDP, food prices, and wages, though not perfectly direct.

- 2000–2005: GDP rises steadily, wages and prices rise mildly.
- 2006–2008: faster GDP growth accompanies stronger wage and price growth.
- 2009: during the crisis GDP and food prices fall, indicating clear correlation.
- 2010–2012: gradual recovery – GDP, wages and prices rise again.
- 2013–2016: prices grow minimally, wages modestly, GDP continues upward steadily.
- 2017–2018: jump in wages and prices corresponds with stronger economic performance.
- 2020: sharp GDP decline (pandemic) – wage growth slows, price data limited.

Conclusion: GDP has a partial influence – in growth periods wages and often food prices tend to rise. In crisis years (e.g., 2009, 2020) economic downturns are reflected in price drops or wage growth slowdowns. The relationship is not linear; prices react slower than wages and GDP.

