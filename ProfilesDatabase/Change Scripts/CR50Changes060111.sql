------------------------------------------------------------------------------------------
--- CR50Changes060111.SQL
------------------------------------------------------------------------------------------ 

GO
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'DisplayPublic' AND Object_ID = Object_ID(N'dbo.luProfileReport'))
BEGIN
	ALTER TABLE [luProfileReport] ADD [DisplayPublic] BIT NOT NULL DEFAULT (0)		
END
GO

IF EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'DisplayPublic' AND Object_ID = Object_ID(N'dbo.luProfileReport'))
BEGIN

	UPDATE [luProfileReport]
	SET
		[DisplayPublic] = 0
	WHERE 
		[ReportName] = 'QABriefGUID' OR
		[ReportName] = 'FullProfileGUID'
	
	UPDATE [luProfileReport]
	SET
		[DisplayPublic] = 1
	WHERE 
		[ReportName] = 'SummaryProfileGUID' OR
		[ReportName] = 'SummaryPrioritisationGUID'

END
GO