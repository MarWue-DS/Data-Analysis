
Create OR REPLACE TABLE `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
AS

SELECT 
  id
  ,account_id
  ,Datum
  ,menge_typ1
  ,menge_typ2
  ,menge_typ3
  ,gesamt gesamt_menge
  ,umsatz_typ1
  ,SAFE_CAST (umsatz_typ2 AS FLOAT64) umsatz_typ2
  ,SAFE_CAST (umsatz_typ3 AS FLOAT64) umsatz_typ3
  ,umsatz_gesamt
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`



