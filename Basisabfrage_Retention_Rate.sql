
#1. Abfrage: Erstkaufsjahr für jeden Kunden

WITH ekj AS (SELECT
  account_id
  ,MIN(EXTRACT(YEAR FROM Datum)) Erstkaufjahr
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
group by 1),


#2. Abfrage: Gruppierung von Erstkaufjahr/Kaufjahr -> Messwert Anzahl Kunden

Kunde_ekj_kj_t AS (SELECT
  Erstkaufjahr
  ,EXTRACT(YEAR FROM Datum) AS Kaufjahr
  ,COUNT(DISTINCT a.account_id) Kunde_ekj_kj
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders` a left outer join ekj b ON a.account_id = b.account_id
group by 1, 2
order by 1, 2)

#3. Abfrage: (Kunden Erstkaufjahr/Kaufjahr) / Kunden Erstkaufjahr = Retention Rate

SELECT
  Erstkaufjahr
  ,Kaufjahr
  ,Kunde_ekj_kj
  ,MAX(Kunde_ekj_kj) OVER (PARTITION BY Erstkaufjahr) Kunden_EKJ
  ,Kunde_ekj_kj / MAX(Kunde_ekj_kj) OVER (PARTITION BY Erstkaufjahr) AS Retention_Rate
FROM Kunde_ekj_kj_t
order by 1, 2



