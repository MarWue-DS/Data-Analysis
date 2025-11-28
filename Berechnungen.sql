#Wie viel % macht Menge  Typ 1 von der Gesamtmenge aus?


SELECT
  menge_typ1 AS Menge_Produkt1
  ,gesamt
  ,(menge_typ1/gesamt)*100 AS Anteil_typ1
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` LIMIT 1000