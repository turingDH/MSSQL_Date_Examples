/*
MS SQL Server for DebIan
sqlcmd -S localhost -U SA -P yourpassword -i dates.sql -o results.txt
*/


-- if some of these seem confusing, just separate some of the parentheses out to give visual whitespace
-- these all use DATEDIFF, which counts in units given from the epoch.  Run: CAST(0 as DATETIME) to see
SELECT
GETDATE() AS getDate,
CAST(GETDATE() AS DATE) AS dateToday,
GETDATE() -1 AS yesterday,
DATEADD(mm, DATEDIFF(mm,  0, GETDATE()),  0) AS startOfCurMonth,
DATEADD(mm, DATEDIFF(mm, -1, GETDATE()), -1) AS endOfCurMonth,
DATEADD(dd, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE())+1,0)) AS alsoEndOfCurMonth,
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) -1, 0) AS startOfPrevMonth,
DATEADD(mm, DATEDIFF(mm, -1, GETDATE()) -12, -1) AS endOfMonthLastYear,
DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0) AS startofCurQuarter,
DATEADD(dd, -1, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()) +1, 0)) AS endOfCurQuarter,
DATEADD(qq, DATEDIFF(qq, 0, GETDATE()) -1, 0) AS startOfPrevQuarter,
DATEADD(dd, -1, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0)) AS endOfPrevQuarter,
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) AS startOfCurYear,
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1) AS endOfCurYear,
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -1, 0) AS startOfPrevYear,
DATEADD(dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)) AS endOfPrevYear
GO


-- some various formats.
SELECT
CONVERT(VARCHAR(8), GETDATE(), 1)   AS convertFormatOne,
CONVERT(VARCHAR(8), GETDATE(), 2)   AS convertFormatTwo,
CONVERT(VARCHAR(10), GETDATE(), 101) AS convertFormatOneZedOne,
CONVERT(VARCHAR(10), GETDATE(), 121) AS convertFormatOneTwoOne,
CONVERT(VARCHAR(19), GETDATE(), 121) AS convertFormatOneTwoOne
GO

