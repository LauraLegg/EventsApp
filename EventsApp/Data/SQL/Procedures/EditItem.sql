CREATE OR ALTER PROCEDURE EditItem
    @ItemID INT,
	@EventID INT,
    @Name NVARCHAR(64),
	@Purpose NVARCHAR(256),
    @Price FLOAT
AS
UPDATE [Events].Items
SET EventID = @EventID, [Name] = @Name, Purpose = @Purpose, Price = @Price
WHERE
    ItemID = @ItemID AND
       (EventID <> @EventID OR
		[Name] <> @Name OR
        Purpose <> @Purpose OR
        Price <> @Price)
GO