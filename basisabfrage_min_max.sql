
# Wann hat ein Kunde jeweils seinen ersten und letzten Kauf getätigt?

SELECT
  account_id
  ,Min(Datum) Erstkauf
  ,MAX(Datum) Letztkauf
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` 
 group by 1