-- Top 5 cabang: rating cabang tertinggi, lalu rating transaksi terendah
CREATE OR REPLACE TABLE `rakamin-kf-analytics-513600.kimia_farma.kf_top5_cabang` AS
SELECT
  branch_id,
  kota,
  branch_name,
  MAX(rating_cabang) AS rating_cabang,
  ROUND(AVG(rating_transaksi), 2) AS rating_transaksi,
  COUNT(*) AS jumlah_transaksi
FROM `rakamin-kf-analytics-513600.kimia_farma.kf_analisa`
GROUP BY branch_id, kota, branch_name
ORDER BY rating_cabang DESC, rating_transaksi ASC
LIMIT 5;
