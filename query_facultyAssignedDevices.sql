-- Query: Find all faculty members currently assigned a device
SELECT 
  f.FacultyFName,
  f.FacultyID,
  d.SerialNo,
  d.DeviceType
FROM 
  FacultyInfo f
JOIN 
  Device d ON f.currentDevice = d.SerialNo
WHERE 
  f.currentDevice IS NOT NULL;
