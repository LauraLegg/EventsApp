-- Events App Tables

-- If the tables already exists, drop them
DROP TABLE IF EXISTS [Events].RecievedItems
DROP TABLE IF EXISTS [Events].Attendees
DROP TABLE IF EXISTS [Events].Members
DROP TABLE IF EXISTS [Events].Roles
DROP TABLE IF EXISTS [Events].People
DROP TABLE IF EXISTS [Events].Items
DROP TABLE IF EXISTS [Events].[Events]
DROP TABLE IF EXISTS [Events].Organizations
GO

CREATE TABLE [Events].Organizations
(
	OrganizationID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[NAME] NVARCHAR(64) NOT NULL UNIQUE,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].People
(
	PersonID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	WID INT NOT NULL UNIQUE,
	EID NVARCHAR(32) NOT NULL UNIQUE,
	FirstName NVARCHAR(64) NOT NULL,
	LastName NVARCHAR(64) NOT NULL
)

CREATE TABLE [Events].Members
(
	OrganizationID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].Organizations(OrganizationID),
	PersonID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].People(PersonID),
	IsAdmin BIT NOT NULL
)

CREATE TABLE [Events].[Events]
(
	EventID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OrganizationID INT NOT NULL FOREIGN KEY
		REFERENCES [Events].Organizations(OrganizationID),
	[Name] NVARCHAR(64) NOT NULL,
	[Location] NVARCHAR(64) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].Items
(
	ItemID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	EventID INT NOT NULL FOREIGN KEY
		REFERENCES [Events].[Events](EventID),
	[Name] NVARCHAR(64) NOT NULL,
	Purpose NVARCHAR(256) NOT NULL,
	Price FLOAT NOT NULL
)

CREATE TABLE [Events].[Roles]
(
	RoleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Title NVARCHAR(64) NOT NULL UNIQUE,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].Attendees
(
	AttendeeID INT NOT NULL IDENTITY(1,1) UNIQUE,
	PersonID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].People(PersonID),
	EventID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].[Events](EventID),
	RoleID	INT NOT NULL FOREIGN KEY
      REFERENCES [Events].[Roles](RoleID),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Reason NVARCHAR(32) NOT NULL

	Primary Key
	(
		AttendeeID,
		PersonID,
		EventID,
		RoleID
	)
)

CREATE TABLE [Events].RecievedItems
(
	AttendeeID INT FOREIGN KEY
		REFERENCES [Events].Attendees(AttendeeID),
	ItemID INT FOREIGN KEY
		REFERENCES [Events].Items(ItemID)
)

GO