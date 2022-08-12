CREATE OR ALTER PROCEDURE CreateMember
    @OrgName NVARCHAR(64),
	@WID INT,
    @IsAdmin BIT
AS
MERGE [Events].Members M
USING (SELECT @OrgName, @WID, @IsAdmin) AS MM(OrgName, WID, IsAdmin) 
	INNER JOIN [Events].People P ON P.WID = MM.WID
	INNER JOIN [Events].Organizations O ON O.[Name] = MM.OrgName ON
    M.OrganizationID = O.OrganizationID AND
	M.PersonID = P.PersonID
WHEN NOT MATCHED THEN
    INSERT(OrganizationID, PersonID, IsAdmin)
    VALUES(O.OrganizationID, P.PersonID, MM.IsAdmin);
GO