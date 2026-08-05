# 🩺 Diabetes Hospital Readmission Analysis

## 📌 Project Overview

This project analyzes over **100,000 hospital admissions of diabetic patients** from **130 U.S. hospitals (1999–2008)**. The objective was to investigate the factors associated with patient readmission, understand hospitalization patterns, evaluate medication usage, and build an interactive business intelligence dashboard.

The project follows a complete end-to-end data analytics workflow:

* Data Cleaning with Python
* Relational Database Modeling with SQL Server
* Dimensional Modeling (Star Schema)
* Data Visualization with Power BI
* Business Insights through DAX Measures

---

## 🎯 Objectives

The main goals of this project were:

* Analyze hospital readmission rates.
* Identify demographic groups with higher readmission risk.
* Evaluate the relationship between medications and readmissions.
* Explore hospitalization characteristics such as emergency visits and length of stay.
* Build an optimized analytical model suitable for Business Intelligence.

---

## 📊 Dataset

**Source:**
UCI Machine Learning Repository

**Dataset:**
Diabetes 130-US hospitals for years 1999–2008

The dataset contains over **100,000 hospital encounters** collected from **130 hospitals across the United States**, including information such as:

* Patient demographics
* Diagnoses (ICD-9)
* Hospital admissions
* Hospital discharge
* Medication prescriptions
* Laboratory results
* Readmission information

---

# 🛠 Technologies Used

* Python
* Pandas
* SQL Server
* Power BI
* DAX
* Git
* GitHub

---

# 🧹 Data Cleaning

The data preparation stage was performed in Python.

Main cleaning tasks included:

* Removal of duplicated records
* Handling missing values
* Data type corrections
* Standardization of categorical values
* Creation of lookup tables
* Preparation of data for relational modeling

Some variables with excessive missing values or low analytical relevance were removed to improve model quality and dashboard performance.

Examples include:

* Weight
* Payer Code
* Medical Specialty
* Secondary and tertiary diagnoses
* Number of laboratory procedures
* Number of diagnoses
* Race

---

# 🗄 Database Modeling

Instead of importing the dataset directly into Power BI, a complete relational database was developed in SQL Server.

The project follows a **Star Schema**, composed of one fact table and multiple dimension tables.

### Fact Table

* Fact_Hospitalization
* Fact_Medication_Usage

### Dimension Tables

* Dim_Admission_Type
* Dim_Admission_Source
* Dim_Discharge_Disposition
* Dim_Diagnosis
* Dim_Medication
* Dim_Readmission

The model includes:

* Primary Keys
* Foreign Keys
* Data integrity constraints
* Appropriate SQL data types
* Optimized relationships for analytical queries

---

# 🩺 Diagnosis Mapping

One of the biggest challenges of this project was handling the diagnosis codes.

The original dataset contains ICD-9 diagnosis codes in a non-standard format, requiring additional preprocessing.
All measurements and verifications were performed individually in accordance with WHO codes.

The diagnosis dimension was created by:

* Cleaning diagnosis codes
* Standardizing ICD-9 values
* Mapping each code to its corresponding disease
* Grouping diseases into broader clinical categories

This process significantly improved the readability and usability of the dashboard.

---

# 💊 Medication Modeling

Medication analysis was modeled as a dedicated dimension.

Instead of treating medications as isolated variables, medication status was consolidated into a single analytical structure, allowing the dashboard to evaluate:

* Most prescribed medications
* Medication changes
* Diabetes medication usage
* Relationship between medications and readmission

---

# 📈 Power BI Dashboard

The dashboard was designed using a clean and minimalistic layout focused on business decision-making.

It includes interactive pages dedicated to:

## Executive Overview

* Total Patients
* Readmission Rate
* Average Length of Stay
* Emergency Visits
* Inpatient Visits
* Outpatient Visits

---

## Demographic Analysis

* Gender distribution
* Age groups
* Readmission by age
* Readmission rate by gender

---

## Hospitalization Analysis

* Admission type
* Admission source
* Discharge disposition
* Average hospitalization time
* Emergency admissions

---

## Medication Analysis

* Most frequently prescribed medications
* Medication status
* Medication changes
* Diabetes medication usage
* Readmission by medication

---

## Diagnosis Analysis

* Most common diseases
* Disease groups
* Readmission by diagnosis
* Distribution of ICD-9 categories

---

# 📊 DAX Measures

Several DAX measures were developed to support business analysis, including:

* Total Patients
* Total Admissions
* Readmission Rate
* Average Length of Stay
* Average Emergency Visits
* Average Inpatient Visits
* Average Outpatient Visits
* Medication Usage Rate
* Diabetes Medication Rate
* Percentage Distribution by Category
* Dynamic KPIs
* Interactive filtering measures

---

# 🔍 Key Insights

Some examples of insights obtained from the analysis include:

* Certain age groups present considerably higher readmission rates.
* Emergency admissions are strongly associated with future readmissions.
* Patients with longer hospital stays tend to show higher readmission frequencies.
* Medication usage patterns vary significantly across patient profiles.
* Specific diagnosis groups contribute disproportionately to hospital readmissions.

---

# 📁 Repository Structure

```
Diabetes-Hospital-Readmission-Analysis/

│
├── Data/
│   ├── Raw Dataset
│   ├── Processed Dataset
│
├── Notebooks/
│   ├── Data Cleaning
│   ├── Data Preparation
│   ├── Medication Auxiliar Table
│
├── SQL/
│   ├── Database Creation
│   ├── Table Creation
│   ├── Constraints
│   ├── Inserts
│   ├── Analisys 
│
├── Power BI/
│   ├── Dashboard.pbix
│
├── Images/
│   ├── Dashboard Preview
│   ├── Schema
│   ├── Insights
│
└── README.md
```

---

# 🚀 Skills Demonstrated

This project demonstrates practical experience with:

* Data Cleaning
* Exploratory Data Analysis
* Data Modeling
* SQL Database Design
* Dimensional Modeling
* ETL Concepts
* Business Intelligence
* Power BI Development
* DAX
* Dashboard Design
* Healthcare Data Analytics
* Data Storytelling

---

# 📚 What I Learned

Throughout this project I gained practical experience in:

* Building an end-to-end analytics project.
* Designing scalable relational databases.
* Applying dimensional modeling concepts.
* Transforming raw healthcare data into actionable insights.
* Creating professional Power BI dashboards focused on business users.
* Developing reusable DAX measures for interactive analysis.
* Managing a complete analytics workflow using Git and GitHub.

---

# 📷 Dashboard Preview

*(Add screenshots of your Power BI dashboard here.)*

---

# 📄 Data Source

Diabetes 130-US Hospitals for Years 1999–2008

UCI Machine Learning Repository

---

# ❤️ Special Thanks

A special thank you to my girlfriend Danyely Ribeiro for her incredible support throughout this project.

The ICD-9 diagnosis mapping required reviewing hundreds of medical codes and disease descriptions, making it one of the most demanding stages of the project. Her patience and dedication in helping organize and validate this information were invaluable.

While the data engineering, database modeling, analytics, and dashboard development were my responsibility, her contribution made the diagnosis documentation far more efficient and accurate.

You are the best!!

Thank you for always making all dreams come true. ❤️


# 👨‍💻 Author

**Matheus Henrykssen**

Aspiring Data Analyst passionate about Business Intelligence, SQL, Python and Power BI.

Feel free to connect with me on LinkedIn and explore my projects.

<p align="center">
  <a href="https://www.linkedin.com/in/matheus-goncalves-45534a414/">
    🔗 LinkedIn
  </a>
  &nbsp; | &nbsp;
  <a href="https://github.com/matheushenrykssen">
    💻 GitHub
  </a>
</p>
