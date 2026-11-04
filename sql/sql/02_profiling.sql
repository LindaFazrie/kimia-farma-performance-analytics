-- Profiling data sebelum membuat tabel analisa
SELECT
  (SELECT COUNT(*) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS n_rows,
  (SELECT COUNT(DISTINCT transaction_id) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS n_distinct_trx,
  (SELECT MIN(date) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS min_date,
  (SELECT MAX(date) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS max_date,
  (SELECT MIN(discount_percentage) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS min_disc,
  (SELECT MAX(discount_percentage) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS max_disc,
  (SELECT MIN(rating) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS min_rating_trx,
  (SELECT MAX(rating) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction`) AS max_rating_trx,
  (SELECT COUNT(*) - COUNT(DISTINCT branch_id) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_kantor_cabang`) AS dup_branch,
  (SELECT COUNT(*) - COUNT(DISTINCT product_id) FROM `rakamin-kf-analytics-513600.kimia_farma.kf_product`) AS dup_product,
  (SELECT COUNTIF(t.price != p.price)
     FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction` t
     JOIN `rakamin-kf-analytics-513600.kimia_farma.kf_product` p ON t.product_id = p.product_id) AS beda_harga,
  (SELECT COUNTIF(b.branch_id IS NULL)
     FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction` t
     LEFT JOIN `rakamin-kf-analytics-513600.kimia_farma.kf_kantor_cabang` b ON t.branch_id = b.branch_id) AS orphan_branch,
  (SELECT COUNTIF(p.product_id IS NULL)
     FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction` t
     LEFT JOIN `rakamin-kf-analytics-513600.kimia_farma.kf_product` p ON t.product_id = p.product_id) AS orphan_product;
