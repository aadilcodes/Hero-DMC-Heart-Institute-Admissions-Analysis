**Executive Summary**  
*This report analyzes admissions data from the Hero DMC Heart Institute, uncovering key patterns to support operational planning and decision-making. Insights focus on admission trends, including seasonal peaks, demographic and regional distributions, and gender-based ratios. Emergency Room (ER) admissions show significant seasonal variation, with higher rates among older male patients. Outpatient Department (OPD) visits are steady but reveal urban dominance and underutilization by rural populations. By leveraging PostgreSQL and Power BI, the analysis highlights data-driven insights crucial for resource allocation and healthcare delivery planning.*  

*The findings align with industry-standard healthcare metrics, providing a clear foundation for monitoring and improving hospital performance.*  

# Healthcare Admissions Analysis Report: Hero DMC Heart Institute

## Overview

This project analyzes hospital admissions data from [Hero DMC Heart Institute](https://www.kaggle.com/datasets/ashishsahani/hospital-admissions-data/data), analyzing patterns and trends to support decision-making in a healthcare setting.
The dataset, covering admissions from April 1, 2017, to March 31, 2019, includes demographic, clinical, and risk factor information.
The analysis focuses on admissions peak times, demographic and regional trends, leveraging PostgreSQL queries and Power BI visualizations.

## Key Objectives

1.  Identify peak admission times for emergency (ER) and outpatient (OPD) visits.
2.  Analyze demographic trends influencing admission patterns.
3.  Investigate regional disparities in admission types.
4.  Rate of admissions by department and Gender.

## Key Insights and Findings

### 1. Admission Types and Peak Times

**Objective**: Identify peak admission periods for ER and OPD admissions.
**Findings**:
- Peak ER admissions occurred in January 2019 (622 cases), while peak OPD admissions occurred in March 2019 (277 cases).
- ER admissions spiked during winter months, whereas OPD admissions were more stable, with minor variations by season.

### 2. Demographic Trends

**Objective**: Analyze age and gender distribution for ER and OPD admissions.
**Findings**:
- The highest ER admissions were among men aged 51-65 (2,880 cases) 26.4%, followed by men aged 66+ (2,711 cases) 24.8% .
- OPD admissions were also predominantly among older age groups, with men aged 51-65 leading at (1,412 cases) 29.23% .

### 3. Regional Analysis

**Objective**: Evaluate differences in admissions between rural and urban populations.
**Findings**:
- Urban patients accounted for a majority of ER admissions, particularly in November 2018 (403 cases).
- Rural patients showed relatively lower OPD visits, with peaks in February 2019 (59 cases).

### 4. Admission Rate by Admission Type

**Objective**: Determine the proportion of Emergency (ER) and Outpatient (OPD) admissions.  
**Findings**:  
- ER admissions accounted for **69.33%** of total admissions, demonstrating their significant role in hospital operations.  
- OPD admissions constituted **30.67%**, indicating the need for dedicated outpatient resources.

---

### 5. Gender Admission Ratio

**Objective**: Examine gender-based admission ratios across years and regions.  
**Findings**:  
- Male admissions consistently outnumbered female admissions across all regions and years.  
- Urban areas in **2017** had the highest male admission ratio at **64.27%**, while urban areas in **2019** recorded the lowest at **62.17%**.  
- Rural areas generally showed a slightly higher male admission ratio compared to urban areas, except in **2019**, where rural ratios were **62.91%** compared to urban ratios of **62.17%**.

---

## Data Modeling and Query Design

The original dataset was normalized and split into separate tables for: - **Patients**: Demographics and regional data.
- **Admission**: Admission type, dates, and outcomes.
- **Clinical Indicators**: Lab results and clinical measures.
- **Risk Factors**: Smoking, alcohol use, and chronic diseases.
- **Diagnoses**: Specific diagnoses and conditions.
- **Time Period**: Month and year details for temporal analysis.

**PostgreSQL Queries**:
- Designed views and Common Table Expressions (CTEs) to calculate KPIs.
- Queries showcase JOINs to analyze data relationships efficiently.

## Dashboard Integration

An interactive Power BI dashboard is embedded to visualize key trends, including:
- Monthly ER and OPD admission trends.
- Age and gender distribution of admissions.
- Rural vs. urban admission patterns.
- Admission rate by Department and Gender.

[View Interactive Dashboard](https://app.powerbi.com/groups/me/reports/2721d857-7dd2-465e-af67-f3384318f158/ReportSection?experience=power-bi)

## Conclusion

This analysis of admissions data from Hero DMC Heart Institute highlights significant patterns in hospital operations. Emergency admissions peak during winter months, primarily among older male patients, while outpatient admissions remain steady. Urban areas account for the majority of emergency visits, with gender trends consistently showing higher male admission rates. The data underscores critical trends in resource utilization and demographic distributions, offering a clear foundation for strategic decisions.
