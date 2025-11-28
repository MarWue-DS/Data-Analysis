#welcher Kunde gehört zu welcher Region?


SELECT
  a.Name AS Kunde
  ,c.name AS Region
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts` AS a left outer join `ihk-data-analyst-2024.Rohdaten_Projekt_1.sales_reps` AS b ON sales_rep_id = b.id left outer join `ihk-data-analyst-2024.Rohdaten_Projekt_1.region` AS c ON region_id = c.id 


