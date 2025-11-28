
#Frage: Wie viele Tage vergehen durchschnittlich zwischen dem Kauf eines jeden Kunden? (wenn man den Erstkauf ignoriert)


With tage_seit AS (SELECT 
  account_id
  ,DATE_DIFF(Datum, LAG(Datum) OVER (Partition BY account_id ORDER BY Datum), DAY) Tage_seit_letztem_Kauf
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`)

SELECT
  account_id
  ,AVG(Tage_seit_letztem_Kauf) Tage_seit_letztem_Kauf_AVG
FROM tage_seit
WHERE Tage_seit_letztem_Kauf is not null
group by 1  

