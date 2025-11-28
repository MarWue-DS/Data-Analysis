
# Wie viel Umsatz haben wir pro Tag. Zusätzlich interessiert uns neben dem Umsatz pro Tag, wie hoch der Anteil des Tagesumsatzes im Verhältnis zum kompletten Monatsumsatzes liegt.
#1. Abfrage: Umsatz pro Tag
#2. Abfrage: Umsatz pro Monat
#3. Abfrage: Join der 1. und 2. Abfrage sowie der Bildung des Verhältnisses von Umsatz pro Tag / Umsatz pro Monat


#1. Abfrage: Umsatz pro Tag
WITH umsatz_tag_t AS (
SELECT
  Datetime_trunc(Datum,DAY) Datum_tag
  ,sum(umsatz_gesamt) umsatz_tag
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
group by 1
),

#2. Abfrage: Umsatz pro Monat
umsatz_monat_t AS (
SELECT
  Datetime_trunc(Datum,MONTH) Datum_monat
  ,sum(umsatz_gesamt) umsatz_monat
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
group by 1
)


#3. Abfrage: Join der 1. und 2. Abfrage sowie der Bildung des Verhältnisses von Umsatz pro Tag / Umsatz pro Monat
SELECT
  Datum_tag
  ,umsatz_tag
  ,umsatz_monat
  ,(umsatz_tag / umsatz_monat)*100 AS Anteil_am_Monatsumsatz
FROM umsatz_tag_t left outer join umsatz_monat_t ON Datetime_trunc(Datum_tag,MONTH) = Datum_monat


