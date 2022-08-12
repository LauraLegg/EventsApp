-- Create Events schema if it doesn't exist.

IF NOT EXISTS
   (
      SELECT *
      FROM sys.schemas s
      WHERE s.[name] = N'Events'
   )
BEGIN
   EXEC(N'CREATE SCHEMA [Events] AUTHORIZATION [dbo]');
END;