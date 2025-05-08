# 🏥 Clinic Booking System (MySQL)

## 📋 Description
This project is a fully functional database management system designed to manage the core operations of a clinic. It includes data structures and relationships for users (doctors and patients), appointments, and prescriptions. Built using only MySQL, it enforces proper relational constraints and integrity.

## ✨ Features
- User records with role distinction (`doctor` or `patient`)
- One-to-one relationships between users and their specific roles
- Scheduling of appointments with status tracking
- Prescription management linked to appointments

## 🗂️ Database Schema
The system consists of
The system consists of the following main entities:
- **Users**
- **Doctors**
- **Patients**
- **Appointments**
- **Prescriptions**

Each table is created with appropriate primary keys, foreign keys, and constraints (NOT NULL, UNIQUE, ENUM, etc.).

## 🧩 ERD (Entity Relationship Diagram)
![ERD Screenshot](to be added)

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/clinic-booking-system.git

2. Open the clinic_booking_system.sql file in MySQL Workbench or any MySQL-compatible tool.


3. Run the SQL script to:

Create all necessary tables

Insert sample data



4. Verify with basic queries like:
   
```bash
SELECT * FROM Users;
SELECT * FROM Appointments;

```

## 🧪Sample Data Included

The SQL file contains preloaded data for:

- **2 doctors**

- **2 patients**

- **2 appointments**

- **2 prescriptions**


## 👩‍💻 Author

**Michelle Rufaro Samuriwo (Alora)**
