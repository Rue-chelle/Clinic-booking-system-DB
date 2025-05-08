-- Clinic Booking System Database
-- Created for SQL Assignment - MySQL only

-- Drop tables if they exist to avoid duplication
DROP TABLE IF EXISTS Prescriptions, Appointments, Patients, Doctors, Users;

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
