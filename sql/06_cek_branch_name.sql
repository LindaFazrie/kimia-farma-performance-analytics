SELECT FORMAT("%'.0f", SUM(nett_sales)) AS total_nett_sales,
       FORMAT("%'.0f", SUM(nett_profit)) AS total_nett_profit,
       ROUND(SUM(nett_profit)/SUM(nett_sales), 3) AS margin
FROM `rakamin-kf-analytics-513600.kimia_farma.kf_analisa`;
