-- Device Table
CREATE TABLE Device (
  SerialNo VARCHAR(50) PRIMARY KEY,         -- Unique device serial number
  AssetNo VARCHAR(50),                        -- Asset tag/number for inventory tracking
  PONo VARCHAR(50),                           -- Purchase Order number
  DeliveryNo VARCHAR(50),                     -- Delivery note/reference
  DeviceType VARCHAR(50),                     -- e.g., Laptop, Tablet, Desktop
  isActive BOOLEAN,                           -- Is the device active in the system?
  isFunctional BOOLEAN,                       -- Is the device working correctly?
  isDamaged BOOLEAN,                          -- Has the device been damaged?
  ImageInfo TEXT,                             -- URL or description of the device image
  CurrentUser INT,                            -- FK: references StudentInfo or FacultyInfo
  LoginInfo TEXT,                             -- Login credentials or notes
  isLost BOOLEAN                              -- Is the device reported as lost?
);

-- Inserting 10 sample rows
INSERT INTO Device (SerialNo, AssetNo, PONo, DeliveryNo, DeviceType, isActive, isFunctional, isDamaged, ImageInfo, CurrentUser, LoginInfo, isLost)
VALUES
('SN1001', 'AT001', 'PO123', 'DEL001', 'Laptop', TRUE, TRUE, FALSE, 'img1.jpg', 1001, 'info1', FALSE),
('SN1002', 'AT002', 'PO124', 'DEL002', 'Tablet', TRUE, TRUE, FALSE, 'img2.jpg', 1002, 'info2', FALSE),
('SN1003', 'AT003', 'PO125', 'DEL003', 'Laptop', TRUE, FALSE, TRUE, 'img3.jpg', 1003, 'info3', FALSE),
('SN1004', 'AT004', 'PO126', 'DEL004', 'Desktop', TRUE, TRUE, FALSE, 'img4.jpg', NULL,   'info4', FALSE),
('SN1005', 'AT005', 'PO127', 'DEL005', 'Laptop', TRUE, TRUE, FALSE, 'img5.jpg', 1004, 'info5', FALSE),
('SN1006', 'AT006', 'PO128', 'DEL006', 'Tablet', TRUE, TRUE, FALSE, 'img6.jpg', 1005, 'info6', FALSE),
('SN1007', 'AT007', 'PO129', 'DEL007', 'Laptop', TRUE, TRUE, TRUE,  'img7.jpg', NULL,   'info7', TRUE),
('SN1008', 'AT008', 'PO130', 'DEL008', 'Desktop', TRUE, TRUE, FALSE, 'img8.jpg', 1006, 'info8', FALSE),
('SN1009', 'AT009', 'PO131', 'DEL009', 'Tablet', TRUE, TRUE, FALSE, 'img9.jpg', 1007, 'info9', FALSE),
('SN1010', 'AT010', 'PO132', 'DEL010', 'Laptop', TRUE, TRUE, FALSE, 'img10.jpg',1008, 'info10', FALSE);
