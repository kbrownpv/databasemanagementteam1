SELECT PaymentID, UserID, TotalPaid, RemainingBal
FROM Payments
WHERE RemainingBal > 0;
