-- Query: List rentals that were returned late
SELECT 
  r.RentalNum,
  r.DeviceID,
  r.StudentID,
  r.RentalDate,
  r.RentalDue,
  r.ReturnDate
FROM 
  Rentals r
WHERE 
  r.ReturnDate IS NOT NULL 
  AND r.ReturnDate > r.RentalDue;
