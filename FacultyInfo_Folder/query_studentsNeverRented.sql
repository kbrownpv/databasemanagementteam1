-- Query to list all students who have never rented a device
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName
FROM 
    StudentInfo s
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM Rentals r
        WHERE r.StudentID = s.StudentID
    );
