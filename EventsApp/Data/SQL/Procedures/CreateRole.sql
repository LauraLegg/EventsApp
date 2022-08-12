CREATE OR ALTER PROCEDURE CreateRole
	@Title NVARCHAR(64),
	@Description NVARCHAR(256)
AS
MERGE [Events].Roles R
USING (SELECT @Title, @Description) AS MR(Title, [Description]) ON R.Title = MR.Title
WHEN NOT MATCHED THEN
    INSERT(Title,[Description])
    VALUES(MR.Title, MR.[Description]);
GO