SELECT * FROM diabetes_prediction.pysliq_prediction;
SELECT age,Patient_id from pysliq_prediction;#Retrieve the Patient_id and ages of all patients
SELECT EmployeeName,gender,age from pysliq_prediction where gender= 'Female' and age>=40;#Select all female patients who are older than 40
SELECT avg(bmi) from pysliq_prediction;#Calculate the average BMI of patients
SELECT EmployeeName,blood_glucose_level from pysliq_prediction order by blood_glucose_level desc;#List patients in descending order of blood glucose levels
SELECT EmployeeName,hypertension,diabetes from pysliq_prediction where hypertension=1 and diabetes=1;#Find patients who have hypertension and diabetes
SELECT count(Patient_id) from pysliq_prediction where heart_disease=1; #Determine the number of patients with heart disease
SELECT count(Patient_id),smoking_history from pysliq_prediction GROUP BY smoking_history;#Group patients by smoking history and count how many smokers and non-smokers there are
SELECT Patient_id,bmi from pysliq_prediction where bmi>(SELECT avg(bmi) from pysliq_prediction);#Retrieve the Patient_ids of patients who have a BMI greater than the average BMI
SELECT * from pysliq_prediction where HbA1c_level=(SELECT Max(HbA1c_level) from pysliq_prediction) OR HbA1c_level=(SELECT Min(HbA1c_level) from pysliq_prediction); #Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel
SELECT age,Patient_id, DATEDIFF(CURDATE(),STR_TO_DATE(age,'%Y-%M-%D'))/365 AS calculated_age from pysliq_prediction;#Calculate the age of patients in years 
SELECT Patient_id,gender,blood_glucose_level,RANK()OVER(PARTITION BY gender ORDER BY blood_glucose_level Desc) AS glucose_rank from pysliq_prediction;#Rank patients by blood glucose level within each gender group
UPDATE pysliq_prediction SET smoking_history='Ex-smoker' where age>50; #Update the smoking history of patients who are older than 50 to "Ex-smoker
INSERT INTO pysliq_prediction (EmployeeName,Patient_id,gender,age,hypertension,heart_disease,smoking_history,bmi,HbA1c_level,blood_glucose_level,diabetes) VALUES ('JACK','a123','Male',46,0,1,'non-smoker',25.5,4.7,90,0);
DELETE from pysliq_prediction where heart_disease=1;#Delete all patients with heart disease from the database.
SELECT Patient_id,hypertension,diabetes FROM pysliq_prediction where diabetes=0 and hypertension=1; #Find patients who have hypertension but not diabetes using the EXCEPT operator
ALTER TABLE pysliq_prediction ADD UNIQUE (Patient_id);#Define a unique constraint on the "patient_id" column to ensure its values are unique
CREATE VIEW predict AS  SELECT Patient_id, age, bmi from pysliq_prediction;#Create a view that displays the Patient_ids, ages, and BMI of patients
