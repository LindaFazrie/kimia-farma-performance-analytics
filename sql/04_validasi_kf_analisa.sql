SELECT
  COUNT(*) AS n,
  COUNTIF(branch_name IS NULL) AS orphan_branch,
  COUNTIF(product_name IS NULL) AS orphan_product,
  COUNTIF(nett_sales IS NULL OR nett_profit IS NULL) AS null_hitung,
  ROUND(SUM(nett_sales)) AS total_nett_sales,
  ROUND(SUM(nett_profit)) AS total_nett_profit
FROM `rakamin-kf-analytics-513600.kimia_farma.kf_analisa`;
