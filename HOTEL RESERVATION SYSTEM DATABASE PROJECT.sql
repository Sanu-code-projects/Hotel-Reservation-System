-- =====================================================
-- HOTEL RESERVATION SYSTEM DATABASE PROJECT
-- B103 Databases & Big Data
-- =====================================================

-- CREATE DATABASE

CREATE DATABASE HotelReservationSystem;

USE HotelReservationSystem;
-- =====================================================
-- TABLE: RoomType
-- =====================================================

CREATE TABLE RoomType (

    RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,

    TypeName VARCHAR(50) NOT NULL UNIQUE,

    Capacity INT NOT NULL
    CHECK (Capacity > 0),

    PricePerNight DECIMAL(10,2) NOT NULL
    CHECK (PricePerNight > 0)

);
-- =====================================================
-- TABLE: Customer
-- =====================================================

CREATE TABLE Customer (

    CustomerID INT PRIMARY KEY AUTO_INCREMENT,

    FirstName VARCHAR(50) NOT NULL,

    LastName VARCHAR(50) NOT NULL,

    Email VARCHAR(100) NOT NULL UNIQUE,

    Phone VARCHAR(20) NOT NULL UNIQUE,

    Address VARCHAR(255)

);
-- =====================================================
-- TABLE: Room
-- =====================================================

CREATE TABLE Room (

    RoomID INT PRIMARY KEY AUTO_INCREMENT,

    RoomNumber VARCHAR(10) NOT NULL UNIQUE,

    RoomTypeID INT NOT NULL,

    FloorNumber INT NOT NULL
    CHECK (FloorNumber > 0),

    Status ENUM(
        'Available',
        'Occupied',
        'Maintenance'
    ) DEFAULT 'Available',

    FOREIGN KEY (RoomTypeID)
    REFERENCES RoomType(RoomTypeID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
-- =====================================================
-- TABLE: StaffRole
-- =====================================================

CREATE TABLE StaffRole (

    RoleID INT PRIMARY KEY AUTO_INCREMENT,

    RoleName VARCHAR(50) NOT NULL UNIQUE

);

-- =====================================================
-- TABLE: Staff
-- =====================================================

CREATE TABLE Staff (

    StaffID INT PRIMARY KEY AUTO_INCREMENT,

    FirstName VARCHAR(50) NOT NULL,

    LastName VARCHAR(50) NOT NULL,

    RoleID INT NOT NULL,

    Salary DECIMAL(10,2)
    CHECK (Salary >= 0),

    FOREIGN KEY (RoleID)
    REFERENCES StaffRole(RoleID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
-- =====================================================
-- TABLE: Reservation
-- =====================================================

CREATE TABLE Reservation (

    ReservationID INT PRIMARY KEY AUTO_INCREMENT,

    CustomerID INT NOT NULL,

    RoomID INT NOT NULL,

    CheckInDate DATE NOT NULL,

    CheckOutDate DATE NOT NULL,

    ReservationDate DATE NOT NULL,

    Status ENUM(
        'Confirmed',
        'Checked-In',
        'Completed',
        'Cancelled'
    ) DEFAULT 'Confirmed',

    CHECK (CheckOutDate > CheckInDate),

    CHECK (ReservationDate <= CheckInDate),

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (RoomID)
    REFERENCES Room(RoomID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
-- =====================================================
-- TABLE: Payment
-- =====================================================

CREATE TABLE Payment (

    PaymentID INT PRIMARY KEY AUTO_INCREMENT,

    ReservationID INT NOT NULL,

    Amount DECIMAL(10,2) NOT NULL
    CHECK (Amount > 0),

    PaymentDate DATE NOT NULL,

    PaymentMethod ENUM(
        'Cash',
        'Card',
        'Bank Transfer'
    ) NOT NULL,

    FOREIGN KEY (ReservationID)
    REFERENCES Reservation(ReservationID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
-- =====================================================
-- TABLE: Service
-- =====================================================

CREATE TABLE Service (

    ServiceID INT PRIMARY KEY AUTO_INCREMENT,

    ServiceName VARCHAR(100) NOT NULL UNIQUE,

    Price DECIMAL(10,2) NOT NULL
    CHECK (Price > 0)

);
-- =====================================================
-- TABLE: ReservationService
-- =====================================================

CREATE TABLE ReservationService (

    ReservationID INT,

    ServiceID INT,

    Quantity INT NOT NULL DEFAULT 1
    CHECK (Quantity > 0),

    PRIMARY KEY (ReservationID, ServiceID),

    FOREIGN KEY (ReservationID)
    REFERENCES Reservation(ReservationID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (ServiceID)
    REFERENCES Service(ServiceID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);
-- =====================================================
-- INSERT DATA INTO RoomType
-- =====================================================

INSERT INTO RoomType
(TypeName, Capacity, PricePerNight)

VALUES

('Standard', 2, 100),

('Deluxe', 3, 180),

('Suite', 5, 350);
-- =====================================================
-- INSERT DATA INTO Customer
-- =====================================================

INSERT INTO Customer
(FirstName, LastName, Email, Phone, Address)

VALUES

('Ali', 'Khan',
'ali@gmail.com',
'03001112222',
'Lahore'),

('Sara', 'Ahmed',
'sara@gmail.com',
'03002223333',
'Karachi'),

('John', 'Smith',
'john@gmail.com',
'03003334444',
'Islamabad');
-- =====================================================
-- INSERT DATA INTO Room
-- =====================================================

INSERT INTO Room
(RoomNumber, RoomTypeID, FloorNumber, Status)

VALUES

('101', 1, 1, 'Available'),

('102', 1, 1, 'Occupied'),

('201', 2, 2, 'Available'),

('301', 3, 3, 'Available');
-- =====================================================
-- INSERT DATA INTO StaffRole
-- =====================================================

INSERT INTO StaffRole
(RoleName)

VALUES

('Manager'),

('Receptionist'),

('Cleaner');
-- =====================================================
-- INSERT DATA INTO Staff
-- =====================================================

INSERT INTO Staff
(FirstName, LastName, RoleID, Salary)

VALUES

('Ahmed', 'Raza', 1, 70000),

('Usman', 'Ali', 2, 40000),

('Fatima', 'Noor', 3, 30000);
-- =====================================================
-- INSERT DATA INTO Reservation
-- =====================================================

INSERT INTO Reservation
(
CustomerID,
RoomID,
CheckInDate,
CheckOutDate,
ReservationDate,
Status
)

VALUES

(
1,
1,
'2025-07-01',
'2025-07-05',
'2025-06-20',
'Completed'
),

(
2,
3,
'2025-07-10',
'2025-07-15',
'2025-07-01',
'Confirmed'
),

(
3,
4,
'2025-08-01',
'2025-08-06',
'2025-07-15',
'Checked-In'
);
-- =====================================================
-- INSERT DATA INTO Payment
-- =====================================================

INSERT INTO Payment
(
ReservationID,
Amount,
PaymentDate,
PaymentMethod
)

VALUES

(
1,
400,
'2025-07-05',
'Card'
),

(
2,
900,
'2025-07-01',
'Cash'
),

(
3,
1750,
'2025-08-01',
'Bank Transfer'
);

-- =====================================================
-- INSERT DATA INTO Service
-- =====================================================

INSERT INTO Service
(ServiceName, Price)

VALUES

('Laundry', 20),

('Spa', 50),

('Room Service', 30);
-- =====================================================
-- INSERT DATA INTO ReservationService
-- =====================================================

INSERT INTO ReservationService
(ReservationID, ServiceID, Quantity)

VALUES

(1, 1, 2),

(1, 2, 1),

(2, 3, 3);
-- =====================================================
-- CRUD OPERATIONS
-- =====================================================

-- CREATE

INSERT INTO Customer
(
FirstName,
LastName,
Email,
Phone,
Address
)

VALUES

(
'Bilal',
'Ahmed',
'bilal@gmail.com',
'03005556666',
'Multan'
);

-- READ

SELECT * FROM Customer;

-- UPDATE

UPDATE Customer

SET Address = 'Rawalpindi'

WHERE CustomerID = 1;

-- DELETE

DELETE FROM Customer

WHERE CustomerID = 4;
-- =====================================================
-- QUERY: RESERVATION DETAILS
-- =====================================================

SELECT

r.ReservationID,

c.FirstName,
c.LastName,

rm.RoomNumber,

r.CheckInDate,
r.CheckOutDate,

r.Status

FROM Reservation r

JOIN Customer c
ON r.CustomerID = c.CustomerID

JOIN Room rm
ON r.RoomID = rm.RoomID;
-- =====================================================
-- QUERY: TOTAL BOOKINGS PER CUSTOMER
-- =====================================================

SELECT

c.FirstName,
c.LastName,

COUNT(r.ReservationID)
AS TotalBookings

FROM Customer c

LEFT JOIN Reservation r
ON c.CustomerID = r.CustomerID

GROUP BY c.CustomerID;
-- =====================================================
-- QUERY: TOTAL HOTEL REVENUE
-- =====================================================

SELECT

SUM(Amount)
AS TotalRevenue

FROM Payment;
-- =====================================================
-- QUERY: REVENUE BY PAYMENT METHOD
-- =====================================================

SELECT

PaymentMethod,

SUM(Amount)
AS Revenue

FROM Payment

GROUP BY PaymentMethod;
-- =====================================================
-- QUERY: MOST BOOKED ROOM
-- =====================================================

SELECT

rm.RoomNumber,

COUNT(r.ReservationID)
AS TotalBookings

FROM Room rm

JOIN Reservation r
ON rm.RoomID = r.RoomID

GROUP BY rm.RoomNumber

ORDER BY TotalBookings DESC;
-- =====================================================
-- QUERY: AVAILABLE ROOMS
-- =====================================================

SELECT *

FROM Room

WHERE Status = 'Available';
-- =====================================================
-- QUERY: CUSTOMERS WITH MULTIPLE BOOKINGS
-- =====================================================

SELECT

CustomerID,

COUNT(*)
AS Reservations

FROM Reservation

GROUP BY CustomerID

HAVING COUNT(*) > 1;
-- =====================================================
-- QUERY: PAYMENT DETAILS
-- =====================================================

SELECT

r.ReservationID,

c.FirstName,

p.Amount,

p.PaymentMethod

FROM Reservation r

JOIN Customer c
ON r.CustomerID = c.CustomerID

JOIN Payment p
ON r.ReservationID = p.ReservationID;
-- =====================================================
-- QUERY: TOTAL ROOMS BY TYPE
-- =====================================================

SELECT

rt.TypeName,

COUNT(r.RoomID)
AS TotalRooms

FROM RoomType rt

LEFT JOIN Room r
ON rt.RoomTypeID = r.RoomTypeID

GROUP BY rt.TypeName;
-- =====================================================
-- QUERY: SERVICES USED BY CUSTOMERS
-- =====================================================

SELECT

c.FirstName,

s.ServiceName,

rs.Quantity

FROM Customer c

JOIN Reservation r
ON c.CustomerID = r.CustomerID

JOIN ReservationService rs
ON r.ReservationID = rs.ReservationID

JOIN Service s
ON rs.ServiceID = s.ServiceID;
-- =====================================================
-- QUERY: HIGHEST SPENDING CUSTOMER
-- =====================================================

SELECT

c.FirstName,
c.LastName,

SUM(p.Amount)
AS TotalSpent

FROM Customer c

JOIN Reservation r
ON c.CustomerID = r.CustomerID

JOIN Payment p
ON r.ReservationID = p.ReservationID

GROUP BY c.CustomerID

ORDER BY TotalSpent DESC;
-- =====================================================
-- QUERY: MOST POPULAR SERVICE
-- =====================================================

SELECT

s.ServiceName,

SUM(rs.Quantity)
AS TimesUsed

FROM Service s

JOIN ReservationService rs
ON s.ServiceID = rs.ServiceID

GROUP BY s.ServiceID

ORDER BY TimesUsed DESC;
-- =====================================================
-- QUERY: AVAILABLE ROOMS BY TYPE
-- =====================================================

SELECT

rt.TypeName,

COUNT(r.RoomID)
AS AvailableRooms

FROM RoomType rt

JOIN Room r
ON rt.RoomTypeID = r.RoomTypeID

WHERE r.Status = 'Available'

GROUP BY rt.TypeName;
-- =====================================================
-- CREATE INDEXES
-- =====================================================

CREATE INDEX idx_customer_email
ON Customer(Email);

CREATE INDEX idx_room_status
ON Room(Status);

CREATE INDEX idx_payment_date
ON Payment(PaymentDate);
-- =====================================================
-- CREATE VIEW
-- =====================================================

CREATE VIEW ReservationSummary AS

SELECT

r.ReservationID,

c.FirstName,

c.LastName,

rm.RoomNumber,

r.CheckInDate,

r.CheckOutDate,

r.Status

FROM Reservation r

JOIN Customer c
ON r.CustomerID = c.CustomerID

JOIN Room rm
ON r.RoomID = rm.RoomID;
-- =====================================================
-- DISPLAY VIEW
-- =====================================================

SELECT * FROM ReservationSummary;