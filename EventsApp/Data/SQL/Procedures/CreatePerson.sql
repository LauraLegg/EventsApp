CREATE OR ALTER PROCEDURE CreatePerson
	@WID INT,
	@EID NVARCHAR(32),
	@FirstName NVARCHAR(64),
	@LastName NVARCHAR(64)
AS
MERGE [Events].People P
USING (SELECT @WID, @EID, @FirstName, @LastName) AS MP(WID, EID, FirstName, LastName) ON 
	P.WID = MP.WID AND
	P.EID = MP.EID
WHEN NOT MATCHED THEN
    INSERT(WID, EID, FirstName, LastName)
    VALUES(MP.WID, MP.EID, MP.FirstName, MP.LastName);
GO