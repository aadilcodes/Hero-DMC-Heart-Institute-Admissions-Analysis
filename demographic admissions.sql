/*-Demographics and Admission Trends
Are there specific age groups or genders that have more emergency/Outpatient admissions?
How do demographic factors (e.g., age, gender) influence admission patterns?
*/

SELECT
	  CASE 
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 35 THEN '19-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END AS age_group,
	gender,
	TYPE_OF_ADMISSION AS Admission_type,
	count(mrd_no) as No_of_admissions
from patients p JOIN admission a ON p.sno = a.sno
where a.TYPE_OF_ADMISSION = 'E' OR a.TYPE_OF_ADMISSION = 'O'
GROUP BY 1,2,3
order by 4 desc;

