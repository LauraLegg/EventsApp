CREATE OR ALTER PROCEDURE CreateItem
    @EventName NVARCHAR(64),
    @Name NVARCHAR(64),
	@Purpose NVARCHAR(256),
    @Price FLOAT
AS
MERGE [Events].Items I
USING (SELECT @EventName, @Name, @Purpose, @Price) AS MI(EventName, [Name], Purpose, Price) 
	INNER JOIN [Events].[Events] E ON E.[Name] = MI.EventName ON
	I.EventID = E.EventID
WHEN NOT MATCHED THEN
    INSERT(EventID, [Name], Purpose, Price)
    VALUES(E.EventID, MI.[Name], MI.Purpose, MI.Price);
GO