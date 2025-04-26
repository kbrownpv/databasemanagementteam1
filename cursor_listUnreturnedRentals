-- Cursor: List all currently rented devices
DELIMITER $$

CREATE PROCEDURE cursor_listUnreturnedRentals()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE rentalDevice VARCHAR(50);
  DECLARE rentalCursor CURSOR FOR 
    SELECT DeviceID FROM Rentals WHERE ReturnDate IS NULL;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN rentalCursor;

  read_loop: LOOP
    FETCH rentalCursor INTO rentalDevice;
    IF done THEN
      LEAVE read_loop;
    END IF;
    -- You could do something simple like SELECT device (or just print)
    SELECT rentalDevice AS 'Currently Rented Device';
  END LOOP;

  CLOSE rentalCursor;
END$$

DELIMITER ;
