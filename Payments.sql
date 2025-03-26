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
