CREATE OR ALTER PROCEDURE EditRole
	@Title NVARCHAR(64),
	@Description NVARCHAR(256),
	@RoleID INT
AS
UPDATE [Events].Roles
SET Title = @Title, [Description] = @Description
WHERE
	RoleID = @RoleID AND
		(Title <> @Title OR
		[Description] <> @Description)
GO