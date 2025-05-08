-- Clinic Booking System Database

-- Create Database
CREATE DATABASE clinic_booking_system;

-- Creating Tables
USE clinic_booking_system;

-- USERS TABLE: General user info (can be a doctor or patient)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    user_type ENUM('doctor', 'patient') NOT NULL
);

-- DOCTORS TABLE: One-to-one with Users
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Users(user_id)
);

-- PATIENTS TABLE: One-to-one with Users
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other'),
    FOREIGN KEY (patient_id) REFERENCES Users(user_id)
);

-- APPOINTMENTS TABLE: Many-to-One (Patient to Doctor)
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- PRESCRIPTIONS TABLE: One-to-Many from Appointment
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication TEXT NOT NULL,
    dosage VARCHAR(50),
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Adding Sample data 

-- Sample users (2 doctors, 2 patients)
INSERT INTO Users (full_name, email, phone, user_type) VALUES
('Dr. Lisa Moyo', 'lisa.moyo@clinic.com', '0771122334', 'doctor'),
('Dr. Tawanda Ncube', 'tawanda.ncube@clinic.com', '0773344556', 'doctor'),
('Faith Dube', 'faith.dube@example.com', '0775566778', 'patient'),
('John Chikore', 'john.chikore@example.com', '0779988776', 'patient');

-- Assume doctor_id matches Users.user_id (1 and 2)
INSERT INTO Doctors (doctor_id, specialization, license_number) VALUES
(1, 'General Practitioner', 'DOC-ZW-1001'),
(2, 'Pediatrics', 'DOC-ZW-1002');

-- Assume patient_id matches Users.user_id (3 and 4)
INSERT INTO Patients (patient_id, date_of_birth, gender) VALUES
(3, '1990-05-15', 'female'),
(4, '1988-11-30', 'male');

-- Appointments between patients and doctors
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(3, 1, '2025-05-10 09:00:00', 'scheduled'),
(4, 2, '2025-05-11 10:30:00', 'scheduled');

-- Linked to appointments
INSERT INTO Prescriptions (appointment_id, medication, dosage, instructions) VALUES
(1, 'Paracetamol', '500mg', 'Take 1 tablet every 8 hours after meals'),
(2, 'Cough Syrup', '10ml', 'Twice daily for 5 days');





