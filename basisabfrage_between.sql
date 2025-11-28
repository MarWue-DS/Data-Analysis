#Frage: Bestellung bei denen sowohl von Typ 1 als auch von Typ 2 über 100 gekauft wurden

#SELECT *
#FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` 
#Where menge_typ1 > 100 AND menge_typ2 > 100


#Frage: Welche Bestellung gab es zwischen dem 2016-04-01 und 2016-10-01
SELECT *
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` 
Where Datum between '2016-04-01' And '2016-10-01'