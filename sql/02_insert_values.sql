													-- INSERT VALUES --

-- Dim admission source
BULK INSERT Diabetes_130.dbo.dim_admission_source
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\dim_admission_source.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,              
    FIELDTERMINATOR = ',',    
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,            
    CODEPAGE = '65001'         -- UTF-8
);


-- Dim discharge disposition
BULK INSERT Diabetes_130.dbo.dim_discharge_disposition
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\dim_discharge_disposition.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,             
    CODEPAGE = '65001'         
)

-- Dim readmission
BULK INSERT Diabetes_130.dbo.dim_readmission
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\dim_readmission.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,             
    CODEPAGE = '65001'         
)

-- Dim diagnosis
BULK INSERT Diabetes_130.dbo.dim_diagnosis
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\dim_diagnosis.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,             
    CODEPAGE = '65001'         
)

-- Dim Medications
BULK INSERT Diabetes_130.dbo.dim_medication
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\dim_medication.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,             
    CODEPAGE = '65001'         
)

-- Fact
BULK INSERT Diabetes_130.dbo.fact_hospitalization
FROM 'C:\Users\henry\Desktop\Projects\Diabetes_130_US\Dataset\Dim_&_Fact\fact_hospitalization.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '0x0a',    
    KEEPIDENTITY,             
    CODEPAGE = '65001'         
)
