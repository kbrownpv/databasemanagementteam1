-- Procedure to calculate late fee for a given StudentID
DELIMITER $$

CREATE PROCEDURE calculateLateFee(IN inputStudentID INT)
BEGIN
    DECLARE lateDays INT;
    DECLARE lateFee DECIMAL(6,2);

    -- Get the total days late for the given student
    SELECT DaysLate INTO lateDays
    FROM Overdue_SecurityTracking
    WHERE StudentID = inputStudentID
    ORDER BY DateReported DESC
    LIMIT 1;

    -- Calculate the late fee (5 dollars per day late)
    SET lateFee = lateDays * 5;

    -- Display the result
    SELECT CONCAT('Student ID: ', inputStudentID, ' | Days Late: ', lateDays, ' | Late Fee: $', lateFee) AS LateFeeReport;
END$$

DELIMITER ;
