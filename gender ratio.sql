-- Gender admission ratio
SELECT 
	Year,
	rural,
	ROUND((SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(sno)),2) AS male_admission_ratio,
	ROUND((SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(sno)),2) AS female_admission_ratio
FROM admissions
Group by Year, Rural;