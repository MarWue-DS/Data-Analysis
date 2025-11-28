


WITH split_t AS (SELECT 
  Datum
  ,Produkte
  ,SPLIT(Produkte,',') Produkte_Split
FROM `ihk-data-analyst-2024.abc_bereinigt.Kaeufe`),

unnest_produkt_t AS (SELECT
  Datum
  ,Produkte
  ,unnest_produkt
FROM split_t,
UNNEST (Produkte_Split) AS unnest_produkt),


trim_t AS (SELECT
  TRIM (unnest_produkt) unnest_produkt
FROM unnest_produkt_t),


gb_produkt AS (SELECT
  unnest_produkt
  ,sum (Preise) umsatz_pro_produkt
FROM trim_t left outer join `ihk-data-analyst-2024.abc_bereinigt.Produktpreise` ON unnest_produkt = Produkte
group by 1),

umsatz_kum_ges AS (SELECT
  unnest_produkt
  ,umsatz_pro_produkt
  ,sum(umsatz_pro_produkt) OVER (ORDER BY umsatz_pro_produkt DESC) umsatz_kumuliert
  ,(SELECT sum(umsatz_pro_produkt)FROM gb_produkt) Umsatz_gesamt
FROM gb_produkt),

anteil_gesamt_umsatz_t AS (SELECT
  unnest_produkt
  ,umsatz_pro_produkt
  ,umsatz_kumuliert
  ,(umsatz_kumuliert / Umsatz_gesamt) anteil_gesamt_umsatz
FROM umsatz_kum_ges
order by 2 desc)

SELECT
  unnest_produkt
  ,umsatz_pro_produkt
  ,umsatz_kumuliert
  ,anteil_gesamt_umsatz
  ,CASE
    WHEN anteil_gesamt_umsatz <= 0.6 THEN 'Kategorie A'
    WHEN anteil_gesamt_umsatz <= 0.85 THEN 'Kategorie B'
    else 'Kategorie C'
    END AS ABC_Kategorie
FROM anteil_gesamt_umsatz_t
