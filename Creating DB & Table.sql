-- DDL COMMANDS
/* 
SQL Question 1: CREATE Table
Scenario: 
	You are a data analyst at City Hospital. Management wants to create a new table to store patient details.
    
Task: 
	Write a SQL command to create a table named Patient_details with fields (PatientID, PatientName, Age, Gender, AdmissionDate).
    
Expected Output:
	A new table Patients is created successfully in the database.
*/

create database city_hospital;

use city_hospital;
create table patient_details (
	patient_id varchar(30),
	patient_name varchar(100),
	age int,
	gender enum("M","F"),
	admission_date date
);

/*
SQL Question 2: ALTER – Add Column
Scenario:
 Later, the hospital decides to store the doctor assigned to each patient.
 
Task:
 Write a SQL command to add a new column DoctorAssigned VARCHAR(50) to the Patients table.
 
Expected Output:
 The Patients table now has an additional column DoctorAssigned.
*/

alter table patient_details
add column doctor_assigned varchar(50);

/*
SQL Question 3: ALTER – Modify Column
Scenario:
 The hospital realizes that some patient names are longer than 100 characters.
 
Task:
 Write a SQL command to modify the column PatientName from VARCHAR(100) to VARCHAR(150).
 
Expected Output:
 The column PatientName now allows up to 150 characters.
*/

alter table patient_details
modify patient_name varchar(150);

/*
SQL Question 4: RENAME Table
Scenario:
 For better clarity, the hospital wants to rename Patient_details to Patient_Info.
 
Task:
 Write a SQL command to rename the table.
 
Expected Output:
 The table name is successfully changed to Patient_Info.
*/
rename table patient_details to patient_info;

/*
SQL Question 5: TRUNCATE vs DROP
Scenario:
 At year-end, they want to delete all patient records but keep the table. Later, they want to remove it permanently.
 
Task:
 Write SQL commands for TRUNCATE and DROP operations.
 
Expected Output:
 TRUNCATE keeps structure but clears data; DROP removes the table completely.
*/

truncate table patient_info;

drop table patient_info;
