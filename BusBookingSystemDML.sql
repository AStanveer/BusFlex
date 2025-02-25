-- Insert Data

-- staff table
INSERT INTO STAFF (StaffID, StaffName, ContactNo, StaffPassword)
VALUES ('S001', 'Ali Ibrahim', '0123456789', 'password123');

INSERT INTO STAFF (StaffID, StaffName, ContactNo, StaffPassword)
VALUES ('S002', 'Noraini Binti Ahmad', '0198765432', 'mypassword');

INSERT INTO STAFF (StaffID, StaffName, ContactNo, StaffPassword)
VALUES ('S003', 'Mohd Zaki Bin Salleh', '0182345678', 'securepass');



-- driver table

INSERT INTO DRIVER (StaffID, LicenseType, ExperienceYears, LicenseExpireDate)
VALUES ('S001', 'Class D', 5, '2027-12-31');

INSERT INTO DRIVER (StaffID, LicenseType, ExperienceYears, LicenseExpireDate)
VALUES ('S002', 'Class E', 3, '2025-06-30');

INSERT INTO DRIVER (StaffID, LicenseType, ExperienceYears, LicenseExpireDate)
VALUES ('S003', 'Class D', 6, '2026-11-01');



-- admin table
INSERT INTO ADMIN (StaffID, Department, Role)
VALUES ('S001', 'Operations', 'Manager');

INSERT INTO ADMIN (StaffID, Department, Role)
VALUES ('S002', 'HR', 'Assistant');

INSERT INTO ADMIN (StaffID, Department, Role)
VALUES ('S003', 'Sales', 'Supervisor');

-- customer table
INSERT INTO CUSTOMER (CustomerID, CustName, Password, Email, SecurityQues, SecurityAns, Age, Gender, Address, CustPhone, CustType, DiscountRate)
VALUES ('C001', 'Aisyah Binti Abdullah', 'pass1234', 'aisyah@example.com', 'Mother\'s maiden name', 'Salmah', 22, 'F', 'Jalan Bukit Indah, Johor Bahru 81300', '0129876543', 'Regular', 0.10);

INSERT INTO CUSTOMER (CustomerID, CustName, Password, Email, SecurityQues, SecurityAns, Age, Gender, Address, CustPhone, CustType, DiscountRate)
VALUES ('C002', 'John Tan', 'mypassword', 'john@example.com', 'First pet\'s name', 'Buddy', 30, 'M', 'Taman Johor Jaya, Johor Bahru 81300', '0135678923', 'VIP', 0.15);

INSERT INTO CUSTOMER (CustomerID, CustName, Password, Email, SecurityQues, SecurityAns, Age, Gender, Address, CustPhone, CustType, DiscountRate)
VALUES ('C003', 'Rina Mohamed', 'securepass', 'rina@example.com', 'Favourite teacher', 'Mr. Lim', 25, 'F', 'Jalan Setia, Johor Bahru 81300', '0162345789', 'Regular', 0.05);



-- bus table
-- Increase the size of the Model column to 50 characters
ALTER TABLE BUS MODIFY COLUMN Model VARCHAR(50);

-- Increase the size of the Availability column to 15 characters
ALTER TABLE BUS MODIFY COLUMN Availability VARCHAR(15);
INSERT INTO BUS (BusID, StaffID, Model, SeatCapacity, BookingPrice, Availability)
VALUES ('B001', 'S001', 'RapidKL', 15, 100.00, 'Available');

INSERT INTO BUS (BusID, StaffID, Model, SeatCapacity, BookingPrice, Availability)
VALUES ('B002', 'S002', 'GoKL', 20, 120.00, 'Unavailable');

INSERT INTO BUS (BusID, StaffID, Model, SeatCapacity, BookingPrice, Availability)
VALUES ('B003', 'S003', 'Penang Bus Service', 12, 80.00, 'Available');



-- booking table
INSERT INTO BOOKING (BookingID, CustomerID, BusID, StaffID, BookingDate, PickUpLocation, DropOffLocation, NumOfPassengers, TotalPrice, Status)
VALUES ('B001', 'C001', 'B001', 'S001', '2025-01-10', 'Johor Bahru 81300', 'Kuala Lumpur', 2, 150.00, 'Confirmed');

INSERT INTO BOOKING (BookingID, CustomerID, BusID, StaffID, BookingDate, PickUpLocation, DropOffLocation, NumOfPassengers, TotalPrice, Status)
VALUES ('B002', 'C002', 'B002', 'S002', '2025-01-11', 'Johor Bahru 81300', 'Penang', 1, 100.00, 'Pending');

INSERT INTO BOOKING (BookingID, CustomerID, BusID, StaffID, BookingDate, PickUpLocation, DropOffLocation, NumOfPassengers, TotalPrice, Status)
VALUES ('B003', 'C001', 'B003', 'S003', '2025-01-12', 'Johor Bahru 81300', 'Kuala Lumpur', 3, 180.00, 'Cancelled');

-- notification table
INSERT INTO NOTIFICATION (NotiID, BookingID, Message)
VALUES ('N001', 'B001', 'Your booking is confirmed for 2025-01-10.');

INSERT INTO NOTIFICATION (NotiID, BookingID, Message)
VALUES ('N002', 'B002', 'Your booking is pending approval.');

INSERT INTO NOTIFICATION (NotiID, BookingID, Message)
VALUES ('N003', 'B003', 'Your booking has been cancelled due to unavailability.');

-- payment table
ALTER TABLE PAYMENT MODIFY COLUMN PaymentMethod VARCHAR(50);

INSERT INTO PAYMENT (PaymentID, BookingID, PaymentMethod, PaymentAmount, PaymentDate, PaymentStatus)
VALUES ('P001', 'B001', 'Credit Card', 150.00, '2025-01-10', 'Completed');

INSERT INTO PAYMENT (PaymentID, BookingID, PaymentMethod, PaymentAmount, PaymentDate, PaymentStatus)
VALUES ('P002', 'B002', 'Cash', 100.00, '2025-01-11', 'Pending');

INSERT INTO PAYMENT (PaymentID, BookingID, PaymentMethod, PaymentAmount, PaymentDate, PaymentStatus)
VALUES ('P003', 'B003', 'Credit Card', 180.00, '2025-01-12', 'Cancelled');

-- card payment table
-- alterations
ALTER TABLE CARDPAYMENT MODIFY COLUMN CardNumber BIGINT;

-- insertion
INSERT INTO CARDPAYMENT (PaymentID, CardNumber, ExpiryDate, CVV)
VALUES ('P001', 1234567890123456, '2027-12-31', 123);

INSERT INTO CARDPAYMENT (PaymentID, CardNumber, ExpiryDate, CVV)
VALUES ('P002', 2345678901234567, '2026-06-30', 456);

INSERT INTO CARDPAYMENT (PaymentID, CardNumber, ExpiryDate, CVV)
VALUES ('P003', 3456789012345678, '2025-01-15', 789);


-- cash payment table
INSERT INTO CASHPAYMENT (PaymentID, ReceiptNumber)
VALUES ('P001', 10001);

INSERT INTO CASHPAYMENT (PaymentID, ReceiptNumber)
VALUES ('P002', 10002);

INSERT INTO CASHPAYMENT (PaymentID, ReceiptNumber)
VALUES ('P003', 10003);



-- Updating 
-- staf table 
-- update
UPDATE STAFF
SET StaffPassword = 'newpassword123'
WHERE StaffID = 'S002';


-- driver table
UPDATE DRIVER
SET ExperienceYears = 7
WHERE StaffID = 'S001';


-- admin table
UPDATE ADMIN
SET Role = 'Senior Manager'
WHERE StaffID = 'S001';

-- customer table
UPDATE CUSTOMER
SET CustType = 'Premium', DiscountRate = 0.20
WHERE CustomerID = 'C002';



-- bus table
UPDATE BUS
SET Availability = 'Available'
WHERE BusID = 'B002';


-- booking table
-- mark booking as completed
UPDATE BOOKING
SET Status = 'Completed'
WHERE BookingID = 'B001';

-- cancelling a booking
UPDATE BOOKING
SET Status = 'Cancelled'
WHERE BookingID = 'B001';


-- notification table
UPDATE NOTIFICATION
SET Message = 'Your booking has been confirmed and payment received.'
WHERE NotiID = 'N001';

-- update notification when for booking cancellation
UPDATE NOTIFICATION
SET Message = 'Your booking has been cancelled.'
WHERE NotiID = 'N001';



-- payment table
UPDATE PAYMENT
SET PaymentStatus = 'Completed'
WHERE PaymentID = 'P002';

-- change payment method to card for B002
UPDATE PAYMENT
SET PaymentMethod = 'Credit Card'
WHERE BookingID = 'B002';  


-- card payment table
UPDATE CARDPAYMENT
SET ExpiryDate = '2028-12-31'
WHERE PaymentID = 'P001';


-- cash payment table
UPDATE CASHPAYMENT
SET ReceiptNumber = 10004
WHERE PaymentID = 'P002';


-- income analysis table
UPDATE INCOMEANALYSIS
SET TotalIncome = 120000.00
WHERE AnalysisID = 'A003';


-- deleting a booking when B001 gets cancelled
-- deleting the booking record
DELETE FROM BOOKING
WHERE BookingID = 'B001'; 

-- deleting the associated payment record for the canceled booking
DELETE FROM CARDPAYMENT
WHERE PaymentID = 'P001';  
-- deleting the related notification message indicating booking confirmation
DELETE FROM NOTIFICATION
WHERE BookingID = 'B001';  