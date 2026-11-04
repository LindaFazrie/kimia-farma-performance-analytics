SELECT branch_name, branch_category, COUNT(*) AS n
FROM `rakamin-kf-analytics-513600.kimia_farma.kf_kantor_cabang`
GROUP BY branch_name, branch_category
ORDER BY n DESC;
