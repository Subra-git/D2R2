/* NB: Run RunPrioritisationCalculation.sql after running this script */
/*----------------------------------------------------------------------- */

/* 2.2.5 Provision of spell checking facilities   */
CREATE TABLE [dbo].[SpellCustomWord]
	(
	Id uniqueidentifier NOT NULL,
	Word varchar(255) NOT NULL,
	LastUpdated timestamp NOT NULL
	)  ON [PRIMARY]
GO

ALTER TABLE [dbo].[SpellCustomWord] ADD CONSTRAINT
	PK_SpellCustomWord PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO 

/* 2.2.1 Profile scenarios continued*/ 
ALTER TABLE
	[ProfileVersion]
ADD
	[ScenarioTitle] varchar(255) NULL
GO

UPDATE
	[ProfileVersion]
SET
	[ScenarioTitle] = [Profile].[ScenarioTitle]
FROM
	[ProfileVersion] INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
WHERE
	[Profile].[ScenarioTitle] IS NOT NULL

ALTER TABLE
	[ProfileVersion]
DROP COLUMN
	[LastUpdated]
GO

ALTER TABLE
	[ProfileField]
ADD
	[IsReadOnlyCurrentSituation] bit NULL,
	[IsReadOnlyScenario] bit NULL,
	[DefaultValue] text NULL
GO

UPDATE
	[ProfileField]
SET
	[IsReadOnlyCurrentSituation] = [IsReadOnly],
	[IsReadOnlyScenario] = 0

ALTER TABLE 
	[ProfileField]
DROP CONSTRAINT
	[DF_ProfileField_IsReadOnly]
GO

ALTER TABLE
	[ProfileField]
DROP COLUMN
	[IsReadOnly]
GO

ALTER TABLE
	[ProfileField]
ALTER COLUMN
	[IsReadOnlyCurrentSituation] bit NOT NULL
GO

ALTER TABLE
	[ProfileField]
ALTER COLUMN
	[IsReadOnlyScenario] bit NOT NULL
GO

ALTER TABLE 
	[ProfileField]
ADD CONSTRAINT
	[DF_ProfileField_IsReadOnlyCurrentSituation] DEFAULT 0 FOR [IsReadOnlyCurrentSituation]
GO

ALTER TABLE 
	[ProfileField]
ADD CONSTRAINT
	[DF_ProfileField_IsReadOnlyScenario] DEFAULT 0 FOR [IsReadOnlyScenario]
GO

INSERT INTO [ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance]
	)
VALUES
	(
	'A8708502-9AE2-4DCD-9510-291B90658B19',
	'Scenario description',
	'Scenario Description',
	'1ED0595D-3E1A-49D4-B340-C0D41E17D045',
	4,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
	)

INSERT INTO [ProfileField]
	(
	[Id],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue]
	)
VALUES
	(
	'06EFA477-EE11-4987-A021-31952082F2F2',
	'Scenario Description',
	'A8708502-9AE2-4DCD-9510-291B90658B19',
	1,
	'd297f63b-638a-4574-b042-97c248338a26',
	1,
	0,
	0,
	'''The data presented in this profile is based on the current situation for this disease/issue.'''
	)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.Columns WHERE table_name='Summary' AND column_name='ScenarioDescription') BEGIN
ALTER TABLE
	[Summary]
ADD
	[ScenarioDescription] text NULL
END

GO

-- Write default text into the ScenarioDescription column into current drafts and all published versions of existing "current situation" profiles
UPDATE
	[Summary]
SET
	[ScenarioDescription] = 'The data presented in this profile is based on the current situation for this disease/issue.'
FROM
	[Summary] INNER JOIN [ProfileVersion] ON [Summary].[ProfileVersionId] = [ProfileVersion].[Id]
	INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
WHERE
	([luProfileVersionState].[Name] = 'Published' OR ([luProfileVersionState].[Name] = 'Draft' AND [ProfileVersion].[EffectiveDateTo] IS NULL)) AND
	[Profile].[ParentId] IS NULL

ALTER TABLE
	[luProfileReport]
ADD
	[IncludeInScenarios] bit NULL
GO

UPDATE
	[luProfileReport]
SET
	[IncludeInScenarios] = 0

UPDATE
	[luProfileReport]
SET
	[IncludeInScenarios] = 1
WHERE
	[ReportName] IN ('FullProfileGUID', 'SummaryPrioritisationGUID')

ALTER TABLE
	[luProfileReport]
ALTER COLUMN
	[IncludeInScenarios] bit NOT NULL
GO
GO 


/* 2.2.9. New Species table data  */

INSERT INTO [dbo].[SpeciesField]
(
[Id],
[Name],
[ShortName],
[FieldNumber],
[ReferenceTableId],
[DataFieldTypeId],
[IsMandatory]
)
VALUES
(
NEWID(),
'Number of holdings in GB',
'GB Holding Count',
15,
null,
'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
0
)


INSERT INTO [dbo].[SpeciesField]
(
[Id],
[Name],
[ShortName],
[FieldNumber],
[ReferenceTableId],
[DataFieldTypeId],
[IsMandatory]
)
VALUES
(
NEWID(),
'GB population',
'GB Population',
16,
null,
'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
0
)

GO

ALTER TABLE [dbo].[Species] ADD
	GBHoldingCount varchar(255) NULL,
	GBPopulation varchar(255) NULL
GO


/*2.2.17 Changing the order of the species hierarchy */
DECLARE @ParentId uniqueidentifier
DECLARE @tmpTable TABLE
	(
	ParentId uniqueidentifier,
	Id uniqueidentifier,
	SequenceNumber int,
	EffectiveDateFrom datetime
	)

INSERT INTO @tmpTable
SELECT 
	[ParentId], 
	[Id], 
	[SequenceNumber], 
	[EffectiveDateFrom]
FROM 
	[Species]
ORDER BY 
	ISNULL([Species].[SequenceNumber], 999), [Species].[EffectiveDateFrom]

DECLARE Cursor1 CURSOR
FOR
SELECT DISTINCT 
	[ParentId] 
FROM [Species]
WHERE 
	[ParentId] is not null AND
	[SequenceNumber] is null
OPEN Cursor1

FETCH NEXT FROM Cursor1
INTO @ParentId
WHILE @@FETCH_STATUS = 0
BEGIN
	
	DECLARE @SeqNum int 
	DECLARE @SeqMax int
	
	SET @SeqMax = 0

	SELECT 
		@SeqMax = Max( isnull(tmpT.SequenceNumber, 0) ) 
	FROM 
		@tmpTable tmpT 
	WHERE 
		tmpT.ParentId = @ParentId

	IF @SeqMax = 0 
	BEGIN
		SET @SeqNum = 0	
	END
	ELSE
	BEGIN
		SET @SeqNum = @SeqMax
	END

	DECLARE Cursor2 CURSOR
	FOR
	SELECT 
		Id 
	FROM 
		@tmpTable tmpT
	WHERE 
		tmpT.[ParentId] = @ParentId AND
		tmpT.[SequenceNumber] is null

	OPEN Cursor2
	DECLARE @Id uniqueidentifier

	FETCH NEXT FROM Cursor2
	INTO @Id	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @SeqNum = @SeqNum + 1

		UPDATE 
			[Species]
		SET
			[SequenceNumber] = @SeqNum
		WHERE
			[ParentId] = @ParentId AND
			[SequenceNumber] is null AND
			[Id] = @Id 
	
	FETCH NEXT FROM Cursor2
	INTO @Id

	END
	CLOSE Cursor2
	DEALLOCATE Cursor2

FETCH NEXT FROM Cursor1
INTO @ParentId

END
CLOSE Cursor1
DEALLOCATE Cursor1
	
SET @SeqMax = 0

SELECT 
	@SeqMax = Max( isnull(SequenceNumber, 0) ) 
FROM 
	Species
WHERE 
	ParentId is null

print @SeqMax

IF @SeqMax = 0 
BEGIN
	SET @SeqNum = 0	
END
ELSE
BEGIN
	SET @SeqNum = @SeqMax
END

DECLARE Cursor3 CURSOR
FOR
SELECT DISTINCT 
	[Id] 
FROM 
	[Species]
WHERE 
	[ParentId] is null AND
	[SequenceNumber] is null
		
OPEN Cursor3

FETCH NEXT FROM Cursor3
INTO @Id
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SeqNum = @SeqNum + 1	

	UPDATE 
		[Species]
	SET
		[SequenceNumber] = @SeqNum
	WHERE
		[ParentId] is null AND
		[SequenceNumber] is null AND
		[Id] = @Id 

FETCH NEXT FROM Cursor3
INTO @Id

END
CLOSE Cursor3
DEALLOCATE Cursor3

GO

ALTER TABLE [Species]
ALTER COLUMN [SequenceNumber] int NOT NULL

GO

/* 2.2.15 Changes to the calculation of the International Trade score */

-- Add new criterion IT11
INSERT INTO [PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[MappingFlag],
	[TrueMapping],
	[FalseMapping]
	)
VALUES
	(
	'4107815A-0E2B-4100-BDC1-4FE44864BBE1',
	'a1ea4c86-d087-4a54-b3a0-5ca33288a346', -- International Trade category
	'IT11',
	'Export market value for each species/group',
	1,
	NULL,
	'8B5240E4-59F3-429A-9C62-2EF561201BB8',
	NULL
	)
	
INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'5DF88CD9-3C75-4912-819E-1FB43AA5B843',
	'4107815A-0E2B-4100-BDC1-4FE44864BBE1',
	'Not commercial',
	1,
	1
	)

INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'CA8E4B35-7D66-411D-ADD4-8AFE2D04A263',
	'4107815A-0E2B-4100-BDC1-4FE44864BBE1',
	'Low',
	2,
	2
	)

INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'F46F6E58-D339-4C5B-9317-F9728820CCA4',
	'4107815A-0E2B-4100-BDC1-4FE44864BBE1',
	'Medium',
	3,
	3
	)
	
INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'BA0DF663-B6BB-46C9-92D9-C48B83C0AD73',
	'4107815A-0E2B-4100-BDC1-4FE44864BBE1',
	'High',
	4,
	4
	)

-- Add “None” option to question 11.7

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 2
WHERE
	[ReferenceTableId] = 'ED182673-29CD-4988-8A80-4B36686D97DF' AND-- Commodities compromised level
	[LookupValue] = 'Low'

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 3
WHERE
	[ReferenceTableId] = 'ED182673-29CD-4988-8A80-4B36686D97DF' AND-- Commodities compromised level
	[LookupValue] = 'Medium'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 4
WHERE
	[ReferenceTableId] = 'ED182673-29CD-4988-8A80-4B36686D97DF' AND-- Commodities compromised level
	[LookupValue] = 'High'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 5
WHERE
	[ReferenceTableId] = 'ED182673-29CD-4988-8A80-4B36686D97DF' AND-- Commodities compromised level
	[LookupValue] = 'Very high'

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'C7813A45-947D-486B-BE8A-914357F3F0E0',
	'ED182673-29CD-4988-8A80-4B36686D97DF', -- Commodities compromised level
	'None',
	1
	)

IF NOT EXISTS (SELECT [Id] FROM [luCommoditiesCompromisedLevel] WHERE [LookupValue] = 'None') BEGIN

	UPDATE
		[luCommoditiesCompromisedLevel]
	SET
		[SequenceNumber] = 2
	WHERE
		[LookupValue] = 'Low'
	
	UPDATE
		[luCommoditiesCompromisedLevel]
	SET
		[SequenceNumber] = 3
	WHERE
		[LookupValue] = 'Medium'
		
	UPDATE
		[luCommoditiesCompromisedLevel]
	SET
		[SequenceNumber] = 4
	WHERE
		[LookupValue] = 'High'

	UPDATE
		[luCommoditiesCompromisedLevel]
	SET
		[SequenceNumber] = 5
	WHERE
		[LookupValue] = 'Very high'
		
	INSERT INTO [luCommoditiesCompromisedLevel]
		(
		[Id],
		[LookupValue],
		[SequenceNumber]
		)
	VALUES
		(
		'C7813A45-947D-486B-BE8A-914357F3F0E0',
		'None',
		1
		)

END

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 2
WHERE
	[PrioritisationCriterionId] = '91CD55C3-B98F-4A62-A17F-DD36945D2E5C' AND -- IT07
	[CriterionValue] = 'Low'

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 3
WHERE
	[PrioritisationCriterionId] = '91CD55C3-B98F-4A62-A17F-DD36945D2E5C' AND -- IT07
	[CriterionValue] = 'Medium'
	
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 4
WHERE
	[PrioritisationCriterionId] = '91CD55C3-B98F-4A62-A17F-DD36945D2E5C' AND -- IT07
	[CriterionValue] = 'High'

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 5
WHERE
	[PrioritisationCriterionId] = '91CD55C3-B98F-4A62-A17F-DD36945D2E5C' AND -- IT07
	[CriterionValue] = 'Very high'
	
INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'11063CC2-DF63-47E3-B31D-EB1EB9C46A11',
	'91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
	'None',
	0,
	1
	)

-- Amend irrelevance rules for International Trade category

CREATE TABLE [PrioritisationCategoryIrrelevance]
	(
	[Id] uniqueidentifier NOT NULL,
	[PrioritisationCategoryId] uniqueidentifier NOT NULL,
	[IrrelevanceFieldId] uniqueidentifier NOT NULL,
	[IrrelevanceValueId] uniqueidentifier NULL,
	[IrrelevanceFlag] bit NULL,
	CONSTRAINT [PK_PrioritisationCategoryIrrelevance] PRIMARY KEY CLUSTERED 
		(
		[Id]
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

ALTER TABLE [PrioritisationCategoryIrrelevance] WITH CHECK ADD CONSTRAINT [FK_PrioritisationCategoryIrrelevance_PrioritisationCategory] FOREIGN KEY([PrioritisationCategoryId])
REFERENCES [PrioritisationCategory] ([Id])
GO
ALTER TABLE [PrioritisationCategoryIrrelevance] WITH CHECK ADD CONSTRAINT [FK_PrioritisationCategoryIrrelevance_ProfileField] FOREIGN KEY([IrrelevanceFieldId])
REFERENCES [ProfileField] ([Id])
GO
ALTER TABLE [PrioritisationCategoryIrrelevance] WITH CHECK ADD CONSTRAINT [FK_PrioritisationCategoryIrrelevance_ReferenceValue] FOREIGN KEY([IrrelevanceValueId])
REFERENCES [ReferenceValue] ([Id])
GO

INSERT INTO [PrioritisationCategoryIrrelevance]
	(
	[Id],
	[PrioritisationCategoryId],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag]
	)
VALUES
	(
	'6DCBFAA5-E272-4317-981F-10178CA853C6',
	'A1EA4C86-D087-4A54-B3A0-5CA33288A346', --International trade
	'78CEE922-DDFC-469F-8614-2F01ABF79F9A',
	'5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
	NULL
	)

INSERT INTO [PrioritisationCategoryIrrelevance]
	(
	[Id],
	[PrioritisationCategoryId],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag]
	)
VALUES
	(
	'298B0989-225B-42C6-8C51-A6C24E90B7B9',
	'0BE9F729-8669-4CCA-9426-7737F75397D9', --Public health
	'383289E8-44D0-464D-AD77-9F4C1BD7D658',
	'CBB4614A-4964-4CD1-8859-829D08CA3DFB',
	NULL
	)

INSERT INTO [PrioritisationCategoryIrrelevance]
	(
	[Id],
	[PrioritisationCategoryId],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag]
	)
VALUES
	(
	'58EAC1CF-AFD4-4E39-9214-E8BA858AE387',
	'A873901C-DEA8-4C0F-855F-A5AEFAA2F704', --Welfare
	'39C11421-1494-4A29-98F1-0CF7FD363B37',
	NULL,
	0
	)

-- new, second irrelevance check for International trade
INSERT INTO [PrioritisationCategoryIrrelevance]
	(
	[Id],
	[PrioritisationCategoryId],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag]
	)
VALUES
	(
	'025923C2-B9E3-4671-B45E-96653E9DF145',
	'A1EA4C86-D087-4A54-B3A0-5CA33288A346', --International trade
	'CF83A24C-6885-4329-8FCA-248BFE4B7509',
	'C7813A45-947D-486B-BE8A-914357F3F0E0',
	NULL
	)

-- remove the irrelevance information from the PrioritisationCategory table (now it has its own table)
ALTER TABLE [PrioritisationCategory]
DROP CONSTRAINT [FK_PrioritisationCategory_ProfileField]
GO

ALTER TABLE [PrioritisationCategory]
DROP COLUMN [IrrelevanceFieldId]
GO

ALTER TABLE [PrioritisationCategory]
DROP CONSTRAINT [FK_PrioritisationCategory_ReferenceValue]
GO

ALTER TABLE [PrioritisationCategory]
DROP COLUMN [IrrelevanceValueId]
GO

ALTER TABLE [PrioritisationCategory]
DROP COLUMN [IrrelevanceFlag]
GO

/* Work Item 3090 - Validation indicators bug */
ALTER TABLE
	[ProfileVersionSection]
DROP COLUMN
	[IsValid]
GO

/* CR30 Other affected species */

CREATE TABLE [luAffectedSpeciesType]
(
          [Id] uniqueidentifier NOT NULL,
          [Name] varchar(50) NOT NULL,
          CONSTRAINT [PK_luAffectedSpeciesType] PRIMARY KEY CLUSTERED 
                   (
                   [Id]
                   ) ON [PRIMARY]
          ) ON [PRIMARY]
GO

INSERT INTO [luAffectedSpeciesType]
          (
          [Id],
          [Name]
          )
VALUES
          (
          '98C6BBDC-9EF0-4C4A-A7AB-135C8A6C7A62',
          'Profiled'
          )
 
INSERT INTO [luAffectedSpeciesType]
          (
          [Id],
          [Name]
          )
VALUES
          (
          'BFDB703C-B824-4EBB-878C-5BA0640959D0',
          'Other'
          )

ALTER TABLE [ProfileVersionSpecies]
ADD [AffectedSpeciesTypeId] uniqueidentifier NULL
GO
 
UPDATE
          [ProfileVersionSpecies]
SET
          [AffectedSpeciesTypeId] = '98C6BBDC-9EF0-4C4A-A7AB-135C8A6C7A62' -- Profiled

ALTER TABLE [ProfileVersionSpecies]
ALTER COLUMN [AffectedSpeciesTypeId] uniqueidentifier NOT NULL
GO

INSERT INTO luDataFieldType
	(
	[Id],
	[Name],
	[SqlType]
	)
VALUES
	(
	'0F7D5F99-364E-4442-ACCF-6FD61A98BFD1',
	'Profile Version Data',
	NULL
	)
	
 INSERT INTO [ProfileField]
           (
			[Id],
           [Name],
           [ShortName],
           [ProfileQuestionId],
           [FieldNumber],
           [DataFieldTypeId],
           [IsMandatory],
           [ReferenceTableId],
           [IsReadOnlyCurrentSituation],
           [IsReadOnlyScenario],
           [DefaultValue]
			)
     VALUES
           (
			'0268E059-77DF-44BC-AD41-24E01F909D14',
           NULL,
           'Profiled Species',
           '602F2CA1-0DB9-4E1C-A2B6-9BF708CB7AB0',
           1,
           '0F7D5F99-364E-4442-ACCF-6FD61A98BFD1',
           0,
           NULL,
           1,
           1,
           NULL
			)

UPDATE
	[ProfileField]
SET
	[Name] = 'Supporting comments',
	[FieldNumber] = 2
WHERE
	[Id] = '2B257288-DEAC-48CA-B137-1B2FA29C1F52'

UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Profiled species',
	[ShortName] ='Profiled Species'
WHERE
	[Id]='602F2CA1-0DB9-4E1C-A2B6-9BF708CB7AB0'
	
UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 5
WHERE
	[Id] ='625eecf0-273d-410e-a251-d493cfbd54c4' -- Revision history
	
INSERT INTO [ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance]
	)
VALUES
	(
	'2C870A8C-F90E-4961-9AA0-39203CE9B8A2',
	'Other affected species',
	'Other Affected Species',
	'1ED0595D-3E1A-49D4-B340-C0D41E17D045',
	3,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
	)

 INSERT INTO [ProfileField]
           (
			[Id],
           [Name],
           [ShortName],
           [ProfileQuestionId],
           [FieldNumber],
           [DataFieldTypeId],
           [IsMandatory],
           [ReferenceTableId],
           [IsReadOnlyCurrentSituation],
           [IsReadOnlyScenario],
           [DefaultValue]
			)
     VALUES
           (
			'C8691879-9621-4045-8879-103ED3A300E3',
           NULL,
           'Other Affected Species',
           '2C870A8C-F90E-4961-9AA0-39203CE9B8A2',
           1,
           '0F7D5F99-364E-4442-ACCF-6FD61A98BFD1',
           0,
           NULL,
           1,
           1,
           NULL
			)
			
INSERT INTO [ProfileField]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue]
	)
VALUES
	(
	'319EABCC-6CDA-4E9E-80B3-5A654194BBFF',
	'Supporting comments',
	'Other Affected Species Comments',
	'2C870A8C-F90E-4961-9AA0-39203CE9B8A2',
	2,
	'd297f63b-638a-4574-b042-97c248338a26',
	0,
	0,
	0,
	NULL
	)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.Columns WHERE table_name='Summary' AND column_name='OtherAffectedSpeciesComments') BEGIN
ALTER TABLE
	[Summary]
ADD
	[OtherAffectedSpeciesComments] text NULL
END

GO
	
