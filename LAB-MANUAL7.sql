USE Various;
SHOW TABLES;
SELECT *FROM Citizen;
SELECT *FROM Certificate_Type;
SELECT *FROM Certificate_Application;
SELECT *FROM Panchayat_Office;
 #PART - B
 CREATE VIEW All_Certificate_Applications AS
 SELECT*
 FROM Certificate_Application;
 
 SELECT *FROM All_Certificate_Applications;
 
 
 
 CREATE VIEW application_status_View AS
 SELECT application_id,citizen_id,application_status
 FROM Certificate_Application;
 
 SELECT * FROM application_status_view;
 
  CREATE VIEW Approved_Applications AS
 SELECT application_id,citizen_id,certificate_type_id,applicate_date
 FROM Certificate_Application
 WHERE application_status = 'approved';
 SELECT * FROM Approved_Applications;
 
 #task4
 SELECT * FROM Approved_Applications;
 
 #task5
 SHOW FULL TABLES
 WHERE Table_Type = 'VIEW';
 
 #level-2------------------------------------task-1
 
 CREATE VIEW Certificate_Date_View AS
 SELECT C.certificate_name,
		A.applicate_date
FROM Certificate_Application A
JOIN Certificate_Type C
 ON A.certificate_type_id = C.certificate_type_id;
 SELECT * FROM Certificate_Date_View;
 
 #task2
CREATE VIEW Citizen_status_View AS
 SELECT CI.full_name,
		A.application_status
FROM Certificate_Application A
JOIN Citizen CI
 ON A.citizen_id = CI.citizen_id;
 SELECT * FROM Citizen_status_View;

#TASK-3
CREATE VIEW Office_Applications_View AS
SELECT P.village_name,
		A.application_id,
        A.applicate_date,
        A.application_status
        
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = p.office_id;
SELECT *FROM Office_Applications_View;

#task4
CREATE VIEW Certificate_Application_Count_View AS
SELECT certificate_type_id,
	COUNT(*) AS total_applications
FROM Certificate_Application 
GROUP BY certificate_type_id;
SELECT *FROM Certificate_Application_Count_View;

#task-5
CREATE VIEW Office_Application_Count AS
SELECT office_id,
	COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id;

SELECT * FROM Office_Application_Count;

#task-6
CREATE VIEW Pending_Applications_View AS
SELECT C.certificate_name,
	A.application_id,
    A.applicate_date,
    A.application_status
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
WHERE A.application_status = 'pending';
SELECT * FROM Pending_Applications_View;

#task7
SELECT certificate_name,
	applicate_date
FROM Certificate_date_view
WHERE applicate_date >= '2025-01-01';


#task-8

SELECT *FROM Pending_Applications;
SELECT certificate_name FROM pending_Applications WHERE application_status = 'pending';
SHOW CREATE VIEW Pending_Applications_View;

#level-3-------------------------------------task1

CREATE VIEW Certificate_Name_Count_View AS
SELECT C.certificate_name,
	COUNT(A.application_id)AS
total_applications
FROM Certificate_Type C
JOIN Certificate_Application A
ON C.Certificate_type_id = A.Certificate_type_id
GROUP BY
C.certificate_type_id,C.certificate_name;
SELECT * FROM Certificate_Name_Count_View;

#task2
CREATE VIEW Offices_more_than_View AS
SELECT P.village_name,
	COUNT(A.application_id) AS
total_applications
FROM Panchayat_Office P
JOIN Certificate_Application A
ON P.office_id = A.office_id
GROUP BY P.office_id ,P.village_name
HAVING COUNT(A.application_id)>1;
SELECT * FROM Offices_more_than_View;

#task-3
CREATE VIEW Certificate_date_range_view AS
    SELECT C.Certificate_name,
    MIN(A.applicate_date) AS
earliest_date,
	MAX(A.applicate_date) AS
latest_date
FROM Certificate_type C
JOIN Certificate_Application A
ON C.certificate_type_id =A. certificate_type_id
GROUP BY C.certificate_name,C.certificate_type_id;
SELECT * FROM Certificate_date_range_view;

#task-4
CREATE VIEW Citizen_Application_Count_View AS
SELECT CI.full_name,
	COUNT(A.application_id)AS
total_applications
FROM Citizen CI
JOIN Certificate_Application A
ON CI.citizen_id = A.citizen_id
GROUP BY CI.citizen_id,CI.full_name;

SELECT * FROM 
Citizen_Application_Count_View;

#TASK-5
CREATE VIEW Citizen_Certificate_Application_View AS
SELECT CI.full_name,	
	C.certificate_name,
    A.application_id,
    A.applicate_date,
    A.application_status
FROM Certificate_Application A
JOIN Citizen CI
ON A.citizen_id = CI.citizen_id
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id;

SELECT * FROM
Citizen_Certificate_Application_View;


#task6
CREATE VIEW Approved_Details_View AS
SELECT A.application_id,
	CI.full_name,
    C.certificate_name,
    A.applicate_date,
    A.application_status
FROM Certificate_Application A
JOIN Citizen CI
ON A.citizen_id = CI.citizen_id
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
WHERE A.application_status = 'Approved';
SELECT *FROM Approved_Details_View;
