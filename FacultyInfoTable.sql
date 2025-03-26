
CREATE TABLE FacultyInfo (
    FacultyID INT PRIMARY KEY,
    FacultyFName VARCHAR(100),
    FacultyBal DECIMAL(6,2),
    AdminComments TEXT,
    OutstandingBal DECIMAL(6,2),
    numDamages INT,
    canRent BOOLEAN,
    currentDevice VARCHAR(50)
);
