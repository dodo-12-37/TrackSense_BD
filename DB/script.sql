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
);
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
);

CREATE TABLE Contact (
	ContactId INTEGER AUTO_INCREMENT,
    UserLogin VARCHAR(100),
    Fullname VARCHAR(100),
    PhoneNumber VARCHAR(12),
    CONSTRAINT PK_contact PRIMARY KEY (contactId)
);

CREATE TABLE UserStatistics (
	UserLogin VARCHAR(100) UNIQUE,
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Duration DATETIME,
    CONSTRAINT PK_UserStatistics PRIMARY KEY (UserLogin)
);
-- DROP TABLE CompletedRideStatistics;
CREATE TABLE CompletedRideStatistics (
	CompletedRideId VARCHAR(36) UNIQUE,
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Falls INT,
    Calories INT,
    Distance DOUBLE,
    Duration DATETIME
);
-- DROP TABLE CompletedRide;
CREATE TABLE CompletedRide (
	CompletedRideId VARCHAR(36) UNIQUE,
    UserLogin VARCHAR(100) UNIQUE,
    PlannedRideId INT NOT NULL UNIQUE,
    CONSTRAINT PK_CompletedRide PRIMARY KEY (CompletedRideId) 
);
-- DROP TABLE CompletedRidePoint;
CREATE TABLE CompletedRidePoint (
	CompletedRideId VARCHAR(36) UNIQUE ,
    LocationId INT NOT NULL,
    RideStep INT,
    Temperature DOUBLE,
    `date` DATETIME,
    CONSTRAINT PK_CompletedRidePoint PRIMARY KEY (CompletedRideId,LocationId)
);

CREATE TABLE PlannedRide (
PlannedRideId VARCHAR(36) UNIQUE,
UserLogin VARCHAR(100),
Name VARCHAR(100) NULL,
isFavorite BOOLEAN,
CONSTRAINT PK_PlannedRide PRIMARY KEY (PlannedRideId)
);
-- DROP TABLE PlannedRidePoint;
CREATE TABLE PlannedRidePoint (
	PlannedRideId VARCHAR(36) UNIQUE,
    LocationId int NOT NULL,
    RideStep INT NULL,
    CONSTRAINT PK_PlannedRidePoint PRIMARY KEY (PlannedRideId,LocationId)
);

-- Drop TABLE InterestPoint
CREATE TABLE InterestPoint (
	InterestPointId INT  AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100),
    AddressId INT NOT NULL,
    Name VARCHAR(100) NULL,
    Description TEXT NULL
);

-- Drop TABLE PlannedRideStatistics;
CREATE TABLE PlannedRideStatistics (
	PlannedRideId VARCHAR(36) UNIQUE,
	AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Falls INT,
    Calories INT,
    Distance DOUBLE,
    Duration DATETIME
);

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
);

CREATE TABLE Credential (
UserLogin VARCHAR(100) PRIMARY KEY,
Password VARCHAR(30) NOT NULL
);
-- DROP TABLE UserToken;
CREATE TABLE UserToken (
	UserTokenId INT AUTO_INCREMENT PRIMARY KEY,
    UserLogin VARCHAR(100) NOT NULL,
    Token VARCHAR(255) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
    
);
-- DROP TABLE ApplicationToken;
CREATE TABLE ApplicationToken (
	ApplicationTokenId INT AUTO_INCREMENT PRIMARY KEY,
    Token VARCHAR(255) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
);

CREATE TABLE Location (
	LocationId INT AUTO_INCREMENT PRIMARY KEY,
    Latitude DECIMAL NOT NULL,
    Longitude DECIMAL NOT NULL,
    Altitude DECIMAL NULL
);

ALTER TABLE CompletedRideStatistics 
	ADD CONSTRAINT FOREIGN KEY FK_CompletedRide (CompletedRideId) REFERENCES CompletedRide(CompletedRide);

ALTER TABLE Tracksense
	ADD CONSTRAINT FOREIGN KEY FK_User (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE Contact 
	ADD CONSTRAINT FOREIGN KEY FK_User (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE UserStatistics
	ADD CONSTRAINT FOREIGN KEY FK_User (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE Credential
	ADD CONSTRAINT FOREIGN KEY FK_user (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE UserToken
	ADD CONSTRAINT FOREIGN KEY FK_user (UserLogin) REFERENCES User(UserLogin);
ALTER TABLE InterestPoint
	ADD CONSTRAINT FOREIGN KEY FK_user (UserLogin) REFERENCES User(UserLogin),
    ADD CONSTRAINT FOREIGN KEY FK_Address(AddressId) REFERENCES Address(AddressId);
ALTER TABLE Address 
	ADD CONSTRAINT FOREIGN KEY FK_Location(LocationId) REFERENCES Location(LocationId);
ALTER TABLE CompletedRidePoint
	ADD CONSTRAINT FOREIGN KEY FK_Location(LocationId) REFERENCES Location(LocationId),
    ADD CONSTRAINT FOREIGN KEY FK_CompletedRide(CompletedRideId) REFERENCES CompletedRide(CompletedRideId);

ALTER TABLE PlannedRidePoint
	ADD CONSTRAINT FOREIGN KEY FK_Location(LocationId) REFERENCES Location(LocationId),
    ADD CONSTRAINT FOREIGN KEY FK_PlannedRide(PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE PlannedRide 
	ADD	 CONSTRAINT FOREIGN KEY FK_User(UserLogin) REFERENCES User(Userlogin);
ALTER TABLE PlannedRideStatistics 
	ADD	 CONSTRAINT FOREIGN KEY FK_PlannedRide(PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE CompletedRide 
	ADD	 CONSTRAINT FOREIGN KEY FK_User(UserLogin) REFERENCES User(Userlogin),
    ADD	 CONSTRAINT FOREIGN KEY FK_PlannedRide(PlannedRideId) REFERENCES PlannedRide(PlannedRideId);
ALTER TABLE User
	ADD CONSTRAINT FOREIGN KEY FK_Address(AddressId) REFERENCES Address(AddressId);
INSERT into User (Userlogin) Values("admin");