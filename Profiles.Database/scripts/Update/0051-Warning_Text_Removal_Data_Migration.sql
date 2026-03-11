/* Table Changes (only needed once and all DBs now have this appart from client UAT and Prod */
/*

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WarningTextRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarningTexts] [varchar](300) NULL,
	[Completed] [bit] NOT NULL,
	[CompletedWithTrim] [bit] NOT NULL,
 CONSTRAINT [PK_WarningTextRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WarningTextRecords] ADD  CONSTRAINT [DF_WarningTextRecords_Completed]  DEFAULT ((0)) FOR [Completed]
GO

ALTER TABLE [dbo].[WarningTextRecords] ADD  CONSTRAINT [DF_WarningTextRecords_CompletedWithTrim]  DEFAULT ((0)) FOR [CompletedWithTrim]
GO

--*/



/* Ensure clean warning texts 
	Have been executed, only keeping for evidential in case the warning text records table ever
	need to be recreated from the flat file.
*/

/*
update [dbo].[WarningTextRecords]
set [WarningTexts] = REPLACE([WarningTexts], '"', '')

SELECT distinct [WarningTexts]
  FROM [SurveillanceProfilesProd].[dbo].[WarningTextRecords]
--*/


/* Clean up duplicate warning texts 
	Executed already, keeping it for evidential purposes in case the warning text records table ever
	need to be recreated from the flat file. 
--*/
/*

select count(*) NumberOfItems, [WarningTexts], min(id) as OneId
INTO #TempWarnings
FROM [dbo].[WarningTextRecords]
GROUP BY  [WarningTexts]
HAVING count(*) > 1

select * from #TempWarnings
ORDER BY [WarningTexts]

DELETE FROM [dbo].[WarningTextRecords] WHERE ID IN(
select [WarningTextRecords].ID
FROM [dbo].[WarningTextRecords]
	INNER JOIN #TempWarnings ON [WarningTextRecords].[WarningTexts] = #TempWarnings.[WarningTexts]
	AND [WarningTextRecords].[ID] <> #TempWarnings.OneID
--ORDER BY [WarningTextRecords].[WarningTexts]
)

DROP TABLE #TempWarnings

--*/

/***************************************************************************************************************

	THE ACTUAL MIGRATION SCRIPT

	It assumes the existence of the table [WarningTextRecords] in the same DB as where it needs to
	execute.

***************************************************************************************************************/

DECLARE @a_text varchar(300) 

DECLARE MIGRATOR_CURSOR CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR 
SELECT DISTINCT [WarningTexts] 
FROM [WarningTextRecords]
WHERE Completed = 0

OPEN MIGRATOR_CURSOR
FETCH NEXT FROM MIGRATOR_CURSOR INTO @a_text
WHILE @@FETCH_STATUS = 0
BEGIN 
    --Display the current warning text
    PRINT @a_text

	--Update the field values where this exact warning text is present
	UPDATE [dbo].[ProfileVersionFieldValue]
	SET [TextValue] = LTRIM(RTRIM(REPLACE([TextValue], @a_text, '')))
	WHERE [TextValue] LIKE '%' + @a_text + '%'
	UPDATE [WarningTextRecords] SET Completed = 1 WHERE [WarningTexts] = @a_text

    FETCH NEXT FROM MIGRATOR_CURSOR INTO @a_text
END
CLOSE MIGRATOR_CURSOR
DEALLOCATE MIGRATOR_CURSOR


DECLARE MIGRATOR_CURSOR_TRIM CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR 
SELECT DISTINCT [WarningTexts] 
FROM [WarningTextRecords]
WHERE CompletedWithTrim = 0

OPEN MIGRATOR_CURSOR_TRIM
FETCH NEXT FROM MIGRATOR_CURSOR_TRIM INTO @a_text
WHILE @@FETCH_STATUS = 0
BEGIN 
    --Display the current warning text
    PRINT @a_text

	UPDATE [dbo].[ProfileVersionFieldValue]
	SET [TextValue] = LTRIM(RTRIM(REPLACE([TextValue], LTRIM(RTRIM(@a_text)), '')))
	WHERE [TextValue] LIKE '%' + LTRIM(RTRIM(@a_text)) + '%'

	UPDATE [WarningTextRecords] SET CompletedWithTrim = 1 WHERE [WarningTexts] = @a_text

    FETCH NEXT FROM MIGRATOR_CURSOR_TRIM INTO @a_text
END
CLOSE MIGRATOR_CURSOR_TRIM
DEALLOCATE MIGRATOR_CURSOR_TRIM

--/*
IF @@Error = 0
BEGIN
		DECLARE @ScriptDate datetime
		DECLARE @ScriptVersion int = 35

		SELECT @ScriptDate = Getdate()


		INSERT INTO [dbo].[usd_AppliedDatabaseScript]
				   ([ScriptFile]
				   ,[DateApplied]
				   ,[Version]
				   ,[hash])
			 VALUES
				   ('0051-Warning_Text_Removal_Data_Migration.sql'
				   ,@ScriptDate
				   ,@ScriptVersion
				   ,'')
END

--*/

/*

-- Reset table to start again

UPDATE [dbo].[WarningTextRecords]
SET [Completed] = 0
	,[CompletedWithTrim] = 0


	-- DEV Server Prod2  execution: 1 hour 43 minutes  - 100% removal
	-- TEST Server Demo  execution: 1 hour 45 minutes  - 100% removal
	-- TEST Server Test  execution: 1 hour 43 minutes  - 99.9999 removal
--*/