-- Active: 1696214803360@@MYSQL5049.site4now.net@3306@db_a9f4cd_track

-- DROP DATABASE tracksense;
-- Create DATABASE tracksense;

-- use tracksense;
-- DROP TABLE user;
CREATE TABLE User (
	UserLogin VARCHAR(100) PRIMARY KEY,
    AddressId INT,
    UserLastName varchar(100),
    UserFirstName varchar(100),
    UserEmail VARCHAR(100),
    UserCodePostal VARCHAR(12),
    UserPhoneNumber VARCHAR(12)
) ENGINE = InnoDB;
-- DROP TABLE tracksense;
CREATE TABLE Tracksense (
	TracksenseId VARCHAR(36) PRIMARY KEY,
    UserLogin VARCHAR(100) UNIQUE,
    LastLatitude DECIMAL(12,10),
    LastLongitude DECIMAL(12,10),
    LastAltitude DECIMAL(12,10),
    LastCommunication DATETIME,
    isFallen BOOLEAN,
    isStolen BOOLEAN
)ENGINE = InnoDB;

CREATE TABLE Contact (
	ContactId INT AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100) NOT NULL,
    Fullname VARCHAR(100),
    PhoneNumber VARCHAR(12)
) ENGINE = InnoDB;

CREATE TABLE UserStatistic (
	UserLogin VARCHAR(100) PRIMARY KEY,
    AvgSpeed DECIMAL(3,1),
    MaxSpeed DECIMAL(3,1),
    Duration TIME
    )ENGINE = InnoDB;
-- DROP TABLE CompletedRideStatistic;
CREATE TABLE CompletedRideStatistic (
	CompletedRideId VARCHAR(36) PRIMARY KEY,
    AvgSpeed DECIMAL(3,1),
    MaxSpeed DECIMAL(3,1),
    Falls INT,
    Calories INT,
    Distance DECIMAL(3,1),
    Duration TIME,
    StartedAt DATETIME
)ENGINE = InnoDB;

-- DROP TABLE CompletedRide;
CREATE TABLE CompletedRide (
	CompletedRideId VARCHAR(36) PRIMARY KEY,
    UserLogin VARCHAR(100),
    PlannedRideId VARCHAR(36)
)ENGINE = InnoDB;
-- DROP TABLE CompletedRidePoint;
CREATE TABLE CompletedRidePoint (
	CompletedRideId VARCHAR(36),
    LocationId INT NOT NULL,
    RideStep INT,
    Temperature DECIMAL(3,1),
    `date` DATETIME
    -- 
)ENGINE = InnoDB;

CREATE TABLE PlannedRide (
	PlannedRideId VARCHAR(36) PRIMARY KEY,
	UserLogin VARCHAR(100),
	Name VARCHAR(100) NULL,
	isFavorite BOOLEAN
	-- PRIMARY KEY (PlannedRideId, UserLogin)
)ENGINE = InnoDB;
-- DROP TABLE PlannedRidePoint;
CREATE TABLE PlannedRidePoint (
	PlannedRideId VARCHAR(36) PRIMARY KEY,
    LocationId INT NOT NULL,
    RideStep INT NULL,
    Temperature DECIMAL(3,1) NULL,
)ENGINE = InnoDB;

-- Drop TABLE InterestPoint
CREATE TABLE InterestPoint (
	InterestPointId INT  AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100) NOT NULL,
    AddressId INT NOT NULL,
    Name VARCHAR(100) NULL,
    Description TEXT NULL
)ENGINE = InnoDB;

-- Drop TABLE PlannedRideStatistics;
CREATE TABLE PlannedRideStatistic (
	PlannedRideId VARCHAR(36) PRIMARY KEY,
	AvgSpeed DECIMAL(3,1),
    MaxSpeed DECIMAL(3,1),
    Falls INT,
    Calories INT,
    Distance DECIMAL(3,1),
    Duration DATETIME
)ENGINE = InnoDB;

-- DROP TABLE Address;
CREATE TABLE Address (
AddressId INT AUTO_INCREMENT PRIMARY KEY,
LocationId INT UNIQUE,
AppartmentNumber VARCHAR(15),
StreetNumber VARCHAR(15),
StreetName VARCHAR(100),
ZipCode VARCHAR(10),
City VARCHAR(100),
State VARCHAR(100),
Country VARCHAR(100)
)ENGINE = InnoDB;

CREATE TABLE Credential (
UserLogin VARCHAR(100) PRIMARY KEY,
Password VARCHAR(30) NOT NULL
)ENGINE = InnoDB;
-- DROP TABLE UserToken;
CREATE TABLE UserToken (
	UserTokenId INT AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100) NOT NULL,
    Token VARCHAR(250) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
)ENGINE = InnoDB;
-- DROP TABLE ApplicationToken;
CREATE TABLE ApplicationToken (
	ApplicationTokenId INT AUTO_INCREMENT PRIMARY KEY,
    Token VARCHAR(250) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
)ENGINE = InnoDB;
-- DROP TABLE Location;
CREATE TABLE Location (
	LocationId INT  PRIMARY KEY auto_increment,
    Latitude DECIMAL (12,10) NOT NULL,
    Longitude DECIMAL(12,10) NOT NULL,
    Altitude DECIMAL(3,1) Default 0,
    Speed DECIMAL(3,1) Default 0
)ENGINE = InnoDB;


ALTER TABLE contact ADD FOREIGN KEY (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE tracksense	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE contact ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE UserStatistic
	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE Credential
	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE UserToken
	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE InterestPoint
	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin),
    ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId);
ALTER TABLE Address 
	ADD FOREIGN KEY (LocationId) REFERENCES Location(LocationId);
ALTER TABLE CompletedRidePoint
	ADD PRIMARY KEY (CompletedRideId,LocationId),
	ADD  FOREIGN KEY (LocationId) REFERENCES Location(LocationId),
    ADD  FOREIGN KEY (CompletedRideId) REFERENCES CompletedRide(CompletedRideId);
    
ALTER TABLE PlannedRidePoint
	ADD FOREIGN KEY (LocationId) REFERENCES Location(LocationId),
    ADD  FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE PlannedRide 
	ADD	  FOREIGN KEY (UserLogin) REFERENCES User(Userlogin);
ALTER TABLE PlannedRideStatistic 
	ADD	  FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE CompletedRide 
	ADD	 FOREIGN KEY (UserLogin) REFERENCES User(Userlogin),
    ADD	 FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE CompletedRideStatistic
ADD FOREIGN KEY (CompletedRideId) REFERENCES CompletedRide(CompletedRideId);

DELIMITER //

CREATE FUNCTION calculateDistance(
    LocationId_At_Start INT,
    LocationId_At_End INT
) RETURNS DECIMAL(5, 2) 
BEGIN
   DECLARE totalDistance DECIMAL(5, 2) DEFAULT 0.0;

   SELECT
      IFNULL(SUM(distance), 0.0) 
   INTO totalDistance
   FROM
       (
           SELECT 
               l1.`LocationId` AS id,
               ST_Distance_Sphere(
                   POINT(l1.Latitude, l1.Longitude),
                   POINT(l2.Latitude, l2.Longitude)
               )/1000 AS distance
           FROM 
               Location l1
           JOIN 
               Location l2 
           ON l2.LocationId = l1.LocationId + 1
           WHERE
               l1.LocationId BETWEEN LocationId_At_Start AND LocationId_At_End - 1
       ) AS Subquery;
   RETURN totalDistance;
END;
//

DELIMITER ;


-- DROP VIEW RideStatistic;
-- SELECT * FROM RideStatistic;

CREATE VIEW RideStatistic AS 
SELECT 
	c.UserLogin,
	p.CompletedRideId,
    sec_to_time(MAX(p.date)-MIN(p.date)) AS Duration,
    ROUND(Max(l.speed),1) AS MaxSpeed,
    ROUND(AVG(l.speed),1) AS AvgSpeed,
    0 AS Calories,
    0 AS Falls,
    calculateDistance(MIN(l.`LocationId`),MAX(l.`LocationId`)) AS Distance
FROM 
	CompletedRidePoint p
INNER JOIN 
	Location l  ON p.locationId = l.LocationId
INNER JOIN
	CompletedRide c ON c. CompletedRideId = p.CompletedRideId
GROUP BY c.CompletedRideId;

-- DROP VIEW UserCompletedRide;
-- use db_a9f4cd_track;
-- use tracksense;
-- version avec planneRide
CREATE VIEW UserCompletedRide AS
SELECT
	c.UserLogin,
	crp.CompletedRideId,
    p.Name AS PlannedRideName,
    MIN(crp.Date) AS StartedAt,
    sec_to_time(MAX(crp.Date)-MIN(crp.Date)) AS Duration,
    calculateDistance(MIN(l.`LocationId`),MAX(l.`LocationId`)) AS Distance
FROM CompletedRidePoint crp
INNER JOIN Location l ON l.LocationId = crp.LocationId
INNER JOIN CompletedRide c ON c.CompletedRideId = crp.CompletedRideId
LEFT JOIN PlannedRide p ON p.`PlannedRideId` = c.`PlannedRideId` 
GROUP BY crp.CompletedRideId
ORDER BY StartedAt DESC;