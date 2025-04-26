-- Trigger: Limit students to 3 active rentals (not yet returned)
DELIMITER //
CREATE TRIGGER LimitStudentRentals
BEFORE INSERT ON Rentals
FOR EACH ROW
BEGIN
  DECLARE rental_count INT;
  SELECT COUNT(*) INTO rental_count
  FROM Rentals
  WHERE StudentID = NEW.StudentID AND ReturnDate IS NULL;

  IF rental_count >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Student cannot rent more than 3 devices at a time.';
  END IF;
END;
//
DELIMITER ;
