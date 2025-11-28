# Wie viel Umsatz macht jeder Kunde? Erweitert: mit Name?

SELECT 
  account_id
  ,sum (umsatz_gesamt) Umsatz_pro_Kunde
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
 GROUP BY 1