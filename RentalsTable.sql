-- Rentals Table: Created by Sarah (Fully Enhanced)
CREATE TABLE Rentals (
  RentalNum INT PRIMARY KEY,                     -- Unique rental record number
  RentalType VARCHAR(50),                        -- Type (Short-term, Long-term, etc.)
  RentalDate DATE NOT NULL,                      -- Date when rental began
  RentalTime TIME NOT NULL,                      -- Time of rental start
  RentalDue DATE NOT NULL,                       -- Due date for return

  ReturnDate DATE,                               -- Date when device was returned
  ReturnTime TIME,                               -- Time when device was returned
  ReturnCode VARCHAR(20),                        -- Return status (e.g., OK, Late, Damaged)

  DeviceID VARCHAR(50) NOT NULL,                 -- FK: Device.SerialNo
  StudentID INT NOT NULL,                        -- FK: StudentInfo.StudentID

  FOREIGN KEY (DeviceID) REFERENCES Device(SerialNo),
  FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID),

  -- Constraints
  CHECK (RentalTime BETWEEN '08:00:00' AND '18:00:00'),         -- Rentals only allowed between 8AM–6PM
  CHECK (ReturnTime IS NULL OR ReturnTime <= '20:00:00'),       -- Returns must be before 8PM
  CHECK (
    (RentalType = 'Short-term' AND DATEDIFF(RentalDue, RentalDate) <= 5) OR
    (RentalType = 'Long-term' AND DATEDIFF(RentalDue, RentalDate) <= 14)
  ),
  CHECK (ReturnCode IN ('OK', 'Late', 'Damaged') OR ReturnCode IS NULL),
  CHECK (ReturnDate IS NULL OR ReturnDate >= RentalDate)
);

-- Sample Data Insertion (10 Rows)
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

-- Trigger: Limit students to 3 active rentals (not yet returned)
DELIMITER //
CREATE TRIGGER LimitStudentRentals
BEFORE INSERT ON Rentals
FOR EACH ROW
BEGIN
  DECLARE rental_count INT;
  SELECT COUNT(*) INTO rental_count
  FROM Rentals
  WHERE StudentID = NEW.StudentID AND ReturnDate IS NULL;

  IF rental_count >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Student cannot rent more than 3 devices at a time.';
  END IF;
END;
//
DELIMITER ;
