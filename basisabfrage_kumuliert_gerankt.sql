
#Fragestellung: Erstelle eine Übersicht in der für jede Bestellung der Umsatz je Mitarbeiter kumuliert wird. Es soll jeden Monat neu angefangen werden zu zählen.
#Fragestellung: Wir wollen pro Monat jeweils den kumulierten Umsatz je Vertriebsmitarbeiter ausweisen und zusätzlich jeweils innerhalb des Monats den Rang im Vergleich mit seinen Kollegen berechnen.


With base_join AS (SELECT 
  TIMESTAMP_TRUNC(Datum, MONTH) Datum_monat
  ,c.name
  ,sum (umsatz_gesamt) Umsatz_pro_Monat_pro_MA
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders` AS a left outer join `ihk-data-analyst-2024.Rohdaten_bereinigt.accounts` As b ON account_id = b.id 
left outer join `ihk-data-analyst-2024.Rohdaten_bereinigt.sales_rep` as c ON sales_rep_id = c.id
group by 1,2)

SELECT 
  Datum_monat
  ,name
  ,Umsatz_pro_Monat_pro_MA
  ,RANK() OVER (PARTITION BY Datum_monat ORDER BY Umsatz_pro_Monat_pro_MA DESC) Umsatz_rang
FROM base_join
order by 1,3

