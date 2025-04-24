create database deviceRental;
use deviceRental;

-- Device Table
CREATE TABLE Device (
  SerialNo VARCHAR(50) PRIMARY KEY,           -- Unique device serial number
  AssetNo VARCHAR(50),                        -- Asset tag/number for inventory tracking
  PONo VARCHAR(50),                           -- Purchase Order number
  DeliveryNo VARCHAR(50),                     -- Delivery note/reference
  DeviceType VARCHAR(50),                     -- e.g., Laptop, Tablet, Desktop
  isActive BOOLEAN,                           -- Is the device active in the system?
  isFunctional BOOLEAN,                       -- Is the device working correctly?
  isDamaged BOOLEAN,                          -- Has the device been damaged?
  ImageInfo TEXT,                             -- URL or description of the device image
  CurrentUser INT,                            -- FK: references StudentInfo or FacultyInfo
  LoginInfo TEXT,                             -- Login credentials or notes
  isLost BOOLEAN                              -- Is the device reported as lost?
);
-- FacultyInfo Table: Created by Lemikkos
CREATE TABLE FacultyInfo (
  FacultyID INT PRIMARY KEY,                -- Unique faculty ID
  FacultyFName VARCHAR(100) NOT NULL,         -- Faculty full name
  FacultyBal DECIMAL(6,2) DEFAULT 0.00,         -- Current balance
  AdminComments TEXT,                         -- Admin comments
  OutstandingBal DECIMAL(6,2) DEFAULT 0.00,     -- Overdue amount
  numDamages INT DEFAULT 0,                     -- Number of reported damages
  canRent BOOLEAN NOT NULL DEFAULT TRUE,        -- Renting eligibility status
  currentDevice VARCHAR(50)                     -- FK: Device SerialNo currently assigned
);
-- Overdue_SecurityTracking Table: Created by Brandon
CREATE TABLE Overdue_SecurityTracking (
  TrackingID INT PRIMARY KEY,               -- Unique tracking record ID
  UserID INT,                               -- FK: refers to StudentInfo (or FacultyInfo)
  DeviceID VARCHAR(50),                     -- FK: Device.SerialNo
  IssueReported TEXT,                       -- Description of the issue (e.g., overdue, damage)
  DateReported DATE,                        -- When the issue was reported
  Resolved BOOLEAN,                         -- Has the issue been resolved?
  FOREIGN KEY (DeviceID) REFERENCES Device(SerialNo)
);
-- Payments Table: Created by Karrington
CREATE TABLE Payments (
  PaymentID INT PRIMARY KEY,                -- Unique payment ID
  PaymentLoc VARCHAR(100),                  -- Location where payment was made
  UserID INT,                               -- FK: Refers to StudentInfo or FacultyInfo
  DeviceID VARCHAR(50),                     -- FK: Device.SerialNo
  PaymentDate DATE,                         -- Date of payment
  PaymentTime TIME,                         -- Time of payment
  TotalPaid DECIMAL(6,2),                   -- Amount paid
  RemainingBal DECIMAL(6,2),                -- Balance remaining
  FOREIGN KEY (DeviceID) REFERENCES Device(SerialNo)
);
-- Rentals Table: Created by Sarah (Fixed error)
CREATE TABLE Rentals (
  RentalNum INT PRIMARY KEY,                -- Unique rental record number
  RentalType VARCHAR(50),                   -- Type (Short-term, Long-term, etc.)
  RentalDate DATE,                          -- Date when rental began
  RentalTime TIME,                          -- Time of rental start
  RentalDue DATE,                           -- Due date for return
  DeviceID VARCHAR(50),                     -- FK: Device.SerialNo
  StudentID INT,                            -- FK: StudentInfo.StudentID

  FOREIGN KEY (DeviceID) REFERENCES Device(SerialNo),
  FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
);
-- StudentInfo Table: Created by Kendall
CREATE TABLE StudentInfo (
  StudentID INT PRIMARY KEY,                -- Unique student ID
  FirstName VARCHAR(50) NOT NULL,           --First name of Student
  LastName VARCHAR(50) NOT NULL,            --Last name of Student
  StudentBal DECIMAL(6,2) DEFAULT 0.00,         -- Current account balance
  AdminComments TEXT,                         -- Comments by admin
  OutstandingBal DECIMAL(6,2) DEFAULT 0.00,     -- Overdue amount
  isRegistered BOOLEAN NOT NULL DEFAULT TRUE,   -- Registration status
  isAttending BOOLEAN NOT NULL DEFAULT TRUE,    -- Active attendance
  numDamages INT DEFAULT 0,                     -- Count of damaged returns
  canRent BOOLEAN NOT NULL DEFAULT TRUE,        -- Renting eligibility
  currentDevice VARCHAR(50)                     -- FK: Device SerialNo currently assigned
);

-- Inserting 10 sample rows
INSERT INTO StudentInfo (StudentID, StudentName, StudentBal, AdminComments, OutstandingBal, isRegistered, isAttending, numDamages, canRent, currentDevice)
VALUES
(1001, 'Alice Smith',  0.00, 'Good standing',         0.00, TRUE, TRUE, 0, TRUE, 'SN1001'),
(1002, 'Bob Johnson',  5.00, 'Late fee pending',        5.00, TRUE, TRUE, 1, TRUE, 'SN1002'),
(1003, 'Carol White',  0.00, 'No issues',               0.00, TRUE, TRUE, 0, TRUE, 'SN1003'),
(1004, 'David Brown', 10.00, 'Minor damages reported', 10.00, TRUE, TRUE, 1, TRUE, 'SN1005'),
(1005, 'Eva Green',    0.00, 'Excellent record',        0.00, TRUE, TRUE, 0, TRUE, 'SN1006'),
(1006, 'Frank Black', 15.00, 'Pending payment',        15.00, TRUE, TRUE, 2, FALSE, NULL),
(1007, 'Grace Lee',    0.00, 'Good standing',         0.00, TRUE, TRUE, 0, TRUE, 'SN1009'),
(1008, 'Henry Adams', 20.00, 'Repeated late returns', 20.00, TRUE, TRUE, 2, FALSE, 'SN1010'),
(1009, 'Ivy Baker',    0.00, 'No issues',             0.00, TRUE, TRUE, 0, TRUE, NULL),
(1010, 'Jack Carter',  5.00, 'Small fee pending',      5.00, TRUE, TRUE, 1, TRUE, 'SN1008');

-- Inserting 10 sample rows
INSERT INTO Rentals (RentalNum, RentalType, RentalDate, RentalTime, RentalDue, DeviceID, StudentID)
VALUES
(4001, 'Short-term', '2025-03-01', '08:00:00', '2025-03-05', 'SN1001', 1001),
(4002, 'Long-term',  '2025-03-02', '09:00:00', '2025-03-12', 'SN1002', 1002),
(4003, 'Short-term', '2025-03-03', '10:00:00', '2025-03-07', 'SN1003', 1003),
(4004, 'Short-term', '2025-03-04', '11:00:00', '2025-03-08', 'SN1005', 1004),
(4005, 'Long-term',  '2025-03-05', '12:00:00', '2025-03-15', 'SN1006', 1005),
(4006, 'Short-term', '2025-03-06', '13:00:00', '2025-03-10', 'SN1007', 1006),
(4007, 'Long-term',  '2025-03-07', '14:00:00', '2025-03-17', 'SN1009', 1007),
(4008, 'Short-term', '2025-03-08', '15:00:00', '2025-03-12', 'SN1010', 1008),
(4009, 'Long-term',  '2025-03-09', '16:00:00', '2025-03-19', 'SN1004', 1009),
(4010, 'Short-term', '2025-03-10', '17:00:00', '2025-03-14', 'SN1008', 1010);
-- Inserting 10 sample rows
INSERT INTO Payments (PaymentID, PaymentLoc, UserID, DeviceID, PaymentDate, PaymentTime, TotalPaid, RemainingBal)
VALUES
(3001, 'Front Desk', 1001, 'SN1001', '2025-03-10', '09:00:00', 50.00,  0.00),
(3002, 'Online',     1002, 'SN1002', '2025-03-11', '10:00:00', 30.00,  5.00),
(3003, 'Front Desk', 1003, 'SN1003', '2025-03-12', '11:00:00', 40.00,  0.00),
(3004, 'Online',     1004, 'SN1005', '2025-03-13', '12:00:00', 20.00, 10.00),
(3005, 'Front Desk', 1005, 'SN1006', '2025-03-14', '13:00:00', 60.00,  0.00),
(3006, 'Online',     1006, 'SN1007', '2025-03-15', '14:00:00', 25.00, 15.00),
(3007, 'Front Desk', 1007, 'SN1009', '2025-03-16', '15:00:00', 35.00,  0.00),
(3008, 'Online',     1008, 'SN1010', '2025-03-17', '16:00:00', 45.00,  0.00),
(3009, 'Front Desk', 1010, 'SN1008', '2025-03-18', '17:00:00', 55.00,  5.00),
(3010, 'Online',     1009, 'SN1004', '2025-03-19', '18:00:00', 30.00,  0.00);
-- Inserting 10 sample rows
INSERT INTO Overdue_SecurityTracking (TrackingID, UserID, DeviceID, IssueReported, DateReported, Resolved)
VALUES
(5001, 1001, 'SN1001', 'Late return',         '2025-03-05', FALSE),
(5002, 1002, 'SN1002', 'Damaged screen',        '2025-03-06', FALSE),
(5003, 1003, 'SN1003', 'Lost device',           '2025-03-07', TRUE),
(5004, 1004, 'SN1005', 'Overdue payment',       '2025-03-08', FALSE),
(5005, 1005, 'SN1006', 'Security breach',       '2025-03-09', TRUE),
(5006, 1006, 'SN1007', 'Unauthorized access',   '2025-03-10', FALSE),
(5007, 1007, 'SN1009', 'Device tampering',      '2025-03-11', TRUE),
(5008, 1008, 'SN1010', 'Late return',           '2025-03-12', FALSE),
(5009, 1010, 'SN1008', 'Lost device',           '2025-03-13', FALSE),
(5010, 1009, 'SN1004', 'Damaged hardware',      '2025-03-14', TRUE);
-- Inserting 10 sample rows
INSERT INTO FacultyInfo (FacultyID, FacultyFName, FacultyBal, AdminComments, OutstandingBal, numDamages, canRent, currentDevice)
VALUES
(2001, 'Professor Adams',   0.00, 'No issues',       0.00, 0, TRUE, 'SN1004'),
(2002, 'Professor Baker',   0.00, 'No issues',       0.00, 0, TRUE, NULL),
(2003, 'Professor Clark',  10.00, 'Minor issues',   10.00, 1, TRUE, 'SN1007'),
(2004, 'Professor Davis',    0.00, 'Excellent',        0.00, 0, TRUE, 'SN1010'),
(2005, 'Professor Evans',    5.00, 'Late submission fee', 5.00, 0, TRUE, 'SN1008'),
(2006, 'Professor Foster',   0.00, 'No issues',       0.00, 0, TRUE, NULL),
(2007, 'Professor Garcia',  15.00, 'Pending review',  15.00, 1, FALSE, NULL),
(2008, 'Professor Harris',   0.00, 'No issues',       0.00, 0, TRUE, 'SN1002'),
(2009, 'Professor Irvine',  20.00, 'Damaged equipment',20.00, 2, FALSE, NULL),
(2010, 'Professor Jenkins',  0.00, 'No issues',       0.00, 0, TRUE, 'SN1003');
-- Inserting 10 sample rows
INSERT INTO Device (SerialNo, AssetNo, PONo, DeliveryNo, DeviceType, isActive, isFunctional, isDamaged, ImageInfo, CurrentUser, LoginInfo, isLost)
VALUES
('SN1001', 'AT001', 'PO123', 'DEL001', 'Laptop', TRUE, TRUE, FALSE, 'img1.jpg', 1001, 'info1', FALSE),
('SN1002', 'AT002', 'PO124', 'DEL002', 'Tablet', TRUE, TRUE, FALSE, 'img2.jpg', 1002, 'info2', FALSE),
('SN1003', 'AT003', 'PO125', 'DEL003', 'Laptop', TRUE, FALSE, TRUE, 'img3.jpg', 1003, 'info3', FALSE),
('SN1004', 'AT004', 'PO126', 'DEL004', 'Desktop', TRUE, TRUE, FALSE, 'img4.jpg', NULL,   'info4', FALSE),
('SN1005', 'AT005', 'PO127', 'DEL005', 'Laptop', TRUE, TRUE, FALSE, 'img5.jpg', 1004, 'info5', FALSE),
('SN1006', 'AT006', 'PO128', 'DEL006', 'Tablet', TRUE, TRUE, FALSE, 'img6.jpg', 1005, 'info6', FALSE),
('SN1007', 'AT007', 'PO129', 'DEL007', 'Laptop', TRUE, TRUE, TRUE,  'img7.jpg', NULL,   'info7', TRUE),
('SN1008', 'AT008', 'PO130', 'DEL008', 'Desktop', TRUE, TRUE, FALSE, 'img8.jpg', 1006, 'info8', FALSE),
('SN1009', 'AT009', 'PO131', 'DEL009', 'Tablet', TRUE, TRUE, FALSE, 'img9.jpg', 1007, 'info9', FALSE),
('SN1010', 'AT010', 'PO132', 'DEL010', 'Laptop', TRUE, TRUE, FALSE, 'img10.jpg',1008, 'info10', FALSE);
