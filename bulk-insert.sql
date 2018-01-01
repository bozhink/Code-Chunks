USE [MyTests]
GO

BULK
INSERT [testdbo].[Test]
FROM 'C:\temp\simple-data.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)