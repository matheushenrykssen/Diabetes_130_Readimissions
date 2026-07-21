-- Patients <30 days

SELECT
    r.readmitted,
    COUNT(*) AS total_patients,
    ROUND(
        100 * COUNT(*) / SUM(COUNT(*)) OVER (),2
    ) AS percentage
FROM fact_hospitalization f
JOIN dim_readmission AS r
    ON f.readmission_id = r.readmission_id
GROUP BY r.readmitted
ORDER BY total_patients DESC



-- Readmissions by age

WITH total AS
(
    SELECT
        age,
        COUNT(*) AS total_patients
    FROM fact_hospitalization
    GROUP BY age
),

readmitted AS
(
    SELECT
        age,
        COUNT(*) AS readmitted_patients
    FROM fact_hospitalization f
    JOIN dim_readmission r
        ON f.readmission_id = r.readmission_id
    WHERE r.readmitted <> 'NO'
    GROUP BY age
)

SELECT
    t.age,
    t.total_patients,
    r.readmitted_patients,
    CAST(
        100.0 * r.readmitted_patients / t.total_patients
        AS DECIMAL(5,2)
    ) AS readmission_rate
FROM total t
JOIN readmitted r
    ON t.age = r.age
ORDER BY readmission_rate DESC


-- Main diagnoses for readmisison

SELECT 
    d.disease_name,
    COUNT(d.disease_name) AS total_diag
FROM fact_hospitalization f
    JOIN dim_diagnosis d
    ON f.diagnosis_id = d.diagnosis_id
    JOIN dim_readmission r
    ON f.readmission_id = r.readmission_id
WHERE readmitted <> 'NO'
GROUP BY d.disease_name
ORDER BY total_diag DESC 


-- Main disease group for readmission

SELECT 
    d.disease_group,
    COUNT(d.disease_name) AS total_diag
FROM fact_hospitalization f
    JOIN dim_diagnosis d
    ON f.diagnosis_id = d.diagnosis_id
    JOIN dim_readmission r
    ON f.readmission_id = r.readmission_id
WHERE readmitted <> 'NO'
GROUP BY d.disease_group
ORDER BY total_diag DESC 

-- Top diagnoses

SELECT 
    d.disease_name,
    COUNT(d.disease_name) AS total_diag
FROM fact_hospitalization f
    JOIN dim_diagnosis d
    ON f.diagnosis_id = d.diagnosis_id
GROUP BY d.disease_name
ORDER BY total_diag DESC 

-- Main type of discharge disposition

SELECT 
    d.discharge_descripition,
    COUNT(d.discharge_descripition) AS total_disch
FROM fact_hospitalization f
    JOIN dim_discharge_disposition d
    ON f.discharge_disposition_id = d.discharge_disposition_id
GROUP BY d.discharge_descripition
ORDER BY total_disch DESC 

-- Main type of admission

SELECT 
    d.admission_type,
    COUNT(d.admission_type) AS total_adm
FROM fact_hospitalization f
    JOIN dim_admission_type d
    ON f.admission_type_id = d.admission_type_id
GROUP BY d.admission_type
ORDER BY total_adm DESC 

-- Insulin use for readmission

SELECT 
    insulin_status,
    COUNT(m.insulin_status) AS insulin
FROM fact_hospitalization f
    JOIN dim_readmission r
    ON f.readmission_id = r.readmission_id
    JOIN dim_medication m
    ON f.medication_id = m.medication_id
WHERE readmitted <> 'NO' and insulin_status <> 'NO'
GROUP BY m.insulin_status
ORDER BY insulin DESC


-- Medications by age

SELECT
    age,
    AVG(CAST(num_medications AS DECIMAL(5,2))) AS avg_medications
FROM fact_hospitalization
GROUP BY age
ORDER BY avg_medications DESC

-- Recurring patients

SELECT TOP (10)
    patient_nbr,
    COUNT(*) AS total_hospitalizations
FROM fact_hospitalization
GROUP BY patient_nbr
ORDER BY total_hospitalizations DESC

-- Recurring hospitalization

WITH patient_visits AS
(
    SELECT
        patient_nbr,
        COUNT(*) AS total_hospitalizations
    FROM fact_hospitalization
    GROUP BY patient_nbr
)

SELECT
    total_hospitalizations,
    COUNT(*) AS total_patients
FROM patient_visits
GROUP BY total_hospitalizations
ORDER BY total_hospitalizations

-- Readmssion vs recurrence

WITH patient_visits AS
(
    SELECT
        patient_nbr,
        COUNT(*) AS total_hospitalizations
    FROM fact_hospitalization
    GROUP BY patient_nbr
)

SELECT
    pv.total_hospitalizations,
    COUNT(DISTINCT f.patient_nbr) AS total_patients,
    SUM(CASE WHEN r.readmitted = '<30' THEN 1 ELSE 0 END) AS readmissions_under_30
FROM fact_hospitalization f
JOIN patient_visits pv
    ON f.patient_nbr = pv.patient_nbr
JOIN dim_readmission r
    ON f.readmission_id = r.readmission_id
GROUP BY pv.total_hospitalizations
ORDER BY pv.total_hospitalizations