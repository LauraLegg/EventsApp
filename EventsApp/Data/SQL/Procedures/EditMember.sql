CREATE OR ALTER PROCEDURE EditMember
    @OrganizationID INT,
	@PersonID INT,
    @IsAdmin BIT
AS
UPDATE [Events].Members
SET IsAdmin = @IsAdmin
WHERE
    OrganizationID = @OrganizationID AND
	PersonID = @PersonID AND
       (IsAdmin <> @IsAdmin)
GO