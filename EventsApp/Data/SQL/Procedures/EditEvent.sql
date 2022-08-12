CREATE OR ALTER PROCEDURE EditEvent
    @Name NVARCHAR(64),
    @Location NVARCHAR(64),
    @StartDate DATE,
    @EndDate DATE,
	@Description NVARCHAR(256),
    @EventID INT
AS
UPDATE [Events].[Events]
SET [Name] = @Name, [Location] = @Location, StartDate = @StartDate, EndDate = @EndDate, [Description] = @Description
WHERE
    EventID = @EventID AND
       ([Name] <> @Name OR
        [Location] <> @Location OR
        StartDate <> @StartDate OR
        EndDate <> @EndDate OR
		[Description] <> @Description)
GO