
#Frage: Welche Bestellungen haben mindestens von einem Typ eine Menge von 100 gehabt?

SELECT *
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` 
WHERE menge_typ1 >100 or menge_typ2 >100 or menge_typ3 >100