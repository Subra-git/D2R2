
--Import
-- Must set the @PathFileName
-- Import only requires the Id and questionNumber columns
SET QUOTED_IDENTIFIER OFF

CREATE TABLE #tmp 
(
Id uniqueidentifier NOT NULL,
QuestionNumber int NOT NULL 
)

go

DECLARE @SQL varchar(1000)
DECLARE @PathFileName varchar(100)

SET @PathFileName = 'c:\Import.txt'

SET @SQL = "BULK INSERT #tmp FROM '"+@PathFileName+"' WITH (FIELDTERMINATOR = ',') "

EXEC (@SQL)

INSERT INTO [ProfileVersionNoteQuestion] (ProfileVersionNoteId, ProfileQuestionId)
SELECT 
	#tmp.[Id],
	[ProfileQuestion].[Id]
FROM 
	#tmp INNER JOIN
	[ProfileVersionNote] ON #tmp.[Id] = [ProfileVersionNote].[Id] INNER JOIN
	[ProfileQuestion] ON [ProfileVersionNote].[ProfileSectionId] = [ProfileQuestion].[ProfileSectionId]
WHERE
	[ProfileQuestion].[QuestionNumber] = #tmp.[QuestionNumber]

DROP TABLE #tmp



