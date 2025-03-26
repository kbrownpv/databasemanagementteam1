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
