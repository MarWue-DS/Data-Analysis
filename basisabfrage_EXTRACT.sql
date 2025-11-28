
# An welchen Wochentagen, Monaten, Jahren haben jeweils unsere Bestellungen stattgefunden?

SELECT
  id
  ,EXTRACT(DATE FROM Datum) Datum
  ,EXTRACT(DAYOFWEEK FROM Datum) Wochentag
  ,EXTRACT(Month FROM Datum) Monat
  ,EXTRACT(Year FROM Datum) Jahr
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`