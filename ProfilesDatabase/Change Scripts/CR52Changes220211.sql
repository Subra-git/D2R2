----------------------------------------------------------------------------------------
--- CR52Changes20110222.SQL
---------------------------------------------------------------------------------------- 

-- luReviewStatus table
GO
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luReviewStatus]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[luReviewStatus]
	(
		[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
		[Name] VARCHAR(50) NOT NULL,
		[SequenceNumber] TINYINT NOT NULL
	)
	END
GO

-- Insert lookup values in luReviewStatus
IF NOT EXISTS (SELECT * FROM [dbo].[luReviewStatus] WHERE [Id]='E3402606-AC66-4D56-B407-B5BDF7E4DBD6')
BEGIN
	INSERT INTO [luReviewStatus]
	(
	[Id],
	[Name],
	[SequenceNumber]        
	)
	VALUES
	(
	'E3402606-AC66-4D56-B407-B5BDF7E4DBD6',
	'Proposed',
	1
	)
END
GO

IF NOT EXISTS (SELECT * FROM [dbo].[luReviewStatus] WHERE [Id]='20396B82-3122-4EBC-94DC-455F93A31C86')
BEGIN      
	INSERT INTO [luReviewStatus]
	(
	[Id],
	[Name],
	[SequenceNumber]        
	)
	VALUES
	(
	'20396B82-3122-4EBC-94DC-455F93A31C86',
	'Active',
	2
	)
END
GO
     
IF NOT EXISTS (SELECT * FROM [dbo].[luReviewStatus] WHERE [Id]='16597B30-26E5-4BCB-8DBB-D8D8585CFAC3')
BEGIN      
	INSERT INTO [luReviewStatus]
	(
	[Id],
	[Name],
	[SequenceNumber]        
	)
	VALUES
	(
	'16597B30-26E5-4BCB-8DBB-D8D8585CFAC3',
	'Complete',
	3
	)
END
GO

-- add column PolicyReviewStatusId on ProfileVersionSection to record review status
GO
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'PolicyReviewStatusId' AND Object_ID = Object_ID(N'dbo.ProfileVersionSection'))
BEGIN
	ALTER TABLE [dbo].[ProfileVersionSection] ADD PolicyReviewStatusId uniqueidentifier NULL	
	
	ALTER TABLE [dbo].[ProfileVersionSection] ADD CONSTRAINT
	FK_ProfileVersionSection_luReviewStatus1 FOREIGN KEY
	(
	PolicyReviewStatusId
	) REFERENCES [dbo].[luReviewStatus]
	(
	Id
	)	
	
END
GO

--Set PolicyReviewStatusId to 'Complete' for all historical & published versions
UPDATE
	[ProfileVersionSection]
SET
	[ProfileVersionSection].[PolicyReviewStatusId] = '16597B30-26E5-4BCB-8DBB-D8D8585CFAC3'
FROM
	[ProfileVersionSection] INNER JOIN [ProfileVersion] ON
	[ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NOT NULL OR
	[ProfileVersion].[VersionMinor] = 0
	
GO

-- add column TechnicalReviewStatusId on ProfileVersionSection to record review status
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'TechnicalReviewStatusId' AND Object_ID = Object_ID(N'dbo.ProfileVersionSection'))
BEGIN
	ALTER TABLE [dbo].[ProfileVersionSection] ADD TechnicalReviewStatusId uniqueidentifier NULL
	
	ALTER TABLE [dbo].[ProfileVersionSection] ADD CONSTRAINT
	FK_ProfileVersionSection_luReviewStatus2 FOREIGN KEY
	(
	TechnicalReviewStatusId
	) REFERENCES [dbo].[luReviewStatus]
	(
	Id
	)			
END
GO
GO
--Set TechnicalReviewStatusId to 'Complete' for all rows
UPDATE
	[ProfileVersionSection]
SET	
	[ProfileVersionSection].[TechnicalReviewStatusId] = '16597B30-26E5-4BCB-8DBB-D8D8585CFAC3'	
FROM
	[ProfileVersionSection] INNER JOIN [ProfileVersion] ON
	[ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NOT NULL OR
	[ProfileVersion].[VersionMinor] = 0
	

GO
-- add column ReviewEmail on ProfileSectionUser 
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'ReviewEmail' AND Object_ID = Object_ID(N'dbo.ProfileSectionUser'))
BEGIN
	ALTER TABLE [dbo].[ProfileSectionUser] ADD
		[ReviewEmail] bit Default 0 NOT NULL 
END
GO

-- Add email address field to user table
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'EmailAddress' AND Object_ID = Object_ID(N'dbo.User'))
BEGIN
	ALTER TABLE [dbo].[User] ADD
		[EmailAddress] varchar(50) NULL 	
END
GO

--Policy review completed column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'PolicyReviewCompleted' AND Object_ID = Object_ID(N'dbo.ProfileVersionSection'))
BEGIN
	ALTER TABLE [dbo].[ProfileVersionSection] ADD PolicyReviewCompleted DATETIME NULL	
END
GO

-- Technical review completed column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE [Name] = N'TechnicalReviewCompleted' AND Object_ID = Object_ID(N'dbo.ProfileVersionSection'))
BEGIN
	ALTER TABLE [dbo].[ProfileVersionSection] ADD TechnicalReviewCompleted DATETIME NULL	
END
GO
