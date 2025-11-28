

WITH split_t AS (SELECT 
  Datum
  ,Produkte
  ,SPLIT(Produkte,',') Produkte_Split
FROM `ihk-data-analyst-2024.abc_bereinigt.Kaeufe`)

SELECT
  Datum
  ,Produkte
  ,unnest_produkt
FROM split_t,
UNNEST (Produkte_Split) AS unnest_produkt


