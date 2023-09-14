USE [master]
GO
/****** Object:  Database [tracksense]    Script Date: 2023-09-14 01:13:11 ******/
CREATE DATABASE [tracksense]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tracksense', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\tracksense.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tracksense_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\tracksense_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tracksense] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tracksense].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tracksense] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tracksense] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tracksense] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tracksense] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tracksense] SET ARITHABORT OFF 
GO
ALTER DATABASE [tracksense] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tracksense] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tracksense] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tracksense] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tracksense] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tracksense] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tracksense] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tracksense] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tracksense] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tracksense] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tracksense] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tracksense] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tracksense] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tracksense] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tracksense] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tracksense] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [tracksense] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tracksense] SET RECOVERY FULL 
GO
ALTER DATABASE [tracksense] SET  MULTI_USER 
GO
ALTER DATABASE [tracksense] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tracksense] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tracksense] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tracksense] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tracksense] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tracksense] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tracksense', N'ON'
GO
ALTER DATABASE [tracksense] SET QUERY_STORE = OFF
GO
USE [tracksense]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [uniqueidentifier] NOT NULL,
	[LocationId] [int] NULL,
	[AppartmentNumber] [nvarchar](15) NULL,
	[StreetNumber] [nvarchar](15) NULL,
	[StreetName] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
 CONSTRAINT [PK__Address__091C2AFB166146D8] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationToken]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationToken](
	[ApplicationTokenId] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](250) NOT NULL,
	[LastUsedAt] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK__Applicat__51EA9096072F9446] PRIMARY KEY CLUSTERED 
(
	[ApplicationTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletedRide]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedRide](
	[CompletedRideId] [uniqueidentifier] NOT NULL,
	[UserLogin] [nvarchar](100) NOT NULL,
	[PlannedRideId] [uniqueidentifier] NULL,
	[UserLogin1] [nvarchar](100) NULL,
 CONSTRAINT [PK__Complete__3D404232BE9BF58B] PRIMARY KEY CLUSTERED 
(
	[CompletedRideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletedRidePoint]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedRidePoint](
	[CompletedRideId] [uniqueidentifier] NOT NULL,
	[LocationId] [int] NOT NULL,
	[RideStep] [int] NULL,
	[Temperature] [float] NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK__Complete__533FA87BD1669A65] PRIMARY KEY CLUSTERED 
(
	[CompletedRideId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletedRideStatistics]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedRideStatistics](
	[CompletedRideId] [uniqueidentifier] NOT NULL,
	[AvgSpeed] [float] NULL,
	[MaxSpeed] [float] NULL,
	[Falls] [int] NULL,
	[Calories] [int] NULL,
	[Distance] [float] NULL,
	[Duration] [time](7) NULL,
 CONSTRAINT [PK__Complete__3D4042327B20BD26] PRIMARY KEY CLUSTERED 
(
	[CompletedRideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [uniqueidentifier] NOT NULL,
	[UserLogin] [nvarchar](100) NULL,
	[Fullname] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](12) NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserLogin] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Credenti__7F8E8D5FB80D981D] PRIMARY KEY CLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterestPoint]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterestPoint](
	[InterestPointId] [int] IDENTITY(1,1) NOT NULL,
	[UserLogin] [nvarchar](100) NULL,
	[AddressId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK__Interest__E13EB84985BF89F7] PRIMARY KEY CLUSTERED 
(
	[InterestPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Altitude] [float] NULL,
	[Speed] [float] NULL,
 CONSTRAINT [PK__Location__E7FEA497B2F12385] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedRide]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedRide](
	[PlannedRideId] [uniqueidentifier] NOT NULL,
	[UserLogin] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[isFavorite] [bit] NULL,
	[UserLoginNavigationUserLogin] [nvarchar](100) NULL,
 CONSTRAINT [PK__PlannedR__807DE2956F2B5FAE] PRIMARY KEY CLUSTERED 
(
	[PlannedRideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedRidePoint]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedRidePoint](
	[PlannedRideId] [uniqueidentifier] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
	[RideStep] [int] NULL,
	[Temperature] [float] NULL,
	[LocationId1] [int] NOT NULL,
 CONSTRAINT [PK__PlannedR__EE0208DC97FCB4A7] PRIMARY KEY CLUSTERED 
(
	[PlannedRideId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedRideStatistics]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedRideStatistics](
	[PlannedRideId] [uniqueidentifier] NOT NULL,
	[AverageSpeed] [float] NULL,
	[AverageDuration] [float] NULL,
	[MaximumSpeed] [float] NULL,
	[Falls] [int] NULL,
	[Calories] [int] NULL,
	[Distance] [float] NULL,
	[Duration] [datetime] NULL,
 CONSTRAINT [PK__PlannedR__807DE295481CB488] PRIMARY KEY CLUSTERED 
(
	[PlannedRideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracksense]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracksense](
	[TracksenseId] [uniqueidentifier] NOT NULL,
	[UserLogin] [nvarchar](100) NULL,
	[LastLatitude] [decimal](18, 6) NULL,
	[LastLongitude] [decimal](18, 6) NULL,
	[LastAltitude] [decimal](18, 6) NULL,
	[LastCommunication] [datetime] NULL,
	[isFallen] [bit] NULL,
	[isStolen] [bit] NULL,
 CONSTRAINT [PK__Tracksen__6AF72C603CA58608] PRIMARY KEY CLUSTERED 
(
	[TracksenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserLogin] [nvarchar](100) NOT NULL,
	[AddressId] [uniqueidentifier] NULL,
	[UserLastName] [nvarchar](100) NULL,
	[UserFirstName] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserCodePostal] [nvarchar](12) NULL,
	[UserPhoneNumber] [nvarchar](12) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatistics]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatistics](
	[UserLogin] [nvarchar](100) NOT NULL,
	[AvgSpeed] [float] NULL,
	[MaxSpeed] [float] NULL,
	[Duration] [datetime] NULL,
 CONSTRAINT [PK__UserStat__7F8E8D5FF90916AF] PRIMARY KEY CLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserToken]    Script Date: 2023-09-14 01:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserToken](
	[UserTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserLogin] [nvarchar](100) NOT NULL,
	[Token] [nvarchar](250) NOT NULL,
	[LastUsedAt] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK__UserToke__BD92DEDB60619A76] PRIMARY KEY CLUSTERED 
(
	[UserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Address_LocationId]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_Address_LocationId] ON [dbo].[Address]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Applicat__1EB4F8176BA0B319]    Script Date: 2023-09-14 01:13:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Applicat__1EB4F8176BA0B319] ON [dbo].[ApplicationToken]
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompletedRide_PlannedRideId]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_CompletedRide_PlannedRideId] ON [dbo].[CompletedRide]
(
	[PlannedRideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CompletedRide_UserLogin1]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_CompletedRide_UserLogin1] ON [dbo].[CompletedRide]
(
	[UserLogin1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompletedRidePoint_LocationId]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_CompletedRidePoint_LocationId] ON [dbo].[CompletedRidePoint]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contact_UserLogin]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_Contact_UserLogin] ON [dbo].[Contact]
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InterestPoint_AddressId]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_InterestPoint_AddressId] ON [dbo].[InterestPoint]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InterestPoint_UserLogin]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_InterestPoint_UserLogin] ON [dbo].[InterestPoint]
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PlannedRide_UserLoginNavigationUserLogin]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_PlannedRide_UserLoginNavigationUserLogin] ON [dbo].[PlannedRide]
(
	[UserLoginNavigationUserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlannedRidePoint_LocationId1]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_PlannedRidePoint_LocationId1] ON [dbo].[PlannedRidePoint]
(
	[LocationId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tracksen__7F8E8D5EC0100CC1]    Script Date: 2023-09-14 01:13:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Tracksen__7F8E8D5EC0100CC1] ON [dbo].[Tracksense]
(
	[UserLogin] ASC
)
WHERE ([UserLogin] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__7F8E8D5EC31A1ED4]    Script Date: 2023-09-14 01:13:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__user__7F8E8D5EC31A1ED4] ON [dbo].[user]
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserToken_UserLogin]    Script Date: 2023-09-14 01:13:11 ******/
CREATE NONCLUSTERED INDEX [IX_UserToken_UserLogin] ON [dbo].[UserToken]
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserToke__1EB4F817FB3EA34C]    Script Date: 2023-09-14 01:13:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__UserToke__1EB4F817FB3EA34C] ON [dbo].[UserToken]
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Location]
GO
ALTER TABLE [dbo].[CompletedRide]  WITH CHECK ADD  CONSTRAINT [FK_CompletedRide_PlannedRide_PlannedRideId] FOREIGN KEY([PlannedRideId])
REFERENCES [dbo].[PlannedRide] ([PlannedRideId])
GO
ALTER TABLE [dbo].[CompletedRide] CHECK CONSTRAINT [FK_CompletedRide_PlannedRide_PlannedRideId]
GO
ALTER TABLE [dbo].[CompletedRide]  WITH CHECK ADD  CONSTRAINT [FK_CompletedRide_user_UserLogin1] FOREIGN KEY([UserLogin1])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[CompletedRide] CHECK CONSTRAINT [FK_CompletedRide_user_UserLogin1]
GO
ALTER TABLE [dbo].[CompletedRidePoint]  WITH CHECK ADD  CONSTRAINT [FK_CompletedRidePoint_CompletedRide_CompletedRideId] FOREIGN KEY([CompletedRideId])
REFERENCES [dbo].[CompletedRide] ([CompletedRideId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompletedRidePoint] CHECK CONSTRAINT [FK_CompletedRidePoint_CompletedRide_CompletedRideId]
GO
ALTER TABLE [dbo].[CompletedRidePoint]  WITH CHECK ADD  CONSTRAINT [FK_CompletedRidePoint_Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompletedRidePoint] CHECK CONSTRAINT [FK_CompletedRidePoint_Location_LocationId]
GO
ALTER TABLE [dbo].[CompletedRideStatistics]  WITH CHECK ADD  CONSTRAINT [FK_CompletedRideStatistics_CompletedRide] FOREIGN KEY([CompletedRideId])
REFERENCES [dbo].[CompletedRide] ([CompletedRideId])
GO
ALTER TABLE [dbo].[CompletedRideStatistics] CHECK CONSTRAINT [FK_CompletedRideStatistics_CompletedRide]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_User]
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_User]
GO
ALTER TABLE [dbo].[InterestPoint]  WITH CHECK ADD  CONSTRAINT [FK_InterestPoint_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[InterestPoint] CHECK CONSTRAINT [FK_InterestPoint_Address]
GO
ALTER TABLE [dbo].[InterestPoint]  WITH CHECK ADD  CONSTRAINT [FK_InterestPoint_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[InterestPoint] CHECK CONSTRAINT [FK_InterestPoint_User]
GO
ALTER TABLE [dbo].[PlannedRide]  WITH CHECK ADD  CONSTRAINT [FK_PlannedRide_user_UserLoginNavigationUserLogin] FOREIGN KEY([UserLoginNavigationUserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[PlannedRide] CHECK CONSTRAINT [FK_PlannedRide_user_UserLoginNavigationUserLogin]
GO
ALTER TABLE [dbo].[PlannedRidePoint]  WITH CHECK ADD  CONSTRAINT [FK_PlannedRidePoint_Location_LocationId1] FOREIGN KEY([LocationId1])
REFERENCES [dbo].[Location] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlannedRidePoint] CHECK CONSTRAINT [FK_PlannedRidePoint_Location_LocationId1]
GO
ALTER TABLE [dbo].[PlannedRidePoint]  WITH CHECK ADD  CONSTRAINT [FK_PlannedRidePoint_PlannedRide_PlannedRideId] FOREIGN KEY([PlannedRideId])
REFERENCES [dbo].[PlannedRide] ([PlannedRideId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlannedRidePoint] CHECK CONSTRAINT [FK_PlannedRidePoint_PlannedRide_PlannedRideId]
GO
ALTER TABLE [dbo].[PlannedRideStatistics]  WITH CHECK ADD  CONSTRAINT [FK_PlannedRideStatistics_PlannedRide_PlannedRideId] FOREIGN KEY([PlannedRideId])
REFERENCES [dbo].[PlannedRide] ([PlannedRideId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlannedRideStatistics] CHECK CONSTRAINT [FK_PlannedRideStatistics_PlannedRide_PlannedRideId]
GO
ALTER TABLE [dbo].[Tracksense]  WITH CHECK ADD  CONSTRAINT [FK_Tracksense_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[Tracksense] CHECK CONSTRAINT [FK_Tracksense_User]
GO
ALTER TABLE [dbo].[UserStatistics]  WITH CHECK ADD  CONSTRAINT [FK_UserStatistics_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[UserStatistics] CHECK CONSTRAINT [FK_UserStatistics_User]
GO
ALTER TABLE [dbo].[UserToken]  WITH CHECK ADD  CONSTRAINT [FK_UserToken_User] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[user] ([UserLogin])
GO
ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK_UserToken_User]
GO
USE [master]
GO
ALTER DATABASE [tracksense] SET  READ_WRITE 
GO
