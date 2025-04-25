-- Create FacultyInfo table
CREATE TABLE FacultyInfo (
    FacultyID INT PRIMARY KEY,                -- Unique faculty ID
    FacultyName VARCHAR(100) NOT NULL,         -- Full name of faculty
    Department VARCHAR(100),                   -- Department they belong to
    Title VARCHAR(50),                         -- Title (e.g., Professor, Assistant Professor)
    FacultyBal DECIMAL(6,2) DEFAULT 0.00,       -- Current account balance
    AdminComments TEXT,                        -- Admin comments about the faculty
    OutstandingBal DECIMAL(6,2) DEFAULT 0.00,   -- Overdue amount if any
    NumDamages INT DEFAULT 0,                  -- Number of damaged devices
    CanRent BOOLEAN NOT NULL DEFAULT TRUE,     -- Renting eligibility
    CurrentDevice VARCHAR(50)                  -- FK: Device.SerialNo (if assigned)
);

-- Insert 10+ sample rows
INSERT INTO FacultyInfo (FacultyID, FacultyName, Department, Title, FacultyBal, AdminComments, OutstandingBal, NumDamages, CanRent, CurrentDevice)
VALUES
(2001, 'Dr. Alice Monroe', 'Computer Science', 'Professor', 0.00, 'Good standing', 0.00, 0, TRUE, 'SN1004'),
(2002, 'Dr. Brian Summers', 'Mathematics', 'Assistant Professor', 5.00, 'Minor late fee', 5.00, 1, TRUE, NULL),
(2003, 'Dr. Cathy Woods', 'Physics', 'Professor', 10.00, 'Pending review', 10.00, 1, FALSE, NULL),
(2004, 'Dr. David Ellis', 'Chemistry', 'Associate Professor', 0.00, 'No issues', 0.00, 0, TRUE, 'SN1007'),
(2005, 'Dr. Emma Frost', 'Biology', 'Lecturer', 0.00, 'Excellent feedback', 0.00, 0, TRUE, NULL),
(2006, 'Dr. Frank West', 'Computer Science', 'Professor', 15.00, 'Multiple device damages', 15.00, 2, FALSE, NULL),
(2007, 'Dr. Gina Lane', 'Engineering', 'Assistant Professor', 0.00, 'Good standing', 0.00, 0, TRUE, 'SN1008'),
(2008, 'Dr. Henry Lake', 'Psychology', 'Professor', 0.00, 'Late payment cleared', 0.00, 0, TRUE, NULL),
(2009, 'Dr. Ivy Bloom', 'Sociology', 'Lecturer', 0.00, 'Good standing', 0.00, 0, TRUE, NULL),
(2010, 'Dr. Jack Noble', 'Education', 'Associate Professor', 0.00, 'Good standing', 0.00, 0, TRUE, 'SN1009');
