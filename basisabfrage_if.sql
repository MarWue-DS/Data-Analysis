-- wir wollen für jeden Kunden berechnen, wie hoch war
-- der Umsatz nach 90 /180 / 360 / über 360 Tagen



-- 1. Abfrage: für jede Kunden ID jeweils das Erstkaufsdatum

With Erstkauf_t AS (SELECT
  account_id
  ,MIN(Datum) Erstkaufdatum
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
group by 1),


-- 2. Abfrage: Join mit allen Bestellungen + jeweils Differenz zwischen
-- Erstkaufdatum und Bestellungsdatum

Tage_seit_t AS (SELECT 
  a.account_id
  ,DATE_diff(Datum, Erstkaufdatum, DAY) Tage_seit_Ek
  ,umsatz_gesamt
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders` a left outer join Erstkauf_t b ON a.account_id = b.account_id)


-- 3. Abfrage: Gruppierung nach Kunden ID und jeweils die Summen der
-- Bestellungen pro Kunden abhängig von der Differenz zwischen
-- Erstkaufdatum und Bestellungsdatum

SELECT 
  account_id
  ,sum(IF (Tage_seit_t.Tage_seit_Ek <= 90, umsatz_gesamt, 0)) CLV_90
  ,sum(IF (Tage_seit_t.Tage_seit_Ek <= 180, umsatz_gesamt, 0)) CLV_180
  ,sum(IF (Tage_seit_t.Tage_seit_Ek <= 360, umsatz_gesamt, 0)) CLV_360
  ,sum(umsatz_gesamt) CLV
FROM Tage_seit_t
group by 1


-- 4. Abfrage: Join Kunden ID -> um den Kundennamen in der Tabelle zu
-- haben -> Die sparen wir uns









