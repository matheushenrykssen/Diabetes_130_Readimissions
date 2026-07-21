USE Diabetes_130

											-- Create Foreign Keys --

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_diagnosis
FOREIGN KEY (diagnosis_id)
REFERENCES dim_diagnosis(diagnosis_id)

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_admission_type
FOREIGN KEY (admission_type_id)
REFERENCES dim_admission_type(admission_type_id)

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_admission_source
FOREIGN KEY (admission_source_id)
REFERENCES dim_admission_source(admission_source_id)

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_discharge_disposition
FOREIGN KEY (discharge_disposition_id)
REFERENCES dim_discharge_disposition(discharge_disposition_id)

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_readmission
FOREIGN KEY (readmission_id)
REFERENCES dim_readmission(readmission_id)

ALTER TABLE fact_hospitalization
ADD CONSTRAINT FK_fact_medication
FOREIGN KEY (medication_id)
REFERENCES dim_medication(medication_id)