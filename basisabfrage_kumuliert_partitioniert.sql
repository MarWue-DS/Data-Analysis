

#Fragestellung: Erstellung einer Spalte, die den kumulierten Umsatz der Bestellungen berechnet:
# Fragestellung: Füge eine kumulierte Umsatzspalte zu den Bestellungen hinzu, die zum Minatsanfang von vorne beginnt.

SELECT 
  Datum
  ,umsatz_gesamt
  ,sum(umsatz_gesamt) OVER (PARTITION BY TIMESTAMP_TRUNC(Datum, MONTH) ORDER BY Datum) kumulierter_Umsatz
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
order by Datum