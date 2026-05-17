# Fitness Center Database System

A full-cycle relational database designed and implemented for a NYC personal training center. The system replaces a fragmented Excel/Google Calendar workflow with a normalized relational database and a functional MS Access application.

## Problem Statement

The fitness center had no centralized system. Trainers were being double-booked, members couldn't track their progress, and payment records were scattered across multiple tools. This project delivered a single, normalized database to manage 
members, trainers, appointments, subscriptions, payments, lockers, and fitness progress.

## My Contributions

- Requirements: identified information needs and defined entity scope  
- ER modeling: wrote relationship sentences and defined cardinalities for all 7 entities  
- Logical modeling & normalization: decomposed relations through BCNF, resolving a transitive dependency in the Member relation (ZipCode → City, State) via a Zip_Reference lookup table  
- SQL implementation: authored all DDL (CREATE TABLE, ALTER TABLE) and DML (INSERT)  
- Query design: wrote 6 analytical queries for business reporting  

## Database Schema

**Final set of relations (all in BCNF):**

- `Member` (MemberID PK, FirstName, LastName, StreetAddress, ZipCode FK, PhoneNumber, EmailAddress, RegistrationDate)  
- `Zip_Reference` (ZipCode PK, City, State)  
- `Subscription` (SubscriptionID PK, BeginningDate, EndDate, Status, Price, MemberID FK)  
- `Payment` (PaymentID PK, Amount, DueDate, Plan, Status, SubscriptionID FK)  
- `Trainers` (TrainerID PK, FirstName, LastName, CertificationLevel, HourlySalary)  
- `Appointment` (AppointmentID PK, StartDateTime, EndDateTime, MemberID FK, TrainerID FK)  
- `Progress` (ProgressID PK, BeginningWeight, BeginningBodyFat%, CurrentWeight, CurrentBodyFat%, DateRecorded, MemberID FK)  
- `Locker` (LockerID PK, RoomNumber, LockerNumber, MemberID FK)  

## Key Design Decisions

**Normalization:** The original Member relation had a transitive dependency — MemberID → ZipCode and ZipCode → City, State. This violates 3NF. The solution was to decompose into Member + Zip_Reference, bringing both to BCNF.

**Scheduling integrity:** The Appointment table enforces that each appointment belongs to exactly one member and one trainer, preventing double-booking at the database level via foreign key constraints.

## Sample Queries

- Active member roster with subscription status  
- Revenue per active member via Member ⟕ Subscription JOIN  
- Member fitness progress ranked by weight loss (descending)  
- Trainer directory sorted by certification level  

## Application Layer

Built in Microsoft Access:
- 5 data-entry forms with VBA event handlers (auto-ID generation, date automation, input validation)
- Navigation switchboard for non-technical staff
- 2 management reports: Member Progress and Trainer Directory

## Tech Stack

- SQL (MS Access dialect)
- Microsoft Access (forms, reports, VBA)
- LucidChart (ER diagramming)
