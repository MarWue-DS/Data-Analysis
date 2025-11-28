#Frage: Unternehmen, die ien g beinhalten

#SELECT *
# FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
#WHERE Name like '%g%'

#Frage: Unternehmen, die mit einem G anfangen
#SELECT *
# FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
#WHERE Name like 'G%'

#Frage: Unternehmen, die mit einem g enden
#SELECT *
# FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
#WHERE Name like '%g'


#1)Unternehmen, die mit einem C starten
SELECT *
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
WHERE Name like 'C%'

#2)Unternehmen, die irgendwo ein 'one' im Namen haben
SELECT *
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
WHERE Name like '%one%'

#3)Unternehmen, die mit s enden
SELECT *
 FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts`
WHERE Name like '%s'

