--Peter Ronemous
create table device (
  assetNo varchar(30) NOT NULL, -- all computers will; be generated an asset number
  serialNo varchar(30) NOT NULL, -- all computers come with a serial number
  PONo varchar(30), -- all computers come in shipments or are logged for tax purposes
  deviceType varchar(40) NOT NULL,
  isActive binary(1), -- 0 for no, 1 for yes
  isFunctional binary(1),  -- 0 for no, 1 for yes
  isDamaged binary(1), -- 0 for no, 1 for yes
  damageComment varchar(280),
  currentUser varchar(26), -- pcr0305@pvamu.edu, adminFaculty, Dr. Genius MD, custodianSteve
  loginPermissions varchar(10), -- admin, student, faculty, maintenance
  isStolen binary(1),  -- 0 for no, 1 for yes
  isLost binary(1), -- 0 for no, 1 for yes
  otherComments varchar(280),
  isFieldReady binary(1), -- 0 for no, 1 for yes
  PRIMARY KEY (assetNo)
);

--
