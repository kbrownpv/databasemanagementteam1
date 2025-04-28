-- Payments Table: Created by Karrington
-- This table stores payment information for students and faculty.

CREATE TABLE Payments (
  PaymentID INT PRIMARY KEY,                -- Unique payment ID
  PaymentLoc VARCHAR(100),                  -- Location where payment was made
  UserID INT,                               -- FK: Refers to StudentInfo or FacultyInfo
  DeviceID VARCHAR(50),                     -- FK: Device.SerialNo
  PaymentDate DATE,                         -- Date of payment
  PaymentTime TIME,                         -- Time of payment
  TotalPaid DECIMAL(6,2),                   -- Amount paid
  RemainingBal DECIMAL(6,2),                -- Balance remaining
  FOREIGN KEY (DeviceID) REFERENCES Device(SerialNo),
  CHECK (RemainingBal >= 0)                 -- Check constraint: balance must be non-negative
);

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



-- PAYMENT LOG TABLE: To be used with a trigger to track new payment entries
CREATE TABLE PaymentLog (
  LogID INT AUTO_INCREMENT PRIMARY KEY,     -- Unique log entry ID
  PaymentID INT,                            -- Payment ID being logged
  LogDate DATETIME,                         -- Date and time of the log
  LogNote VARCHAR(255)                      -- Descriptive note about the payment
);

-- Sample Data for Payment Log Table
INSERT INTO PaymentLog (PaymentID, LogDate, LogNote)
VALUES
  (3001, '2025-04-01 09:15:00', 'New payment of $50 added for User 1001'),
  (3002, '2025-04-01 10:05:00', 'New payment of $30 added for User 1002'),
  (3003, '2025-04-02 08:45:00', 'New payment of $40 added for User 1003'),
  (3004, '2025-04-02 11:30:00', 'New payment of $20 added for User 1004'),
  (3005, '2025-04-03 12:20:00', 'New payment of $60 added for User 1005'),
  (3006, '2025-04-03 14:00:00', 'New payment of $25 added for User 1006'),
  (3007, '2025-04-04 09:40:00', 'New payment of $35 added for User 1007'),
  (3008, '2025-04-04 15:25:00', 'New payment of $45 added for User 1008'),
  (3009, '2025-04-05 10:55:00', 'New payment of $55 added for User 1009'),
  (3010, '2025-04-05 16:10:00', 'New payment of $30 added for User 1010');



