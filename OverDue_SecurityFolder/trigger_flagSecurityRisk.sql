-- Trigger to set FlaggedSecurityRisk = TRUE if DaysLate > 7
DELIMITER $$

CREATE TRIGGER trigger_flagSecurityRisk
BEFORE INSERT ON Overdue_SecurityTracking
FOR EACH ROW
BEGIN
    IF NEW.DaysLate > 7 THEN
        SET NEW.FlaggedSecurityRisk = TRUE;
    END IF;
END$$

DELIMITER ;
