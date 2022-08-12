CREATE OR ALTER PROCEDURE CreateRecievedItem
    @AttendeeID INT,
	@ItemID INT
AS
MERGE [Events].RecievedItems RI
USING (SELECT @AttendeeID, @ItemID) AS MRI(AttendeeID, ItemID) ON 
	RI.AttendeeID = MRI.AttendeeID AND
	RI.ItemID = MRI.ItemID
WHEN NOT MATCHED THEN
    INSERT(AttendeeID, ItemID)
    VALUES(MRI.AttendeeID, MRI.ItemID);
GO