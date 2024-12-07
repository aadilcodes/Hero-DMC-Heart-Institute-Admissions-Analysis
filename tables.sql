

select * from patients

-- patients table --
CREATE TABLE patients (
    sno INT PRIMARY KEY,
    mrd_no INT NOT NULL,
    age INT,
    gender CHAR(1),
    rural CHAR(1)
);

INSERT INTO patients (sno, mrd_no, age, gender, rural)
SELECT sno, mrd_no, age, gender, rural
FROM admissions;

-- admission table -- 
drop table admission;
CREATE TABLE admission (
    sno INT PRIMARY KEY,
    doa DATE,
    dod DATE,
    type_of_admission CHAR(1),
    duration_of_stay INT,
    outcome VARCHAR(50),
	CONSTRAINT fk_admission_patient FOREIGN KEY (sno) REFERENCES patients (sno)
);

INSERT INTO admission (sno, doa, dod, type_of_admission, duration_of_stay, outcome)
SELECT sno, doa, dod, type_of_admission, duration_of_stay, outcome
FROM admissions;

-- clinical table --
drop table clinical_indicators;
CREATE TABLE clinical_indicators (
    sno INT PRIMARY KEY,
    hb FLOAT,
    tlc FLOAT,
    platelets INT,
    glucose FLOAT,
    urea FLOAT,
    creatinine FLOAT,
    bnp VARCHAR(10),
	CONSTRAINT fk_clinical_patient FOREIGN KEY (sno) REFERENCES patients (sno)
);

INSERT INTO clinical_indicators (sno, hb, tlc, platelets, glucose, urea, creatinine, bnp)
SELECT sno, hb, tlc, platelets, glucose, urea, creatinine, bnp
FROM admissions;


-- risk table -- 
drop table risk_factors;
CREATE TABLE risk_factors (
    sno INT PRIMARY KEY,
    smoking INT,
    alcohol INT,
    dm INT,
    htn INT,
    cad INT,
    prior_cmp INT,
    ckd INT,
	CONSTRAINT fk_risk_patient FOREIGN KEY (sno) REFERENCES patients (sno)
);

INSERT INTO risk_factors (sno, smoking, alcohol, dm, htn, cad, prior_cmp, ckd)
SELECT sno, smoking, alcohol, dm, htn, cad, prior_cmp, ckd
FROM admissions;

-- diagnoses taable -- 
drop table diagnoses;
CREATE TABLE diagnoses (
    sno INT PRIMARY KEY,
    severe_anaemia INT,
    anaemia INT,
    acs INT,
    stemi INT,
    heart_failure INT,
    aki INT,
    cva_infract INT,
    af INT,
	CONSTRAINT fk_diagnoses_patient FOREIGN KEY (sno) REFERENCES patients (sno)
);

INSERT INTO diagnoses (sno, severe_anaemia, anaemia, acs, stemi, heart_failure, aki, cva_infract, af)
SELECT sno, severe_anaemia, anaemia, acs, stemi, heart_failure, aki, cva_infract, af
FROM admissions;


-- month year table -- 
drop table time_period;
CREATE TABLE time_period (
    sno INT PRIMARY KEY,
    year INT,
    month INT,
	CONSTRAINT fk_time_patient FOREIGN KEY (sno) REFERENCES patients (sno)
);

INSERT INTO time_period (sno, year, month)
SELECT sno, year, month
FROM admissions;


-- MAIN ADMISSIONS TABLE FROM KAGGLE 

-- dashbaord idea - show urban vs rural patient numbers / % in hosp , 
DROP TABLE IF EXISTS admissions;
CREATE TABLE admissions
( 
	SNO INT,
	MRD_No INT,
	DOA DATE,
	DOD DATE,
	AGE int,
	GENDER VARCHAR(1) ,
	RURAL VARCHAR(1) ,
	TYPE_OF_ADMISSION VARCHAR(1),
	month_year TEXT,
	DURATION_OF_STAY INT,
	duration_of_ius INT,
	OUTCOME VARCHAR(50),
	SMOKING INT,
	ALCOHOL INT,
	DM INT,
	HTN INT,
	CAD INT,
	PRIOR_CMP INT,
	CKD INT,
	HB FLOAT,
	TLC FLOAT ,
	PLATELETS FLOAT,
	GLUCOSE FLOAT,
	UREA FLOAT,
	CREATININE FLOAT,
	BNP VARCHAR(10),
	RAISED_CARDIAC_ENZYMES BOOLEAN,
	EF VARCHAR(10),
	SEVERE_ANAEMIA BOOLEAN,
	ANAEMIA BOOLEAN,
	STABLE_ANGINA BOOLEAN,
	ACS INT,
	STEMI INT,
	ATYPICAL_CHEST_PAIN INT	,
	HEART_FAILURE INT,
	HFREF INT,
	HFNEF INT,
	VALVULAR INT,
	CHB INT,
	SSS INT,
	AKI	INT,
	CVA_INFRACT INT,
	CVA_BLEED INT,
	AF INT,
	VT INT,
	PSVT INT,
	CONGENITAL INT,
	UTI INT,
	NEURO_CARDIOGENIC_SYNCOPE BOOLEAN,
	ORTHOSTATIC BOOLEAN,
	INFECTIVE_ENDOCARDITIS BOOLEAN,
	DVT BOOLEAN,
	CARDIOGENIC_SHOCK BOOLEAN,
	SHOCK BOOLEAN,
	PULMONARY_EMBOLISM BOOLEAN,
	CHEST_INFECTION BOOLEAN	
);


