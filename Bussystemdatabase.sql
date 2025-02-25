-- staff table
CREATE TABLE STAFF (
    StaffID VARCHAR(8) PRIMARY KEY,
    StaffName VARCHAR(60) NOT NULL,
    ContactNo VARCHAR(20),
    StaffPassword VARCHAR(15) NOT NULL
);

-- driver table
CREATE TABLE DRIVER (
    StaffID VARCHAR(8) PRIMARY KEY,
    LicenseType VARCHAR(20),
    ExperienceYears INT(2) NOT NULL,
    LicenseExpireDate DATE NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES STAFF(StaffID)
);

-- Admin table
CREATE TABLE ADMIN (
    StaffID VARCHAR(8) PRIMARY KEY,
    Department VARCHAR(20) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES STAFF(StaffID)
);

-- Customer Table
CREATE TABLE CUSTOMER (
    CustomerID VARCHAR(8) PRIMARY KEY,
    CustName VARCHAR(60) NOT NULL,
    Password VARCHAR(15) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    SecurityQues VARCHAR(50) NOT NULL,
    SecurityAns VARCHAR(10) NOT NULL,
    Age INT(3) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    CustPhone VARCHAR(20),
    CustType VARCHAR(20) NOT NULL,
    DiscountRate FLOAT(2,2) NOT NULL
);

-- Booking table 
CREATE TABLE BOOKING (
    BookingID VARCHAR(8) PRIMARY KEY,
    CustomerID VARCHAR(8) NOT NULL,
    BusID VARCHAR(8) NOT NULL,
    StaffID VARCHAR(8) NOT NULL,
    BookingDate DATE NOT NULL,
    PickUpLocation VARCHAR(50) NOT NULL,
    DropOffLocation VARCHAR(50) NOT NULL,
    NumOfPassengers INT(3) NOT NULL,
    TotalPrice DECIMAL(8,2) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (BusID) REFERENCES BUS(BusID),
    FOREIGN KEY (StaffID) REFERENCES STAFF(StaffID)
);

-- Notification Table
CREATE TABLE NOTIFICATION (
    NotiID VARCHAR(8) PRIMARY KEY,
    BookingID VARCHAR(8) NOT NULL,
    Message VARCHAR(100) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID)
);



-- Bus Table
CREATE TABLE BUS (
    BusID VARCHAR(8) PRIMARY KEY,
    StaffID VARCHAR(8) NOT NULL,
    Model VARCHAR(10) NOT NULL,
    SeatCapacity INT(2) NOT NULL,
    BookingPrice DECIMAL(8,2) NOT NULL,
    Availability VARCHAR(3) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES STAFF(StaffID)
);

-- payment table
CREATE TABLE PAYMENT (
    PaymentID VARCHAR(8) PRIMARY KEY,
    BookingID VARCHAR(8) NOT NULL,
    PaymentMethod VARCHAR(10) NOT NULL,
    PaymentAmount DECIMAL(8,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentStatus VARCHAR(10) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID)
);

-- Cardpayment Table
CREATE TABLE CARDPAYMENT (
    PaymentID VARCHAR(8) PRIMARY KEY,
    CardNumber INT(15) NOT NULL,
    ExpiryDate DATE NOT NULL,
    CVV INT(3) NOT NULL,
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

-- Cashoayment Table
CREATE TABLE CASHPAYMENT (
    PaymentID VARCHAR(8) PRIMARY KEY,
    ReceiptNumber INT(15) NOT NULL,
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

-- IncomeAnalysis table
CREATE TABLE INCOMEANALYSIS (
    AnalysisID VARCHAR(8) PRIMARY KEY,
    TotalIncome DECIMAL(8,2) NOT NULL,
    TotalExpenses DECIMAL(8,2) NOT NULL,
    Profit DECIMAL(8,2) GENERATED ALWAYS AS (TotalIncome - TotalExpenses) STORED
);





