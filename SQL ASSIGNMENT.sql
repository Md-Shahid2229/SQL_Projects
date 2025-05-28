CREATE DATABASE SQL_Assign


CREATE TABLE Hospital(Hospital_Name VARCHAR(300),
Location VARCHAR(200),
Department VARCHAR(150),
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC);


SELECT * FROM Hospital;


ASSIGNMENT

1.Total Number of Patients
ANSWER: SELECT COUNT(Patients_count)
        FROM Hospital;



2.Average Number of Doctors per Hospital
ANSWER:  SELECT AVG(doctors_count)
         FROM Hospital;



3.Top 3 Departments with the Highest Number of Patients
ANSWER: SELECT department, SUM(patients_count) AS Highest_No_Patients
        FROM Hospital
        GROUP BY department, Patients_count
        ORDER BY Highest_No_Patients desc limit 3;

4.Hospital with the Maximum Medical Expenses
ANSWER: SELECT hospital_name, MAX(medical_expenses) as MAX_Medical_exp
        FROM hospital
        GROUP BY hospital_name

5.Daily Average Medical Expenses
ANSWER:  SELECT hospital_name, AVG(medical_expenses) AVG_Medi_exp
         from Hospital
         GROUP BY hospital_name;

6.Longest Hospital Stay
ANSWER:  SELECT *,
         (Discharge_Date - Admission_Date) AS Stay_Duration
         FROM hospital
         ORDER BY Stay_Duration DESC;


7.Total Patients Treated Per City
ANSWER:  SELECT location, 
         SUM(Patients_Count) AS Total_Patients
         FROM Hospital
         GROUP BY Location
         ORDER BY Total_Patients DESC;


8.Average Length of Stay Per Department
ANSWER:  SELECT Department,
         AVG(Discharge_Date - Admission_Date) AS Average_Stay_Duration
         FROM Hospital
         GROUP BY Department
         ORDER BY Average_Stay_Duration DESC;

9.Identify the Department with the Lowest Number of Patients
ANSWER:  SELECT department, SUM(patients_count) as lowest_paitents
         from hospital
         GROUP BY department
         order by lowest_paitents asc;



10.Monthly Medical Expenses Report
ANSWER:  SELECT TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
         SUM(Medical_Expenses) AS Total_Medical_Expenses
         FROM Hospital
         GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
         ORDER BY Month;





















