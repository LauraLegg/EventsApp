CREATE OR ALTER PROCEDURE CreateFromData
     @OrgName NVARCHAR(64),				--Organizations
	 @OrgDescription NVARCHAR(256),
	 @WID INT,							--People
     @EID NVARCHAR(64),
     @FirstName NVARCHAR(64),
     @LastName NVARCHAR(64),
	 @IsAdmin BIT,						--Members
     @EventName NVARCHAR(64),			--Events
     @EventLocation NVARCHAR(64),
     @EventStart DATE,
     @EventEnd DATE,
	 @EventDescription NVARCHAR(256),
	 @ItemName NVARCHAR(64),			--Item
	 @Purpose NVARCHAR(256),
	 @Price FLOAT,
     @Title NVARCHAR(64),				--Role
     @DRoleDescription NVARCHAR(256),
	 @AttendStart DATE,					--Attendance
	 @AttendEnd DATE,
     @Reason NVARCHAR(32)

AS

-- Organizations
MERGE [Events].Organizations O
USING (SELECT @OrgName, @OrgDescription) AS MO([Name], [Description]) ON O.[Name] = MO.[Name]
WHEN NOT MATCHED THEN
    INSERT([Name],[Description])
    VALUES(MO.[Name], MO.[Description]);

-- People
MERGE [Events].People P
USING (SELECT @WID, @EID, @FirstName, @LastName) AS MP(WID, EID, FirstName, LastName) ON P.WID = MP.WID
WHEN NOT MATCHED THEN
    INSERT(WID, EID, FirstName, LastName)
    VALUES(MP.WID, MP.EID, MP.FirstName, MP.LastName);

-- Members
MERGE [Events].Members M
USING (SELECT @WID, @OrgName, @IsAdmin) AS MM(WID, OrgName, IsAdmin)
	INNER JOIN [Events].People P ON P.WID = MM.WID
	INNER JOIN [Events].Organizations O ON O.[Name] = MM.OrgName ON
	M.PersonID = P.PersonID AND
	M.OrganizationID = O.OrganizationID
WHEN NOT MATCHED THEN
    INSERT(OrganizationID, PersonID, IsAdmin)
    VALUES(O.OrganizationID, P.PersonID, MM.IsAdmin);

-- Events
MERGE [Events].[Events] E
USING (SELECT @EventName, @EventLocation, @EventStart, @EventEnd, @EventDescription) AS ME([Name], [Location], StartDate, EndDate, [Description]) ON E.[Name] = ME.[Name]
WHEN NOT MATCHED THEN
    INSERT([Name], [Location], StartDate, EndDate, [Description])
    VALUES(ME.[Name], ME.[Location], ME.StartDate, ME.EndDate, ME.[Description]);

-- Items
MERGE [Events].Items I
USING (SELECT @EventName, @ItemName, @Purpose, @Price) AS MI(EventName, [Name], Purpose, Price) 
	INNER JOIN [Events].[Events] E ON E.[Name] = MI.EventName ON
	I.EventID = E.EventID
WHEN NOT MATCHED THEN
    INSERT(EventID, [Name], Purpose, Price)
    VALUES(E.EventID, MI.[Name], MI.Purpose, MI.Price);

-- Roles
MERGE [Events].Roles R
USING (SELECT @Title, @DRoleDescription) AS MR(Title, [Description]) ON R.Title = MR.Title
WHEN NOT MATCHED THEN
    INSERT(Title,[Description])
    VALUES(MR.Title, MR.[Description]);

-- Attendees
MERGE [Events].Attendees A
USING (SELECT @EventName, @WID, @Title, @AttendStart, @AttendEnd, @Reason) AS MA(EventName, WID, Title, AttendStart, AttendEnd, Reason) 
	INNER JOIN [Events].[Events] E ON E.[Name] = MA.EventName
	INNER JOIN [Events].[People] P ON P.WID = MA.WID
	INNER JOIN [Events].[Roles] R ON R.Title = MA.Title ON
	A.EventID = E.EventID AND
	A.PersonID = P.PersonID AND
    A.RoleID = R.RoleID AND
    A.StartDate = MA.AttendStart AND
	A.EndDate = MA.AttendEnd
WHEN NOT MATCHED THEN
    INSERT(EventID, PersonID, RoleID, StartDate, EndDate, Reason)
    VALUES(E.EventID, P.PersonID, R.RoleID, MA.AttendStart, MA.AttendEnd, MA.Reason);

-- RecievedItems
MERGE [Events].RecievedItems RI
USING (SELECT @AttendStart, @ItemName) AS MRI(AttendStart, ItemName) 
	INNER JOIN [Events].Attendees A ON A.StartDate = MRI.AttendStart
	INNER JOIN [Events].Items I ON I.[Name] = MRI.ItemName ON
	RI.AttendeeID = A.AttendeeID AND
	RI.ItemID = I.ItemID
WHEN NOT MATCHED THEN
    INSERT(AttendeeID, ItemID)
    VALUES(A.AttendeeID, I.ItemID);