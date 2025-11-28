
#1 Berechnung Aktive Kunden pro Jahr

WITH Aktiven_Kunden_t AS (SELECT 
  EXTRACT(YEAR from Datum) Jahr
  ,Count(DISTINCT account_id) Aktive_Kunden
 FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders` 
 group by 1),


#2 Berechnung Neukunden pro Jahr

ekj AS (SELECT
  account_id
  ,MIN(EXTRACT(YEAR from Datum)) Erstkauf_jahr
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
group by 1),

nkj AS (SELECT
  Erstkauf_jahr
  ,COUNT(DISTINCT account_id) Anzahl_Neukunden
FROM ekj
group by 1),

#3 Berechnung Bestandskunden pro Jahr

Bestandskunden_t AS (SELECT
  Jahr
  ,Aktive_Kunden
  ,Anzahl_Neukunden
  ,Aktive_Kunden - Anzahl_Neukunden AS Bestandskunden
FROM Aktiven_Kunden_t left outer join nkj ON Jahr = Erstkauf_jahr)


#4 Churn Rate pro Jahr

SELECT
  Jahr
  ,Aktive_Kunden
  ,Anzahl_Neukunden
  ,Bestandskunden
  ,1 - (Bestandskunden/LAG(Aktive_Kunden) OVER (ORDER BY Jahr)) AS Churn_Rate
FROM Bestandskunden_t
order by 1