-- Events App Tables

-- If the tables already exists, drop them
DROP TABLE IF EXISTS [Events].Person
DROP TABLE IF EXISTS [Events].Organization
DROP TABLE IF EXISTS [Events].[Event]
DROP TABLE IF EXISTS [Events].Item
DROP TABLE IF EXISTS [Events].[Role]
DROP TABLE IF EXISTS [Events].Attendance
GO

CREATE TABLE [Events].Person
(
	PersonID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	WID INT NOT NULL UNIQUE,
	FirstName NVARCHAR(32) NOT NULL,
	LastName NVARCHAR(32) NOT NULL
)

CREATE TABLE [Events].Organization
(
	OrganizationID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[NAME] NVARCHAR(64) NOT NULL UNIQUE,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].[Event]
(
	EventID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(32) NOT NULL,
	[Location] NVARCHAR(32) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].Item
(
	ItemID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(32) NOT NULL,
	Purpose NVARCHAR(256) NOT NULL
)

CREATE TABLE [Events].[Role]
(
	RoleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Title NVARCHAR(32) NOT NULL,
	[Description] NVARCHAR(256)
)

CREATE TABLE [Events].Attendance
(
	PersonID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].Person(PersonID),
	EventID INT NOT NULL FOREIGN KEY
      REFERENCES [Events].[Event](EventID),
	RoleID	INT NOT NULL FOREIGN KEY
      REFERENCES [Events].[Role](RoleID),
	ItemID	INT NOT NULL FOREIGN KEY
      REFERENCES [Events].Item(ItemID),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Reason NVARCHAR(32)

	Primary Key
	(
		PersonID,
		EventID,
		RoleID,
		ItemID
	)
)

GO