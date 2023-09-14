-- drop DATABASE tracksense;
USE master;
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'tracksense')
BEGIN
    CREATE DATABASE tracksense;
END
GO

USE tracksense;
GO

-- DROP TABLE user;
CREATE TABLE [user] (
    UserLogin NVARCHAR(100) UNIQUE,
    AddressId UNIQUEIDENTIFIER,
    UserLastName NVARCHAR(100),
    UserFirstName NVARCHAR(100),
    UserEmail NVARCHAR(100),
    UserCodePostal NVARCHAR(12),
    UserPhoneNumber NVARCHAR(12),
    CONSTRAINT PK_user PRIMARY KEY (Userlogin)
);

-- DROP TABLE tracksense;
CREATE TABLE Tracksense (
    TracksenseId UNIQUEIDENTIFIER PRIMARY KEY,
    UserLogin NVARCHAR(100) UNIQUE,
    LastLatitude DECIMAL(18, 6),
    LastLongitude DECIMAL(18, 6),
    LastAltitude DECIMAL(18, 6),
    LastCommunication DATETIME,
    isFallen BIT,
    isStolen BIT
);

CREATE TABLE Contact (
    ContactId UNIQUEIDENTIFIER,
    UserLogin NVARCHAR(100),
    Fullname NVARCHAR(100),
    PhoneNumber NVARCHAR(12),
    CONSTRAINT PK_contact PRIMARY KEY (contactId)
);

CREATE TABLE UserStatistics (
    UserLogin NVARCHAR(100) PRIMARY KEY,
    AvgSpeed FLOAT,
    MaxSpeed FLOAT,
    Duration TIME
);

-- DROP TABLE CompletedRideStatistics;
CREATE TABLE CompletedRideStatistics (
    CompletedRideId UNIQUEIDENTIFIER PRIMARY KEY,
    AvgSpeed FLOAT,
    MaxSpeed FLOAT,
    Falls INT,
    Calories INT,
    Distance FLOAT,
    Duration TIME
);

-- DROP TABLE CompletedRide;
CREATE TABLE CompletedRide (
    CompletedRideId UNIQUEIDENTIFIER PRIMARY KEY,
    UserLogin NVARCHAR(100),
    PlannedRideId UNIQUEIDENTIFIER
);

-- DROP TABLE CompletedRidePoint;
CREATE TABLE CompletedRidePoint (
	PRIMARY KEY (CompletedRideId,LocationId),
    CompletedRideId UNIQUEIDENTIFIER NOT NULL ,
    LocationId INT NOT NULL,
    RideStep INT,
    Temperature FLOAT,
    [date] DATETIME
);

CREATE TABLE PlannedRide (
    PlannedRideId UNIQUEIDENTIFIER PRIMARY KEY,
    UserLogin NVARCHAR(100),
    Name NVARCHAR(100) NULL,
    isFavorite BIT
);

-- DROP TABLE PlannedRidePoint;
CREATE TABLE PlannedRidePoint (
	PRIMARY KEY (PlannedRideId,LocationId),
    PlannedRideId UNIQUEIDENTIFIER NOT NULL,
    LocationId INT NOT NULL,
    RideStep INT NULL,
	Temperature FLOAT NULL,
);

-- Drop TABLE InterestPoint
CREATE TABLE InterestPoint (
    InterestPointId INT IDENTITY(1,1) PRIMARY KEY,
    UserLogin NVARCHAR(100),
    AddressId UNIQUEIDENTIFIER NOT NULL,
    Name NVARCHAR(100) NULL,
    Description NVARCHAR(MAX) NULL
);

-- Drop TABLE PlannedRideStatistics;
CREATE TABLE PlannedRideStatistics (
    PlannedRideId UNIQUEIDENTIFIER PRIMARY KEY,
    AverageSpeed FLOAT NULL,
	AverageDuration TIME NULL,
    MaximumSpeed FLOAT NULL,
    Falls INT NULL,
    Calories INT NULL,
    Distance FLOAT NULL,
    Duration TIME NULL
);

-- DROP TABLE Address;
CREATE TABLE Address (
    AddressId UNIQUEIDENTIFIER PRIMARY KEY,
    LocationId INT ,
    AppartmentNumber NVARCHAR(15),
    StreetNumber NVARCHAR(15),
    StreetName NVARCHAR(100),
    ZipCode NVARCHAR(10),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100)
);
USE tracksense;
GO

-- Create TABLE Credential
CREATE TABLE Credential (
    UserLogin NVARCHAR(100) PRIMARY KEY,
    [Password] NVARCHAR(30) NOT NULL
);
GO
-- DROP TABLE UserToken;
CREATE TABLE UserToken (
    UserTokenId INT IDENTITY(1,1) PRIMARY KEY,
    UserLogin NVARCHAR(100) NOT NULL,
    Token NVARCHAR(250) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
);

-- DROP TABLE ApplicationToken;
CREATE TABLE ApplicationToken (
    ApplicationTokenId INT IDENTITY(1,1) PRIMARY KEY,
    Token NVARCHAR(250) UNIQUE NOT NULL,
    LastUsedAt DATETIME,
    CreatedAt DATETIME NOT NULL
);
Go
-- DROP TABLE Location;
CREATE TABLE Location (
    LocationId INT PRIMARY KEY,
    Latitude FLOAT NOT NULL,
    Longitude FLOAT NOT NULL,
    Altitude FLOAT NULL,
	Speed	FLOAT NULL,
);
GO
-- Add Foreign Keys
ALTER TABLE CompletedRideStatistics
    ADD CONSTRAINT FK_CompletedRideStatistics_CompletedRide
    FOREIGN KEY (CompletedRideId)
    REFERENCES CompletedRide(CompletedRideId);
GO
ALTER TABLE Tracksense
    ADD CONSTRAINT FK_Tracksense_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE Contact
    ADD CONSTRAINT FK_Contact_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE UserStatistics
    ADD CONSTRAINT FK_UserStatistics_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE Credential
    ADD CONSTRAINT FK_Credential_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE UserToken
    ADD CONSTRAINT FK_UserToken_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);

ALTER TABLE InterestPoint
    ADD CONSTRAINT FK_InterestPoint_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE InterestPoint
    ADD CONSTRAINT FK_InterestPoint_Address
    FOREIGN KEY (AddressId)
    REFERENCES Address(AddressId);
GO
ALTER TABLE Address
    ADD CONSTRAINT FK_Address_Location
    FOREIGN KEY (LocationId)
    REFERENCES Location(LocationId);
GO
ALTER TABLE CompletedRidePoint
    ADD CONSTRAINT FK_CompletedRidePoint_Location
    FOREIGN KEY (LocationId)
    REFERENCES Location(LocationId);
GO
ALTER TABLE CompletedRidePoint
    ADD CONSTRAINT FK_CompletedRidePoint_CompletedRide
    FOREIGN KEY (CompletedRideId)
    REFERENCES CompletedRide(CompletedRideId);
GO
ALTER TABLE PlannedRidePoint
    ADD CONSTRAINT FK_PlannedRidePoint_Location
    FOREIGN KEY (LocationId)
    REFERENCES Location(LocationId);
GO
ALTER TABLE PlannedRidePoint
    ADD CONSTRAINT FK_PlannedRidePoint_PlannedRide
    FOREIGN KEY (PlannedRideId)
    REFERENCES PlannedRide(PlannedRideId);
GO		
ALTER TABLE PlannedRide
    ADD CONSTRAINT FK_PlannedRide_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE PlannedRideStatistics
    ADD CONSTRAINT FK_PlannedRideStatistics_PlannedRide
    FOREIGN KEY (PlannedRideId)
    REFERENCES PlannedRide(PlannedRideId);
GO
ALTER TABLE CompletedRide
    ADD CONSTRAINT FK_CompletedRide_User
    FOREIGN KEY (UserLogin)
    REFERENCES [user](UserLogin);
GO
ALTER TABLE CompletedRide
    ADD CONSTRAINT FK_CompletedRide_PlannedRide
    FOREIGN KEY (PlannedRideId)
    REFERENCES PlannedRide(PlannedRideId);
GO
-- Insert data
INSERT INTO [user] (Userlogin) VALUES ('admin');
GO
-- Insert location
INSERT INTO Location (LocationId,Latitude, Longitude)
VALUES
    (1,12.822779904, -119.0112014336),
    (2,29.9661408256, 25.214549504),
    (3,87.0611467264, -40.6562651136),
    (4,79.0482689024, -100.9452537856),
    (5,-5.7181708288, -162.5749092352);
GO
-- Insert data into PlannedRide
INSERT INTO PlannedRide (PlannedRideId, Userlogin)
VALUES
    ('2854D652-F4FB-EB65-6807-A49E7A031D6E', 'admin'),
    ('9953DE61-59FF-8AB9-DB8D-8431D862448B', 'admin'),
    ('91782BEA-2302-E83A-79DD-199B04ED8390', 'admin'),
    ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA', 'admin');
GO
-- Insert data into CompletedRide
INSERT INTO CompletedRide (CompletedRideId, Userlogin, PlannedRideId)
VALUES
    ('2854D652-F4FB-EB65-6807-A49E7A031D6E', 'admin', '2854D652-F4FB-EB65-6807-A49E7A031D6E'),
    ('9953DE61-59FF-8AB9-DB8D-8431D862448B', 'admin', '9953DE61-59FF-8AB9-DB8D-8431D862448B'),
    ('91782BEA-2302-E83A-79DD-199B04ED8390', 'admin', '91782BEA-2302-E83A-79DD-199B04ED8390'),
    ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA', 'admin', '558F58E2-9F83-CAF2-93C7-82859BEE6ECA');
GO
-- Insert data into CompletedRidePoint
INSERT INTO CompletedRidePoint (CompletedRideId, LocationId)
VALUES
    ('2854D652-F4FB-EB65-6807-A49E7A031D6E', 1),
    ('9953DE61-59FF-8AB9-DB8D-8431D862448B', 2),
    ('91782BEA-2302-E83A-79DD-199B04ED8390', 3),
    ('558F58E2-9F83-CAF2-93C7-82859BEE6ECA', 4);

	Select * from CompletedRidePoint
	Select * from Location