
-- DROP DATABASE tracksense;
-- Create DATABASE tracksense;
use tracksense;
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
    LastLatitude DECIMAL,
    LastLongitude DECIMAL,
    LastAltitude DECIMAL,
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
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Duration TIME
    )ENGINE = InnoDB;
-- DROP TABLE CompletedRideStatistic;
CREATE TABLE CompletedRideStatistic (
	CompletedRideId VARCHAR(36) PRIMARY KEY,
    AvgSpeed DOUBLE,
    MaxSpeed DOUBLE,
    Falls INT,
    Calories INT,
    Distance DOUBLE,
    Duration TIME
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
    Temperature DOUBLE,
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
    Temperature DOUBLE
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
	LocationId INT  PRIMARY KEY auto_increment,
    Latitude DOUBLE NOT NULL,
    Longitude DOUBLE NOT NULL,
    Altitude DOUBLE	 NULL,
    Speed DOUBLE NULL
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



