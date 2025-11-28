
# Berechnet pro Kunde den Durchschnittlichen Umsatz pro Bestellung sowie den Max- und Min-Wert

SELECT 
  account_id
  ,MAX(umsatz_gesamt) max_umsatz
  ,MIN(umsatz_gesamt) min_umsatz
  ,AVG(umsatz_gesamt) umsatz_durchschnitt
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
 group by 1