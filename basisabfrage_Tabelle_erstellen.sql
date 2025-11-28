#Kunden
#Name des Kunden
#Website
#AP_Unternehmen
#Erstkauf
#Letztkauf
Create or Replace Table `ihk-data-analyst-2024.Aggregierte_Tabellen.kunden`
AS

SELECT
  Name As Name_des_Kunden
  ,Website
  ,primary_poc AS Hauptansprechpartner
  ,MIN(Datum) As Erstkauf
  ,MAX(Datum) As Letztkauf
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.accounts` AS a left outer join `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders` As b ON a.id = account_id
group by 1,2,3   
