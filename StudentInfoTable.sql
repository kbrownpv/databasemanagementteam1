CREATE TABLE StudentInfo (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    StudentBal DECIMAL(6,2),
    AdminComments TEXT,
    OutstandingBal DECIMAL(6,2),
    isRegistered BOOLEAN,
    isAttending BOOLEAN,
    numDamages INT,
    canRent BOOLEAN,
    currentDevice VARCHAR(50)
);

