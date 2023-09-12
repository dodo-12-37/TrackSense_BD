-- Create DATABASE tracksense;
-- DROP DATABASE tracksense;
use tracksense;
-- DROP TABLE user;
CREATE TABLE user (
	UserLogin VARCHAR(100) UNIQUE,
    AddressId INT,
    UserLastName varchar(100),
    UserFirstName varchar(100),
    UserEmail VARCHAR(100),
    UserCodePostal VARCHAR(12),
    UserPhoneNumber VARCHAR(12),
    CONSTRAINT PK_user PRIMARY KEY (Userlogin)
) ENGINE = InnoDB;
-- DROP TABLE tracksense;
CREATE TABLE Tracksense (
	TracksenseId VARCHAR(36) UNIQUE PRIMARY KEY,
    UserLogin VARCHAR(100) UNIQUE,
    LastLatitude DECIMAL,
    LastLongitude DECIMAL,
    LastAltitude DECIMAL,
    LastCommunication DATETIME,
    isFallen BOOLEAN,
    isStolen BOOLEAN
)ENGINE = InnoDB;

CREATE TABLE Contact (
	ContactId INTEGER AUTO_INCREMENT,
    UserLogin VARCHAR(100),
    Fullname VARCHAR(100),
    PhoneNumber VARCHAR(12),
    CONSTRAINT PK_contact PRIMARY KEY (contactId)
);

CREATE TABLE UserStatistics (
	UserLogin VARCHAR(100) PRIMARY KEY,
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Duration DATETIME
    )ENGINE = InnoDB;
-- DROP TABLE CompletedRideStatistics;
CREATE TABLE CompletedRideStatistics (
	CompletedRideId VARCHAR(36) PRIMARY KEY,
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Falls INT,
    Calories INT,
    Distance DOUBLE,
    Duration DATETIME
)ENGINE = InnoDB;
-- DROP TABLE CompletedRide;
CREATE TABLE CompletedRide (
	CompletedRideId VARCHAR(36) PRIMARY KEY,
    UserLogin VARCHAR(100),
    PlannedRideId VARCHAR(36)
)ENGINE = InnoDB;
-- DROP TABLE CompletedRidePoint;
CREATE TABLE CompletedRidePoint (
	CompletedRideId VARCHAR(36) PRIMARY KEY ,
    LocationId INT NOT NULL,
    RideStep INT,
    Temperature DOUBLE,
    `date` DATETIME
)ENGINE = InnoDB;

CREATE TABLE PlannedRide (
PlannedRideId VARCHAR(36) PRIMARY KEY,
UserLogin VARCHAR(100),
Name VARCHAR(100) NULL,
isFavorite BOOLEAN
)ENGINE = InnoDB;
-- DROP TABLE PlannedRidePoint;
CREATE TABLE PlannedRidePoint (
	PlannedRideId VARCHAR(36) PRIMARY KEY,
    LocationId int NOT NULL,
    RideStep INT NULL
)ENGINE = InnoDB;

-- Drop TABLE InterestPoint
CREATE TABLE InterestPoint (
	InterestPointId INT  AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100),
    AddressId INT NOT NULL,
    Name VARCHAR(100) NULL,
    Description TEXT NULL
)ENGINE = InnoDB;

-- Drop TABLE PlannedRideStatistics;
CREATE TABLE PlannedRideStatistics (
	PlannedRideId VARCHAR(36) PRIMARY KEY,
	AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Falls INT,
    Calories INT,
    Distance DOUBLE,
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
	LocationId INT AUTO_INCREMENT PRIMARY KEY,
    Latitude DOUBLE NOT NULL,
    Longitude DOUBLE NOT NULL,
    Altitude DOUBLE	 NULL
)ENGINE = InnoDB;

ALTER TABLE completedRideStatistics ADD FOREIGN KEY (CompletedRideId) REFERENCES CompletedRide(CompletedRideId);

ALTER TABLE tracksense	ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE contact ADD FOREIGN KEY  (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE UserStatistics
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
	ADD  FOREIGN KEY (LocationId) REFERENCES Location(LocationId),
    ADD  FOREIGN KEY (CompletedRideId) REFERENCES CompletedRide(CompletedRideId);

ALTER TABLE PlannedRidePoint
	ADD FOREIGN KEY (LocationId) REFERENCES Location(LocationId),
    ADD  FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE PlannedRide 
	ADD	  FOREIGN KEY (UserLogin) REFERENCES User(Userlogin);
ALTER TABLE PlannedRideStatistics 
	ADD	  FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE CompletedRide 
	ADD	 FOREIGN KEY (UserLogin) REFERENCES User(Userlogin),
    ADD	 FOREIGN KEY (PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE User
	ADD  FOREIGN KEY (AddressId) REFERENCES Address(AddressId);
ALTER TABLE Contact
	ADD FOREIGN KEY (UserLogin) REFERENCES User(UserLogin);
INSERT into User (Userlogin) Values("admin");

-- insert location 
INSERT INTO location (Latitude,Longitude)
VALUES
  ('12.822779904','-119.0112014336'),
  ('29.9661408256','25.214549504'),
  ('87.0611467264','-40.6562651136'),
  ('79.0482689024','-100.9452537856'),
  ('-5.7181708288','-162.5749092352');
Select	* from location;

-- TABLE PlannedRide
INSERT INTO PlannedRide(plannedrideId,Userlogin) VALUE
	('2854D652-F4FB-EB65-6807-A49E7A031D6E','admin'),
	('9953DE61-59FF-8AB9-DB8D-8431D862448B','admin'),
	('91782BEA-2302-E83A-79DD-199B04ED8390','admin'),
	('558F58E2-9F83-CAF2-93C7-82859BEE6ECA','admin');

-- Table CompletedRide
INSERT INTO COMPLETEDRIDE (completedRideId,Userlogin,plannedRideId)VALUES
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E','admin','2854D652-F4FB-EB65-6807-A49E7A031D6E'),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B','admin','9953DE61-59FF-8AB9-DB8D-8431D862448B'),
  ('91782BEA-2302-E83A-79DD-199B04ED8390','admin','91782BEA-2302-E83A-79DD-199B04ED8390'),
  ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA','admin','558F58E2-9F83-CAF2-93C7-82859BEE6ECA');
  
INSERT INTO CompletedRidePoint (completedRideId,LocationId) VALUES
  ('2854D652-F4FB-EB65-6807-A49E7A031D6E',1),
  ('9953DE61-59FF-8AB9-DB8D-8431D862448B',2),
  ('91782BEA-2302-E83A-79DD-199B04ED8390',3),
  ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA',4);