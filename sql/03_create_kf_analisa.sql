-- Tabel analisa Kimia Farma: gabungan transaksi, cabang, dan produk
CREATE OR REPLACE TABLE `rakamin-kf-analytics-513600.kimia_farma.kf_analisa` AS
WITH base AS (
  SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    b.branch_name,
    b.kota,
    b.provinsi,
    b.rating AS rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    p.product_category,            -- tambahan untuk analisis kategori
    p.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi
  FROM `rakamin-kf-analytics-513600.kimia_farma.kf_final_transaction` t
  LEFT JOIN `rakamin-kf-analytics-513600.kimia_farma.kf_kantor_cabang` b ON t.branch_id = b.branch_id
  LEFT JOIN `rakamin-kf-analytics-513600.kimia_farma.kf_product` p ON t.product_id = p.product_id
),
calc AS (
  SELECT *,
    -- persentase laba berdasarkan harga sebelum diskon
    CASE
      WHEN actual_price <= 50000  THEN 0.10
      WHEN actual_price <= 100000 THEN 0.15
      WHEN actual_price <= 300000 THEN 0.20
      WHEN actual_price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,
    -- harga setelah diskon (diskon berupa pecahan 0-1)
    actual_price * (1 - discount_percentage) AS nett_sales
  FROM base
)
SELECT *, nett_sales * persentase_gross_laba AS nett_profit
FROM calc;
