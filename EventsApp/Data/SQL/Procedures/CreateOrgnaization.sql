CREATE OR ALTER PROCEDURE CreateOrganization
    @Name NVARCHAR(64),
	@Description NVARCHAR(256)
AS
MERGE [Events].Organizations O
USING (SELECT @Name, @Description) AS MO([Name], [Description]) ON O.[Name] = MO.[Name]
WHEN NOT MATCHED THEN
    INSERT([Name],[Description])
    VALUES(MO.[Name], MO.[Description]);
GO