
#Fragestellung: Umsatz nach Jahr im Verhältnis mit dem Umsatz vom Vorjahr

With umsatz_jahr AS (SELECT 
  DATETIME_TRUNC(Datum,YEAR) Jahr
  ,sum(umsatz_gesamt) umsatz_gesamt
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
group by 1)

SELECT *
  ,umsatz_gesamt/LAG(umsatz_gesamt) OVER (ORDER BY Jahr) verhaeltnis_vorjahr  #LEAD - Nachfolgejahr
FROM umsatz_jahr