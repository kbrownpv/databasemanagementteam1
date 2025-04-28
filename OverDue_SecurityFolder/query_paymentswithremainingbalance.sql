SELECT 
  p.PaymentID,
  p.UserID,
  d.DeviceType,
  p.TotalPaid,
  p.RemainingBal
FROM 
  Payments p
JOIN 
  Device d ON p.DeviceID = d.SerialNo
WHERE 
  p.RemainingBal > 0;
