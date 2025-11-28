
#Füge zu jeder Bestellung den Wochentag in der Form Montag, Dienstag etc. hinzu:




SELECT
    EXTRACT(DAYOFWEEK FROM Datum)
    ,CASE
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 1 THEN 'Sonntag'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 2 THEN 'Montag'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 3 THEN 'Dienstag'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 4 THEN 'Mittwoch'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 5 THEN 'Donnerstag'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 6 THEN 'Freitag'
      WHEN EXTRACT(DAYOFWEEK FROM Datum) = 7 THEN 'Samstag'
    else 'Fehler'
    end
    As Wochentag
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`