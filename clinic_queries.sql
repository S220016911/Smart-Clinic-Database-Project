-- Query 1: Retrieve all scheduled appointments
SELECT Appointment_ID, App_Date, App_Time 
FROM APPOINTMENT 
WHERE Status = 'Scheduled';

-- Query 2: List all medicines sorted by their names alphabetically
SELECT Med_Name, Dosage 
FROM MEDICINE 
ORDER BY Med_Name ASC;

-- Query 3: Find treatments that cost more than 200
SELECT Description, Cost 
FROM TREATMENT 
WHERE Cost > 200.00;

-- Query 4: Calculate the total revenue grouped by payment method
SELECT Pay_Method, SUM(Amount) AS Total_Revenue 
FROM PAYMENT 
GROUP BY Pay_Method;

-- Query 5: Join DOCTOR and APPOINTMENT to see which doctor has which appointment
SELECT DOCTOR.Specialization, DOCTOR.Room_Number, APPOINTMENT.App_Date, APPOINTMENT.Status 
FROM DOCTOR 
JOIN APPOINTMENT ON DOCTOR.Person_ID = APPOINTMENT.Doctor_ID;
-- Query 6: Nested Query to find patients with scheduled appointments
SELECT Fname, Lname 
FROM PERSON 
WHERE Person_ID IN (
    SELECT Patient_ID 
    FROM APPOINTMENT 
    WHERE Status = 'Scheduled'
);
-- Query 7: UPDATE Statement
UPDATE MEDICINE 
SET Dosage = '600mg' 
WHERE Med_Name = 'Panadol';
-- Query 8: DELETE Statement
DELETE FROM MEDICINE 
WHERE Med_Name = 'Vitamin C';
-- Query 9: Create a VIEW
CREATE VIEW Doctor_Info AS 
SELECT PERSON.Fname, PERSON.Lname, DOCTOR.Specialization 
FROM PERSON 
JOIN DOCTOR ON PERSON.Person_ID = DOCTOR.Person_ID;

-- Query 10: Create a TRIGGER
DELIMITER //
CREATE TRIGGER Prevent_Negative_Cost
BEFORE INSERT ON TREATMENT
FOR EACH ROW
BEGIN
    IF NEW.Cost < 0 THEN
        SET NEW.Cost = 0;
    END IF;
END; //
DELIMITER ;
