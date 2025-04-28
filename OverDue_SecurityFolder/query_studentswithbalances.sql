SELECT 
  s.StudentID,
  s.FirstName,
  s.LastName,
  s.StudentBal,
  COUNT(r.RentalNum) AS TotalRentals
FROM 
  StudentInfo s
LEFT JOIN 
  Rentals r ON s.StudentID = r.StudentID
WHERE 
  s.StudentBal > 0
GROUP BY 
  s.StudentID, s.FirstName, s.LastName, s.StudentBal;
