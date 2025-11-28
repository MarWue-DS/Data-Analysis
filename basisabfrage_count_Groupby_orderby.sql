#Wie viele Bestellungen haben wir pro Account_id / Kunde? Erweitert: mit Name?

SELECT 
  account_id
  ,count(*) Anzahl_Kaeufe
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
GROUP BY 1   #account_id
order by 2 desc
