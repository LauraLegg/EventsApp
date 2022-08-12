CREATE OR ALTER PROCEDURE EditPerson
	@WID INT,
	@FirstName NVARCHAR(64),
	@LastName NVARCHAR(64),
	@PersonID INT
AS
UPDATE [Events].People
SET WID = @WID, FirstName = @FirstName, LastName = @LastName
WHERE
	PersonID = @PersonID AND
		(WID <> @WID OR
		FirstName <> @FirstName OR
		LastName <> @LastName)
GO