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
