CREATE OR ALTER PROCEDURE CreateAttendee
	@WID INT,
	@EventName NVARCHAR(32),
    @Title NVARCHAR(64),
    @StartDate DATE,
	@EndDate DATE,
    @Reason NVARCHAR(32)
AS
MERGE [Events].Attendees A
USING (SELECT @EventName, @WID, @Title, @StartDate, @EndDate, @Reason) AS MA(EventName, WID, Title, StartDate, EndDate, Reason) 
	INNER JOIN [Events].[Events] E ON E.[Name] = MA.EventName
	INNER JOIN [Events].People P ON P.WID = MA.WID
	INNER JOIN [Events].Roles R ON R.Title = MA.Title ON
	A.EventID = E.EventID AND
	A.PersonID = P.PersonID AND
    A.RoleID = R.RoleID AND
    A.StartDate = MA.StartDate AND
	A.EndDate = MA.EndDate
WHEN NOT MATCHED THEN
    INSERT(EventID, PersonID, RoleID, StartDate, EndDate, Reason)
    VALUES(E.EventID, P.PersonID, R.RoleID, MA.StartDate, MA.EndDate, MA.Reason);
GO