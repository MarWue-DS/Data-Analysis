
#Frage: Kürzen unserer Bestellungen auf den Monat, wann sie stattgefunden haben


# DATETIME_TRUNC(datetime_spalte, PART)

SELECT
  DATETIME_TRUNC(Datum, Month) Monat
  ,sum(umsatz_gesamt) Umsatz_pro_Monat
  ,count(*) Anzahl_Bestellungen
FROM `ihk-data-analyst-2024.Rohdaten_Projekt_1.orders`
group by 1