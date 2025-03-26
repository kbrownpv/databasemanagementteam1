-- Rentals Table: Created by Sarah
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
