-- Create Overdue_SecurityTracking table
CREATE TABLE Overdue_SecurityTracking (
    TrackingID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each record
    StudentID INT NOT NULL,                    -- Refers to StudentInfo.StudentID
    DeviceID VARCHAR(50),                      -- Refers to Device.SerialNo
    DaysLate INT NOT NULL,                     -- Number of days the device is overdue
    FlaggedSecurityRisk BOOLEAN DEFAULT FALSE, -- Set TRUE if DaysLate > 7
    IssueReported TEXT,                        -- Description of the issue
    DateReported DATE                          -- Date when issue was reported
);

-- Insert at least 10 sample rows
INSERT INTO Overdue_SecurityTracking (StudentID, DeviceID, DaysLate, FlaggedSecurityRisk, IssueReported, DateReported)
VALUES
(1001, 'SN1001', 3, FALSE, 'Late return', '2025-04-01'),
(1002, 'SN1002', 8, TRUE, 'Late return', '2025-04-02'),
(1003, 'SN1003', 2, FALSE, 'Minor damage reported', '2025-04-03'),
(1004, 'SN1005', 10, TRUE, 'Overdue payment', '2025-04-04'),
(1005, 'SN1006', 5, FALSE, 'Late return', '2025-04-05'),
(1006, 'SN1007', 12, TRUE, 'Device tampering', '2025-04-06'),
(1007, 'SN1009', 1, FALSE, 'Late return', '2025-04-07'),
(1008, 'SN1010', 9, TRUE, 'Late return', '2025-04-08'),
(1009, 'SN1004', 0, FALSE, 'On-time return', '2025-04-09'),
(1010, 'SN1008', 7, FALSE, 'Late return', '2025-04-10');
