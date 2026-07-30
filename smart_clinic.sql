CREATE DATABASE smart_clinic;
USE smart_clinic;

CREATE TABLE PERSON (
    Person_ID VARCHAR(10) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) UNIQUE
);

CREATE TABLE DOCTOR (
    Person_ID VARCHAR(10) PRIMARY KEY,
    Specialization VARCHAR(50) NOT NULL,
    Room_Number VARCHAR(10),
    FOREIGN KEY (Person_ID) REFERENCES PERSON(Person_ID)
);

CREATE TABLE PATIENT (
    Person_ID VARCHAR(10) PRIMARY KEY,
    Blood_Type VARCHAR(5),
    Emergency_Contact VARCHAR(15),
    FOREIGN KEY (Person_ID) REFERENCES PERSON(Person_ID)
);

CREATE TABLE APPOINTMENT (
    Appointment_ID VARCHAR(10) PRIMARY KEY,
    App_Date DATE NOT NULL,
    App_Time TIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Doctor_ID VARCHAR(10),
    Patient_ID VARCHAR(10),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Person_ID),
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Person_ID)
);

CREATE TABLE TREATMENT (
    Treatment_ID VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(255) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Appointment_ID VARCHAR(10),
    FOREIGN KEY (Appointment_ID) REFERENCES APPOINTMENT(Appointment_ID)
);

CREATE TABLE MEDICINE (
    Medicine_ID VARCHAR(10) PRIMARY KEY,
    Med_Name VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL
);

CREATE TABLE PRESCRIPTION (
    Prescription_ID VARCHAR(10) PRIMARY KEY,
    Treatment_ID VARCHAR(10),
    Medicine_ID VARCHAR(10),
    FOREIGN KEY (Treatment_ID) REFERENCES TREATMENT(Treatment_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES MEDICINE(Medicine_ID)
);

CREATE TABLE PAYMENT (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Pay_Method VARCHAR(50) NOT NULL,
    Pay_Date DATE NOT NULL,
    Appointment_ID VARCHAR(10),
    FOREIGN KEY (Appointment_ID) REFERENCES APPOINTMENT(Appointment_ID)
);
INSERT INTO PERSON (Person_ID, Fname, Lname, Phone) VALUES
('D001', 'Hatem', 'Hassan', '0531950301'),
('D002', 'Abdullah', 'ALZamel', '0599260804'),
('D003', 'Turki', 'ALHarbi', '0599914804'),
('D004', 'Abdullah', 'ALZharani', '0564440504'),
('D005', 'Saad', 'baker', '0533345786'),
('P001', 'Khalid', 'Muqati', '0506105023'),
('P002', 'Saif', 'ALAnzi', '0555412789'),
('P003', 'Majed', 'ALDakhilallah', '0550554567'),
('P004', 'Osamah', 'Bassam', '0546789213'),
('P005', 'Sami', 'ALHarthi', '0559989790');

INSERT INTO DOCTOR (Person_ID, Specialization, Room_Number) VALUES
('D001', 'Dentistry', 'A-101'),
('D002', 'Surgeon', 'B-102'),
('D003', 'Cardiology', 'C-103'),
('D004', 'Neurology', 'D-104'),
('D005', 'Dermatology', 'E-105');

INSERT INTO PATIENT (Person_ID, Blood_Type, Emergency_Contact) VALUES
('P001', 'O+', '0597214369'),
('P002', 'A-', '0531957080'),
('P003', 'B+', '0551401301'),
('P004', 'AB+', '0502003005'),
('P005', 'O-', '05900800700');

INSERT INTO APPOINTMENT (Appointment_ID, App_Date, App_Time, Status, Doctor_ID, Patient_ID) VALUES
('A001', '2026-09-01', '10:00:00', 'Completed', 'D001', 'P001'),
('A002', '2026-09-02', '11:00:00', 'Scheduled', 'D002', 'P002'),
('A003', '2026-09-03', '12:00:00', 'Completed', 'D001', 'P003'),
('A004', '2026-09-04', '16:00:00', 'Cancelled', 'D003', 'P004'),
('A005', '2026-09-05', '17:00:00', 'Scheduled', 'D004', 'P005');

INSERT INTO TREATMENT (Treatment_ID, Description, Cost, Appointment_ID) VALUES
('T001', 'Heart Checkup', 600.00, 'A001'),
('T002', 'Skin Allergy Test', 400.00, 'A002'),
('T003', 'Blood Pressure Test', 300.00, 'A003'),
('T004', 'General Consultation', 200.00, 'A004'),
('T005', 'Nerve Examination', 100.00, 'A005');

INSERT INTO MEDICINE (Medicine_ID, Med_Name, Dosage) VALUES
('M001', 'Panadol ', '500mg'),
('M002', 'Loratadine', '30mg'),
('M003', 'Lisinopril', '40mg'),
('M004', 'Vitamin C', '500mg'),
('M005', 'Ibuprofen', '300mg');

INSERT INTO PRESCRIPTION (Prescription_ID, Treatment_ID, Medicine_ID) VALUES
('PR001', 'T001', 'M001'),
('PR002', 'T002', 'M002'),
('PR003', 'T003', 'M003'),
('PR004', 'T004', 'M004'),
('PR005', 'T005', 'M005');

INSERT INTO PAYMENT (Payment_ID, Amount, Pay_Method, Pay_Date, Appointment_ID) VALUES
('PA001', 600.00, 'Credit Card', '2026-08-01', 'A001'),
('PA002', 400.00, 'Samsung Pay', '2026-08-02', 'A002'),
('PA003', 300.00, 'Mada', '2026-08-03', 'A003'),
('PA004', 200.00, 'Google Pay', '2026-08-04', 'A004'),
('PA005', 100.00, 'Apple Pay', '2026-08-05', 'A005');


