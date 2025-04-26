-- TRIGGER: Log New Payments
-- Automatically logs every new payment inserted into the Payments table

DELIMITER $$

CREATE TRIGGER log_new_payment
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
  INSERT INTO PaymentLog (PaymentID, LogDate, LogNote)
  VALUES (
    NEW.PaymentID,
    NOW(),
    CONCAT('New payment of $', NEW.TotalPaid, ' added for User ', NEW.UserID)
  );
END$$

DELIMITER ;
