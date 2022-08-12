CREATE OR ALTER PROCEDURE CreateEvent
    @Name NVARCHAR(64),
	@OrgName NVARCHAR(64),
    @Location NVARCHAR(64),
    @StartDate DATE,
    @EndDate DATE,
	@Description NVARCHAR(256)
AS
MERGE [Events].[Events] E
USING (SELECT @Name, @OrgName, @Location, @StartDate, @EndDate, @Description) AS ME([Name], OrgName, [Location], StartDate, EndDate, [Description]) 
	INNER JOIN [Events].Organizations O ON O.[Name] = ME.OrgName ON
	E.OrganizationID = O.OrganizationID
WHEN NOT MATCHED THEN
    INSERT(OrganizationID, [Name], [Location], StartDate, EndDate, [Description])
    VALUES(O.OrganizationID, ME.[Name], ME.[Location], ME.StartDate, ME.EndDate, ME.[Description]);
GO