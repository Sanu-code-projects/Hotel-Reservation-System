# Hotel Reservation System

## Project Overview

The Hotel Reservation System is a relational database project created with MySQL Workbench to be able to operate the Hotel Efficiently. The system will be used to store and manage customer information, room types, rooms, reservations, payments, hotel services, information about staff members and their roles.

The project illustrates the concepts of database design, normalization, enforcing data integrity, CRUD operations, data manipulation with advanced SQL queries, index usage, and the creation of views. The system produces meaningful reports and business insights required in the management of the hotel.


---

## Project Objectives

The objectives of this project are:

* Design a normalized relational database schema.
* Establish relationships using Primary Keys and Foreign Keys.
* Apply constraints to ensure data integrity.
* Implement CRUD operations.
* Execute advanced SQL queries.
* Generate analytical reports.
* Optimize query performance using indexes.
* Create database views for efficient reporting.

---

## Technologies Used

* MySQL Server 8.0
* MySQL Workbench
* SQL
* Entity Relationship Diagram (ERD)

---

## How to Run the Project

1. Open MySQL Workbench.
2. Create a new SQL script.
3. Copy the contents of HotelReservationSystem.sql.
4. Execute the script.
5. Refresh Schemas.
6. Open the HotelReservationSystem database.
7. Run the provided queries.
8. View outputs and reports.

---

## Database Name

HotelReservationSystem

---

## Database Tables

The database consists of nine tables.

### 1. RoomType

Stores room categories.

**Attributes**

* RoomTypeID
* TypeName
* Capacity
* PricePerNight

### 2. Customer

Stores customer information.

**Attributes**

* CustomerID
* FirstName
* LastName
* Email
* Phone
* Address

### 3. Room

Stores room details.

**Attributes**

* RoomID
* RoomNumber
* RoomTypeID
* FloorNumber
* Status

### 4. StaffRole

Stores employee roles.

**Attributes**

* RoleID
* RoleName

### 5. Staff

Stores employee information.

**Attributes**

* StaffID
* FirstName
* LastName
* RoleID
* Salary

### 6. Reservation

Stores booking information.

**Attributes**

* ReservationID
* CustomerID
* RoomID
* CheckInDate
* CheckOutDate
* ReservationDate
* Status

### 7. Payment

Stores payment details.

**Attributes**

* PaymentID
* ReservationID
* Amount
* PaymentDate
* PaymentMethod

### 8. Service

Stores hotel services.

**Attributes**

* ServiceID
* ServiceName
* Price

### 9. ReservationService

Bridge table for many-to-many relationships.

**Attributes**

* ReservationID
* ServiceID
* Quantity

---

## Database Constraints

The following constraints have been implemented.

### Primary Keys

Implemented in all tables.

Examples:

* CustomerID
* RoomID
* ReservationID
* PaymentID

### Foreign Keys

Relationships established include:

* Reservation → Customer
* Reservation → Room
* Payment → Reservation
* Staff → StaffRole
* ReservationService → Reservation
* ReservationService → Service

### Other Constraints

Implemented constraints include:

* NOT NULL
* UNIQUE
* CHECK
* DEFAULT
* ENUM

Examples:

* Email UNIQUE
* Phone UNIQUE
* Price > 0
* Capacity > 0
* Available room status
* Payment methods validation
* Reservation status validation

---

## Sample Data

Sample records were inserted into all tables.

Examples include:

* Customers
* Rooms
* Reservations
* Payments
* Services
* Staff Members
* Room Categories
* Staff Roles
* Reservation Services

---

## CRUD Operations

CRUD operations were implemented and tested.

### Create

Insert a new customer.

Example:

* Bilal Ahmed

### Read

Retrieve customer records.

```sql
SELECT * FROM Customer;
```

### Update

Update customer address.

Example:

* Rawalpindi

### Delete

Delete customer record.

Example:

* CustomerID = 4

---

## SQL Queries Implemented

### Reservation Details Query

Displays:

* Customer Names
* Room Numbers
* Booking Dates
* Reservation Status

### Payment Details Query

Displays:

* Payment Amount
* Payment Method
* Customer Information

### Total Hotel Revenue

Uses:

* SUM()

Result:

* 3050

### Revenue by Payment Method

Uses:

* GROUP BY
* SUM()

Methods:

* Cash
* Card
* Bank Transfer

### Total Bookings per Customer

Uses:

* COUNT()
* GROUP BY

### Customers with Multiple Reservations

Uses:

* HAVING Clause
* COUNT()

### Most Booked Room

Uses:

* ORDER BY
* COUNT()

### Available Rooms Query

Displays:

* Rooms having Available status

### Total Rooms by Type

Uses:

* GROUP BY

### Services Used by Customers

Uses multiple JOIN statements.

Displays:

* Customer Name
* Service Name
* Quantity

### Highest Spending Customer

Uses:

* SUM()
* ORDER BY DESC

Result:

* John Smith
* Total Spent = 1750

### Most Popular Service

Uses:

* SUM()
* GROUP BY

Result:

* Room Service

### Available Rooms by Type

Displays room availability according to room categories.

---

## Indexing

Indexes were created to improve query performance.

Indexes include:

* idx_customer_email
* idx_room_status
* idx_payment_date

---

## Database View

### View Name

ReservationSummary

### Purpose

Provides simplified reservation reports.

### Displays

* ReservationID
* Customer Name
* Room Number
* Check-in Date
* Check-out Date
* Reservation Status

---

## Entity Relationship Diagram

The project includes an ERD created in MySQL Workbench.

The ERD illustrates:

* Entity Relationships
* Primary Keys
* Foreign Keys
* Cardinality
* Many-to-Many Relationships

---

## Database Optimization Techniques

Implemented techniques include:

* Normalization
* Indexes
* Constraints
* Views
* Efficient JOIN Operations

---

## Query Outputs

The project contains screenshots demonstrating:

* CRUD Operations
* Reservation Details
* Payment Details
* Revenue Reports
* Availability Reports
* Service Analysis
* Customer Analysis
* Views
* Indexes
* ERD
* Database Schema

---

## Challenges Encountered

Challenges included:

* Designing normalized tables
* Managing many-to-many relationships
* Writing complex JOIN queries
* Implementing constraints
* Optimizing queries
* Creating the ERD

---

## Future Enhancements

Potential improvements include:

* Stored Procedures
* Triggers
* User Authentication
* Online Booking System
* Payment Gateway Integration
* Web Application Integration
* Real-time Reservation Tracking

---

## Author

Module: B103 Databases & Big Data

Project: Hotel Reservation System

Developed using MySQL Workbench and SQL.
