-----------------------------------------------------------------------------------------
--- CR51Changes250211.SQL
----------------------------------------------------------------------------------------- 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luProfileStatusType]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[luProfileStatusType]
(
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] VARCHAR(50) NOT NULL,
    [IsValidationComplete] bit NOT NULL,
    [SequenceNumber] INTEGER NOT NULL
)

ALTER TABLE [dbo].[luProfileStatusType] ADD CONSTRAINT
	[PK_luProfileStatus] PRIMARY KEY CLUSTERED 
	(
	[Id]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

END

IF NOT EXISTS (SELECT * FROM [dbo].[luProfileStatusType] WHERE [Id] = '10AA936B-9607-4D3B-BBE5-D2839575A585')
BEGIN

INSERT INTO [dbo].[luProfileStatusType]
(
[Id],
[Name],
[IsValidationComplete],
[SequenceNumber]
)
VALUES
(
'10AA936B-9607-4D3B-BBE5-D2839575A585',
'Cloned content',
0,
1
)

END

IF NOT EXISTS (SELECT * FROM [dbo].[luProfileStatusType] WHERE [Id] = '761C04E5-CE37-4DB5-BB75-297991B39EBE')
BEGIN

INSERT INTO [dbo].[luProfileStatusType]
(
[Id],
[Name],
[IsValidationComplete],
[SequenceNumber]
)
VALUES
(
'761C04E5-CE37-4DB5-BB75-297991B39EBE',
'Drafting underway',
0,
2
)

END

IF NOT EXISTS (SELECT * FROM [dbo].[luProfileStatusType] WHERE [Id] = 'B948B33D-5209-459D-BC43-DE70043F0E69')
BEGIN

INSERT INTO [dbo].[luProfileStatusType]
(
[Id],
[Name],
[IsValidationComplete],
[SequenceNumber]
)
VALUES
(
'B948B33D-5209-459D-BC43-DE70043F0E69',
'Scoring complete',
0,
3
)

END

IF NOT EXISTS (SELECT * FROM [dbo].[luProfileStatusType] WHERE [Id] = 'D33AEA30-C5EB-434C-AE0D-4E3C64A973F7')
BEGIN

INSERT INTO [dbo].[luProfileStatusType]
(
[Id],
[Name],
[IsValidationComplete],
[SequenceNumber]
)
VALUES
(
'D33AEA30-C5EB-434C-AE0D-4E3C64A973F7',
'Under validation',
0,
4
)

END

IF NOT EXISTS (SELECT * FROM [dbo].[luProfileStatusType] WHERE [Id] = '316B1D17-BCB8-4550-B596-5F114F0C1683')
BEGIN

INSERT INTO [dbo].[luProfileStatusType]
(
[Id],
[Name],
[IsValidationComplete],
[SequenceNumber]
)
VALUES
(
'316B1D17-BCB8-4550-B596-5F114F0C1683',
'Validation complete',
1,
5
)

END

GO
IF NOT EXISTS(SELECT * FROM sys.columns WHERE [name] = 'ProfileStatus' AND Object_ID = Object_ID(N'Profile'))
BEGIN

ALTER TABLE [dbo].[Profile] ADD
	ProfileStatusId UNIQUEIDENTIFIER NULL

ALTER TABLE [dbo].[Profile] ADD CONSTRAINT
	FK_Profile_luProfileStatusType FOREIGN KEY
	(
	ProfileStatusId
	) REFERENCES [dbo].[luProfileStatusType]
	(
	Id
	)

END
GO

UPDATE 
	[Profile]
SET
	[ProfileStatusId] = NULL

GO