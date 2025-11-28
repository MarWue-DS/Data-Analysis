
#Fragestellung: Festlegung für jede Account_ID zu den wie viel % umsatzstärksten Kunden sie gehört.


With umsatz_je_acc AS (SELECT 
  account_id
  ,sum(umsatz_gesamt) umsatz_gesamt
FROM `ihk-data-analyst-2024.Rohdaten_bereinigt.orders`
group by 1)


SELECT *
  ,PERCENT_RANK() OVER (ORDER BY umsatz_gesamt DESC) Perzentil_Rang
FROM umsatz_je_acc