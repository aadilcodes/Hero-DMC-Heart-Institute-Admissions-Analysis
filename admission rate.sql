
-- admission rate by admission type
SELECT 
    type_of_admission AS admission_type,
    COUNT(sno) AS total_admissions,
    COUNT(sno) * 100.0 / SUM(COUNT(sno)) OVER () AS admission_rate
FROM admissions
GROUP BY  type_of_admission
ORDER BY admission_rate DESC;