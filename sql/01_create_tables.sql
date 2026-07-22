USE Diabetes_130

									-- Separe and create tables --

-- Fact_table

CREATE TABLE fact_hospitalization (
	encounter_id BIGINT PRIMARY KEY,
	patient_nbr INT NOT NULL,
	admission_type_id TINYINT NOT NULL,
	admission_source_id TINYINT NOT NULL,
	discharge_disposition_id TINYINT NOT NULL,
	diagnosis_id INT NOT NULL,
	medication_id INT NOT NULL,

	readmission_id TINYINT NOT NULL
		CHECK(readmission_id BETWEEN 1 AND 3),
	
	age VARCHAR(10) NOT NULL,
	gender VARCHAR(20) NOT NULL
		CHECK(gender IN ('Male', 'Female', 'Unknow/Invalid')),
	
	diabetes_med BIT NOT NULL,
	medication_changed BIT NOT NULL,

	a1c_result VARCHAR(10) NOT NULL
		CHECK(a1c_result IN('None', 'Norm', '>7', '>8')),
	
	max_glu_serum VARCHAR(10) NOT NULL
		CHECK(max_glu_serum IN('None', 'Norm', '>200', '>300')),
	
	time_in_hospital TINYINT NOT NULL
		CHECK(time_in_hospital >= 1),
	
	num_medications TINYINT	NOT NULL,
	number_emergency TINYINT NOT NULL,
	number_inpatient TINYINT NOT NULL,
	number_outpatient TINYINT NOT NULL
)

											-- Dim_tables --

-- Dimension Readmission
CREATE TABLE dim_readmission(
	readmission_id TINYINT PRIMARY KEY,
	readmitted VARCHAR(5) NOT NULL UNIQUE
		CHECK(readmitted IN('NO','<30','>30'))
)

-- Dimension Admission Type
CREATE TABLE dim_admission_type(
	admission_type_id TINYINT PRIMARY KEY,
	admission_type VARCHAR(20) NOT NULL UNIQUE
)

-- Dimension Admission Source
CREATE TABLE dim_admission_source(
	admission_source_id TINYINT PRIMARY KEY,
	admission_source_description VARCHAR(100) NOT NULL UNIQUE
)

-- Dimension Discharge Disposition
CREATE TABLE dim_discharge_disposition(
	discharge_disposition_id TINYINT PRIMARY KEY,
	discharge_descripition VARCHAR(150) NOT NULL UNIQUE
)

-- Dimension Diagnosis
CREATE TABLE dim_diagnosis(
	diagnosis_id INT PRIMARY KEY,
	icd9_code VARCHAR(10) NOT NULL UNIQUE,
	disease_name VARCHAR(150) NOT NULL,
	short_name VARCHAR(50) NOT NULL,
	disease_group VARCHAR(100) NOT NULL
)

-- Dimension Medication
CREATE TABLE dim_medication(
    medication_id INT PRIMARY KEY,

    metformin_status VARCHAR(10) NOT NULL
		CHECK(metformin_status IN('No','Steady','Up','Down')),

    repaglinide_status VARCHAR(10) NOT NULL 
		CHECK(repaglinide_status IN('No','Steady','Up','Down')),

    nateglinide_status VARCHAR(10) NOT NULL
		CHECK(nateglinide_status IN('No','Steady','Up','Down')),

    chlorpropamide_status VARCHAR(10) NOT NULL
		CHECK(chlorpropamide_status IN('No','Steady','Up','Down')),

    glimepiride_status VARCHAR(10) NOT NULL
		CHECK(glimepiride_status IN('No','Steady','Up','Down')),

    acetohexamide_status VARCHAR(10) NOT NULL
		CHECK(acetohexamide_status IN('No','Steady','Up','Down')),

    glipizide_status VARCHAR(10) NOT NULL
		CHECK(glipizide_status IN('No','Steady','Up','Down')),

    glyburide_status VARCHAR(10) NOT NULL
		CHECK(glyburide_status IN('No','Steady','Up','Down')),

    tolbutamide_status VARCHAR(10) NOT NULL
		CHECK(tolbutamide_status IN('No','Steady','Up','Down')),

    pioglitazone_status VARCHAR(10) NOT NULL
		CHECK(pioglitazone_status IN('No','Steady','Up','Down')),

    rosiglitazone_status VARCHAR(10) NOT NULL
		CHECK(rosiglitazone_status IN('No','Steady','Up','Down')),

    acarbose_status VARCHAR(10) NOT NULL
		CHECK(acarbose_status IN('No','Steady','Up','Down')),

    miglitol_status VARCHAR(10) NOT NULL
		CHECK(miglitol_status IN('No','Steady','Up','Down')),

    troglitazone_status VARCHAR(10) NOT NULL
		CHECK(troglitazone_status IN('No','Steady','Up','Down')),

    tolazamide_status VARCHAR(10) NOT NULL
		CHECK(tolazamide_status IN('No','Steady','Up','Down')),

    insulin_status VARCHAR(10) NOT NULL
		CHECK(insulin_status IN('No','Steady','Up','Down')),

    glyburide_metformin_status VARCHAR(10) NOT NULL
		CHECK(glyburide_metformin_status IN('No','Steady','Up','Down')),

    glipizide_metformin_status VARCHAR(10) NOT NULL
		CHECK(glipizide_metformin_status IN('No','Steady','Up','Down')),

    glimepiride_pioglitazone_status VARCHAR(10) NOT NULL
		CHECK(glimepiride_pioglitazone_status IN('No','Steady','Up','Down')),

    metformin_rosiglitazone_status VARCHAR(10) NOT NULL
		CHECK(metformin_rosiglitazone_status IN('No','Steady','Up','Down')),

    metformin_pioglitazone_status VARCHAR(10) NOT NULL
		CHECK(metformin_pioglitazone_status IN('No','Steady','Up','Down'))
)