-- StudentInfo Table: Created by You
CREATE TABLE StudentInfo (
  StudentID INT PRIMARY KEY,                -- Unique student ID
  StudentName VARCHAR(100) NOT NULL,          -- Full name of student
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
