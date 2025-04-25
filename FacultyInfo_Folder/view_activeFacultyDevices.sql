-- Create a view showing all active faculty and their assigned devices
CREATE VIEW ActiveFacultyDevices AS
SELECT 
    FacultyID,
    FacultyName,
    Department,
    Title,
    CurrentDevice
FROM 
    FacultyInfo
WHERE 
    CanRent = TRUE
    AND CurrentDevice IS NOT NULL
WITH CHECK OPTION;
