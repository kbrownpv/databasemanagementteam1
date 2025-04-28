-- JOIN QUERY: Total Paid Per Student
-- Query joins the Payments table with the StudentInfo table to display each
-- student's name and the total amount they've paid so far.
SELECT 
    s.studentID,
    s.firstName,
    s.lastName,
    SUM(p.TotalPaid) AS TotalPaid
FROM 
    Payments p
JOIN 
    StudentInfo s ON p.UserID = s.studentID
WHERE
    p.UserID IS NOT NULL
GROUP BY 
    s.studentID, s.firstName, s.lastName;

