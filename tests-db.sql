USE [tempdb]
GO

IF OBJECT_ID('MyTests') IS NOT NULL
    DROP DATABASE [MyTests]
GO

CREATE DATABASE [MyTests]
GO

USE [MyTests]
GO

IF (OBJECT_ID('testdbo') IS NOT NULL)
    DROP SCHEMA [testdbo]
GO

CREATE SCHEMA [testdbo]
GO

IF OBJECT_ID('test.Test') IS NOT NULL
    DROP TABLE [testdbo].[Test]
GO

CREATE TABLE [testdbo].[Test]
(
[Id] INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(10) NOT NULL,
[Description] NVARCHAR(200),
[Comments] NVARCHAR(100),
[Is H] BIT NOT NULL
)
GO