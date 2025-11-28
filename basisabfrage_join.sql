
#Frage: Wie heißen die Vertriebsverantwortlichen für jeden Kunden

SELECT 
  a.Name AS Kunde
  ,b.name AS Vertriebsmensch
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts` AS a left outer join `ihk-data-analyst-2024.Rohdaten_Projekt_1.sales_reps` AS b ON sales_rep_id = b.id


#SELECT 
#  Name
#  ,id
#FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.sales_reps` 