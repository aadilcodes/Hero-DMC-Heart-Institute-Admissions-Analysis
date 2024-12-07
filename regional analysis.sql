/*
-Regional Analysis
How do admission patterns differ between rural and urban patients?
Are there disparities in types of admissions across regions?
*/

SELECT 
    t.year,
    t.month,
    p.rural,
    a.type_of_admission AS admission_type,
    COUNT(p.mrd_no) AS no_of_admissions
FROM patients p
JOIN admission a ON p.sno = a.sno
JOIN time_period t ON p.sno = t.sno
GROUP BY t.year, t.month, p.rural, a.type_of_admission;
