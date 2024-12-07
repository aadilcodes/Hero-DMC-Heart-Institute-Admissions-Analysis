/* Hero DMC Heart Institute, 
	Unit of Dayanand Medical College and Hospital, Ludhiana, Punjab, India.*/

/* 
Patient Admission Patterns
Objective: Analyze patterns in admissions based on the type of admission (Emergency vs. OPD), month and year, age, and gender.
Business Question: What are the peak admission times, and are there specific demographic groups that require more emergency admissions?

2. Average Length of Stay (LOS)
Objective: Assess the average duration of stay for different conditions (like STEMI, Heart Failure, ACS) and patient demographics.
Business Question: How does the length of stay vary by condition, and what factors influence longer stays?

3. Intensive Care Utilization
Objective: Determine the usage of intensive care based on duration of intensive unit stay and condition.
Business Question: Which conditions and patient demographics are more likely to need intensive care?

4. Discharge Outcomes and Readmissions
Objective: Explore discharge outcomes to identify patterns in discharge status and identify common causes of unfavorable outcomes.
Business Question: Which factors (like age, condition, or admission type) are associated with higher rates of readmission or DAMA (Discharged Against Medical Advice)?

5. Comorbidities Impact Analysis
Objective: Examine how comorbidities such as diabetes (DM), hypertension (HTN), and chronic kidney disease (CKD) impact outcome and length of stay.
Business Question: What role do common comorbidities play in patient outcomes and resource utilization?

6. Admission Trends by Region
Objective: Compare admission trends between rural and urban patients and see if there are disparities in treatment outcomes.
Business Question: Are there differences in hospital outcomes or lengths of stay between rural and urban patients?

7. Laboratory Values and Patient Outcomes
Objective: Investigate relationships between lab results (like Hb, TLC, platelets, glucose, urea, creatinine, BNP) and outcomes for different patient demographics.
Business Question: Do certain lab values correlate with poorer outcomes or longer hospital stays?

8. Risk Factors for Cardiac Events
Objective: Study patients with conditions like STEMI, ACS, and heart failure to determine key risk factors such as smoking, alcohol use, comorbidities.
Business Question: What are the most significant risk factors for severe cardiac events and poor outcomes?

9. Mortality and Morbidity Analysis
Objective: Analyze patient outcomes, focusing on mortality rates associated with various conditions and demographic factors.
Business Question: Which conditions or combinations of risk factors have the highest mortality rates?

10. Seasonal Variations in Cardiac Events
Objective: Identify seasonal trends in cardiac events like STEMI and heart failure using the month and year of admission.
Business Question: Are certain cardiac events more frequent during specific seasons or months?

*/

-- Cleaning data 
-- we cleared empty and nill values in excel keeping the other data intact. 
-- solved file upload errors 

-- assign proper date format. 

SELECT * FROM admissions

select
	EXTRACT (YEAR from to_Date(month_year, 'YY-Mon')) as YEAR,
	EXTRACT (Month from to_Date(month_year, 'YY-Mon')) as Month
from admissions;

Alter table admissions
add column YEAR INT,
add column Month INT;

Update admissions
set 
	YEAR = EXTRACT (YEAR from to_Date(month_year, 'YY-Mon')), 
	MONTH = EXTRACT (Month from to_Date(month_year, 'YY-Mon')) ;

/*
Patient Admission Patterns
Objective: Analyze patterns in admissions based on the type of admission (Emergency vs. OPD), month and year, age, and gender.
Business Question: What are the peak admission times, and are there specific demographic groups that require more emergency admissions?
*/

-- 15755 records total

-- Peak admission times opd/er
SELECT * FROM admissions

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
	admission_count,
	rank
from peak_time
where rank between 1 and 3;

--
select
	year,
	month,
	count(mrd_no) as admission_Ct
from admissions
group by 1,2
order by 1,2

	
-- are there specific demographic groups that require more emergency admissions

SELECT
	  CASE 
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 35 THEN '19-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+' 
    END AS age_group,
	gender,
	count(mrd_no) as No_of_admissions
from admissions
where TYPE_OF_ADMISSION = 'E'
GROUP BY 1,2
order by 3 desc

/*
 Average Length of Stay (LOS)
Objective: Assess the average duration of stay for different conditions (like STEMI, Heart Failure, ACS) and patient demographics.
Business Question: How does the length of stay vary by condition, and what factors influence longer stays?

	What is the average LOS for high-prevalence cardiac conditions (like STEMI, Heart Failure, and ACS), 
	and how does it differ across patient demographics?"
*/ -- factors acs, stemi and heart failure ,  demographics  - age, gender, rural urban , avg los

select
	max(duration_of_stay),
	avg(duration_of_stay), 
	min(duration_of_stay)
from admissions

SELECT * FROM admissions

----
select 
	CASE 
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 35 THEN '19-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+'
	end as age_group,
	gender,
	rural,
	CASE
		WHEN STEMI = 1 THEN 'STEMI'
		WHEN ACS = 1 THEN 'ACS'
		WHEN heart_failure = 1 THEN 'heart_failure'
	END as condition,
	round(avg(duration_of_stay),1) as avg_days
from admissions
where STEMI = 1 OR ACS = 1 OR heart_failure = 1
group by 1,2,3,4
order by 1,2,3,4

/*
6. Admission Trends by Region
Objective: Compare admission trends between rural and urban patients and see if there are disparities in treatment outcomes.
Business Question: Are there differences in hospital outcomes or lengths of stay between rural and urban patients?
*/

	
SELECT 
	rural, 
	outcome, 
	count(outcome) as Outcome_Count, 
	round(avg(duration_of_stay),2) as avg_los,
	ROUND(
        (COUNT(outcome) * 1.0 / SUM(COUNT(sno)) OVER (PARTITION BY rural)) * 100, 2
    ) AS outcome_percentage
from admissions
group by 1,2
order by 2

