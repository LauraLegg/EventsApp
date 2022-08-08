-- Create Events database if it does not exist.

USE master
GO

-- Check if database exists and create if not
IF NOT EXISTS
(
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'EventsApp'
)
CREATE DATABASE EventsApp
GO

-- Ensure we are using ACMEvents
USE EventsApp
GO