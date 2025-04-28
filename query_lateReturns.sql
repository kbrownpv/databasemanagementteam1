SELECT 
    r.RentalNum,
    r.DeviceID,
    r.StudentID,
    r.RentalDate,
    r.RentalDue,
    r.ReturnDate
FROM Rentals r
JOIN Device d ON r.DeviceID = d.SerialNo
WHERE r.ReturnDate IS NOT NULL
AND r.ReturnDate > r.RentalDue;
