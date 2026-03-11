
-- CR41 Database Changes

-- Drop foreign key constraint
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionNote_ProfileVersionSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionNote]'))
ALTER TABLE [dbo].[ProfileVersionNote] DROP CONSTRAINT [FK_ProfileVersionNote_ProfileVersionSection]
GO

IF NOT EXISTS(SELECT * FROM SYS.COLUMNS WHERE [Name] = N'ProfileSectionId' AND Object_ID = Object_ID(N'ProfileVersionNoteQuestion'))
BEGIN
	ALTER TABLE [ProfileVersionNoteQuestion] ADD [ProfileSectionId] UNIQUEIDENTIFIER NULL
END
GO

IF EXISTS(SELECT * FROM SYS.COLUMNS WHERE [Name] = N'ProfileSectionId' AND Object_ID = Object_ID(N'ProfileVersionNote'))	
BEGIN

	DECLARE @ProfileVersionNoteId UNIQUEIDENTIFIER
	DECLARE @ProfileQuestionId UNIQUEIDENTIFIER	
	DECLARE @ProfileSectionId UNIQUEIDENTIFIER
	
	DECLARE c1 CURSOR FOR
	SELECT ProfileVersionNoteId, ProfileQuestionId
	FROM ProfileVersionNoteQuestion

	OPEN c1

	FETCH NEXT FROM c1
	INTO @ProfileVersionNoteId, @ProfileQuestionId

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		SELECT 
			@ProfileSectionId = ProfileSectionId
		FROM
			ProfileQuestion
		WHERE
			Id = @ProfileQuestionId

		-- populate the new profile section id column
		UPDATE ProfileVersionNoteQuestion
		SET
			ProfileSectionId = @ProfileSectionId
		WHERE
			ProfileVersionNoteId = @ProfileVersionNoteId AND
			ProfileQuestionId = @ProfileQuestionId

		FETCH NEXT FROM c1
		INTO @ProfileVersionNoteId, @ProfileQuestionId
	END

	CLOSE c1
	DEALLOCATE c1

	ALTER TABLE [ProfileVersionNoteQuestion] ALTER COLUMN [ProfileSectionId] UNIQUEIDENTIFIER NOT NULL

	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProfileVersionNoteQuestion]') AND name = N'PK_ProfileVersionNoteQuestion')
	BEGIN
		ALTER TABLE [dbo].[ProfileVersionNoteQuestion] DROP CONSTRAINT [PK_ProfileVersionNoteQuestion]
	END

	-- Drop the profile section id column from the Profile version note table
	ALTER TABLE [ProfileVersionNote] DROP COLUMN [ProfileSectionId]

END
GO

-- Add profile section id foreign key to ProfileVersionNoteQuestion table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_ID = OBJECT_ID(N'FK_ProfileVersionNoteQuestion_ProfileSection') AND type = (N'F'))
BEGIN
	ALTER TABLE [ProfileVersionNoteQuestion] ADD CONSTRAINT FK_ProfileVersionNoteQuestion_ProfileSection
	FOREIGN KEY ([ProfileSectionId]) REFERENCES ProfileSection([Id])
END
GO

-- Add clustered primary key to ProfileVersionNoteQuestion
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProfileVersionNoteQuestion]') AND name = N'PK_ProfileVersionNoteQuestion')
BEGIN
	ALTER TABLE [dbo].[ProfileVersionNoteQuestion] ADD  CONSTRAINT [PK_ProfileVersionNoteQuestion] PRIMARY KEY CLUSTERED 
	(
		[ProfileVersionNoteId] ASC,
		[ProfileQuestionId] ASC,
		[ProfileSectionId] ASC
	)
END
GO

-- Add profile version id foreign key to profile version note table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_ID = OBJECT_ID(N'FK_ProfileVersionNote_ProfileVersion') AND type = (N'F'))
BEGIN
	ALTER TABLE [ProfileVersionNote] ADD CONSTRAINT FK_ProfileVersionNote_ProfileVersion
	FOREIGN KEY ([ProfileVersionId]) REFERENCES ProfileVersion([Id])
END
GO


