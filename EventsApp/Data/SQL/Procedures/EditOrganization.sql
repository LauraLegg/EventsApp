CREATE OR ALTER PROCEDURE EditOrganization
    @Name NVARCHAR(64),
	@Description NVARCHAR(256),
    @OrganizationID INT
AS
UPDATE [Events].Organizations
SET [Name] = @Name, [Description] = @Description
WHERE
    OrganizationID = @OrganizationID AND
       ([Name] <> @Name OR
	    [Description] <> @Description)
GO