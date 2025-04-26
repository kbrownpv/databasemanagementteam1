-- Query: Find all overdue devices and their reported issues
SELECT 
  o.DeviceID,
  o.IssueReported,
  d.DeviceType
FROM 
  Overdue_SecurityTracking o
JOIN 
  Device d ON o.DeviceID = d.SerialNo
WHERE 
  o.Resolved = FALSE;
