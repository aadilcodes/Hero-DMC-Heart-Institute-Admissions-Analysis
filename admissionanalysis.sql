/* Admissions analysis DMC HEART INS

Broad Question:
"What patterns and trends can be identified in hospital admissions based on type, time, patient demographics, and comorbidities?"

Subcategories:
-Admission Types and Peak Times
What are the peak times for different types of admissions (Emergency vs. OPD)?
How do admission patterns vary by month and year?

-Demographics and Admission Trends
Are there specific age groups or genders that have more emergency admissions?
How do demographic factors (e.g., age, gender) influence admission patterns?

-Regional Analysis
How do admission patterns differ between rural and urban patients?
Are there disparities in types of admissions or outcomes across regions?

-Admission and Comorbidity Trends
What are the most common comorbidities among patients with different types of admissions (e.g., Emergency, OPD)?
How do comorbid conditions (e.g., STEMI, ACS, heart failure) influence the length of stay and the type of care required?
Are there any patterns in admissions based on the presence of multiple comorbidities?
How do comorbidities affect patient outcomes, such as discharge status or readmission risk?
*/

/*
-Admission Types and Peak Times
What are the peak times for different types of admissions (Emergency vs. OPD)?
How do admission patterns vary by month and year?
*/

-- Peak admission times opd/er
SELECT * FROM admissions
order by sno;
	

with peak_time
as
(select
	year,
	month, 
	TYPE_OF_ADMISSION,
	COUNT(mrd_no)as admission_count,
	dense_rank () over(partition by Year, TYPE_OF_ADMISSION order by count(mrd_no) desc) as rank 
from admissions
group by 1,2, TYPE_OF_ADMISSION
)
Select
	Year,
	month,
	TYPE_OF_ADMISSION,
	admission_count as Total_No_of_Admissions,
	rank
from peak_time
where rank between 1 and 3
order by 2;

--
select
	year,
	month,
	count(mrd_no) as admission_Ct
from patients p join time_period t
ON p.sno = t.sno
group by 1,2




