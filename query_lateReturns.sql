-- Query: List rentals that were returned late
SELECT 
  r.RentalNum,
  r.RentalDate,
  r.RentalDue,
  r.ReturnDate,
  d.DeviceType,
  d.SerialNo
FROM 
  Rentals r
JOIN 
  Device d ON r.DeviceID = d.SerialNo
WHERE 
  r.ReturnDate > r.RentalDue;
