-- Phase 2 Release 3
--2.1 - Enhancements to references -

-- new tables:
--		luProfileNoteType
--		ProfileVersionNote
--		ProfileVersionNoteQuestion

--2.1 a)
CREATE TABLE [dbo].[luProfileNoteType]
	(
	[Id] uniqueidentifier NOT NULL,
	[Name] varchar(255) NOT NULL,
	[PluralName] varchar(255) NOT NULL,
	[SequenceNumber] int NOT NULL
	)

GO
ALTER TABLE [dbo].[luProfileNoteType] ADD PRIMARY KEY ([Id] )

GO

INSERT INTO [dbo].[luProfileNoteType]
(
[Id],
[Name],
[PluralName],
[SequenceNumber]
)
VALUES
(
'0F95D1E8-5BFB-497F-8BC4-89CBE846E45A',
'Scientific paper reference',
'Scientific paper references',
1
)
 
INSERT INTO [dbo].[luProfileNoteType]
(
[Id],
[Name],
[PluralName],
[SequenceNumber]
)
VALUES
(
'546718F4-5FE0-438C-9212-E701E552A381',
'Legislative reference',
'Legislative references',
2
)

INSERT INTO [dbo].[luProfileNoteType]
(
[Id],
[Name],
[PluralName],
[SequenceNumber]
)
VALUES
(
'C37C98F1-CCA4-4937-9057-59FFACE67E4E',
'Source of further information',
'Sources of further information',
3
)

--2.1 b)
CREATE TABLE [dbo].[ProfileVersionNote]
	(
	[Id] uniqueidentifier NOT NULL,
	[ProfileVersionId] uniqueidentifier NOT NULL,
	[ProfileSectionId] uniqueidentifier NOT NULL,
	[ProfileNoteTypeId] uniqueidentifier NOT NULL,
	[NoteText] varchar(max) NOT NULL,
	[LastUpdated] timestamp NOT NULL
	)

ALTER TABLE [dbo].[ProfileVersionNote] ADD PRIMARY KEY ([Id] )

ALTER TABLE [dbo].[ProfileVersionNote] ADD CONSTRAINT
	FK_ProfileVersionNote_ProfileVersionSection FOREIGN KEY
	(
	ProfileVersionId,
	ProfileSectionId
	) REFERENCES dbo.ProfileVersionSection
	(
	ProfileVersionId,
	ProfileSectionId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	

INSERT INTO [dbo].[ProfileVersionNote]
(
	[Id],
	[ProfileVersionId],
	[ProfileSectionId],
	[ProfileNoteTypeId],
	[NoteText]
)
SELECT 
	[ScientificPaperReference].[Id],
	[ScientificPaperReference].[ProfileVersionId],
	[ScientificPaperReference].[ProfileSectionId],
	'0F95D1E8-5BFB-497F-8BC4-89CBE846E45A',
	[ScientificPaperReference].[NoteText]
FROM 
	[ScientificPaperReference]  INNER JOIN 
	[ProfileVersion] ON [ScientificPaperReference].[ProfileVersionId] = [ProfileVersion].[Id]	
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL 


INSERT INTO [dbo].[ProfileVersionNote]
(
	[Id],
	[ProfileVersionId],
	[ProfileSectionId],
	[ProfileNoteTypeId],
	[NoteText]	
)
SELECT 
	[LegislativeReference].[Id],
	[LegislativeReference].[ProfileVersionId],
	[LegislativeReference].[ProfileSectionId],
	'546718F4-5FE0-438C-9212-E701E552A381',
	[LegislativeReference].[NoteText]
FROM 
	[LegislativeReference] INNER JOIN 
	[ProfileVersion] ON [LegislativeReference].[ProfileVersionId] = [ProfileVersion].[Id]	
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL 
	
INSERT INTO [dbo].[ProfileVersionNote]
(
	[Id],
	[ProfileVersionId],
	[ProfileSectionId],
	[ProfileNoteTypeId],
	[NoteText]
)
SELECT 
	[SourceOfFurtherInformation].[Id],
	[SourceOfFurtherInformation].[ProfileVersionId],
	[SourceOfFurtherInformation].[ProfileSectionId],
	'C37C98F1-CCA4-4937-9057-59FFACE67E4E',
	[SourceOfFurtherInformation].[NoteText]
FROM 
	[SourceOfFurtherInformation] INNER JOIN 
	[ProfileVersion] ON [SourceOfFurtherInformation].[ProfileVersionId] = [ProfileVersion].[Id]	
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL 

--2.1 c)
CREATE TABLE [dbo].[ProfileVersionNoteQuestion]
	(
	[ProfileVersionNoteId] uniqueidentifier NOT NULL,
	[ProfileQuestionId] uniqueidentifier NOT NULL
	)

GO
ALTER TABLE [dbo].[ProfileVersionNoteQuestion] ADD CONSTRAINT
	PK_ProfileVersionNoteQuestion PRIMARY KEY CLUSTERED 
	(
	ProfileVersionNoteId,
	ProfileQuestionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProfileVersionNoteQuestion] ADD CONSTRAINT
	FK_ProfileVersionNoteQuestion_ProfileVersionNote FOREIGN KEY
	(
	ProfileVersionNoteId
	) REFERENCES [dbo].[ProfileVersionNote]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO

ALTER TABLE [dbo].[ProfileVersionNoteQuestion] ADD CONSTRAINT
	FK_ProfileVersionNoteQuestion_ProfileQuestion FOREIGN KEY
	(
	ProfileQuestionId
	) REFERENCES [dbo].[ProfileQuestion]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO

DROP TABLE [dbo].[LegislativeReference]
DROP TABLE [dbo].[ScientificPaperReference]
DROP TABLE [dbo].[SourceOfFurtherInformation]
GO

-- 2.4.1	(Pre-req. A) Reference tables - change to non code-gen

-- 2.4.1 a)
ALTER TABLE [ReferenceValue]
	ADD
	[EffectiveDateFrom] datetime NULL,
	[EffectiveDateTo] datetime NULL,
	[LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [ReferenceValue]
ALTER COLUMN [SequenceNumber] tinyint NULL
GO

ALTER TABLE [ReferenceValue]
DROP CONSTRAINT [DF_ReferenceValue_SequenceNumber]
GO

-- 2.4.1 b)
ALTER TABLE [ReferenceTableAuditLog]
ALTER COLUMN [EffectiveDate] datetime NOT NULL
GO

ALTER TABLE [ReferenceTableAuditLog]
ALTER COLUMN [LogDate] datetime NOT NULL
GO

-- 2.4.1 a)
-- Copy values from the individual maintainable reference tables back into ReferenceValue

-- Spread Mechanism

UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luSpreadMechanism].[LookupValue],
	[EffectiveDateFrom] = [luSpreadMechanism].[EffectiveDateFrom],
	[EffectiveDateTo] = [luSpreadMechanism].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luSpreadMechanism] ON [ReferenceValue].[Id] = [luSpreadMechanism].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luSpreadMechanism].[Id],
	'92104271-8505-4189-A43D-23F88E25DBEE',
	[luSpreadMechanism].[LookupValue],
	200,
	[luSpreadMechanism].[EffectiveDateFrom],
	[luSpreadMechanism].[EffectiveDateTo]
FROM
	[luSpreadMechanism] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luSpreadMechanism].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luSpreadMechanism] ON [ReferenceValue].[Id] = [luSpreadMechanism].[Id]
WHERE
	[luSpreadMechanism].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = '92104271-8505-4189-A43D-23F88E25DBEE'
				
-- Transmission Mechanism
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luTransmissionMechanism].[LookupValue],
	[EffectiveDateFrom] = [luTransmissionMechanism].[EffectiveDateFrom],
	[EffectiveDateTo] = [luTransmissionMechanism].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luTransmissionMechanism] ON [ReferenceValue].[Id] = [luTransmissionMechanism].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luTransmissionMechanism].[Id],
	'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
	[luTransmissionMechanism].[LookupValue],
	200,
	[luTransmissionMechanism].[EffectiveDateFrom],
	[luTransmissionMechanism].[EffectiveDateTo]
FROM
	[luTransmissionMechanism] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luTransmissionMechanism].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luTransmissionMechanism] ON [ReferenceValue].[Id] = [luTransmissionMechanism].[Id]
WHERE
	[luTransmissionMechanism].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = 'BFC9F1C2-77EA-4704-B586-301BDD03B7B7'
				
-- Surveillance Mechanism
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luSurveillanceMechanism].[LookupValue],
	[EffectiveDateFrom] = [luSurveillanceMechanism].[EffectiveDateFrom],
	[EffectiveDateTo] = [luSurveillanceMechanism].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luSurveillanceMechanism] ON [ReferenceValue].[Id] = [luSurveillanceMechanism].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luSurveillanceMechanism].[Id],
	'D41B31E1-D0C0-464D-B640-3D26DD21546E',
	[luSurveillanceMechanism].[LookupValue],
	200,
	[luSurveillanceMechanism].[EffectiveDateFrom],
	[luSurveillanceMechanism].[EffectiveDateTo]
FROM
	[luSurveillanceMechanism] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luSurveillanceMechanism].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luSurveillanceMechanism] ON [ReferenceValue].[Id] = [luSurveillanceMechanism].[Id]
WHERE
	[luSurveillanceMechanism].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = 'D41B31E1-D0C0-464D-B640-3D26DD21546E'
				
-- Geographic Area
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luGeographicArea].[LookupValue],
	[EffectiveDateFrom] = [luGeographicArea].[EffectiveDateFrom],
	[EffectiveDateTo] = [luGeographicArea].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luGeographicArea] ON [ReferenceValue].[Id] = [luGeographicArea].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luGeographicArea].[Id],
	'948B3612-BEE6-4A07-892A-7861E5FAD085',
	[luGeographicArea].[LookupValue],
	200,
	[luGeographicArea].[EffectiveDateFrom],
	[luGeographicArea].[EffectiveDateTo]
FROM
	[luGeographicArea] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luGeographicArea].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luGeographicArea] ON [ReferenceValue].[Id] = [luGeographicArea].[Id]
WHERE
	[luGeographicArea].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = '948B3612-BEE6-4A07-892A-7861E5FAD085'
				
-- Diagnosis And Detection Mechanism
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luDiagnosisAndDetectionMechanism].[LookupValue],
	[EffectiveDateFrom] = [luDiagnosisAndDetectionMechanism].[EffectiveDateFrom],
	[EffectiveDateTo] = [luDiagnosisAndDetectionMechanism].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luDiagnosisAndDetectionMechanism] ON [ReferenceValue].[Id] = [luDiagnosisAndDetectionMechanism].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luDiagnosisAndDetectionMechanism].[Id],
	'19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
	[luDiagnosisAndDetectionMechanism].[LookupValue],
	200,
	[luDiagnosisAndDetectionMechanism].[EffectiveDateFrom],
	[luDiagnosisAndDetectionMechanism].[EffectiveDateTo]
FROM
	[luDiagnosisAndDetectionMechanism] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luDiagnosisAndDetectionMechanism].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luDiagnosisAndDetectionMechanism] ON [ReferenceValue].[Id] = [luDiagnosisAndDetectionMechanism].[Id]
WHERE
	[luDiagnosisAndDetectionMechanism].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = '19A8013C-E7D6-4AED-A58F-AA1F775CBA54'	
		
-- Control Mechanism
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = [luControlMechanism].[LookupValue],
	[EffectiveDateFrom] = [luControlMechanism].[EffectiveDateFrom],
	[EffectiveDateTo] = [luControlMechanism].[EffectiveDateTo]
FROM
	[ReferenceValue] INNER JOIN [luControlMechanism] ON [ReferenceValue].[Id] = [luControlMechanism].[Id]

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom],
	[EffectiveDateTo]
	)
SELECT
	[luControlMechanism].[Id],
	'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
	[luControlMechanism].[LookupValue],
	200,
	[luControlMechanism].[EffectiveDateFrom],
	[luControlMechanism].[EffectiveDateTo]
FROM
	[luControlMechanism] LEFT JOIN [ReferenceValue] ON [ReferenceValue].[Id] = [luControlMechanism].[Id]
WHERE
	[ReferenceValue].[Id] IS NULL

DELETE
	[ReferenceValue]
FROM
	[ReferenceValue] LEFT JOIN [luControlMechanism] ON [ReferenceValue].[Id] = [luControlMechanism].[Id]
WHERE
	[luControlMechanism].[Id] IS NULL AND
	[ReferenceValue].[ReferenceTableId] = 'D9889426-96A2-4C69-A3DB-C26F256C5FC1'
				
-- 2.4.1 a)
-- Change the sequence numbers in ReferenceValue to take account of the changed rows

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = RowNumber
FROM
	[ReferenceValue] INNER JOIN
		(
		SELECT
			[ReferenceValue].[Id],
			ROW_NUMBER() OVER (PARTITION BY [ReferenceTableId] ORDER BY [SequenceNumber], [EffectiveDateFrom]) AS RowNumber
		FROM
			[ReferenceValue]
		) tmp ON [ReferenceValue].[Id] = tmp.[Id]
GO
		
-- 2.4.2	(Cross-cutting issues) Reference tables - handle long reference values

-- 2.4.2 a)

ALTER TABLE [ReferenceValue]
ALTER COLUMN [LookupValue] varchar(255) NOT NULL
GO

ALTER TABLE [ReferenceTableAuditLog]
ALTER COLUMN [OldLookupValue] varchar(255) NOT NULL
GO

ALTER TABLE [ReferenceTableAuditLog]
ALTER COLUMN [NewLookupValue] varchar(255) NOT NULL
GO

-- 2.6.2	(Pre-req. A) Profile answer tables – FieldValue structure (breaks q. 10.1)

-- 2.6.2 a)
CREATE TABLE [ProfileVersionQuestionRow]
	(
	[Id] uniqueidentifier NOT NULL,
	[ProfileVersionId] uniqueidentifier NOT NULL,
	[ProfileQuestionId] uniqueidentifier NOT NULL,
	[SequenceNumber] int NOT NULL
	) ON [PRIMARY]
GO

ALTER TABLE [ProfileVersionQuestionRow] ADD CONSTRAINT
PK_ProfileVersionQuestionRow PRIMARY KEY CLUSTERED
(
Id
) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [ProfileVersionQuestionRow]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionQuestionRow_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [ProfileVersion] ([Id])
GO

-- 2.6.2 b)

CREATE TABLE [ProfileVersionFieldValue]
(
[Id] uniqueidentifier NOT NULL,
[ProfileVersionId] uniqueidentifier NOT NULL,
[ProfileFieldId] uniqueidentifier NOT NULL,
[SpeciesId] uniqueidentifier NULL,
[ProfileVersionQuestionRowId] uniqueidentifier NULL,
[BooleanValue] bit NULL,
[ListValue] uniqueidentifier NULL,
[DecimalValue] money NULL,
[DateValue] datetime NULL,
[TextValue] varchar(MAX) NULL
)  ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE  [ProfileVersionFieldValue] ADD CONSTRAINT
PK_ProfileVersionFieldValue PRIMARY KEY CLUSTERED
(
Id
) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [ProfileVersionFieldValue]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionFieldValue_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [ProfileVersion] ([Id])
GO

ALTER TABLE [ProfileVersionFieldValue]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionFieldValue_ProfileField] FOREIGN KEY([ProfileFieldId])
REFERENCES [ProfileField] ([Id])
GO

ALTER TABLE [ProfileVersionFieldValue]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionFieldValue_Species] FOREIGN KEY([SpeciesId])
REFERENCES [Species] ([Id])
GO

ALTER TABLE [ProfileVersionFieldValue]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionFieldValue_ProfileVersionQuestionRow] FOREIGN KEY([ProfileVersionQuestionRowId])
REFERENCES [ProfileVersionQuestionRow] ([Id])
GO

-- 2.6.2 c)

ALTER TABLE [luDataFieldType]
ADD [FieldValueColumn] varchar(50) NULL
GO

UPDATE
	[luDataFieldType]
SET
	[FieldValueColumn] = 'BooleanValue'
WHERE
	[Name] = 'Boolean'

UPDATE
	[luDataFieldType]
SET
	[FieldValueColumn] = 'ListValue'
WHERE
	[Name] = 'List'

DELETE
	[luDataFieldType]
WHERE
	[Name] = 'Integer' OR [Name] = 'URL' OR [Name] = 'Currency' OR [Name] = 'Percentage'
	
UPDATE
	[luDataFieldType]
SET
	[FieldValueColumn] = 'DecimalValue'
WHERE
	[Name] = 'Decimal'
	
UPDATE
	[luDataFieldType]
SET
	[FieldValueColumn] = 'DateValue'
WHERE
	[Name] = 'Date'
	
UPDATE
	[luDataFieldType]
SET
	[FieldValueColumn] = 'TextValue'
WHERE
	[Name] = 'Long Text' OR [Name] = 'Text'

-- problem with Epidemiology q.3.2 - the field numbers didn't start at 1
UPDATE
	[ProfileField]
SET
	[FieldNumber] = 1
WHERE
	[Id] = 'C9151EB7-B0A5-4D05-8881-58D727F3DFBA' 

-- insert all the existing field values into the FieldValue structures
INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'7FC60B51-D99F-48B9-8A3B-3474899E5984',
	NULL,
	NULL,
	[SummaryImpactOnAnimalWelfare]
FROM
	[AnimalWelfare]
WHERE
	[SummaryImpactOnAnimalWelfare] IS NOT NULL
			
INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A',
	NULL,
	NULL,
	[ControlsAboveTheHoldingLevel]
FROM
	[ApproachToControl]
WHERE
	[ControlsAboveTheHoldingLevel] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D1F80CBF-4C2F-4053-844B-8F63115D0406',
	NULL,
	NULL,
	[ControlsAboveTheHoldingLevelComments]
FROM
	[ApproachToControl]
WHERE
	[ControlsAboveTheHoldingLevelComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'0FD52ACB-4095-407A-B6F1-E7FD020D0DBB',
	NULL,
	NULL,
	[AreasOfUncertaintySummary]
FROM
	[AreasOfUncertainty]
WHERE
	[AreasOfUncertaintySummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'48517386-C2B5-48EE-A11E-30694E6A313C',
	NULL,
	NULL,
	[SuspectCaseDefinition]
FROM
	[Epidemiology]
WHERE
	[SuspectCaseDefinition] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C9151EB7-B0A5-4D05-8881-58D727F3DFBA',
	NULL,
	NULL,
	[ProbableCaseDefinition]
FROM
	[Epidemiology]
WHERE
	[ProbableCaseDefinition] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'56AD0DE1-257C-46FE-8F8A-1D9618C6BB5D',
	NULL,
	NULL,
	[ConfirmedCaseDefinition]
FROM
	[Epidemiology]
WHERE
	[ConfirmedCaseDefinition] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'EDBC2927-72B1-45FD-B148-E70F601491A3',
	NULL,
	NULL,
	[DiagnosisMechanismComments]
FROM
	[Epidemiology]
WHERE
	[DiagnosisMechanismComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'3EC9ED6A-D7F0-4780-9954-E603479C8B17',
	NULL,
	NULL,
	[AgentDescription]
FROM
	[Epidemiology]
WHERE
	[AgentDescription] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'09C1523C-F382-4E46-8468-A94EBEFE0589',
	NULL,
	NULL,
	[TherapeuticAgentSusceptibility]
FROM
	[Epidemiology]
WHERE
	[TherapeuticAgentSusceptibility] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'729D6BAF-1F5E-4E58-A854-81AA36A6CB31',
	NULL,
	NULL,
	[PersistenceInEnvironmentIndicator]
FROM
	[Epidemiology]
WHERE
	[PersistenceInEnvironmentIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D916E329-C080-4FFA-AE5E-729D36DDBAE6',
	NULL,
	NULL,
	[PersistenceInEnvironmentIndicatorComments]
FROM
	[Epidemiology]
WHERE
	[PersistenceInEnvironmentIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'FC92A38A-5516-4A58-98B6-56CF96C155D7',
	NULL,
	NULL,
	[SpreadMechanismComments]
FROM
	[Epidemiology]
WHERE
	[SpreadMechanismComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'BA50C83A-9948-45F1-BA14-035400B2BC4B',
	NULL,
	NULL,
	[MultiSpeciesSummary]
FROM
	[Epidemiology]
WHERE
	[MultiSpeciesSummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C51B7AFA-98FF-497C-AD7B-4634FADDB224',
	NULL,
	NULL,
	[DiagnosisAndDetectionMechanismId]
FROM
	[ConfirmationOfDiagnosis]

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A6A7E809-16E7-4CD1-A999-9C9CB6B882CE',
	NULL,
	NULL,
	[SpreadMechanismId]
FROM
	[SpreadMechanism]

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[BooleanValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'367EF28D-31A3-46D0-B2A4-BEB38272ED5A',
	NULL,
	NULL,
	[GBPresenceIndicator]
FROM
	[GeographicDistribution]
WHERE
	[GBPresenceIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B97082F0-091A-40BB-A028-531B5D024589',
	NULL,
	NULL,
	[GBPresenceIndicatorComments]
FROM
	[GeographicDistribution]
WHERE
	[GBPresenceIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'6AD5F071-9412-4FDE-8F15-082B5FF5FB02',
	NULL,
	NULL,
	[CurrentPrevalenceInGB]
FROM
	[GeographicDistribution]
WHERE
	[CurrentPrevalenceInGB] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'84C095A3-EBC8-41A4-BA46-20E7109A0F41',
	NULL,
	NULL,
	[CurrentPrevalenceInGBComments]
FROM
	[GeographicDistribution]
WHERE
	[CurrentPrevalenceInGBComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[DateValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'5F1B9EE9-D594-4C4B-83A3-95B85E42C0FE',
	NULL,
	NULL,
	[DateOfMostRecentOccurrenceInGB]
FROM
	[GeographicDistribution]
WHERE
	[DateOfMostRecentOccurrenceInGB] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'69433B2E-38DB-4666-A5C3-AD7B8D4AF4C5',
	NULL,
	NULL,
	[DateOfMostRecentOccurrenceInGBComments]
FROM
	[GeographicDistribution]
WHERE
	[DateOfMostRecentOccurrenceInGBComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D65FCE8E-C0EA-449E-B83D-AC8A8500F838',
	NULL,
	NULL,
	[RiskOfIntroductionToGB]
FROM
	[GeographicDistribution]
WHERE
	[RiskOfIntroductionToGB] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'1F645806-4062-4270-800E-8FD90303F36A',
	NULL,
	NULL,
	[RiskOfIntroductionToGBComments]
FROM
	[GeographicDistribution]
WHERE
	[RiskOfIntroductionToGBComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A660ED3C-B6FD-4999-B4AB-6C55886F50C7',
	NULL,
	NULL,
	[GlobalGeographicDistributionComments]
FROM
	[GeographicDistribution]
WHERE
	[GlobalGeographicDistributionComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'BC525D73-9223-40F3-A4B8-2D2472A11E84',
	NULL,
	NULL,
	[GeographicAreaId]
FROM
	[GlobalGeographicDistribution]

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'383289E8-44D0-464D-AD77-9F4C1BD7D658',
	NULL,
	NULL,
	[ZoonoticIndicator]
FROM
	[HumanHealth]
WHERE
	[ZoonoticIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B38F1F59-EE1D-4764-994A-B96F043ACEFE',
	NULL,
	NULL,
	[ZoonoticIndicatorComments]
FROM
	[HumanHealth]
WHERE
	[ZoonoticIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'7667FC38-62DE-4294-A505-DED03D1817E8',
	NULL,
	NULL,
	[HumanTransmissionMechanismComments]
FROM
	[HumanHealth]
WHERE
	[HumanTransmissionMechanismComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'17890192-61FC-4767-881D-4D94D4452ADD',
	NULL,
	NULL,
	[SymptomsOfHumanDisease]
FROM
	[HumanHealth]
WHERE
	[SymptomsOfHumanDisease] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'1DE4E306-AAEF-4131-8C78-D787DCE79B98',
	NULL,
	NULL,
	[TransmissibilityIndicator]
FROM
	[HumanHealth]
WHERE
	[TransmissibilityIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8EACB34C-8058-4947-BA4A-EE376FAAEDDE',
	NULL,
	NULL,
	[TransmissibilityIndicatorComments]
FROM
	[HumanHealth]
WHERE
	[TransmissibilityIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B658405A-DBC2-47DF-943F-4B889453DCED',
	NULL,
	NULL,
	[ModalSeverityOfHumanDisease]
FROM
	[HumanHealth]
WHERE
	[ModalSeverityOfHumanDisease] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'9ED6C609-9287-4CB6-81EB-9399124F955C',
	NULL,
	NULL,
	[ModalSeverityOfHumanDiseaseComments]
FROM
	[HumanHealth]
WHERE
	[ModalSeverityOfHumanDiseaseComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'1156C38B-42C6-464A-BD06-131BAE2BC51F',
	NULL,
	NULL,
	[MaximumSeverityOfHumanDisease]
FROM
	[HumanHealth]
WHERE
	[MaximumSeverityOfHumanDisease] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'70B0E8C9-FB22-41C9-A78E-829863473BED',
	NULL,
	NULL,
	[MaximumSeverityOfHumanDiseaseComments]
FROM
	[HumanHealth]
WHERE
	[MaximumSeverityOfHumanDiseaseComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F2802D49-C0D4-4A7F-BED0-B8A8970EA531',
	NULL,
	NULL,
	[GeographicDistributionOfHumanDiseaseComments]
FROM
	[HumanHealth]
WHERE
	[GeographicDistributionOfHumanDiseaseComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'FE334744-D887-4547-B1CA-C8751E1F16EB',
	NULL,
	NULL,
	[AnnualNumberOfHumanCasesInGB]
FROM
	[HumanHealth]
WHERE
	[AnnualNumberOfHumanCasesInGB] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'FE7B93AA-DB56-4785-A7E4-DFE1BCA26EF0',
	NULL,
	NULL,
	[AnnualNumberOfHumanCasesInGBComments]
FROM
	[HumanHealth]
WHERE
	[AnnualNumberOfHumanCasesInGBComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F44C465F-99EE-4780-AC14-6040880856E9',
	NULL,
	NULL,
	[AverageCostPerCase]
FROM
	[HumanHealth]
WHERE
	[AverageCostPerCase] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'AAB9CC41-31C3-4881-A392-B4D65E6D036B',
	NULL,
	NULL,
	[AverageCostPerCaseComments]
FROM
	[HumanHealth]
WHERE
	[AverageCostPerCaseComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'5DDE04BE-201E-4F64-8916-506207290572',
	NULL,
	NULL,
	[IndirectEconomicCostOfHumanIllness]
FROM
	[HumanHealth]
WHERE
	[IndirectEconomicCostOfHumanIllness] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C78339DE-D2AD-4C92-B9DE-AB1CD34A0CC1',
	NULL,
	NULL,
	[IndirectEconomicCostOfHumanIllnessComments]
FROM
	[HumanHealth]
WHERE
	[IndirectEconomicCostOfHumanIllnessComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'CACA25D5-8E19-468D-812C-A95193ED47D1',
	NULL,
	NULL,
	[Uncertainty]
FROM
	[HumanHealth]
WHERE
	[Uncertainty] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D26DF689-8FA1-4D10-9CA5-F8F325A1AEBF',
	NULL,
	NULL,
	[UncertaintyComments]
FROM
	[HumanHealth]
WHERE
	[UncertaintyComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'1D6286B7-A66D-4172-823D-E3F1D810E396',
	NULL,
	NULL,
	[ImpactOnHumanHealth]
FROM
	[HumanHealth]
WHERE
	[ImpactOnHumanHealth] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'EC477782-2328-4A7F-8EF8-30AFB67F3929',
	NULL,
	NULL,
	[TransmissionMechanismId]
FROM
	[HumanTransmissionMechanism]

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'0A8E869F-639C-4FF6-BFC4-F2CE77DDFD4E',
	NULL,
	NULL,
	[GeographicAreaId]
FROM
	[GeographicDistributionOfHumanDisease]

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A989643B-5622-4C36-B432-D2C3899B3BF4',
	NULL,
	NULL,
	[StatutoryObligationToControl]
FROM
	[InternationalTrade]
WHERE
	[StatutoryObligationToControl] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A5C23820-4CD3-4F32-95FA-3864820EB0B0',
	NULL,
	NULL,
	[StatutoryObligationToControlComments]
FROM
	[InternationalTrade]
WHERE
	[StatutoryObligationToControlComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'DDDD01DE-AD39-45F8-B691-1A0E02EEB97B',
	NULL,
	NULL,
	[ReestablishmentOfTradingStatus]
FROM
	[InternationalTrade]
WHERE
	[ReestablishmentOfTradingStatus] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'5845EAA6-4DEC-4BEB-850D-2F9CF7B3F2DA',
	NULL,
	NULL,
	[ReestablishmentOfTradingStatusComments]
FROM
	[InternationalTrade]
WHERE
	[ReestablishmentOfTradingStatusComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'57F81031-D5DE-443A-838B-0DC7AB9D4454',
	NULL,
	NULL,
	[PotentialForRegionalisation]
FROM
	[InternationalTrade]
WHERE
	[PotentialForRegionalisation] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2F890ED6-3479-40F6-B390-7DA2F5A4BF11',
	NULL,
	NULL,
	[PotentialForRegionalisationComments]
FROM
	[InternationalTrade]
WHERE
	[PotentialForRegionalisationComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'CF83A24C-6885-4329-8FCA-248BFE4B7509',
	NULL,
	NULL,
	[RangeOfCommoditiesCompromised]
FROM
	[InternationalTrade]
WHERE
	[RangeOfCommoditiesCompromised] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B5F80128-2031-4414-9BA7-A18EB64939BB',
	NULL,
	NULL,
	[RangeOfCommoditiesCompromisedComments]
FROM
	[InternationalTrade]
WHERE
	[RangeOfCommoditiesCompromisedComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'40FDC18B-B3E3-4296-9E9C-EC63537AD15D',
	NULL,
	NULL,
	[ImpactOnInternationalTrade]
FROM
	[InternationalTrade]
WHERE
	[ImpactOnInternationalTrade] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[BooleanValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2',
	NULL,
	NULL,
	[NotifiableDiseaseIndicator]
FROM
	[LegislationAndMandates]
WHERE
	[NotifiableDiseaseIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[BooleanValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D001D1B4-2653-41B1-871F-9C6DBE724237',
	NULL,
	NULL,
	[ReportableCausativeOrganismIndicator]
FROM
	[LegislationAndMandates]
WHERE
	[ReportableCausativeOrganismIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C8348A4B-14DF-4665-B453-68AF2AE6226F',
	NULL,
	NULL,
	[ApplicableLegislationAndMandatesComments]
FROM
	[LegislationAndMandates]
WHERE
	[ApplicableLegislationAndMandatesComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E26D172C-9FF7-4AB1-ACBE-9FC14B22BAB9',
	NULL,
	NULL,
	[LegislationOverview]
FROM
	[LegislationAndMandates]
WHERE
	[LegislationOverview] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D91E8E19-8CE8-4FBB-859E-71590DAE54ED',
	NULL,
	NULL,
	[LegislationTypeId]
FROM
	[ApplicableLegislationAndMandates]

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C69AA48F-94F0-451A-A733-1F50A4C18CFB',
	NULL,
	NULL,
	[OpportunityToAddValueSummary]
FROM
	[OpportunityToAddValue]
WHERE
	[OpportunityToAddValueSummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8341765E-42DD-4EC8-A977-4C4181450F3D',
	NULL,
	NULL,
	[PublicAndStakeholderPerceptionSummary]
FROM
	[PublicAndStakeholderPerception]
WHERE
	[PublicAndStakeholderPerceptionSummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E8177ECD-2028-48D0-9DCB-2C44ACBBEEDC',
	NULL,
	NULL,
	[Description]
FROM
	[Summary]
WHERE
	[Description] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2B257288-DEAC-48CA-B137-1B2FA29C1F52',
	NULL,
	NULL,
	[AffectedSpeciesComments]
FROM
	[Summary]
WHERE
	[AffectedSpeciesComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'319EABCC-6CDA-4E9E-80B3-5A654194BBFF',
	NULL,
	NULL,
	[OtherAffectedSpeciesComments]
FROM
	[Summary]
WHERE
	[OtherAffectedSpeciesComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'06EFA477-EE11-4987-A021-31952082F2F2',
	NULL,
	NULL,
	[ScenarioDescription]
FROM
	[Summary]
WHERE
	[ScenarioDescription] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'1DEA58BE-575F-4A3D-9BD7-95E836759791',
	NULL,
	NULL,
	[RevisionHistory]
FROM
	[Summary]
WHERE
	[RevisionHistory] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D93AD6B7-C191-4BC1-B7B3-2CDB85DC5E83',
	NULL,
	NULL,
	[SummaryOfSurveillanceActivities]
FROM
	[Surveillance]
WHERE
	[SummaryOfSurveillanceActivities] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2AA7A601-6560-4384-AEAD-B9A74018514D',
	NULL,
	NULL,
	[PotentialUnplannedCostToExchequer]
FROM
	[WiderSociety]
WHERE
	[PotentialUnplannedCostToExchequer] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'5B5D5F1B-A0CA-4D2A-A75C-724731A7D3BA',
	NULL,
	NULL,
	[PotentialUnplannedCostToExchequerComments]
FROM
	[WiderSociety]
WHERE
	[PotentialUnplannedCostToExchequerComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'73854A00-7B2C-4452-87A4-846CF4BDCEA9',
	NULL,
	NULL,
	[GlobalEnvironment]
FROM
	[WiderSociety]
WHERE
	[GlobalEnvironment] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8950DAE5-47ED-4D45-B2BE-776A4ECD29B0',
	NULL,
	NULL,
	[GlobalEnvironmentComments]
FROM
	[WiderSociety]
WHERE
	[GlobalEnvironmentComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A0CF81AF-C6D1-4B62-A0C4-4228ECCA4D7A',
	NULL,
	NULL,
	[LocalEnvironment]
FROM
	[WiderSociety]
WHERE
	[LocalEnvironment] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'71D4A481-AB15-4E18-A252-8E82F4CB7C6E',
	NULL,
	NULL,
	[LocalEnvironmentComments]
FROM
	[WiderSociety]
WHERE
	[LocalEnvironmentComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'4C4CD781-FED9-4CAC-A3F0-7E67BE82A7A7',
	NULL,
	NULL,
	[WiderRuralCommunity]
FROM
	[WiderSociety]
WHERE
	[WiderRuralCommunity] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2047540D-11FA-4E65-9800-AFE7703F429C',
	NULL,
	NULL,
	[WiderRuralCommunityComments]
FROM
	[WiderSociety]
WHERE
	[WiderRuralCommunityComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'17369492-0391-4115-8973-2470DF2E6FA3',
	NULL,
	NULL,
	[TotalSurveillanceCosts]
FROM
	[WiderSociety]
WHERE
	[TotalSurveillanceCosts] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'46C000D8-96DE-4A15-A232-C785234E8B96',
	NULL,
	NULL,
	[TotalSurveillanceCostsComments]
FROM
	[WiderSociety]
WHERE
	[TotalSurveillanceCostsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F2A753F4-AE41-4CDD-9163-B77DF3B03806',
	NULL,
	NULL,
	[ImpactOnSocietySummary]
FROM
	[WiderSociety]
WHERE
	[ImpactOnSocietySummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
)
SELECT
	NEWID(),
	[ProfileVersionId],
	'4376E65C-1319-4A06-987F-DA7A610BF78F',
	NULL,
	NULL,
	[FFGCostsSummary]
FROM
	[WiderSociety]
WHERE
	[FFGCostsSummary] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[BooleanValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'39C11421-1494-4A29-98F1-0CF7FD363B37',
	[SpeciesId],
	NULL,
	[WelfareIssueIndicator]
FROM
	[AnimalWelfareSpecies]
WHERE
	[WelfareIssueIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E1E5B2D3-5AE7-4BD7-A3A1-4B1A4F6726DB',
	[SpeciesId],
	NULL,
	[WelfareIssueIndicatorComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[WelfareIssueIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'830906FA-0860-496C-816C-45FF963BAF50',
	[SpeciesId],
	NULL,
	[FreedomFromHungerAndThirst]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromHungerAndThirst] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2147EC1F-08CC-4689-B6D2-A0AF867649A7',
	[SpeciesId],
	NULL,
	[FreedomFromHungerAndThirstComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromHungerAndThirstComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8CED4EAB-5458-4519-9DD6-E1062212061A',
	[SpeciesId],
	NULL,
	[FreedomFromDiscomfort]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromDiscomfort] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'4F45216C-A650-4915-BF4F-6F2665CEA2BF',
	[SpeciesId],
	NULL,
	[FreedomFromDiscomfortComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromDiscomfortComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'9B5BDC1A-57F7-416F-81D6-1706F254B26F',
	[SpeciesId],
	NULL,
	[FreedomFromPainOrInjury]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromPainOrInjury] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'756554D0-8CE0-4244-A3B3-BF9C16C1CC22',
	[SpeciesId],
	NULL,
	[FreedomFromPainOrInjuryComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromPainOrInjuryComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'72BEA5CE-DAA6-4AAF-A75E-EB415880E244',
	[SpeciesId],
	NULL,
	[FreedomToExpressNormalBehaviour]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomToExpressNormalBehaviour] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'57FF2726-E245-44E8-A5A9-7BD018DDE252',
	[SpeciesId],
	NULL,
	[FreedomToExpressNormalBehaviourComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomToExpressNormalBehaviourComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'14B22362-4A5E-4823-B405-B966F9650613',
	[SpeciesId],
	NULL,
	[FreedomFromFearAndDistress]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromFearAndDistress] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'54860BEA-23A5-4631-9B2F-1222AFF78271',
	[SpeciesId],
	NULL,
	[FreedomFromFearAndDistressComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[FreedomFromFearAndDistressComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'371A7645-068B-4195-8092-798ED57416EC',
	[SpeciesId],
	NULL,
	[PotentialToReduceWelfareImplications]
FROM
	[AnimalWelfareSpecies]
WHERE
	[PotentialToReduceWelfareImplications] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C04698DF-734C-48F3-AD1B-E2097AF20280',
	[SpeciesId],
	NULL,
	[PotentialToReduceWelfareImplicationsComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[PotentialToReduceWelfareImplicationsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8B73DA0E-5DD6-43BF-837A-E7CBFD1A604D',
	[SpeciesId],
	NULL,
	[ProportionOfAnimalsAffectedSufferingSeverely]
FROM
	[AnimalWelfareSpecies]
WHERE
	[ProportionOfAnimalsAffectedSufferingSeverely] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'11A970F7-A1C2-401E-B046-66DAFF92D942',
	[SpeciesId],
	NULL,
	[ProportionOfAnimalsAffectedSufferingSeverelyComments]
FROM
	[AnimalWelfareSpecies]
WHERE
	[ProportionOfAnimalsAffectedSufferingSeverelyComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'AD30941B-186A-4080-A4EC-845287A24DAF',
	[SpeciesId],
	NULL,
	[CurrentControlMechanismsComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[CurrentControlMechanismsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B7832630-0B66-45C5-8120-A9B34B981097',
	[SpeciesId],
	NULL,
	[OtherControlMechanismsComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[OtherControlMechanismsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E9FBFAC3-0A69-44BB-A077-EDF86E29946C',
	[SpeciesId],
	NULL,
	[UptakeAtHoldingLevel]
FROM
	[ApproachToControlSpecies]
WHERE
	[UptakeAtHoldingLevel] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A9C16BC9-374D-4790-AB0B-907C3496D9CC',
	[SpeciesId],
	NULL,
	[UptakeAtHoldingLevelComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[UptakeAtHoldingLevelComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'52BE906A-3E8C-4E14-A277-0A556A0D05C5',
	[SpeciesId],
	NULL,
	[WelfareEffect]
FROM
	[ApproachToControlSpecies]
WHERE
	[WelfareEffect] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'466971E6-DA7D-4784-BBC3-84F49BD1C2DB',
	[SpeciesId],
	NULL,
	[WelfareEffectComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[WelfareEffectComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9',
	[SpeciesId],
	NULL,
	[PotentialToReduceRisk]
FROM
	[ApproachToControlSpecies]
WHERE
	[PotentialToReduceRisk] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'78E0AB9A-1E05-41E5-A40A-214F11458491',
	[SpeciesId],
	NULL,
	[PotentialToReduceRiskComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[PotentialToReduceRiskComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8EA70BCB-19B7-4890-A51C-C7AC2525C275',
	[SpeciesId],
	NULL,
	[PotentialToReduceHumanExposure]
FROM
	[ApproachToControlSpecies]
WHERE
	[PotentialToReduceHumanExposure] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'9EA1E638-AD87-4936-96D4-38B967D40E58',
	[SpeciesId],
	NULL,
	[PotentialToReduceHumanExposureComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[PotentialToReduceHumanExposureComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[BooleanValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8AC735B8-8262-4A0C-9ED7-2B591A94C599',
	[SpeciesId],
	NULL,
	[VaccinesAvailableIndicator]
FROM
	[ApproachToControlSpecies]
WHERE
	[VaccinesAvailableIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F60FCE3D-097F-4343-9A6B-7CE990288B5B',
	[SpeciesId],
	NULL,
	[VaccinesAvailableIndicatorComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[VaccinesAvailableIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'114C5FD3-10FF-41C8-9B09-13377D45DFF6',
	[SpeciesId],
	NULL,
	[ControlsAtTheHoldingLevel]
FROM
	[ApproachToControlSpecies]
WHERE
	[ControlsAtTheHoldingLevel] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'329196F6-D3D8-40B9-A839-63CCBB825D14',
	[SpeciesId],
	NULL,
	[ControlsAtTheHoldingLevelComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[ControlsAtTheHoldingLevelComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E6415E2D-689B-45AD-B5B6-398FD24845C4',
	[SpeciesId],
	NULL,
	[Compensation]
FROM
	[ApproachToControlSpecies]
WHERE
	[Compensation] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2D0FF667-E077-4ABF-8551-622A04FB6A8C',
	[SpeciesId],
	NULL,
	[LevelOfNationalPreparedness]
FROM
	[ApproachToControlSpecies]
WHERE
	[LevelOfNationalPreparedness] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'DC7F7B14-E4D0-48B0-802E-C4353062FA9A',
	[SpeciesId],
	NULL,
	[LevelOfNationalPreparednessComments]
FROM
	[ApproachToControlSpecies]
WHERE
	[LevelOfNationalPreparednessComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'ED529657-AD83-4A9A-8D93-534AC8B7DC11',
	[SpeciesId],
	NULL,
	[ControlMechanismId]
FROM
	[CurrentControlMechanisms]

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'DEA928F9-87AF-49A9-9EC1-8D7599347FE1',
	[SpeciesId],
	NULL,
	[ControlMechanismId]
FROM
	[OtherControlMechanisms]

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'7EFBBAD7-12CC-4F94-BBCF-AFF8FF44B8CE',
	[SpeciesId],
	NULL,
	[DifferentialDiagnoses]
FROM
	[EpidemiologySpecies]
WHERE
	[DifferentialDiagnoses] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'95874F6E-CFA3-4DAE-932D-FA908CFAD58C',
	[SpeciesId],
	NULL,
	[PotentialForSilentSpread]
FROM
	[EpidemiologySpecies]
WHERE
	[PotentialForSilentSpread] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B217F9B9-A18E-4CF3-82ED-FD80C86D9457',
	[SpeciesId],
	NULL,
	[PotentialForSilentSpreadComments]
FROM
	[EpidemiologySpecies]
WHERE
	[PotentialForSilentSpreadComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[DecimalValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'55C4B147-FFFE-438F-9000-74E51E2DE48E',
	[SpeciesId],
	NULL,
	[IncubationPeriodTypicalLower]
FROM
	[EpidemiologySpecies]
WHERE
	[IncubationPeriodTypicalLower] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[DecimalValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D0B7A0FA-4A8F-4B3A-8658-77CC09A94B24',
	[SpeciesId],
	NULL,
	[IncubationPeriodTypicalUpper]
FROM
	[EpidemiologySpecies]
WHERE
	[IncubationPeriodTypicalUpper] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[DecimalValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'DDE32F7E-D15D-4791-BE95-8AC56EA7584D',
	[SpeciesId],
	NULL,
	[IncubationPeriodMinimum]
FROM
	[EpidemiologySpecies]
WHERE
	[IncubationPeriodMinimum] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[DecimalValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'12FF0BBD-B7A2-4401-82B3-55A2E020FD8C',
	[SpeciesId],
	NULL,
	[IncubationPeriodMaximum]
FROM
	[EpidemiologySpecies]
WHERE
	[IncubationPeriodMaximum] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'FA9F1405-5D3D-4AC4-9C76-F072C9B6AB02',
	[SpeciesId],
	NULL,
	[ClinicalSigns]
FROM
	[EpidemiologySpecies]
WHERE
	[ClinicalSigns] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'59E4F04F-71ED-4EB0-9C1B-6F0176B5E6BC',
	[SpeciesId],
	NULL,
	[PathologicalFeatures]
FROM
	[EpidemiologySpecies]
WHERE
	[PathologicalFeatures] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'17704EAA-A505-4F9F-8E8F-2C570EAB29E5',
	[SpeciesId],
	NULL,
	[MortalityIndicator]
FROM
	[EpidemiologySpecies]
WHERE
	[MortalityIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'C975A050-5BED-40A9-90F2-57E0C0FC80A9',
	[SpeciesId],
	NULL,
	[MortalityIndicatorComments]
FROM
	[EpidemiologySpecies]
WHERE
	[MortalityIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'239C26CF-1759-45B4-B7AA-722195D70DB2',
	[SpeciesId],
	NULL,
	[DurationOfDisease]
FROM
	[EpidemiologySpecies]
WHERE
	[DurationOfDisease] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'68535B51-DACC-41F7-824E-E9627934199D',
	[SpeciesId],
	NULL,
	[DurationOfDiseaseComments]
FROM
	[EpidemiologySpecies]
WHERE
	[DurationOfDiseaseComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'2DC5E75D-80CE-4601-82AE-3F23635BF96F',
	[SpeciesId],
	NULL,
	[PrimaryDetectionMethods]
FROM
	[EpidemiologySpecies]
WHERE
	[PrimaryDetectionMethods] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'7DE49BBF-80AB-40CD-ABA3-354DE57BEDA3',
	[SpeciesId],
	NULL,
	[DetectionMethodTypeComments]
FROM
	[EpidemiologySpecies]
WHERE
	[DetectionMethodTypeComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'0F34CB48-B774-4EDC-B6E1-E52BD813455F',
	[SpeciesId],
	NULL,
	[TransmissionMechanismComments]
FROM
	[EpidemiologySpecies]
WHERE
	[TransmissionMechanismComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'ECF5E96A-CD7B-479F-84C6-8272AF79C88A',
	[SpeciesId],
	NULL,
	[RateOfSpreadOnPremises]
FROM
	[EpidemiologySpecies]
WHERE
	[RateOfSpreadOnPremises] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A1D674CA-984D-47E8-A6CB-54B1940599D8',
	[SpeciesId],
	NULL,
	[RateOfSpreadOnPremisesComments]
FROM
	[EpidemiologySpecies]
WHERE
	[RateOfSpreadOnPremisesComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'652D2259-FA6F-45A2-BB35-C7745E5056D4',
	[SpeciesId],
	NULL,
	[WildlifeReservoirIndicator]
FROM
	[EpidemiologySpecies]
WHERE
	[WildlifeReservoirIndicator] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E09D143B-4BC6-4C21-8E71-676BDF46F584',
	[SpeciesId],
	NULL,
	[WildlifeReservoirIndicatorComments]
FROM
	[EpidemiologySpecies]
WHERE
	[WildlifeReservoirIndicatorComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'10CFFCD6-9393-4973-ABDE-72835C323F62',
	[SpeciesId],
	NULL,
	[IncreaseUnderstandingPotential]
FROM
	[EpidemiologySpecies]
WHERE
	[IncreaseUnderstandingPotential] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D9D781E1-968F-4589-9BAC-006AB20FB8CF',
	[SpeciesId],
	NULL,
	[IncreaseUnderstandingPotentialComments]
FROM
	[EpidemiologySpecies]
WHERE
	[IncreaseUnderstandingPotentialComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'EFD26011-D9EB-4142-B2DE-98F04D9A7BB6',
	[SpeciesId],
	NULL,
	[TransmissionMechanismId]
FROM
	[TransmissionMechanism]

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E843BF5F-9482-4AAD-BAD0-9113B96E7FE1',
	[SpeciesId],
	NULL,
	[NumberOfCasesPerYearInGB]
FROM
	[GeographicDistributionSpecies]
WHERE
	[NumberOfCasesPerYearInGB] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'5F42D557-73EA-4682-B5DE-F26CD8517174',
	[SpeciesId],
	NULL,
	[NumberOfCasesPerYearInGBComments]
FROM
	[GeographicDistributionSpecies]
WHERE
	[NumberOfCasesPerYearInGBComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'87DA7961-C443-4E8E-B8CD-559CB2C2B0C6',
	[SpeciesId],
	NULL,
	[PotentialForRiskChange]
FROM
	[GeographicDistributionSpecies]
WHERE
	[PotentialForRiskChange] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F0DA03A4-1841-4D42-BAEE-C97EAD0F8693',
	[SpeciesId],
	NULL,
	[PotentialForRiskChangeComments]
FROM
	[GeographicDistributionSpecies]
WHERE
	[PotentialForRiskChangeComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'E6C08E8A-9258-4DB0-9D91-24AF8B32B172',
	[SpeciesId],
	NULL,
	[LevelOfHumanExposureToAnimalOrProducts]
FROM
	[HumanHealthSpecies]
WHERE
	[LevelOfHumanExposureToAnimalOrProducts] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'50949328-C9FE-41C1-BC96-CE08A772F926',
	[SpeciesId],
	NULL,
	[LevelOfHumanExposureToAnimalOrProductsComments]
FROM
	[HumanHealthSpecies]
WHERE
	[LevelOfHumanExposureToAnimalOrProductsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'75D1A6F2-554F-41E9-AA6B-D334794E3774',
	[SpeciesId],
	NULL,
	[AttributableFraction]
FROM
	[HumanHealthSpecies]
WHERE
	[AttributableFraction] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'D770C9AF-BB81-431C-A3FC-AB263D0D02D6',
	[SpeciesId],
	NULL,
	[AttributableFractionComments]
FROM
	[HumanHealthSpecies]
WHERE
	[AttributableFractionComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'78CEE922-DDFC-469F-8614-2F01ABF79F9A',
	[SpeciesId],
	NULL,
	[CommercialTrade]
FROM
	[InternationalTradeSpecies]
WHERE
	[CommercialTrade] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'B67553CC-F12B-420C-912A-D1C633F83A26',
	[SpeciesId],
	NULL,
	[CommercialTradeComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[CommercialTradeComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'34A3D221-92EE-4DD1-B59C-67D814CA7FE7',
	[SpeciesId],
	NULL,
	[ImpactOnLevelOfImports]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnLevelOfImports] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'25E9EC19-D3FC-4FC2-A9E0-F2301FF2222A',
	[SpeciesId],
	NULL,
	[ImpactOnLevelOfImportsComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnLevelOfImportsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'CFD4A65F-A2ED-4C45-9FFF-E41DDCB9E38E',
	[SpeciesId],
	NULL,
	[ImportanceOfExportTrade]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImportanceOfExportTrade] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'A3E6098E-71C8-4A7A-8D30-74358EF3B5FA',
	[SpeciesId],
	NULL,
	[ImportanceOfExportTradeComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImportanceOfExportTradeComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'F2801477-78C8-4A34-A35B-8B64CDFEB471',
	[SpeciesId],
	NULL,
	[ImpactOnIntraCommunityFlows]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnIntraCommunityFlows] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'74D538E3-342D-4622-89E7-EE0A3752B078',
	[SpeciesId],
	NULL,
	[ImpactOnIntraCommunityFlowsComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnIntraCommunityFlowsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'9A429CF0-7435-470D-9C22-319708F1E721',
	[SpeciesId],
	NULL,
	[ImpactOnThirdCountryFlows]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnThirdCountryFlows] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'106E6232-7BBB-4945-987B-C5ABCE8040BD',
	[SpeciesId],
	NULL,
	[ImpactOnThirdCountryFlowsComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[ImpactOnThirdCountryFlowsComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'8B5240E4-59F3-429A-9C62-2EF561201BB8',
	[SpeciesId],
	NULL,
	[ExportMarketValue]
FROM
	[InternationalTradeSpecies]
WHERE
	[ExportMarketValue] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'DE949D70-B6EC-44B5-A82E-AD87AB47F261',
	[SpeciesId],
	NULL,
	[ExportMarketValueComments]
FROM
	[InternationalTradeSpecies]
WHERE
	[ExportMarketValueComments] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'27848441-EE33-452F-B71E-658172CB0F37',
	[SpeciesId],
	NULL,
	[RiskScenarios]
FROM
	[RiskSpecies]
WHERE
	[RiskScenarios] IS NOT NULL


INSERT INTO [ProfileVersionQuestionRow]
	(
	[Id],
	[ProfileVersionId],
	[ProfileQuestionId],
	[SequenceNumber]
	)
SELECT
	[Id],
	[ProfileVersionId],
	'1B1FD167-E16B-4297-9BEA-B34C434A998C',
	ROW_NUMBER() OVER (PARTITION BY [ProfileVersionId] ORDER BY [SpeciesId], [Reference])
FROM
	[CurrentSurveillanceActivitiesSpecies]


	
	INSERT INTO [ProfileVersionFieldValue]
		(
		[Id],
		[ProfileVersionId],
		[ProfileFieldId],
		[SpeciesId],
		[ProfileVersionQuestionRowId],
		[TextValue]
		)
	SELECT
		NEWID(),
		[ProfileVersionId],
		'FEC172AA-CEAE-476C-B23C-A8BE1FFD763D',
		[SpeciesId],
		[Id],
		[Reference]
	FROM
		[CurrentSurveillanceActivitiesSpecies]
	WHERE
		[Reference] IS NOT NULL

	
	INSERT INTO [ProfileVersionFieldValue]
		(
		[Id],
		[ProfileVersionId],
		[ProfileFieldId],
		[SpeciesId],
		[ProfileVersionQuestionRowId],
		[ListValue]
		)
	SELECT
		NEWID(),
		[ProfileVersionId],
		'054AC640-9C3E-4400-BEB3-18720172BF44',
		[SpeciesId],
		[Id],
		[Mechanism]
	FROM
		[CurrentSurveillanceActivitiesSpecies]
	WHERE
		[Mechanism] IS NOT NULL

	
	INSERT INTO [ProfileVersionFieldValue]
		(
		[Id],
		[ProfileVersionId],
		[ProfileFieldId],
		[SpeciesId],
		[ProfileVersionQuestionRowId],
		[TextValue]
		)
	SELECT
		NEWID(),
		[ProfileVersionId],
		'68BE0CF9-4AE3-4CB4-A030-C8DDBBA62F90',
		[SpeciesId],
		[Id],
		[PurposeAndDetail]
	FROM
		[CurrentSurveillanceActivitiesSpecies]
	WHERE
		[PurposeAndDetail] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[ListValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'13955418-8899-44D9-A48B-D6D3DBB838D4',
	[SpeciesId],
	NULL,
	[LocalAgriculturalEconomy]
FROM
	[WiderSocietySpecies]
WHERE
	[LocalAgriculturalEconomy] IS NOT NULL

INSERT INTO [ProfileVersionFieldValue]
	(
	[Id],
	[ProfileVersionId],
	[ProfileFieldId],
	[SpeciesId],
	[ProfileVersionQuestionRowId],
	[TextValue]
	)
SELECT
	NEWID(),
	[ProfileVersionId],
	'EDDC2E84-8AAD-4234-B765-969BC897915C',
	[SpeciesId],
	NULL,
	[LocalAgriculturalEconomyComments]
FROM
	[WiderSocietySpecies]
WHERE
	[LocalAgriculturalEconomyComments] IS NOT NULL

CREATE NONCLUSTERED INDEX [IX_ProfileVersionFieldValue_ProfileVersionId] ON [ProfileVersionFieldValue]
(
[ProfileVersionId]
) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_ProfileVersionQuestionRow_ProfileVersionId] ON [ProfileVersionQuestionRow]
(
[ProfileVersionId]
) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
							
-- 2.6.2 d)

ALTER TABLE [ProfileVersionFieldValue]
WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionFieldValue_ReferenceValue] FOREIGN KEY([ListValue])
REFERENCES [ReferenceValue] ([Id])
GO


-- 2.2.3 a)

ALTER TABLE [dbo].[ProfileQuestion] ADD
	[NonTechnicalName] varchar(255) NULL
GO

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]=[Name]

ALTER TABLE [dbo].[ProfileQuestion]
ALTER COLUMN [NonTechnicalName] VARCHAR(255) NOT NULL
GO

-- 2.2.3 b)

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is it?'
WHERE [Id]='D0086A85-E54B-4CA7-90E0-070915B76C3A'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Why is it important?'
WHERE [Id]='F9AF0D5F-CE13-4FD9-A1AC-0DD894D6C56A'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Does it affect people?'
WHERE [Id]='A025E3EE-5A2A-47CC-99DC-63ACF3D98F59'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What are the effects on people?'
WHERE [Id]='CB1DE3F4-FD98-46A2-BC82-12FC88D76EED'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How is it transmitted to people?'
WHERE [Id]='D298E014-DF8D-4680-B93E-CB62CB2DE2C8'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Is it transmitted between people?'
WHERE [Id]='B35E3C7F-0651-42FC-B427-6D6D1926F3D1'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How is the disease spread between animals?'
WHERE [Id]='C7BEF5CF-0A53-43B3-A6C4-03C86014E766'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How is the disease spread between premises?'
WHERE [Id]='D62C2D6C-D824-4E37-B744-072A7274D062'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What are the effects on live animals?'
WHERE [Id]='739B5116-5E5C-4A24-B38B-F4811F32C22B'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What are the features observed on dead animals?'
WHERE [Id]='9FBE8E95-D897-46BC-8E32-0689E4490358'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Is there a vaccine for animals?'
WHERE [Id]='E0AF3E4E-55DC-425C-80A7-E48C68841E0E'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How can animals be treated?'
WHERE [Id]='14E5D526-B35A-47AB-AAAD-4A9C2E173099'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Is it a notifiable disease?'
WHERE [Id]='47F994AA-F7F3-4F06-A24E-CE6473062C90'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Is it a reportable disease'
WHERE [Id]='AB87554C-98D0-4FF4-9C93-B3AC33720669'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Where does the disease occur abroad?'
WHERE [Id]='15371B7D-9630-44B1-BCFC-31B7850FCDB6'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How might the disease be introduced to Great Britain?'
WHERE [Id]='504166F3-FE15-4E0C-B902-B5C3E9A19453'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is the government doing to look for the disease?'
WHERE [Id]='F03E03A8-2BB8-4B05-87C5-C10B81BB960A'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is currently being done to control this disease or issue in Great Britain?'
WHERE [Id]='33BC3269-F975-47E3-AEE0-527C15D55660'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What else could be done to control the disease or issue in Great Britain?'
WHERE [Id]='55940F19-9CE3-4118-A6B1-2311F41FC285'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is the impact of the disease on animal welfare?'
WHERE [Id]='D2174FEE-AA09-4CB9-B66C-266E7AC6F463'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is the impact of the disease on international trade?'
WHERE [Id]='A9AE8EF9-FD50-463B-A5A1-64C05B16C176'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What animals are profiled?'
WHERE [Id]='602F2CA1-0DB9-4E1C-A2B6-9BF708CB7AB0'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What other animals are affected?'
WHERE [Id]='602F2CA1-0DB9-4E1C-A2B6-9BF708CB7AB0'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Is this disease currently present in Great Britain?'
WHERE [Id]='93B12402-F412-4227-9E86-B929F5C42171'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='How common is it in Great Britain?'
WHERE [Id]='3756BE7D-AB87-46ED-841A-AF6FF3CDB325'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='Potential for risk change in GB'
WHERE [Id]='5790EEAA-1496-4357-A4ED-98B2B991D090'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='When did the disease last occur in Great Britain?'
WHERE [Id]='FBF10EF6-3DFE-4409-BC6F-E9D0A7316368'

UPDATE [dbo].[ProfileQuestion]
SET [NonTechnicalName]='What is the risk of introduction into Great Britain?'
WHERE [Id]='55C96DCC-03E8-4650-A055-C97CAAD5BE01'



--2.5.1 a)
CREATE TABLE [dbo].[SpeciesSection]
	(
	[Id] uniqueidentifier NOT NULL,
	[Name] varchar(200) NOT NULL,
	[ShortName] varchar(80) NOT NULL,
	[SectionNumber] int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[SpeciesSection] ADD CONSTRAINT
	PK_SpeciesSection PRIMARY KEY CLUSTERED 
	(
	[Id]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('A77543E5-1154-42B6-A4FE-60DFD884B178','Animal identification', 'Animal identification', 1)
INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('E64B9A7E-F5EA-42EE-9267-04D38400C332','Movements', 'Movements', 2)
INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('BF444992-298E-4E44-B1E2-F8D9F9BFDD20','Animal locations and number', 'Animal locations and number', 3)
INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('A43641F9-8572-477E-84D8-ADF54782F840','Bio-security', 'Bio-security', 4)
INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('5A98D508-B9F5-43CD-A231-1683F9002924','Surveillance', 'Surveillance', 5)
INSERT INTO [dbo].[SpeciesSection] ([Id],[Name],[ShortName],[SectionNumber]) VALUES ('3F9F8EF6-1B94-44C2-8D4C-907A34E21A57','International trade', 'International trade', 6)

--2.5.1 b)
CREATE TABLE [dbo].[SpeciesQuestion]
	(
	[Id] uniqueidentifier NOT NULL,
	[Name] varchar(255) NOT NULL,
	[SpeciesSectionId] uniqueidentifier NOT NULL,
	[QuestionNumber] int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[SpeciesQuestion] ADD CONSTRAINT
	PK_SpeciesQuestion PRIMARY KEY CLUSTERED 
	(
	[Id]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SpeciesQuestion] ADD CONSTRAINT
	FK_SpeciesQuestion_SpeciesSection FOREIGN KEY
	(
	[SpeciesSectionId]
	) REFERENCES [dbo].[SpeciesSection]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('5630C7C7-B192-4415-867C-00A04BB6305A','How accurately can certain animals of this species be identified?','A77543E5-1154-42B6-A4FE-60DFD884B178',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('3F21C529-6883-4658-B79E-408F67BB7B2D','How easy is it to investigate the movement of a specific animal or group of animals (general requirements/anticipated modal approach by modal keeper of this species/group?)','E64B9A7E-F5EA-42EE-9267-04D38400C332',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('7B85141F-B9B0-4852-B9CA-9FD575ADBA2B','In addition to the above general requirements there may be specific records for certain types of holding situation','E64B9A7E-F5EA-42EE-9267-04D38400C332',2)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('39DD8372-2B37-452F-A0FB-A32B5625C3BF','Number of holdings in GB','BF444992-298E-4E44-B1E2-F8D9F9BFDD20',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('A4E50F95-41A1-4632-ABEC-1570B60A11E5','Number of animals in GB','BF444992-298E-4E44-B1E2-F8D9F9BFDD20',2)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('E3CEE297-D9EE-4CEF-A4D3-F39ECB9E34B5','Proportion of these holdings that keep mixed species','BF444992-298E-4E44-B1E2-F8D9F9BFDD20',3)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('848E16D2-4243-4615-8415-11820A5F9A76','Livestock contacts','A43641F9-8572-477E-84D8-ADF54782F840',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('AB21BB0B-D5B7-4221-B096-3E0501FD2F92','Imported livestock - isolation','A43641F9-8572-477E-84D8-ADF54782F840',2)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('E4E57D73-5B1F-4264-97E2-A241C9F22812','Imported livestock - testing/treatment regime','A43641F9-8572-477E-84D8-ADF54782F840',3)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('5BF9BB97-3495-45FB-88F4-7AAE8DA86D77','Farm personnel - animal contacts elsewhere','A43641F9-8572-477E-84D8-ADF54782F840',4)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('B60E99CD-1381-488E-9E02-73BBB1636CDE','Farm personnel - observance of bio-security protocols','A43641F9-8572-477E-84D8-ADF54782F840',5)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('9D259F12-6301-42EF-BD9A-2301F8DBCFE3','Farm situation - modal type of group of this species','A43641F9-8572-477E-84D8-ADF54782F840',6)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('3556BEFC-9126-4A5C-A17F-A765B0EF1988','Farm situation - degree of separation','A43641F9-8572-477E-84D8-ADF54782F840',7)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('4682104E-2A53-44E6-9E23-76FC15EAC4B3','Farm situation - how many assurance schemes apply to livestock of this species?','A43641F9-8572-477E-84D8-ADF54782F840',8)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('3EAEC91B-9883-46DC-B60C-86F48DF86056','Level of carcase submissions to VLA for this species?','5A98D508-B9F5-43CD-A231-1683F9002924',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('8CFD9556-AA35-49F7-87D6-B8D3E11CBE8F','Is much testing generally carried out by non Government labs for this species?','5A98D508-B9F5-43CD-A231-1683F9002924',2)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('66835FBE-F278-4DF2-9866-4D21BA49C6E7','Are any samples (other than carcases) collected routinely for Government Surveillance Schemes?','5A98D508-B9F5-43CD-A231-1683F9002924',3)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('CCCBFD7D-CF8C-49DD-822A-0DFC2B446239','Is there substantial commercial trade in this species/group?','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',1)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('75347697-DF29-4452-B2AD-EC3BB5BBF0C0','Relative importance of export trade to the industry sector','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',2)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('EC2F6F45-A3F7-46D5-AECA-1993E40611D5','Potential level of imports for this species/group','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',3)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('1863217E-E667-45E5-BFC1-6F863B5103A9','Annual level of export consignments containing animals/commodities in this species/group sent into intracommunity trade','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',4)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('22DCE389-3D60-4F35-A58B-186E0B8B32BA','Annual level of export consignments containing animals commodities of this species/group sent into third country trade','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',5)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('AC02555E-8561-4C8A-AB03-A325C2B4E12F','Export market value for this species/group','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',6)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('90E2020D-9F7A-43E3-BDB9-E6471098B671','Number of holdings in GB','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',7)
INSERT INTO [dbo].[SpeciesQuestion] ([Id], [Name], [SpeciesSectionId],[QuestionNumber]) VALUES ('B04DE56E-D027-4905-A32A-7AC6C3F487D4','GB population','3F9F8EF6-1B94-44C2-8D4C-907A34E21A57',8)

--2.5.1 c)
ALTER TABLE [dbo].[SpeciesField] ADD
	[ProfileFieldId] uniqueidentifier NULL
GO
ALTER TABLE [dbo].[SpeciesField] ADD CONSTRAINT
	FK_SpeciesField_ProfileField FOREIGN KEY
	(
	[ProfileFieldId]
	) REFERENCES [dbo].[ProfileField]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='8B5240E4-59F3-429A-9C62-2EF561201BB8' WHERE [Id]='33E63913-09D4-484E-8818-3485D2897FEF'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='78CEE922-DDFC-469F-8614-2F01ABF79F9A' WHERE [Id]='D8508D02-644C-4DB7-AFE0-84F66DA95F91'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='9A429CF0-7435-470D-9C22-319708F1E721' WHERE [Id]='FF59C6DB-10EE-43D2-AC57-ABD20CBD802F'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='34A3D221-92EE-4DD1-B59C-67D814CA7FE7' WHERE [Id]='2B3E6845-4D43-4F03-9ACE-5EF35D4DFE1B'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='A3E6098E-71C8-4A7A-8D30-74358EF3B5FA' WHERE [Id]='FE30E671-91EB-4F12-AB47-DEB08473DFE7'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='F2801477-78C8-4A34-A35B-8B64CDFEB471' WHERE [Id]='3A5910E4-6E48-4EDB-A916-40AAAD39F122'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='DE949D70-B6EC-44B5-A82E-AD87AB47F261' WHERE [Id]='03477D37-30CC-4878-826A-9414DD288D63'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='106E6232-7BBB-4945-987B-C5ABCE8040BD' WHERE [Id]='7641F411-EE1A-4135-A502-007AB080B41A'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='B67553CC-F12B-420C-912A-D1C633F83A26' WHERE [Id]='08C76C6D-48F6-477C-B123-6820707B09EC'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='CFD4A65F-A2ED-4C45-9FFF-E41DDCB9E38E' WHERE [Id]='E48AA9CA-4A0A-4C4C-B097-150333240874'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='74D538E3-342D-4622-89E7-EE0A3752B078' WHERE [Id]='615589A7-8FE3-4070-82DB-EA4161C346E0'
UPDATE [dbo].[SpeciesField] SET [ProfileFieldId]='25E9EC19-D3FC-4FC2-A9E0-F2301FF2222A' WHERE [Id]='34119D63-C218-43E2-BEBB-B2D91D57927D'

--2.5.1 d)
ALTER TABLE [dbo].[SpeciesField] ADD
	[SpeciesQuestionId] uniqueidentifier NULL
GO
ALTER TABLE [dbo].[SpeciesField] ADD CONSTRAINT
	FK_SpeciesField_SpeciesQuestion FOREIGN KEY
	(
	[SpeciesQuestionId]
	) REFERENCES [dbo].[SpeciesQuestion]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
GO

ALTER TABLE [dbo].[SpeciesTableAuditLogEntry] DROP CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesField]
GO

-- fix the GUIDs for the GB Population and Holding Count species fields 
UPDATE
	[SpeciesTableAuditLogEntry]
SET
	[SpeciesTableAuditLogEntry].[SpeciesFieldId] = 'AA9F05BE-B863-4702-B135-32AA4412F05C'
FROM
	[SpeciesTableAuditLogEntry] INNER JOIN [SpeciesField] ON [SpeciesTableAuditLogEntry].[SpeciesFieldId] = [SpeciesField].[Id]
WHERE
	[SpeciesField].[ShortName] = 'GB Population'

UPDATE
	[SpeciesField]
SET
	[Id] = 'AA9F05BE-B863-4702-B135-32AA4412F05C'
WHERE
	[SpeciesField].[ShortName] ='GB Population'

UPDATE
	[SpeciesTableAuditLogEntry]
SET
	[SpeciesTableAuditLogEntry].[SpeciesFieldId] = '03E75B79-5BFF-4A16-9722-3B41043B3E9A'
FROM
	[SpeciesTableAuditLogEntry] INNER JOIN [SpeciesField] ON [SpeciesTableAuditLogEntry].[SpeciesFieldId] = [SpeciesField].[Id]
WHERE
	[SpeciesField].[ShortName] = 'GB Holding Count'

UPDATE
	[SpeciesField]
SET
	[Id] = '03E75B79-5BFF-4A16-9722-3B41043B3E9A'
WHERE
	[SpeciesField].[ShortName] ='GB Holding Count'

UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='22DCE389-3D60-4F35-A58B-186E0B8B32BA', [Name]=null WHERE ID='FF59C6DB-10EE-43D2-AC57-ABD20CBD802F'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='22DCE389-3D60-4F35-A58B-186E0B8B32BA', [Name]='Supporting comments' WHERE ID='7641F411-EE1A-4135-A502-007AB080B41A'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='EC2F6F45-A3F7-46D5-AECA-1993E40611D5', [Name]=null WHERE ID='2B3E6845-4D43-4F03-9ACE-5EF35D4DFE1B'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='EC2F6F45-A3F7-46D5-AECA-1993E40611D5', [Name]='Supporting comments' WHERE ID='34119D63-C218-43E2-BEBB-B2D91D57927D'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='1863217E-E667-45E5-BFC1-6F863B5103A9', [Name]=null WHERE ID='3A5910E4-6E48-4EDB-A916-40AAAD39F122'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='1863217E-E667-45E5-BFC1-6F863B5103A9', [Name]='Supporting comments' WHERE ID='615589A7-8FE3-4070-82DB-EA4161C346E0'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='B04DE56E-D027-4905-A32A-7AC6C3F487D4', [Name]=null WHERE ID='AA9F05BE-B863-4702-B135-32AA4412F05C'
--UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='B04DE56E-D027-4905-A32A-7AC6C3F487D4', [Name]='Supporting comments' WHERE ID='EDBA24BC-638F-4F74-BDB8-F54D517F8AF0'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='AC02555E-8561-4C8A-AB03-A325C2B4E12F', [Name]=null WHERE ID='33E63913-09D4-484E-8818-3485D2897FEF'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='AC02555E-8561-4C8A-AB03-A325C2B4E12F', [Name]='Supporting comments' WHERE ID='03477D37-30CC-4878-826A-9414DD288D63'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='90E2020D-9F7A-43E3-BDB9-E6471098B671', [Name]=null WHERE ID='03E75B79-5BFF-4A16-9722-3B41043B3E9A'
--UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='90E2020D-9F7A-43E3-BDB9-E6471098B671', [Name]='Supporting comments' WHERE ID='73EA7E50-0D42-464C-BF45-C417AE54D8BA'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='75347697-DF29-4452-B2AD-EC3BB5BBF0C0', [Name]=null WHERE ID='E48AA9CA-4A0A-4C4C-B097-150333240874'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='75347697-DF29-4452-B2AD-EC3BB5BBF0C0', [Name]='Supporting comments' WHERE ID='FE30E671-91EB-4F12-AB47-DEB08473DFE7'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='CCCBFD7D-CF8C-49DD-822A-0DFC2B446239', [Name]=null WHERE ID='D8508D02-644C-4DB7-AFE0-84F66DA95F91'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='CCCBFD7D-CF8C-49DD-822A-0DFC2B446239', [Name]='Supporting comments' WHERE ID='08C76C6D-48F6-477C-B123-6820707B09EC'
GO

--Remove Name and ParentId entries

DELETE FROM [dbo].[SpeciesField] WHERE [id]='3BC53920-3AAF-43DA-9753-A4FECCF3FDE4'
DELETE FROM [dbo].[SpeciesField] WHERE [id]='D6AB8580-E240-412B-9915-F506DB19F40D'
GO

ALTER TABLE [dbo].[SpeciesField] ALTER COLUMN [SpeciesQuestionId] uniqueidentifier NOT NULL
GO

INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('C0C269CC-357E-4498-AA98-EC08BE05AAB6',null,'Ease of investigation of animal movement',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'3F21C529-6883-4658-B79E-408F67BB7B2D')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('D59C9118-E8F4-4A70-B0F6-1845C14F4156','Tick all that apply to this species','Specific holding records',1,null,'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',0,null,'7B85141F-B9B0-4852-B9CA-9FD575ADBA2B')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('8EBEA30B-38F8-4674-B7D4-6BD793EB87F2',null,'Level of carcase submissions',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'3EAEC91B-9883-46DC-B60C-86F48DF86056')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('FAD094A1-B3FE-4444-86EB-658B0C9FA0D7','Supporting comments','Level of carcase submissions supporting commments',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'3EAEC91B-9883-46DC-B60C-86F48DF86056')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('6B59E436-FC6B-4237-8035-D8076BD04767',null,'Government testing',1,'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4','A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'8CFD9556-AA35-49F7-87D6-B8D3E11CBE8F')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('76036510-8C5D-4B16-AAB1-7C22D52358B6','Supporting comments','Government testing supporting comments',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'8CFD9556-AA35-49F7-87D6-B8D3E11CBE8F')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('0E301C34-89A6-418C-B995-154BABD5445A','Nationally implemented schemes','Samples collected routinely for national govt schemes',1,null,'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',0,null,'66835FBE-F278-4DF2-9866-4D21BA49C6E7')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('DEF98BB9-8165-439B-AC9D-D0EAFBF769BF','Supporting comments','Samples collected routinely for national govt schemes supporting comments',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'66835FBE-F278-4DF2-9866-4D21BA49C6E7')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('A16BAF3B-2904-4A6A-ADF0-1A2FD900AA08','Locally implemented schemes (e.g. abortion investigations)','Samples collected routinely for local govt schemes',3,null,'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',0,null,'66835FBE-F278-4DF2-9866-4D21BA49C6E7')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('B2F7AC6C-78ED-4F7D-A116-E485E71E60A6','Supporting comments','Samples collected routinely for local govt schemes supporting comments',4,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'66835FBE-F278-4DF2-9866-4D21BA49C6E7')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('F16A5742-C34B-4F34-8AFF-F46C3766C9BE','Individual animal level','Species identification accuracy',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'5630C7C7-B192-4415-867C-00A04BB6305A')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('05DF331C-30B8-43EF-9300-B5DCE9E9FE8C',null,'Livestock contacts',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'848E16D2-4243-4615-8415-11820A5F9A76')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('2A245EF3-33D1-4134-AA3D-26EF614E82B0',null,'Imported livestock isolation',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'AB21BB0B-D5B7-4221-B096-3E0501FD2F92')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('2A9A3DA3-E8A0-444D-87D9-AE961592D511',null,'Imported livestock testing/treatment regime',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'E4E57D73-5B1F-4264-97E2-A241C9F22812')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('9429482D-89F5-4465-8D02-56FB46A99305',null,'Farm personnel animal contacts elsewhere',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'5BF9BB97-3495-45FB-88F4-7AAE8DA86D77')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('BC635D99-C57F-4E1B-82B2-F2D39410A764',null,'Farm personnel observance of bio-security',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'B60E99CD-1381-488E-9E02-73BBB1636CDE')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('7CB1554F-8693-48BE-9BC3-418C2C1BA59D',null,'Farm situation modal type of group of species',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'9D259F12-6301-42EF-BD9A-2301F8DBCFE3')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('5BC535E4-DB66-4077-8786-4AA79D175869',null,'Farm situation separation',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'3556BEFC-9126-4A5C-A17F-A765B0EF1988')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('641C0C32-35EE-4442-AA40-E512962D2C04',null,'Farm situation assurance schemes apply to livestock of species',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'4682104E-2A53-44E6-9E23-76FC15EAC4B3')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('39F4A38A-F679-4F29-BEF5-74E5FB7147A5',null,'Holdings in GB',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'39DD8372-2B37-452F-A0FB-A32B5625C3BF')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('73EA7E50-0D42-464C-BF45-C417AE54D8BA','Supporting comments','',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'39DD8372-2B37-452F-A0FB-A32B5625C3BF')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('5B03E550-538A-4E25-B5C0-5F5856D067F4',null,'Animals in GB',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'A4E50F95-41A1-4632-ABEC-1570B60A11E5')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('EDBA24BC-638F-4F74-BDB8-F54D517F8AF0','Supporting comments','',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'A4E50F95-41A1-4632-ABEC-1570B60A11E5')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('C7DBDBFE-F5C8-427B-89CE-5067B88C3D1F',null,'Mixed species holdings',1,null,'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',0,null,'E3CEE297-D9EE-4CEF-A4D3-F39ECB9E34B5')
INSERT INTO [dbo].[SpeciesField] ([Id],[Name],[ShortName],[FieldNumber],[ReferenceTableId],[DataFieldTypeId],[IsMandatory],[ProfileFieldId],[SpeciesQuestionId])
VALUES ('6DA09A54-5282-4681-91D2-B3054AE6DE0D','Supporting comments','',2,null,'D297F63B-638A-4574-B042-97C248338A26',0,null,'E3CEE297-D9EE-4CEF-A4D3-F39ECB9E34B5')

--2.5.1 e)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('26309E98-8744-4E25-8ADE-18BB84740363','Identification accuracy',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('F0E877DF-6E63-4831-B64D-FD96AA80289A','26309E98-8744-4E25-8ADE-18BB84740363','Unique id & "passport"',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('F597E690-BB10-4D69-A3B9-E1D809632014','26309E98-8744-4E25-8ADE-18BB84740363','"Passport" but can’t always guarantee identity',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('E939716D-BB9D-45E7-9FE9-1B5EE7ED075A','26309E98-8744-4E25-8ADE-18BB84740363','Unique id, no "passport"',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('DB8C3094-137F-4DD6-B1FF-9D8F44B3D51C','26309E98-8744-4E25-8ADE-18BB84740363','Some with unique id',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('6DDA1798-DCB9-43FD-89F2-71A6248FFFE3','26309E98-8744-4E25-8ADE-18BB84740363','All identifiable to a holding',5)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('CCCFDA2D-97D4-44F3-A30E-BE64996B7882','26309E98-8744-4E25-8ADE-18BB84740363','Some identifiable to a holding',6)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('E4BC8CE3-34E0-4D4E-957E-DB5118CA1C2F','26309E98-8744-4E25-8ADE-18BB84740363','Can rarely identify an area (wildlife)',7)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('9362A79F-E1F2-42BB-B90B-50DD85415D40','26309E98-8744-4E25-8ADE-18BB84740363','No id or association in an area',8)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('E8D62DF1-A677-473C-B662-4C5F7105CED7','Movement investigation accuracy',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('4A4DAD0D-E3D5-4347-BD0C-5346E74B60BF','E8D62DF1-A677-473C-B662-4C5F7105CED7','Each individual & its movement recorded nationally',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('D37A87AB-40DF-48FE-BB0C-CBC0D705DDC7','E8D62DF1-A677-473C-B662-4C5F7105CED7','Each has id, group movements recorded nationally',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('CDF124EB-52AC-430C-BAD9-B00D820412BC','E8D62DF1-A677-473C-B662-4C5F7105CED7','All movements of groups recorded nationally',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('D9E6E08C-BEDD-443B-9A32-5FA9DC7BFC17','E8D62DF1-A677-473C-B662-4C5F7105CED7','Some movements of groups recorded nationally',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('FECED740-B7F2-466D-9295-DE31BAA83689','E8D62DF1-A677-473C-B662-4C5F7105CED7','Movements of groups recorded locally',5)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('6EEBEAAA-5141-49F8-8673-EE70C6986880','E8D62DF1-A677-473C-B662-4C5F7105CED7','Some may keep movement records voluntarily',6)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('933E742A-AC86-4BFA-879E-7B2443B7E834','E8D62DF1-A677-473C-B662-4C5F7105CED7','No movement recording anticipated',7)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('31A35980-0682-4604-9DDB-485A0120E6FD','Holding records',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('AEBA841D-3D77-4448-B0A5-6CCF894E10F5','31A35980-0682-4604-9DDB-485A0120E6FD','Market records',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('0B80EE9E-175B-43DC-A238-E4007DF8B282','31A35980-0682-4604-9DDB-485A0120E6FD','Show records',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('1C9CEB76-EDA4-4D6F-931D-0BFABADE9929','31A35980-0682-4604-9DDB-485A0120E6FD','Pig walking licence',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('95D2973D-7FC8-46F9-A54B-9682E4224685','31A35980-0682-4604-9DDB-485A0120E6FD','Pig pyramid member',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('CB483FCE-FEF0-4A44-83E2-B6C3D7F3DBDB','31A35980-0682-4604-9DDB-485A0120E6FD','Goat walking licence',5)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('7EF73336-D5E0-464C-BB83-57F4F39C6B42','31A35980-0682-4604-9DDB-485A0120E6FD','Exhibition licence',6)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('1B57612D-C541-496B-8274-BC14BB7747AF','31A35980-0682-4604-9DDB-485A0120E6FD','Bird fayres',7)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('4F98D183-FCE7-451B-91EC-F1A864BF7614','31A35980-0682-4604-9DDB-485A0120E6FD','Horses at competitions',8)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC','Holdings',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('59BDFE7D-A2B7-42F3-8E57-597E28A238C9','49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC','1-999',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('449200A6-7002-4C64-9927-38828E74CAD1','49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC','1000-4999',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('5A183853-F522-49B6-A840-CC396DBA1E1C','49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC','5000-9999',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('C960B55E-A691-4035-B11E-393619BFCC66','49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC','>9999',4)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63','Population',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('AD39770A-81AE-4F7A-8745-739F99610ACA','FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63','1-49,999',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('6954C874-659A-48FB-908B-642E558065F8','FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63','50,000-999,999',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('286FB4D5-F539-420B-8C46-3FE1F85703A1','FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63','1,000,000-9,999,999',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('83CB55B6-DAA1-4C29-B2B7-9659A9EA4577','FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63','>9,999,999',4)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('BEADAD71-3150-4B45-8C31-103D6F417281','Mixed species holding',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('54B3C942-CDEE-4749-AC97-444C9F12EEF3','BEADAD71-3150-4B45-8C31-103D6F417281','0',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('B2B3036B-D698-430C-A754-8B7214F61D84','BEADAD71-3150-4B45-8C31-103D6F417281','1-50%',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('7141F040-26A6-4A3D-B39F-D25925079F7D','BEADAD71-3150-4B45-8C31-103D6F417281','51-100%',3)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Livestock contact',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('2D630AB3-0D22-4990-B60D-5455CC9A2FBC','B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Regularly mix',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('E7D40F20-121D-4687-BF0D-197D668B4D70','B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Occasionally mix',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('3EE6817A-DA81-4ECC-8EB1-D8447E051B92','B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Rarely mix, but replacements widely sourced',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('8B40C36C-2C05-4CD3-8EFF-D70AB6368AA1','B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Rarely mix, replacements specifically sourced',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('0EF4B6A6-8B36-457E-8270-C3B6D7F065F4','B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5','Majority are all in – all out',5)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('1A2E069F-96CC-45F1-B95F-8111348D0590','Livestock isolation',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('AB01C27A-A83A-4BAF-82AE-754AB9923BD5','1A2E069F-96CC-45F1-B95F-8111348D0590','Mixed on arrival',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('EA566DBE-3491-448E-8BAA-366101080529','1A2E069F-96CC-45F1-B95F-8111348D0590','Separate for a few days',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('CBE2518C-1100-4EA4-88C9-2339FFB4B070','1A2E069F-96CC-45F1-B95F-8111348D0590','Separate throughout life (all in – all out)',3)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('9C008842-A7A3-4020-8E74-F4C4007D9EEE','Livestock testing',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('62985975-2A3E-41DF-B751-F1971BB40FCE','9C008842-A7A3-4020-8E74-F4C4007D9EEE','No preventative action taken',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('FB8AA6FE-7E81-42C0-9830-BE0A6DA2E54F','9C008842-A7A3-4020-8E74-F4C4007D9EEE','Precautions taken for 1 – 2 specific diseases',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('48F0FD55-2C75-4184-9077-7B20174B425A','9C008842-A7A3-4020-8E74-F4C4007D9EEE','Precautions taken for 3 + diseases',3)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('20C18730-4291-4608-A2A5-86F37D3D06B2','Personnel contact',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('3532F881-9C7D-44CF-8B01-110B52725231','20C18730-4291-4608-A2A5-86F37D3D06B2','Frequent association elsewhere',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('843F037B-2718-4359-997D-718CC6724C6D','20C18730-4291-4608-A2A5-86F37D3D06B2','Rare association elsewhere',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('F4416A2B-3E9E-4182-96BA-5D865406E087','20C18730-4291-4608-A2A5-86F37D3D06B2','Association elsewhere banned',3)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('2BE34D58-7FD3-41C7-B0F8-82E0AEEAF110','Obervance of biosec',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('8BE7A26A-55F1-43B6-AC96-B6B6BA7C8A9E','2BE34D58-7FD3-41C7-B0F8-82E0AEEAF110','No bio-security precautions',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('9853F6EC-CEAF-44F0-A10B-FABF64A44E2F','2BE34D58-7FD3-41C7-B0F8-82E0AEEAF110','Some bio-security precautions',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('26C67C98-8BFA-4376-B591-AF611B4A97F8','2BE34D58-7FD3-41C7-B0F8-82E0AEEAF110','Extensive bio-security precautions',3)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('6EF76695-3640-466B-901B-FFE62424201F','Modal type',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('FE01FE03-4D5E-419D-8D47-7FC2CEAC79A8','6EF76695-3640-466B-901B-FFE62424201F','Wildlife – overlapping ranges',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('EB6150E1-1904-485F-A92D-77D50882F93D','6EF76695-3640-466B-901B-FFE62424201F','Wildlife – discrete ranges',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('B4A97990-7F42-435C-A941-F0B988FFBCEB','6EF76695-3640-466B-901B-FFE62424201F','Lots of land parcels for holding',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('99590547-EAAC-4313-A548-E05E7DA3FC9C','6EF76695-3640-466B-901B-FFE62424201F','5 or fewer land parcels are stocked at one time',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('42B8E252-731A-416A-8CC2-CA6634DF358B','6EF76695-3640-466B-901B-FFE62424201F','Holding is a single entity',5)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('E4A198C1-C28E-42C9-9075-9117877750B5','Farm seperation',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('F8351D65-E661-439C-90FD-09B0D8FBFFA9','E4A198C1-C28E-42C9-9075-9117877750B5','Frequent exchange, wide distribution',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('57D95587-038B-4D2F-89E4-ED594E878C26','E4A198C1-C28E-42C9-9075-9117877750B5','Occasional exchange, wide distribution',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('7E576C6F-831E-43B5-852C-A820F361B372','E4A198C1-C28E-42C9-9075-9117877750B5','Frequent exchange limited distribution',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('7A22CC0C-F410-4824-B21B-A778152A3257','E4A198C1-C28E-42C9-9075-9117877750B5','No exchange',4)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('5D61467F-DB2A-4414-B85B-6C8C02535E61','Assurance schemes',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('9083CB3B-3436-4E36-959A-7DE4267000B7','5D61467F-DB2A-4414-B85B-6C8C02535E61','0',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('5D527180-4DC0-4132-A0AC-703656AEEC8D','5D61467F-DB2A-4414-B85B-6C8C02535E61','1-3',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('476DD8A0-FB5C-4051-85A7-7A156658C7B2','5D61467F-DB2A-4414-B85B-6C8C02535E61','4-6',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('1E1998CC-E5E0-4E0F-A2B2-341BA879BA88','5D61467F-DB2A-4414-B85B-6C8C02535E61','>6',4)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('2233FDA6-0152-451C-90D5-DE7AC3CE2FDE','Carcase submissions',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('9524BD27-FE92-4034-B66D-D695BAF95462','2233FDA6-0152-451C-90D5-DE7AC3CE2FDE','Zero',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('1197CE9A-BCD7-4CC0-B962-F4143F864D21','2233FDA6-0152-451C-90D5-DE7AC3CE2FDE','Few',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('4B1405AE-ED1B-4383-8DF9-0EE905E5AFF8','2233FDA6-0152-451C-90D5-DE7AC3CE2FDE','Several',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('E3A745B5-7DE3-4E5A-B28A-DA74D3BB1C6D','2233FDA6-0152-451C-90D5-DE7AC3CE2FDE','Many (VIDA data)',4)
INSERT INTO [dbo].[ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('F6CE1C97-E883-4C12-9E5C-4F3077784CA6','Collected samples',0)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('910B7103-FB30-4C6A-98E1-7415AA71DE48','F6CE1C97-E883-4C12-9E5C-4F3077784CA6','Blood/Serum',1)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('B815C2B9-A431-4E40-8ED1-7C841B946FC7','F6CE1C97-E883-4C12-9E5C-4F3077784CA6','Faeces',2)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('BD85EFD4-017E-413D-B674-A9560AE21A2C','F6CE1C97-E883-4C12-9E5C-4F3077784CA6','Milk',3)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('283006FA-B4CD-4799-A390-83AECDD2CDFE','F6CE1C97-E883-4C12-9E5C-4F3077784CA6','Other',4)
INSERT INTO [dbo].[ReferenceValue] ([Id],[ReferenceTableId],[LookupValue],[SequenceNumber]) VALUES ('B2AB3C81-1E7C-425D-BA65-9980A7E50660','F6CE1C97-E883-4C12-9E5C-4F3077784CA6','No such scheme',5)


UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='E8D62DF1-A677-473C-B662-4C5F7105CED7' WHERE [Id]='C0C269CC-357E-4498-AA98-EC08BE05AAB6'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='31A35980-0682-4604-9DDB-485A0120E6FD' WHERE [Id]='D59C9118-E8F4-4A70-B0F6-1845C14F4156'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='2233FDA6-0152-451C-90D5-DE7AC3CE2FDE' WHERE [Id]='8EBEA30B-38F8-4674-B7D4-6BD793EB87F2'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='F6CE1C97-E883-4C12-9E5C-4F3077784CA6' WHERE [Id]='0E301C34-89A6-418C-B995-154BABD5445A'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='F6CE1C97-E883-4C12-9E5C-4F3077784CA6' WHERE [Id]='A16BAF3B-2904-4A6A-ADF0-1A2FD900AA08'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='26309E98-8744-4E25-8ADE-18BB84740363' WHERE [Id]='F16A5742-C34B-4F34-8AFF-F46C3766C9BE'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='B75AEB43-39E2-4B0C-9BAD-5C0BBD56CEE5' WHERE [Id]='05DF331C-30B8-43EF-9300-B5DCE9E9FE8C'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='1A2E069F-96CC-45F1-B95F-8111348D0590' WHERE [Id]='2A245EF3-33D1-4134-AA3D-26EF614E82B0'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='9C008842-A7A3-4020-8E74-F4C4007D9EEE' WHERE [Id]='2A9A3DA3-E8A0-444D-87D9-AE961592D511'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='20C18730-4291-4608-A2A5-86F37D3D06B2' WHERE [Id]='9429482D-89F5-4465-8D02-56FB46A99305'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='2BE34D58-7FD3-41C7-B0F8-82E0AEEAF110' WHERE [Id]='BC635D99-C57F-4E1B-82B2-F2D39410A764'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='6EF76695-3640-466B-901B-FFE62424201F' WHERE [Id]='7CB1554F-8693-48BE-9BC3-418C2C1BA59D'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='E4A198C1-C28E-42C9-9075-9117877750B5' WHERE [Id]='5BC535E4-DB66-4077-8786-4AA79D175869'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='5D61467F-DB2A-4414-B85B-6C8C02535E61' WHERE [Id]='641C0C32-35EE-4442-AA40-E512962D2C04'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC' WHERE [Id]='39F4A38A-F679-4F29-BEF5-74E5FB7147A5'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63' WHERE [Id]='5B03E550-538A-4E25-B5C0-5F5856D067F4'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='BEADAD71-3150-4B45-8C31-103D6F417281' WHERE [Id]='C7DBDBFE-F5C8-427B-89CE-5067B88C3D1F'

--Remove duplicate questions (GB Holding and GB Population)
UPDATE [dbo].[SpeciesQuestion] SET [SpeciesSectionId]='BF444992-298E-4E44-B1E2-F8D9F9BFDD20', [QuestionNumber]=2, [Name]='Number of animals in GB' WHERE [Id]='B04DE56E-D027-4905-A32A-7AC6C3F487D4'
UPDATE [dbo].[SpeciesQuestion] SET [SpeciesSectionId]='BF444992-298E-4E44-B1E2-F8D9F9BFDD20', [QuestionNumber]=1 WHERE [Id]='90E2020D-9F7A-43E3-BDB9-E6471098B671'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='49637C0C-7CDE-4E82-BB64-9BC75E3DD1CC', [FieldNumber]=1, [DataFieldTypeId]='A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9' WHERE [Id]='03E75B79-5BFF-4A16-9722-3B41043B3E9A'
UPDATE [dbo].[SpeciesField] SET [ReferenceTableId]='FE78D94F-76AD-4D4B-B8CF-FD3CCF1A7A63', [FieldNumber]=1, [DataFieldTypeId]='A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9' WHERE [Id]='AA9F05BE-B863-4702-B135-32AA4412F05C'
DELETE FROM [dbo].[SpeciesField] WHERE [Id]='39F4A38A-F679-4F29-BEF5-74E5FB7147A5'
DELETE FROM [dbo].[SpeciesField] WHERE [Id]='5B03E550-538A-4E25-B5C0-5F5856D067F4'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='90E2020D-9F7A-43E3-BDB9-E6471098B671' WHERE [Id]='73EA7E50-0D42-464C-BF45-C417AE54D8BA'
UPDATE [dbo].[SpeciesField] SET [SpeciesQuestionId]='B04DE56E-D027-4905-A32A-7AC6C3F487D4' WHERE [Id]='EDBA24BC-638F-4F74-BDB8-F54D517F8AF0'
DELETE FROM [dbo].[SpeciesQuestion] WHERE [Id]='A4E50F95-41A1-4632-ABEC-1570B60A11E5'
DELETE FROM [dbo].[SpeciesQuestion] WHERE [Id]='39DD8372-2B37-452F-A0FB-A32B5625C3BF'

--2.3.1
GO
ALTER TABLE [dbo].[ProfileField] ADD
	IncludeInSummary bit NULL
GO
UPDATE 
	[dbo].[ProfileField]
SET
	[IncludeInSummary] = 1

GO
ALTER TABLE [dbo].[ProfileField] 
ALTER COLUMN [IncludeInSummary] bit NOT NULL
GO
--2.6.1 a)

CREATE TABLE [dbo].[SpeciesFieldValue]
	(
	[Id] uniqueidentifier NOT NULL,
	[SpeciesId] uniqueidentifier NOT NULL,
	[SpeciesFieldId] uniqueidentifier NOT NULL,
	[BooleanValue] bit NULL,
	[ListValue] uniqueidentifier NULL,
	[TextValue] varchar(MAX) NULL
	)  
GO
ALTER TABLE [dbo].[SpeciesFieldValue] ADD PRIMARY KEY ([Id])
GO
CREATE NONCLUSTERED INDEX IX_SpeciesFieldValue ON dbo.SpeciesFieldValue
	(
	[SpeciesId]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SpeciesFieldValue] ADD CONSTRAINT
	FK_SpeciesFieldValue_Species FOREIGN KEY
	(
	[SpeciesId]
	) REFERENCES [dbo].[Species]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE [dbo].[SpeciesFieldValue] ADD CONSTRAINT
	FK_SpeciesFieldValue_SpeciesField FOREIGN KEY
	(
	[SpeciesFieldId]
	) REFERENCES [dbo].[SpeciesField]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
GO

--2.6.1 b)

INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'D8508D02-644C-4DB7-AFE0-84F66DA95F91',null,[CommercialTrade],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'E48AA9CA-4A0A-4C4C-B097-150333240874',null,[ImportanceOfExportTrade],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'2B3E6845-4D43-4F03-9ACE-5EF35D4DFE1B',null,[ImpactOnLevelOfImports],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'3A5910E4-6E48-4EDB-A916-40AAAD39F122',null,[ImpactOnIntraCommunityFlows],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'FF59C6DB-10EE-43D2-AC57-ABD20CBD802F',null,[ImpactOnThirdCountryFlows],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'33E63913-09D4-484E-8818-3485D2897FEF',null,[ExportMarketValue],null FROM [dbo].[Species]
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'08C76C6D-48F6-477C-B123-6820707B09EC',null,null,[CommercialTradeComments] FROM [dbo].[Species] WHERE [CommercialTradeComments] IS NOT NULL
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'FE30E671-91EB-4F12-AB47-DEB08473DFE7',null,null,[ImportanceOfExportTradeComments] FROM [dbo].[Species] WHERE [ImportanceOfExportTradeComments] IS NOT NULL
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'34119D63-C218-43E2-BEBB-B2D91D57927D',null,null,[ImpactOnLevelOfImportsComments] FROM [dbo].[Species] WHERE [ImpactOnLevelOfImportsComments] IS NOT NULL
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'615589A7-8FE3-4070-82DB-EA4161C346E0',null,null,[ImpactOnIntraCommunityFlowsComments] FROM [dbo].[Species] WHERE [ImpactOnIntraCommunityFlowsComments] IS NOT NULL
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'7641F411-EE1A-4135-A502-007AB080B41A',null,null,[ImpactOnThirdCountryFlowsComments] FROM [dbo].[Species] WHERE [ImpactOnThirdCountryFlowsComments] IS NOT NULL
INSERT INTO [dbo].[SpeciesFieldValue] ([Id],[SpeciesId],[SpeciesFieldId],[BooleanValue],[ListValue],[TextValue]) 
SELECT newid(),[Id],'03477D37-30CC-4878-826A-9414DD288D63',null,null,[ExportMarketValueComments] FROM [dbo].[Species] WHERE [ExportMarketValueComments] IS NOT NULL

--2.9.3 a)
CREATE TABLE [dbo].[SpeciesPrioritisationCategory]
	(
	[Id] uniqueidentifier NOT NULL,
	[Name] varchar(50) NOT NULL,
	[SequenceNumber] int NOT NULL
	)
ALTER TABLE [dbo].[SpeciesPrioritisationCategory] ADD PRIMARY KEY ([Id])

INSERT INTO [dbo].[SpeciesPrioritisationCategory] ([Id],[Name],[SequenceNumber])
VALUES ('5837CA89-9E06-4520-98A5-23AE0A8B28DE','Animal identification',1)
INSERT INTO [dbo].[SpeciesPrioritisationCategory] ([Id],[Name],[SequenceNumber])
VALUES ('5B1A65EA-A19A-4239-8A32-DCC06E518598','Movements',2)
INSERT INTO [dbo].[SpeciesPrioritisationCategory] ([Id],[Name],[SequenceNumber])
VALUES ('0985AAF4-3A61-46EB-A93C-6373D5374EBB','Animal locations and number',3)
INSERT INTO [dbo].[SpeciesPrioritisationCategory] ([Id],[Name],[SequenceNumber])
VALUES ('E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Bio-security',4)

--2.9.3 b)
CREATE TABLE [dbo].[SpeciesPrioritisationCriterion]
	(
	[Id] uniqueidentifier NOT NULL,
	[SpeciesPrioritisationCategoryId] uniqueidentifier NOT NULL,
	[Name] varchar(255) NOT NULL,
	[SpeciesFieldId] uniqueidentifier NOT NULL,
	[SequenceNumber] int NOT NULL
	)

ALTER TABLE [dbo].[SpeciesPrioritisationCriterion] ADD PRIMARY KEY ([Id])

ALTER TABLE [dbo].[SpeciesPrioritisationCriterion] ADD CONSTRAINT
	FK_SpeciesPrioritisationCriterion_SpeciesPrioritisationCategory FOREIGN KEY
	(
	[SpeciesPrioritisationCategoryId]
	) REFERENCES [dbo].[SpeciesPrioritisationCategory]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE [dbo].[SpeciesPrioritisationCriterion] ADD CONSTRAINT
	FK_SpeciesPrioritisationCriterion_SpeciesField FOREIGN KEY
	(
	[SpeciesFieldId]
	) REFERENCES [dbo].[SpeciesField]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO


INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','5837CA89-9E06-4520-98A5-23AE0A8B28DE','Accuracy of animal identification','F16A5742-C34B-4F34-8AFF-F46C3766C9BE',1)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','5B1A65EA-A19A-4239-8A32-DCC06E518598','Ease of movement investigation','C0C269CC-357E-4498-AA98-EC08BE05AAB6',1)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('F65F5017-0412-4963-9ADC-328069750224','0985AAF4-3A61-46EB-A93C-6373D5374EBB','Number of holdings','03E75B79-5BFF-4A16-9722-3B41043B3E9A',1)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('63560D8B-9DD4-4EC1-B6B2-743CADAF8552','0985AAF4-3A61-46EB-A93C-6373D5374EBB','Number of animals','AA9F05BE-B863-4702-B135-32AA4412F05C',2)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('4489FD25-C2BC-40AB-A738-066C866F44A3','0985AAF4-3A61-46EB-A93C-6373D5374EBB','Proportion keeping mixed species','C7DBDBFE-F5C8-427B-89CE-5067B88C3D1F',3)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Livestock contacts','05DF331C-30B8-43EF-9300-B5DCE9E9FE8C',1)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('5DD13E41-98CD-43D4-8657-21FFBA753F42','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Imported livestock - isolation','2A245EF3-33D1-4134-AA3D-26EF614E82B0',2)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('97ED641E-3E59-477E-8F5C-BC38F824053A','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Imported livestock – testing/treatment regime','2A9A3DA3-E8A0-444D-87D9-AE961592D511',3)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('06F0F824-125A-4E73-9384-ECC7F6D0A0E1','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Farm personnel – animal contacts elsewhere','9429482D-89F5-4465-8D02-56FB46A99305',4)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('C2D8DCEC-E81A-4DA8-A3CA-FAA2AB90B124','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Farm personnel – observance of bio-security protocols','BC635D99-C57F-4E1B-82B2-F2D39410A764',5)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Farm situation – modal type of group of this species','7CB1554F-8693-48BE-9BC3-418C2C1BA59D',6)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('E587B8E7-BC73-44F2-B8D6-14968B472AFC','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Farm situation – degree of separation','5BC535E4-DB66-4077-8786-4AA79D175869',7)

INSERT INTO [dbo].[SpeciesPrioritisationCriterion] ([Id],[SpeciesPrioritisationCategoryId],[Name],[SpeciesFieldId],[SequenceNumber])
     VALUES('BB30815F-25D1-4E5C-B463-F3C654D5E421','E0C3A33E-CFAC-4033-83C0-A88AD53417B7','Farm situation - how many assurance schemes apply to livestock of this species','641C0C32-35EE-4442-AA40-E512962D2C04',8)
     

--2.9.3 c)

CREATE TABLE [dbo].[SpeciesPrioritisationCriterionValue](
	[Id] [uniqueidentifier] NOT NULL,
	[SpeciesPrioritisationCriterionId] [uniqueidentifier] NOT NULL,
	[ReferenceValueId] [uniqueidentifier] NOT NULL,
	[Score] [int] NOT NULL,
	[LastUpdated] timestamp NOT NULL
	PRIMARY KEY CLUSTERED 
		(
			[Id] ASC
		)
	) 
GO

ALTER TABLE [dbo].[SpeciesPrioritisationCriterionValue]
	WITH CHECK ADD  CONSTRAINT [FK_SpeciesPrioritisationCriterionValue_ReferenceValue]
	FOREIGN KEY([ReferenceValueId])
	REFERENCES [dbo].[ReferenceValue] ([Id])
GO

ALTER TABLE [dbo].[SpeciesPrioritisationCriterionValue] 
	WITH CHECK ADD  CONSTRAINT [FK_SpeciesPrioritisationCriterionValue_SpeciesPrioritisationCriterion]
	FOREIGN KEY([SpeciesPrioritisationCriterionId])
	REFERENCES [dbo].[SpeciesPrioritisationCriterion] ([Id])
GO

INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('43BFFEF6-0BE7-4C5E-908A-D81D0CFC8466','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','F0E877DF-6E63-4831-B64D-FD96AA80289A',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('7FFD837E-7E01-43C6-9B3A-CB8E72D6699A','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','F597E690-BB10-4D69-A3B9-E1D809632014',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('2E9BAE66-AA58-4B6E-A2B1-D349C499410E','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','E939716D-BB9D-45E7-9FE9-1B5EE7ED075A',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('C5C53FE4-09CA-4D88-AFCE-D3B9A6CEF562','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','DB8C3094-137F-4DD6-B1FF-9D8F44B3D51C',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('334904BB-758C-4AEF-8E8C-66FEF8DA1763','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','6DDA1798-DCB9-43FD-89F2-71A6248FFFE3',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('DA45A1E0-4411-4891-82DF-60BB75AB5EC0','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','CCCFDA2D-97D4-44F3-A30E-BE64996B7882',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('B87D6FE8-6031-4B03-A763-13C80BCC117E','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','E4BC8CE3-34E0-4D4E-957E-DB5118CA1C2F',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('69F57147-149C-4F7E-8841-AF61B6D3171A','8BC2D0FF-1FC7-457B-9D62-A77F0FB8D27C','9362A79F-E1F2-42BB-B90B-50DD85415D40',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('9332C010-117C-42F9-91C2-8CC6A837C34B','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','4A4DAD0D-E3D5-4347-BD0C-5346E74B60BF',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('E97B64FD-AAB1-48B4-BBF5-99826B5D9EA9','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','D37A87AB-40DF-48FE-BB0C-CBC0D705DDC7',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('CCF031DA-630B-46FE-89AD-6826627F0A17','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','CDF124EB-52AC-430C-BAD9-B00D820412BC',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('AE63210A-8AA6-4C2D-8168-5620FB44A6F6','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','D9E6E08C-BEDD-443B-9A32-5FA9DC7BFC17',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('6E1B40C5-8DE9-48D5-BB3A-4A1697780559','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','FECED740-B7F2-466D-9295-DE31BAA83689',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('CD9FF046-7535-4F1A-A750-CD2D05782A45','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','6EEBEAAA-5141-49F8-8673-EE70C6986880',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('1771AE1C-0033-4B9C-ACD4-18EC1D800DA2','54D630FF-96CB-4528-8D1E-F7CCE1EB4A61','933E742A-AC86-4BFA-879E-7B2443B7E834',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('55F81B25-5229-4600-B614-9C8FE41B2669','F65F5017-0412-4963-9ADC-328069750224','59BDFE7D-A2B7-42F3-8E57-597E28A238C9',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('CD26F90F-0B59-4999-8B95-6929C08867C6','F65F5017-0412-4963-9ADC-328069750224','449200A6-7002-4C64-9927-38828E74CAD1',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('4B6C25D3-7FB5-4EE9-A7D3-F39C8366AB59','F65F5017-0412-4963-9ADC-328069750224','5A183853-F522-49B6-A840-CC396DBA1E1C',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('219197A1-8569-40E1-96FC-27E4C91C8A89','F65F5017-0412-4963-9ADC-328069750224','C960B55E-A691-4035-B11E-393619BFCC66',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('4199EAA5-484D-4803-800C-CBE01C6733DF','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','AD39770A-81AE-4F7A-8745-739F99610ACA',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('9015130A-ED26-4EFC-B2B4-F439F0EA9ED7','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','6954C874-659A-48FB-908B-642E558065F8',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('5E5E043C-B1F7-46C2-A02F-D5EA1006856A','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','286FB4D5-F539-420B-8C46-3FE1F85703A1',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('3F9C1779-D361-4954-9F8D-0B7D8DE798D0','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','83CB55B6-DAA1-4C29-B2B7-9659A9EA4577',10)
--INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     --VALUES ('4199EAA5-484D-4803-800C-CBE01C6733DF','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','AD39770A-81AE-4F7A-8745-739F99610ACA',10)
--INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     --VALUES ('9015130A-ED26-4EFC-B2B4-F439F0EA9ED7','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','6954C874-659A-48FB-908B-642E558065F8',10)
--INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     --VALUES ('5E5E043C-B1F7-46C2-A02F-D5EA1006856A','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','286FB4D5-F539-420B-8C46-3FE1F85703A1',10)
--INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     --VALUES ('3F9C1779-D361-4954-9F8D-0B7D8DE798D0','63560D8B-9DD4-4EC1-B6B2-743CADAF8552','83CB55B6-DAA1-4C29-B2B7-9659A9EA4577',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('63F569AA-05D3-4FA8-9F54-CF4831C06202','4489FD25-C2BC-40AB-A738-066C866F44A3','54B3C942-CDEE-4749-AC97-444C9F12EEF3',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('6FC6D0CD-A27D-4379-9146-ED910B9F9F7E','4489FD25-C2BC-40AB-A738-066C866F44A3','B2B3036B-D698-430C-A754-8B7214F61D84',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('0EADE30D-EEBB-4DF8-8224-0A0D3D341A28','4489FD25-C2BC-40AB-A738-066C866F44A3','7141F040-26A6-4A3D-B39F-D25925079F7D',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('88AD7510-9D77-474A-B3C5-5FC32B98F380','10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','2D630AB3-0D22-4990-B60D-5455CC9A2FBC',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('1AA0FA83-85F5-40AD-9063-DB509C474FBC','10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','E7D40F20-121D-4687-BF0D-197D668B4D70',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('7CE33D07-215C-409E-97F8-0D887A102035','10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','3EE6817A-DA81-4ECC-8EB1-D8447E051B92',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('1863F784-13CA-4776-BBB2-18C6FB37A356','10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','8B40C36C-2C05-4CD3-8EFF-D70AB6368AA1',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('657DE796-84EA-462A-BBE0-5793B15BC3D0','10F04FB1-FEFA-49B6-B1C0-BA204C12B1B4','0EF4B6A6-8B36-457E-8270-C3B6D7F065F4',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('4AEA7953-2AA2-4B49-8163-7F08DF659158','5DD13E41-98CD-43D4-8657-21FFBA753F42','AB01C27A-A83A-4BAF-82AE-754AB9923BD5',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('1126EE7B-DCC0-451E-B737-0A98D5228380','5DD13E41-98CD-43D4-8657-21FFBA753F42','EA566DBE-3491-448E-8BAA-366101080529',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('55CE9EC8-6216-4E79-B530-AD85255F272F','5DD13E41-98CD-43D4-8657-21FFBA753F42','CBE2518C-1100-4EA4-88C9-2339FFB4B070',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('FE917497-6973-4A85-9864-F144B3CF604D','97ED641E-3E59-477E-8F5C-BC38F824053A','62985975-2A3E-41DF-B751-F1971BB40FCE',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('8FBB4F15-0A78-49D1-9758-681300149F10','97ED641E-3E59-477E-8F5C-BC38F824053A','FB8AA6FE-7E81-42C0-9830-BE0A6DA2E54F',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('41C85CC9-693F-40E1-8136-133C57FBA9C9','97ED641E-3E59-477E-8F5C-BC38F824053A','48F0FD55-2C75-4184-9077-7B20174B425A',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('CA4D1FD9-28E5-46F2-A61E-8F7FB1BE528B','06F0F824-125A-4E73-9384-ECC7F6D0A0E1','3532F881-9C7D-44CF-8B01-110B52725231',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('EC0FCFC0-9C37-4B85-B3D1-9952323202BD','06F0F824-125A-4E73-9384-ECC7F6D0A0E1','843F037B-2718-4359-997D-718CC6724C6D',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('01489A5C-8832-495E-999E-55DD41FB7D50','06F0F824-125A-4E73-9384-ECC7F6D0A0E1','F4416A2B-3E9E-4182-96BA-5D865406E087',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('A3A9BB98-33A6-4941-B950-6D6E6891FE2A','C2D8DCEC-E81A-4DA8-A3CA-FAA2AB90B124','8BE7A26A-55F1-43B6-AC96-B6B6BA7C8A9E',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('036FC533-DFDE-46E8-8DB2-0D0BAA185B5D','C2D8DCEC-E81A-4DA8-A3CA-FAA2AB90B124','9853F6EC-CEAF-44F0-A10B-FABF64A44E2F',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('9E2CB5E6-9D08-4D8B-ABC1-2F060F678F9F','C2D8DCEC-E81A-4DA8-A3CA-FAA2AB90B124','26C67C98-8BFA-4376-B591-AF611B4A97F8',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('C3119628-A34D-4AA7-BC3C-34ACFBBD7277','D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','FE01FE03-4D5E-419D-8D47-7FC2CEAC79A8',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('1254C1EC-F09E-4910-B8FE-8CE97630E63B','D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','EB6150E1-1904-485F-A92D-77D50882F93D',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('7B7CAA3D-76A8-4859-97C8-5BAA3B7FF561','D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','B4A97990-7F42-435C-A941-F0B988FFBCEB',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('37E9AE5E-CD3A-4778-9676-3C1ABC2847DE','D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','99590547-EAAC-4313-A548-E05E7DA3FC9C',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('EEB6110A-EC25-444B-A485-F454BBC80849','D3EAC9BB-E4D3-4E99-86BE-6C8665F4677F','42B8E252-731A-416A-8CC2-CA6634DF358B',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('334F777F-C85B-4777-B4DC-2DB192CA7453','E587B8E7-BC73-44F2-B8D6-14968B472AFC','F8351D65-E661-439C-90FD-09B0D8FBFFA9',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('BF543DAA-1E3A-4373-938B-6BBEE238C0C2','E587B8E7-BC73-44F2-B8D6-14968B472AFC','57D95587-038B-4D2F-89E4-ED594E878C26',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('EB02462E-DA86-4E38-BBF6-87AB1640917B','E587B8E7-BC73-44F2-B8D6-14968B472AFC','7E576C6F-831E-43B5-852C-A820F361B372',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('6DE79C7E-90CE-4CBB-A2AF-A6AFD960E0C9','E587B8E7-BC73-44F2-B8D6-14968B472AFC','7A22CC0C-F410-4824-B21B-A778152A3257',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('EE8C079D-99B1-4A6B-B627-92ADCE59BA82','BB30815F-25D1-4E5C-B463-F3C654D5E421','9083CB3B-3436-4E36-959A-7DE4267000B7',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('3F7C69F7-86B2-404B-8385-BF808AF5D32E','BB30815F-25D1-4E5C-B463-F3C654D5E421','5D527180-4DC0-4132-A0AC-703656AEEC8D',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('B3AC4488-FD5A-4C01-B7CD-FBBCF0FC00FF','BB30815F-25D1-4E5C-B463-F3C654D5E421','476DD8A0-FB5C-4051-85A7-7A156658C7B2',10)
INSERT INTO [dbo].[SpeciesPrioritisationCriterionValue] ([Id],[SpeciesPrioritisationCriterionId],[ReferenceValueId],[Score])
     VALUES ('052057D4-9CF3-46D2-921B-8AFAF367A9F2','BB30815F-25D1-4E5C-B463-F3C654D5E421','1E1998CC-E5E0-4E0F-A2B2-341BA879BA88',10)

--2.9.3 d)

CREATE TABLE [dbo].[SpeciesPrioritisationScore]
	(
	[SpeciesId] uniqueidentifier NOT NULL,
	[SpeciesPrioritisationCategoryId] uniqueidentifier NOT NULL,
	[Score] int NULL
	)

ALTER TABLE [dbo].[SpeciesPrioritisationScore] ADD PRIMARY KEY ([SpeciesId],[SpeciesPrioritisationCategoryId])

ALTER TABLE [dbo].[SpeciesPrioritisationScore] ADD CONSTRAINT
	FK_SpeciesPrioritisationScore_Species FOREIGN KEY
	(
	[SpeciesId]
	) REFERENCES [dbo].[Species]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
GO
ALTER TABLE [dbo].[SpeciesPrioritisationScore] ADD CONSTRAINT
	FK_SpeciesPrioritisationScore_SpeciesPrioritisationCategory FOREIGN KEY
	(
	[SpeciesPrioritisationCategoryId]
	) REFERENCES [dbo].[SpeciesPrioritisationCategory]
	(
	[Id]
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION
GO


-- 2.6.3 Profile answer tables - remove code-gen

-- 2.6.3 d)

-- DROP TABLE AnimalWelfare

-- Drop any FK constraints from Ids within table AnimalWelfare to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to AnimalWelfare

-- Drop FK constraint from AnimalWelfare back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfare_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfare]'))
ALTER TABLE [dbo].[AnimalWelfare] DROP CONSTRAINT [FK_AnimalWelfare_ProfileVersion]
GO

-- Drop any link tables that are linked to AnimalWelfare

-- Drop table AnimalWelfare
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnimalWelfare]') AND type in (N'U'))
DROP TABLE [dbo].[AnimalWelfare]
GO


-- DROP TABLE ApproachToControl

-- Drop any FK constraints from Ids within table ApproachToControl to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControl_ControlsAboveTheHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControl]'))
ALTER TABLE [dbo].[ApproachToControl] DROP CONSTRAINT [FK_ApproachToControl_ControlsAboveTheHoldingLevel]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to ApproachToControl

-- Drop FK constraint from ApproachToControl back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControl_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControl]'))
ALTER TABLE [dbo].[ApproachToControl] DROP CONSTRAINT [FK_ApproachToControl_ProfileVersion]
GO

-- Drop any link tables that are linked to ApproachToControl

-- Drop table ApproachToControl
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApproachToControl]') AND type in (N'U'))
DROP TABLE [dbo].[ApproachToControl]
GO


-- DROP TABLE AreasOfUncertainty

-- Drop any FK constraints from Ids within table AreasOfUncertainty to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to AreasOfUncertainty

-- Drop FK constraint from AreasOfUncertainty back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasOfUncertainty_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasOfUncertainty]'))
ALTER TABLE [dbo].[AreasOfUncertainty] DROP CONSTRAINT [FK_AreasOfUncertainty_ProfileVersion]
GO

-- Drop any link tables that are linked to AreasOfUncertainty

-- Drop table AreasOfUncertainty
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AreasOfUncertainty]') AND type in (N'U'))
DROP TABLE [dbo].[AreasOfUncertainty]
GO


-- DROP TABLE Epidemiology

-- Drop any FK constraints from Ids within table Epidemiology to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Epidemiology_PersistenceInEnvironmentIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[Epidemiology]'))
ALTER TABLE [dbo].[Epidemiology] DROP CONSTRAINT [FK_Epidemiology_PersistenceInEnvironmentIndicator]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to Epidemiology
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfirmationOfDiagnosis_Epidemiology]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]'))
ALTER TABLE [dbo].[ConfirmationOfDiagnosis] DROP CONSTRAINT [FK_ConfirmationOfDiagnosis_Epidemiology]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfirmationOfDiagnosis_DiagnosisAndDetectionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]'))
ALTER TABLE [dbo].[ConfirmationOfDiagnosis] DROP CONSTRAINT [FK_ConfirmationOfDiagnosis_DiagnosisAndDetectionMechanism]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpreadMechanism_Epidemiology]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]'))
ALTER TABLE [dbo].[SpreadMechanism] DROP CONSTRAINT [FK_SpreadMechanism_Epidemiology]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpreadMechanism_SpreadMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]'))
ALTER TABLE [dbo].[SpreadMechanism] DROP CONSTRAINT [FK_SpreadMechanism_SpreadMechanism]
GO


-- Drop FK constraint from Epidemiology back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Epidemiology_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Epidemiology]'))
ALTER TABLE [dbo].[Epidemiology] DROP CONSTRAINT [FK_Epidemiology_ProfileVersion]
GO

-- Drop any link tables that are linked to Epidemiology
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]') AND type in (N'U'))
DROP TABLE [dbo].[ConfirmationOfDiagnosis]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[SpreadMechanism]
GO


-- Drop table Epidemiology
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Epidemiology]') AND type in (N'U'))
DROP TABLE [dbo].[Epidemiology]
GO


-- DROP TABLE GeographicDistribution

-- Drop any FK constraints from Ids within table GeographicDistribution to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_CurrentPrevalenceInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_CurrentPrevalenceInGB]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_RiskOfIntroductionToGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_RiskOfIntroductionToGB]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to GeographicDistribution
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GlobalGeographicDistribution_GeographicDistribution]') AND parent_object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]'))
ALTER TABLE [dbo].[GlobalGeographicDistribution] DROP CONSTRAINT [FK_GlobalGeographicDistribution_GeographicDistribution]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GlobalGeographicDistribution_GeographicArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]'))
ALTER TABLE [dbo].[GlobalGeographicDistribution] DROP CONSTRAINT [FK_GlobalGeographicDistribution_GeographicArea]
GO


-- Drop FK constraint from GeographicDistribution back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_ProfileVersion]
GO

-- Drop any link tables that are linked to GeographicDistribution
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]') AND type in (N'U'))
DROP TABLE [dbo].[GlobalGeographicDistribution]
GO


-- Drop table GeographicDistribution
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]') AND type in (N'U'))
DROP TABLE [dbo].[GeographicDistribution]
GO


-- DROP TABLE HumanHealth

-- Drop any FK constraints from Ids within table HumanHealth to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ZoonoticIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ZoonoticIndicator]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_TransmissibilityIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_TransmissibilityIndicator]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ModalSeverityOfHumanDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ModalSeverityOfHumanDisease]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_MaximumSeverityOfHumanDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_MaximumSeverityOfHumanDisease]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_AnnualNumberOfHumanCasesInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_AnnualNumberOfHumanCasesInGB]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_AverageCostPerCase]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_AverageCostPerCase]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_IndirectEconomicCostOfHumanIllness]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_IndirectEconomicCostOfHumanIllness]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_Uncertainty]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_Uncertainty]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to HumanHealth
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanTransmissionMechanism_HumanHealth]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]'))
ALTER TABLE [dbo].[HumanTransmissionMechanism] DROP CONSTRAINT [FK_HumanTransmissionMechanism_HumanHealth]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanTransmissionMechanism_TransmissionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]'))
ALTER TABLE [dbo].[HumanTransmissionMechanism] DROP CONSTRAINT [FK_HumanTransmissionMechanism_TransmissionMechanism]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionOfHumanDisease_HumanHealth]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]'))
ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease] DROP CONSTRAINT [FK_GeographicDistributionOfHumanDisease_HumanHealth]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionOfHumanDisease_GeographicArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]'))
ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease] DROP CONSTRAINT [FK_GeographicDistributionOfHumanDisease_GeographicArea]
GO


-- Drop FK constraint from HumanHealth back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ProfileVersion]
GO

-- Drop any link tables that are linked to HumanHealth
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[HumanTransmissionMechanism]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]') AND type in (N'U'))
DROP TABLE [dbo].[GeographicDistributionOfHumanDisease]
GO


-- Drop table HumanHealth
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanHealth]') AND type in (N'U'))
DROP TABLE [dbo].[HumanHealth]
GO


-- DROP TABLE InternationalTrade

-- Drop any FK constraints from Ids within table InternationalTrade to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_StatutoryObligationToControl]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_StatutoryObligationToControl]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_ReestablishmentOfTradingStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_ReestablishmentOfTradingStatus]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_PotentialForRegionalisation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_PotentialForRegionalisation]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_RangeOfCommoditiesCompromised]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_RangeOfCommoditiesCompromised]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to InternationalTrade

-- Drop FK constraint from InternationalTrade back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_ProfileVersion]
GO

-- Drop any link tables that are linked to InternationalTrade

-- Drop table InternationalTrade
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternationalTrade]') AND type in (N'U'))
DROP TABLE [dbo].[InternationalTrade]
GO


-- DROP TABLE LegislationAndMandates

-- Drop any FK constraints from Ids within table LegislationAndMandates to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to LegislationAndMandates
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApplicableLegislationAndMandates_LegislationAndMandates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]'))
ALTER TABLE [dbo].[ApplicableLegislationAndMandates] DROP CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationAndMandates]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApplicableLegislationAndMandates_LegislationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]'))
ALTER TABLE [dbo].[ApplicableLegislationAndMandates] DROP CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationType]
GO


-- Drop FK constraint from LegislationAndMandates back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LegislationAndMandates_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[LegislationAndMandates]'))
ALTER TABLE [dbo].[LegislationAndMandates] DROP CONSTRAINT [FK_LegislationAndMandates_ProfileVersion]
GO

-- Drop any link tables that are linked to LegislationAndMandates
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]') AND type in (N'U'))
DROP TABLE [dbo].[ApplicableLegislationAndMandates]
GO


-- Drop table LegislationAndMandates
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LegislationAndMandates]') AND type in (N'U'))
DROP TABLE [dbo].[LegislationAndMandates]
GO


-- DROP TABLE OpportunityToAddValue

-- Drop any FK constraints from Ids within table OpportunityToAddValue to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to OpportunityToAddValue

-- Drop FK constraint from OpportunityToAddValue back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpportunityToAddValue_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpportunityToAddValue]'))
ALTER TABLE [dbo].[OpportunityToAddValue] DROP CONSTRAINT [FK_OpportunityToAddValue_ProfileVersion]
GO

-- Drop any link tables that are linked to OpportunityToAddValue

-- Drop table OpportunityToAddValue
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpportunityToAddValue]') AND type in (N'U'))
DROP TABLE [dbo].[OpportunityToAddValue]
GO


-- DROP TABLE PublicAndStakeholderPerception

-- Drop any FK constraints from Ids within table PublicAndStakeholderPerception to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to PublicAndStakeholderPerception

-- Drop FK constraint from PublicAndStakeholderPerception back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PublicAndStakeholderPerception_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PublicAndStakeholderPerception]'))
ALTER TABLE [dbo].[PublicAndStakeholderPerception] DROP CONSTRAINT [FK_PublicAndStakeholderPerception_ProfileVersion]
GO

-- Drop any link tables that are linked to PublicAndStakeholderPerception

-- Drop table PublicAndStakeholderPerception
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicAndStakeholderPerception]') AND type in (N'U'))
DROP TABLE [dbo].[PublicAndStakeholderPerception]
GO


-- DROP TABLE Summary

-- Drop any FK constraints from Ids within table Summary to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to Summary

-- Drop FK constraint from Summary back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Summary_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Summary]'))
ALTER TABLE [dbo].[Summary] DROP CONSTRAINT [FK_Summary_ProfileVersion]
GO

-- Drop any link tables that are linked to Summary

-- Drop table Summary
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Summary]') AND type in (N'U'))
DROP TABLE [dbo].[Summary]
GO


-- DROP TABLE Surveillance

-- Drop any FK constraints from Ids within table Surveillance to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to Surveillance

-- Drop FK constraint from Surveillance back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Surveillance_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Surveillance]'))
ALTER TABLE [dbo].[Surveillance] DROP CONSTRAINT [FK_Surveillance_ProfileVersion]
GO

-- Drop any link tables that are linked to Surveillance

-- Drop table Surveillance
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Surveillance]') AND type in (N'U'))
DROP TABLE [dbo].[Surveillance]
GO


-- DROP TABLE WiderSociety

-- Drop any FK constraints from Ids within table WiderSociety to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_PotentialUnplannedCostToExchequer]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_PotentialUnplannedCostToExchequer]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_GlobalEnvironment]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_GlobalEnvironment]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_LocalEnvironment]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_LocalEnvironment]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_WiderRuralCommunity]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_WiderRuralCommunity]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_TotalSurveillanceCosts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_TotalSurveillanceCosts]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to WiderSociety

-- Drop FK constraint from WiderSociety back to the ProfileVersion table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_ProfileVersion]
GO

-- Drop any link tables that are linked to WiderSociety

-- Drop table WiderSociety
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WiderSociety]') AND type in (N'U'))
DROP TABLE [dbo].[WiderSociety]
GO


-- DROP TABLE AnimalWelfareSpecies



-- Drop any FK constraints from Ids within table AnimalWelfareSpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromHungerAndThirst]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromHungerAndThirst]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromDiscomfort]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromDiscomfort]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromPainOrInjury]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromPainOrInjury]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomToExpressNormalBehaviour]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomToExpressNormalBehaviour]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromFearAndDistress]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromFearAndDistress]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_PotentialToReduceWelfareImplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_PotentialToReduceWelfareImplications]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_ProportionOfAnimalsAffectedSufferingSeverely]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_ProportionOfAnimalsAffectedSufferingSeverely]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to AnimalWelfareSpecies


-- Drop FK constraint from AnimalWelfareSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"AnimalWelfareSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to AnimalWelfareSpecies


-- Drop table AnimalWelfareSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[AnimalWelfareSpecies]
GO



-- DROP TABLE ApproachToControlSpecies



-- Drop any FK constraints from Ids within table ApproachToControlSpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_UptakeAtHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_UptakeAtHoldingLevel]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_WelfareEffect]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_WelfareEffect]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_PotentialToReduceRisk]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceRisk]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_PotentialToReduceHumanExposure]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceHumanExposure]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_ControlsAtTheHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_ControlsAtTheHoldingLevel]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_LevelOfNationalPreparedness]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_LevelOfNationalPreparedness]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to ApproachToControlSpecies

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentControlMechanisms_ApproachToControlSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]'))
ALTER TABLE [dbo].[CurrentControlMechanisms] DROP CONSTRAINT [FK_CurrentControlMechanisms_ApproachToControlSpecies]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentControlMechanisms_ControlMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]'))
ALTER TABLE [dbo].[CurrentControlMechanisms] DROP CONSTRAINT [FK_CurrentControlMechanisms_ControlMechanism]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtherControlMechanisms_ApproachToControlSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]'))
ALTER TABLE [dbo].[OtherControlMechanisms] DROP CONSTRAINT [FK_OtherControlMechanisms_ApproachToControlSpecies]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtherControlMechanisms_ControlMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]'))
ALTER TABLE [dbo].[OtherControlMechanisms] DROP CONSTRAINT [FK_OtherControlMechanisms_ControlMechanism]
GO


-- Drop FK constraint from ApproachToControlSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"ApproachToControlSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to ApproachToControlSpecies

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]') AND type in (N'U'))
DROP TABLE [dbo].[CurrentControlMechanisms]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]') AND type in (N'U'))
DROP TABLE [dbo].[OtherControlMechanisms]
GO


-- Drop table ApproachToControlSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[ApproachToControlSpecies]
GO



-- DROP TABLE EpidemiologySpecies



-- Drop any FK constraints from Ids within table EpidemiologySpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_PotentialForSilentSpread]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_PotentialForSilentSpread]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_MortalityIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_MortalityIndicator]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_DurationOfDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_DurationOfDisease]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_PrimaryDetectionMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_PrimaryDetectionMethods]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_RateOfSpreadOnPremises]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_RateOfSpreadOnPremises]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_WildlifeReservoirIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_WildlifeReservoirIndicator]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_IncreaseUnderstandingPotential]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_IncreaseUnderstandingPotential]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to EpidemiologySpecies

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransmissionMechanism_EpidemiologySpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]'))
ALTER TABLE [dbo].[TransmissionMechanism] DROP CONSTRAINT [FK_TransmissionMechanism_EpidemiologySpecies]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransmissionMechanism_TransmissionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]'))
ALTER TABLE [dbo].[TransmissionMechanism] DROP CONSTRAINT [FK_TransmissionMechanism_TransmissionMechanism]
GO


-- Drop FK constraint from EpidemiologySpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"EpidemiologySpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to EpidemiologySpecies

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[TransmissionMechanism]
GO


-- Drop table EpidemiologySpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]') AND type in (N'U'))
DROP TABLE [dbo].[EpidemiologySpecies]
GO



-- DROP TABLE GeographicDistributionSpecies



-- Drop any FK constraints from Ids within table GeographicDistributionSpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionSpecies_NumberOfCasesPerYearInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_NumberOfCasesPerYearInGB]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionSpecies_PotentialForRiskChange]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_PotentialForRiskChange]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to GeographicDistributionSpecies


-- Drop FK constraint from GeographicDistributionSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"GeographicDistributionSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to GeographicDistributionSpecies


-- Drop table GeographicDistributionSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[GeographicDistributionSpecies]
GO



-- DROP TABLE HumanHealthSpecies



-- Drop any FK constraints from Ids within table HumanHealthSpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealthSpecies_LevelOfHumanExposureToAnimalOrProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_LevelOfHumanExposureToAnimalOrProducts]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealthSpecies_AttributableFraction]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_AttributableFraction]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to HumanHealthSpecies


-- Drop FK constraint from HumanHealthSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"HumanHealthSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to HumanHealthSpecies


-- Drop table HumanHealthSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[HumanHealthSpecies]
GO



-- DROP TABLE InternationalTradeSpecies



-- Drop any FK constraints from Ids within table InternationalTradeSpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_CommercialTrade]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_CommercialTrade]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnLevelOfImports]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnLevelOfImports]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImportanceOfExportTrade]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImportanceOfExportTrade]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnIntraCommunityFlows]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnIntraCommunityFlows]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnThirdCountryFlows]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnThirdCountryFlows]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ExportMarketValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ExportMarketValue]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to InternationalTradeSpecies


-- Drop FK constraint from InternationalTradeSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"InternationalTradeSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to InternationalTradeSpecies


-- Drop table InternationalTradeSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[InternationalTradeSpecies]
GO



-- DROP TABLE RiskSpecies



-- Drop any FK constraints from Ids within table RiskSpecies to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to RiskSpecies


-- Drop FK constraint from RiskSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"RiskSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[RiskSpecies]'))
ALTER TABLE [dbo].[RiskSpecies] DROP CONSTRAINT [FK_RiskSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to RiskSpecies


-- Drop table RiskSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RiskSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[RiskSpecies]
GO



-- DROP TABLE SurveillanceSpecies



--DROP TABLE CurrentSurveillanceActivitiesSpecies

-- Drop any FK constraints from Ids within table CurrentSurveillanceActivitiesSpecies to lookup tables

  IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentSurveillanceActivitiesSpecies_Mechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]'))
  ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies] DROP CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_Mechanism]
  GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to CurrentSurveillanceActivities
    -- Drop FK constraint from CurrentSurveillanceActivitiesSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentSurveillanceActivitiesSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]'))
    ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies] DROP CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_ProfileVersionSpecies]
    GO
  

-- Drop any link tables that are linked to CurrentSurveillanceActivitiesSpecies


-- Drop table CurrentSurveillanceActivitiesSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[CurrentSurveillanceActivitiesSpecies]
GO



-- Drop any FK constraints from Ids within table SurveillanceSpecies to lookup tables


-- Drop any FK constraints from link tables to lookup tables and from link tables back to SurveillanceSpecies


-- Drop FK constraint from SurveillanceSpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"SurveillanceSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurveillanceSpecies]'))
ALTER TABLE [dbo].[SurveillanceSpecies] DROP CONSTRAINT [FK_SurveillanceSpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to SurveillanceSpecies


-- Drop table SurveillanceSpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurveillanceSpecies]') AND type in (N'U'))
DROP TABLE [dbo].[SurveillanceSpecies]
GO



-- DROP TABLE WiderSocietySpecies



-- Drop any FK constraints from Ids within table WiderSocietySpecies to lookup tables

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSocietySpecies_LocalAgriculturalEconomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]'))
ALTER TABLE [dbo].[WiderSocietySpecies] DROP CONSTRAINT [FK_WiderSocietySpecies_LocalAgriculturalEconomy]
GO


-- Drop any FK constraints from link tables to lookup tables and from link tables back to WiderSocietySpecies


-- Drop FK constraint from WiderSocietySpecies back to the ProfileVersionSpecies table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"WiderSocietySpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]'))
ALTER TABLE [dbo].[WiderSocietySpecies] DROP CONSTRAINT [FK_WiderSocietySpecies_ProfileVersionSpecies]
GO

-- Drop any link tables that are linked to WiderSocietySpecies


-- Drop table WiderSocietySpecies
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]') AND type in (N'U'))
DROP TABLE [dbo].[WiderSocietySpecies]
GO


-- DROP REFERENCE TABLES


-- Drop FK constraint from Species back to the luTradeImpactLevel table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImportanceOfExportTrade_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImportanceOfExportTrade_luTradeImpactLevel]
GO

-- Drop FK constraint from Species back to the luTradeImpactLevel table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesExportMarketValue_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesExportMarketValue_luTradeImpactLevel]
GO

-- Drop FK constraint from Species back to the luTradeImpactLevel table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnIntraCommunityFlows_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnIntraCommunityFlows_luTradeImpactLevel]
GO

-- Drop FK constraint from Species back to the luImportImpactLevel table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnLevelOfImports_luImportImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnLevelOfImports_luImportImpactLevel]
GO

-- Drop FK constraint from Species back to the luBooleanFlag table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesCommercialTrade_luBooleanFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesCommercialTrade_luBooleanFlag]
GO

-- Drop FK constraint from Species back to the luTradeImpactLevel table
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnThirdCountryFlows_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnThirdCountryFlows_luTradeImpactLevel]
GO


-- Drop reference table luExposureLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luExposureLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luExposureLevel]
GO


-- Drop reference table luTotalSurveillanceCosts
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTotalSurveillanceCosts]') AND type in (N'U'))
DROP TABLE [dbo].[luTotalSurveillanceCosts]
GO


-- Drop reference table luIncubationPeriod
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIncubationPeriod]') AND type in (N'U'))
DROP TABLE [dbo].[luIncubationPeriod]
GO


-- Drop reference table luDiseaseDuration
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luDiseaseDuration]') AND type in (N'U'))
DROP TABLE [dbo].[luDiseaseDuration]
GO


-- Drop reference table luStatutoryObligationLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luStatutoryObligationLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luStatutoryObligationLevel]
GO


-- Drop reference table luImportImpactLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luImportImpactLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luImportImpactLevel]
GO


-- Drop reference table luProportionLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luProportionLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luProportionLevel]
GO


-- Drop reference table luSpreadMechanism
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSpreadMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[luSpreadMechanism]
GO


-- Drop reference table luUncertaintyLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luUncertaintyLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luUncertaintyLevel]
GO


-- Drop reference table luTransmissionMechanism
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTransmissionMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[luTransmissionMechanism]
GO


-- Drop reference table luTransmissibilityIndicator
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTransmissibilityIndicator]') AND type in (N'U'))
DROP TABLE [dbo].[luTransmissibilityIndicator]
GO


-- Drop reference table luMortalityLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luMortalityLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luMortalityLevel]
GO


-- Drop reference table luSpreadRateLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSpreadRateLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luSpreadRateLevel]
GO


-- Drop reference table luSurveillanceMechanism
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSurveillanceMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[luSurveillanceMechanism]
GO


-- Drop reference table luCasesPerYear
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCasesPerYear]') AND type in (N'U'))
DROP TABLE [dbo].[luCasesPerYear]
GO


-- Drop reference table luCommoditiesCompromisedLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCommoditiesCompromisedLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luCommoditiesCompromisedLevel]
GO


-- Drop reference table luIssueExtent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIssueExtent]') AND type in (N'U'))
DROP TABLE [dbo].[luIssueExtent]
GO


-- Drop reference table luHumanExposureReductionLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luHumanExposureReductionLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luHumanExposureReductionLevel]
GO


-- Drop reference table luHumanCasesLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luHumanCasesLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luHumanCasesLevel]
GO


-- Drop reference table luModalSeverityLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luModalSeverityLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luModalSeverityLevel]
GO


-- Drop reference table luTradeImpactLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTradeImpactLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luTradeImpactLevel]
GO


-- Drop reference table luGeographicArea
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luGeographicArea]') AND type in (N'U'))
DROP TABLE [dbo].[luGeographicArea]
GO


-- Drop reference table luMaximumSeverityLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luMaximumSeverityLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luMaximumSeverityLevel]
GO


-- Drop reference table luCostLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCostLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luCostLevel]
GO


-- Drop reference table luLocalEnvironmentImpactLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luLocalEnvironmentImpactLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luLocalEnvironmentImpactLevel]
GO


-- Drop reference table luRegionalisationLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRegionalisationLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luRegionalisationLevel]
GO


-- Drop reference table luLegislationType
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luLegislationType]') AND type in (N'U'))
DROP TABLE [dbo].[luLegislationType]
GO


-- Drop reference table luWildlifeReservoirIndicator
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luWildlifeReservoirIndicator]') AND type in (N'U'))
DROP TABLE [dbo].[luWildlifeReservoirIndicator]
GO


-- Drop reference table luGlobalEnvironmentImpactLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luGlobalEnvironmentImpactLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luGlobalEnvironmentImpactLevel]
GO


-- Drop reference table luDiagnosisAndDetectionMechanism
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luDiagnosisAndDetectionMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[luDiagnosisAndDetectionMechanism]
GO


-- Drop reference table luUnplannedCostLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luUnplannedCostLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luUnplannedCostLevel]
GO


-- Drop reference table luBooleanFlag
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luBooleanFlag]') AND type in (N'U'))
DROP TABLE [dbo].[luBooleanFlag]
GO


-- Drop reference table luAttributableFraction
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luAttributableFraction]') AND type in (N'U'))
DROP TABLE [dbo].[luAttributableFraction]
GO


-- Drop reference table luRiskChange
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRiskChange]') AND type in (N'U'))
DROP TABLE [dbo].[luRiskChange]
GO


-- Drop reference table luControlMechanism
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luControlMechanism]') AND type in (N'U'))
DROP TABLE [dbo].[luControlMechanism]
GO


-- Drop reference table luIndicatorFlag
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIndicatorFlag]') AND type in (N'U'))
DROP TABLE [dbo].[luIndicatorFlag]
GO


-- Drop reference table luTimePeriod
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTimePeriod]') AND type in (N'U'))
DROP TABLE [dbo].[luTimePeriod]
GO


-- Drop reference table luRiskLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRiskLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luRiskLevel]
GO


-- Drop reference table luImpactLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luImpactLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luImpactLevel]
GO


-- Drop reference table luPrevalenceLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luPrevalenceLevel]') AND type in (N'U'))
DROP TABLE [dbo].[luPrevalenceLevel]
GO

-- handle default value in profile fields

ALTER TABLE [ProfileField]
ALTER COLUMN [DefaultValue] varchar(max) NULL
GO

UPDATE
	[ProfileField]
SET
	[DefaultValue] = NULL

UPDATE
	[ProfileField]
SET
	[DefaultValue] = 'The data presented in this profile is based on the current situation for this disease/issue.'
WHERE
	[Id] = '06EFA477-EE11-4987-A021-31952082F2F2'
	
-- remove Surveillance section question 10.1

DELETE
	[ProfileVersionFieldValue]
FROM
	[ProfileVersionFieldValue] INNER JOIN [ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id]
	INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
	INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[SectionNumber] = 10 AND
	[ProfileQuestion].[QuestionNumber] = 1

DELETE
	[ProfileVersionQuestionRow]
FROM
	[ProfileVersionQuestionRow] INNER JOIN [ProfileQuestion] ON [ProfileVersionQuestionRow].[ProfileQuestionId] = [ProfileQuestion].[Id]
	INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[SectionNumber] = 10 AND
	[ProfileQuestion].[QuestionNumber] = 1

DELETE
	[ProfileField]
FROM
	[ProfileField] INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
	INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[SectionNumber] = 10 AND
	[ProfileQuestion].[QuestionNumber] = 1

DELETE
	[ProfileQuestion]
FROM
	[ProfileQuestion] INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[SectionNumber] = 10 AND
	[ProfileQuestion].[QuestionNumber] = 1

UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 1
FROM
	[ProfileQuestion] INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[SectionNumber] = 10 AND
	[ProfileQuestion].[QuestionNumber] = 2


-- Laboratories section
-- 2.11.3 a) - c)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'Laboratory',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'52C7B2FF-2D50-4F9A-BBBA-6B01CCFE6270',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'Laboratory A',
	1,
	'26 November 2008'
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'DB08DC04-600D-4AC8-8FA3-967F6561DD59',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'Laboratory B',
	1,
	'26 November 2008'
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	'Laboratory Type',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'EE7DE107-38B4-4371-8502-03F7119B2666',
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	'OIE reference',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'45EC3672-132B-4447-8139-1F4D495D3442',
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	'EU reference',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'37A2E7C1-9BEF-47BD-BD80-53F25B3EF165',
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	'National reference (UK)',
	3
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'E7B223C9-303C-42EB-9020-20EDF886F6CD',
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	'Other diagnostic',
	4
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'30DE0E6C-45F6-44A7-B7F6-C377E3EB718B',
	'Laboratory Expertise Level',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'8B3BAFDB-E4ED-4BD6-9FDF-C20D9BC692F1',
	'30DE0E6C-45F6-44A7-B7F6-C377E3EB718B',
	'Local',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'0F566327-ED1F-4FF5-B979-D9A7F08D55B6',
	'30DE0E6C-45F6-44A7-B7F6-C377E3EB718B',
	'National',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'89B71307-412F-4452-9E5A-7B6A3CECC9CA',
	'30DE0E6C-45F6-44A7-B7F6-C377E3EB718B',
	'International',
	3
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Sample type',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'18CF3879-4231-4DB8-A3D8-120760944002',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Sample type A',
	1,
	'26 November 2008'
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'4B5AE21D-B7A4-4981-8238-768E2B0BA985',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Sample type B',
	1,
	'26 November 2008'
	)

INSERT INTO [ProfileSection]
	(
	[Id],
	[Name],
	[ShortName],
	[SectionNumber],
	[Note]
	)
VALUES
	(
	'7EB5FDDC-DF89-41A5-B486-374A656EDF5D',
	'Laboratories',
	'Laboratories',
	15,
	NULL
	)

INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'7EB5FDDC-DF89-41A5-B486-374A656EDF5D'
FROM
	[ProfileVersion]

INSERT INTO [ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB',
	'Diagnostic laboratories',
	'Diagnostic Laboratories',
	'7EB5FDDC-DF89-41A5-B486-374A656EDF5D',
	1,
	0,
	1,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
	NULL,
	NULL,
	NULL,
	'Diagnostic laboratories'
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'8DEC1184-9946-4F9A-9D66-5C670621AA44',
	'Laboratory',
	'Laboratory',
	'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB',
	1,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	0,
	0,
	NULL,
	1
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'74D2BFBE-CFFD-4235-A6DA-232D85817056',
	NULL,
	'Laboratory Type',
	'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB',
	2,
	'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
	1,
	'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
	0,
	0,
	NULL,
	1
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'9A994660-2ED3-49DD-B946-0DE632532906',
	'What is the level of expertise maintained at this laboratory for this disease?',
	'Laboratory Expertise',
	'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB',
	3,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'30DE0E6C-45F6-44A7-B7F6-C377E3EB718B',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'3623654F-8CA2-4C43-8CAB-A3B59DFD369F',
	'Supporting comments',
	'Laboratory Comments',
	'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB',
	4,
	'd297f63b-638a-4574-b042-97c248338a26',
	0,
	NULL,
	0,
	0,
	NULL,
	1
	)

INSERT INTO [ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	'Laboratory test details',
	'Laboratory Test Details',
	'7EB5FDDC-DF89-41A5-B486-374A656EDF5D',
	2,
	0,
	1,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
	NULL,
	NULL,
	NULL,
	'Laboratory test details'
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'77E8257F-E0B2-48BE-B36D-6A722529DD17',
	'Test',
	'Laboratory Test Name',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	1,
	'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
	1,
	NULL,
	0,
	0,
	NULL,
	1
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'2477B789-B0C5-4606-87DA-4CB4CF49604A',
	'Sample type',
	'Laboratory Test Sample Type',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	2,
	'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
	1,
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	0,
	0,
	NULL,
	1
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'E07BD03B-9425-49B3-B48F-E95ABACBAA8F',
	'Use',
	'Laboratory Test Use',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	3,
	'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
	1,
	NULL,
	0,
	0,
	NULL,
	1
	)

-------

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'82AA067B-35B9-4E04-9906-A795FEB73BE4',
	'Test Unit Cost Level',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'E406CB55-D868-4352-B642-0FC8C01643E6',
	'82AA067B-35B9-4E04-9906-A795FEB73BE4',
	'High',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'0C57CF6A-DBDC-45B4-B88B-682CDC3133BF',
	'82AA067B-35B9-4E04-9906-A795FEB73BE4',
	'Medium',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'BCFD6BA6-8D87-47CB-A534-688FE78E7567',
	'82AA067B-35B9-4E04-9906-A795FEB73BE4',
	'Low',
	3
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'89034D02-A706-446F-B51A-03407B6B4645',
	'Turnaround Time',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'E5205023-76FE-4242-87CD-3CD1EBBE1C60',
	'89034D02-A706-446F-B51A-03407B6B4645',
	'Rapid',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'94B41B58-F449-4973-9157-DF28696BC333',
	'89034D02-A706-446F-B51A-03407B6B4645',
	'Medium',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'C18BF71E-4DA7-4939-BEB9-C17CF1D2756E',
	'89034D02-A706-446F-B51A-03407B6B4645',
	'Slow',
	3
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	'Sensitivity Range',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'9D9AC438-82BA-4989-8176-A2BF08039AA4',
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	'Very high',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'B25D918F-51E2-4429-88C3-9CF02EBD51AD',
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	'High',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'8627AC78-B554-4329-9D4B-6C5A22820E45',
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	'Medium',
	3
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'7AD384A1-A030-4F69-820F-0F7609377E3C',
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	'Low',
	4
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	'Specificity Range',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'A2559E77-4AF4-44CD-A9F9-EFF9A0462769',
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	'Very high',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'DCE07527-4BBB-40FF-8DF3-67F7B4AE9983',
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	'High',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'83CDB840-7E96-4302-BE8E-F215C9914EC7',
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	'Medium',
	3
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'188490E9-B43A-4EE5-8547-2C58B34F83AE',
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	'Low',
	4
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'29DCC0E6-C316-4A4C-9CEC-68254BC8666E',
	'Potential Improvement Level',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'747B1C91-8DF1-4CC2-B717-52D8B88A410A',
	'29DCC0E6-C316-4A4C-9CEC-68254BC8666E',
	'Low',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'8622B0FA-1A50-4C12-A83A-A5B0F6882328',
	'29DCC0E6-C316-4A4C-9CEC-68254BC8666E',
	'Medium',
	2
	)
	
INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'50C17E5D-52CE-41FC-A563-725EB55DB981',
	'29DCC0E6-C316-4A4C-9CEC-68254BC8666E',
	'High',
	3
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'091A3984-F5A7-4B22-8498-EB285F4F1DF2',
	'Applicable Indicator Flag',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'B7A9B3A7-CF0D-4019-AAE3-D6087B0F64DC',
	'091A3984-F5A7-4B22-8498-EB285F4F1DF2',
	'Yes',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'3AE08908-6DC2-426B-97D0-BEAE77C4B104',
	'091A3984-F5A7-4B22-8498-EB285F4F1DF2',
	'No',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'B2DAED23-CB96-4CA8-A11D-CD6FF3859B7F',
	'091A3984-F5A7-4B22-8498-EB285F4F1DF2',
	'Not applicable',
	3
	)

INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C',
	'Test Usage Level',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'73CE18AA-BF06-426A-903C-E37318CE7122',
	'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C',
	'Local',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'4D6A89E2-921C-46F5-82BC-B978A3FC3225',
	'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C',
	'National government',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'6F1148D9-6B24-439E-BEDD-626416FCB676',
	'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C',
	'International reference',
	3
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'1F96850F-5A6A-475D-8EA5-1499B334E22C',
	'Unit cost',
	'Laboratory Test Unit Cost',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	4,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'82AA067B-35B9-4E04-9906-A795FEB73BE4',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'68C346C5-847A-4290-B117-6888D12B9FB5',
	'Turnaround time',
	'Laboratory Test Turnaround Time',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	5,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'89034D02-A706-446F-B51A-03407B6B4645',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'1C7187D6-EF15-412C-B95E-B61DD1AEE9E9',
	'Sensitivity range',
	'Laboratory Test Sensitivity Range',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	6,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'6A38BE43-9264-45E9-8C10-0A7E769F64DA',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'EEC08657-A27E-4991-8BCB-78755FF23525',
	'Specificity range',
	'Laboratory Test Specificity Range',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	7,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'DE28BEDF-CA47-4AE5-8B72-39257597697B',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'B8F47BC9-3F3C-49A6-BAAF-18212973B185',
	'Potential to improve diagnostic capability',
	'Laboratory Test Potential Improvement',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	8,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'29DCC0E6-C316-4A4C-9CEC-68254BC8666E',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'BC4E1B80-9592-43AE-AD57-ECCE10AF40F5',
	'Is this test prescribed by the OIE?',
	'Laboratory Test OIE Prescription',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	9,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'091A3984-F5A7-4B22-8498-EB285F4F1DF2',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'FDFBF94B-B5BE-4D55-AE38-42BF7634DA24',
	'Laboratories that can perform the test',
	'Laboratory Test Laboratories',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	10,
	'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
	1,
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'7B12E7A9-55D4-4E86-8D5E-BB6C1698547A',
	'What use is made of this test',
	'Laboratory Test Usage',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	11,
	'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
	1,
	'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C',
	0,
	0,
	NULL,
	0
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'53A3CBFB-0069-401A-9B24-A0BBFB944FC8',
	'Supporting comments',
	'Laboratory Test Comments',
	'E4388163-BCD2-4024-8D8E-89922AEDE845',
	12,
	'd297f63b-638a-4574-b042-97c248338a26',
	1,
	NULL,
	0,
	0,
	NULL,
	0
	)

-- 2.11.1 New data items: Risk
DELETE FROM [ProfileVersionFieldValue]
WHERE [ProfileVersionFieldValue].[Id] IN
(
SELECT [ProfileVersionFieldValue].[Id] FROM
	[ProfileVersionFieldValue] INNER JOIN
	[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk' AND
	[ProfileQuestion].[QuestionNumber] = 1
)

DELETE FROM [ProfileField]
WHERE [ProfileField].[Id] IN
(
SELECT [ProfileField].[Id] FROM
	[ProfileField] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk' AND
	[ProfileQuestion].[QuestionNumber] = 1
)

DELETE FROM [ProfileQuestion]
WHERE [ProfileQuestion].[Id] IN
(	
SELECT [ProfileQuestion].[Id] FROM
	[ProfileQuestion] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk' AND
	[ProfileQuestion].[QuestionNumber] = 1
)

-- Risk estimation
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('F51DBAF9-377F-48B4-9618-7964ABEB3B19','Risk estimation',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '9B07F705-7B03-4CBB-AF98-ABA42E2592B5', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'Negligible', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '318A01DE-703A-4F97-A9DA-449DD4881635', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'Very low', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '669ECB67-4CFD-43E4-8F4D-AFA14811F7CB', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'Low', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '80A88BD2-B5D5-45BF-921C-FBF376B22772', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'Medium', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '65F53FDD-BBEE-451D-A521-B6699BDF6E13', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'High', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'D2DBB522-01FF-442C-9D63-32696952CA33', 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 'Very high', 6, null, null )

-- Country level risk factors
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('9E5675F2-5684-453D-894F-FEAEFDCF0986','Country level risk factors',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '2356C4AF-9439-414F-B4C0-05C66C7BA2BB', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Vaccination policy', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '1A32C82B-7576-4E2D-97C6-22BF84C5DC1E', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Surveillance undertaken', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '0E2D9FD9-3C0C-4C93-8A81-83A92E75D331', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Current prevalence of infection', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'D4DCE9F7-2FFB-432C-9E67-897682FE3DF6', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Population structure of certain species', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '6F03C50C-D975-46DC-93B3-AAAA1A1751ED', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'General demographics',5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'CF1AAD3A-F811-4419-85FC-D776539ABAAB', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Prior outbreaks recorded', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'F4E2B540-369B-4DEF-B685-E5A88115611A', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Import control policy', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '7D1FE298-BB53-4033-AB9B-052E1FF6BAB8', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Trading partners disease status', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '123D4F68-ADFB-45B0-99DB-09876CF5C8D2', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Worldwide disease distribution', 9, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '813B5995-0DE2-4865-964E-F1BDE0A37259', '9E5675F2-5684-453D-894F-FEAEFDCF0986', 'Industry structure', 10, null, null )

-- Disease risk factors
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5','Disease risk factors',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '9702A880-A5E4-4E17-8323-0E4A083C2CF5', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Incubation period', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'FCD4B055-5A4F-46CF-AC71-2B911E4FC7FF', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Infectious period', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '30E9C7D8-0200-4114-B031-51315784E915', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Latent period', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'EAB81260-2897-4BBD-B9D8-7849FC249947', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Methods of transmission', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '718157FD-6E62-4659-B53C-AB40B153AF85', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Clinical signs', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '29806F47-851A-49AC-8511-B5AE53C21BC8', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Vaccine efficacy', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '8DD1FC13-7053-45F0-9E1C-EE6987F22C99', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Species affected', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '97736AF6-41F8-40B3-A692-024A0D914139', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Environmental stability of agent', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '4D0C3346-AF9A-4B71-AE52-15FDC8CB28AE', 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 'Typical disease history', 9, null, null )

-- Processing risk factors
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96','Processing risk factors',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'A821D0E8-60E5-4890-863D-0CF093FEAAED', '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 'Predilection sites', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'BE9BDACD-81B8-499E-9CFF-21AE1CD05179', '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 'Presence in products', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '9D1ECA8F-B95C-40D9-81C1-2B8078688BC8', '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 'Methods of processing', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'F058E468-730B-467D-8F4A-9BD076ADB36F', '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 'Sensitivity of agent', 4, null, null )

-- Prevelence estimation
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('715FEA53-B81F-475D-9A62-77452D865065','Prevelence estimation',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '78837574-E828-4385-92DC-13DE9F6C9CC0', '715FEA53-B81F-475D-9A62-77452D865065', 'Moderate increase', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '9E8D2881-1CAB-49F2-A481-268567B5ACC2', '715FEA53-B81F-475D-9A62-77452D865065', 'Minor increase', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '6A189ADC-74E6-4055-A900-32B6FE7374B2', '715FEA53-B81F-475D-9A62-77452D865065', 'No change', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '702ACA4A-3341-441E-8822-B054F5FA88B5', '715FEA53-B81F-475D-9A62-77452D865065', 'Minor decrease', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '1ABBD1B3-1DF2-482C-9712-B96679C334EA', '715FEA53-B81F-475D-9A62-77452D865065', 'Major decrease', 4, null, null )

-- Supporting evidence
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('8C6B2614-5E70-4D99-AF28-D6BFB19D8F56','Supporting evidence type',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '7CA04332-0E1F-43CA-9303-091DC6A89820', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Published peer review studies', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '83A9635C-A5A7-4C59-B236-13955B0A8C44', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Systematic reviews', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '2AE86187-1894-4755-AF8F-27A016544999', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Meta-analysis studies', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '3472C369-847F-4DBD-8B41-38D49A6F3BE9', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Expert opinion', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '4D2336FE-7272-4412-8A30-85F3D860C01C', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Traditional reviews', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '27E2F07D-10F4-4D0B-B3DB-87A1A9B9A9F0', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'Other forms of grey literature', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'A5521425-48D8-4805-B458-A110F37F42A2', '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 'IDM reports', 4, null, null )

-- Level of Variability
INSERT INTO [ReferenceTable] ([Id],[Name],[IsMaintainable]) VALUES ('4472C9E5-9983-4E3D-9C92-00CB856991E3','Variability',0)
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( 'B84A92BD-74CF-4738-8227-3EDDD73974DB', '4472C9E5-9983-4E3D-9C92-00CB856991E3', 'Low', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '554C5C8C-3831-4192-9B7F-9F04D4C1F9E5', '4472C9E5-9983-4E3D-9C92-00CB856991E3', 'Medium', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ( '5916D97C-CBE1-45FC-9ABC-C5266989B6DC', '4472C9E5-9983-4E3D-9C92-00CB856991E3', 'High', 3, null, null )

--Risk estimation: F51DBAF9-377F-48B4-9618-7964ABEB3B19
--Country level risk factors: 9E5675F2-5684-453D-894F-FEAEFDCF0986
--Disease risk factors: EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5
--Processing risk factors: 7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96
--Prevelence estimation: 715FEA53-B81F-475D-9A62-77452D865065
--Supporting evidence: 8C6B2614-5E70-4D99-AF28-D6BFB19D8F56
--Level of variability: 4472C9E5-9983-4E3D-9C92-00CB856991E3

--ProfileQuestion: Q1
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 'What is the likelihood of a change to the hazard occurrence in GB within the next 12 months', 'Likelihood of change of hazard occurrence', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 1, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the likelihood of a change to the hazard occurrence in GB within the next 12 months')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('09D58B4F-86F3-472F-9866-09A93B815247', 'Risk estimation', 'Risk estimation', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 1, 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 1, 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('61352AB3-BD94-4423-8643-3FF1751526AB', 'Which country-level risk factors have been considered', 'Country level risk factors', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 2, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '9E5675F2-5684-453D-894F-FEAEFDCF0986', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('D16BF1D6-10EB-47D6-B63C-715C95A1622E', 'Which infection and disease risk factors have been considered', 'Infection and disease risk factors', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 3, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('F5BCC20A-2194-4CE4-9317-9501DCD9C3D4', 'Which processing and parts risk factors have been considered', 'Processing and parts risk factors', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 4, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('BE39FB24-29B2-47B6-83D2-BBA029755EDB', 'Key risk factors identified', 'Key risk factors identified', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 5, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('87D1A90E-B3D3-4ABC-ADF6-D6C820058309', 'Existing mitigating factors', 'Existing mitigating factors', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 6, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('EA462AE8-9B97-4322-AACB-124F6F93A3F7', 'Potential additional mitigating factors', 'Potential additional mitigating factors', '2F243ADC-AB20-43C5-8B6E-093D4BC75DEC', 7, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

--ProfileQuestion: Q2
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 'What is the likelihood of hazard exposure to susceptible animal species', 'Likelihood of hazard exposure to susceptible animal species', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 2, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the likelihood of hazard exposure to susceptible animal species')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('6122815D-DE51-4EBC-828B-3A27DBB61FDC', 'Risk estimation', 'Risk estimation', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 1, 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 1, 'F51DBAF9-377F-48B4-9618-7964ABEB3B19', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('63FB986E-316B-422B-B5D9-9C25E40D0865', 'Which country-level risk factors have been considered', 'Country level risk factors', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 2, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '9E5675F2-5684-453D-894F-FEAEFDCF0986', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('233C0897-43F9-4C8B-85A1-A3B5A9C145FF', 'Which infection and disease risk factors have been considered', 'Infection and disease risk factors', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 3, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('A411C4F2-2906-4B9B-B9D8-2E9CF3F3B734', 'Which processing and parts risk factors have been considered', 'Processing and parts risk factors', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 4, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('E9A95E7B-8D30-443A-87C7-4124BF574BF1', 'Key risk factors identified', 'Key risk factors identified', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 5, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('D3F54AED-897B-4A0A-BD8D-4A596E9B0475', 'Existing mitigating factors', 'Existing mitigating factors', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 6, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('C6F70278-C135-4DC4-BF9E-66699073CADB', 'Potential additional mitigating factors', 'Potential additional mitigating factors', 'E671E45D-1A5D-4A36-9C8E-3599EB80DC25', 7, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

--ProfileQuestion: Q3
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('983003BC-1BD7-410C-AF22-97299CCEA42D', 'What is the likelihood of hazardous exposure to humans', 'Likelihood of hazard exposure to humans', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 3, 0, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the likelihood of hazardous exposure to humans')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('7006EC37-F36E-4DA4-A500-A8772623D86C', null, 'Likelihood of hazardous exposure to humans', '983003BC-1BD7-410C-AF22-97299CCEA42D', 1, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

--ProfileQuestion: Q4
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('677BEFF4-7D2F-4613-811A-C9F2DA708848', 'What is the likelihood of hazardous exposure/contamination to plants or the environment', 'Likelihood of hazardous exposure/contamination to plants ', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 4, 0, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the likelihood of hazardous exposure/contamination to plants or the environment')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('4D962A5A-708A-4688-AB99-4DAEDADECFBC', null, 'Likelihood of hazardous exposure to humans', '677BEFF4-7D2F-4613-811A-C9F2DA708848', 1, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

--ProfileQuestion: Q5
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('DC6CD949-9AB2-459D-94B6-30500123873D', 'What is the consequential change to the prevalence of infected holdings expected following the altered exposure status in GB, within a 12 month period', 'Consequential change to the prevalence of infected holdings', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 5, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the consequential change to the prevalence of infected holdings expected following the altered exposure status in GB, within a 12 month period?')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('6189AC41-EAF4-48A5-9422-4F4FA6320961', 'Prevalance estimation', 'Prevalance estimation', 'DC6CD949-9AB2-459D-94B6-30500123873D', 1, 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 1, '715FEA53-B81F-475D-9A62-77452D865065', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('99CD2EDC-C4E8-4B5E-90A6-5BA8CE9363B4', 'Which country-level risk factors have been considered', 'Country level risk factors', 'DC6CD949-9AB2-459D-94B6-30500123873D', 2, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '9E5675F2-5684-453D-894F-FEAEFDCF0986', 0, 0, null, 1 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('26B7110D-1FD5-4AE2-AA44-7D60D81066FE', 'Which infection and disease risk factors have been considered', 'Infection and disease risk factors', 'DC6CD949-9AB2-459D-94B6-30500123873D', 3, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('1E81C01F-681B-49FB-8EF2-80F0BB6D5BE1', 'Which processing and parts risk factors have been considered', 'Processing and parts risk factors', 'DC6CD949-9AB2-459D-94B6-30500123873D', 4, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('C92229BA-FD86-44FE-B659-974611786076', 'Key risk factors identified', 'Key risk factors identified', 'DC6CD949-9AB2-459D-94B6-30500123873D', 5, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('7F788D0D-795F-42CD-BB11-D18CDD0E6887', 'Existing mitigating factors', 'Existing mitigating factors', 'DC6CD949-9AB2-459D-94B6-30500123873D', 6, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('B8373221-4DAC-4DE1-AAC1-454F25D38842', 'Potential additional mitigating factors', 'Potential additional mitigating factors', 'DC6CD949-9AB2-459D-94B6-30500123873D', 7, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

--ProfileQuestion: Q6
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('1E25EA97-8A52-43CB-9D6B-9070EB599D6D', 'What is the supporting evidence base used', 'Supporting evidence base used', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 6, 0, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'What is the consequential change to the prevalence of infected holdings expected following the altered exposure status in GB, within a 12 month period')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('39F4A25C-3750-438D-B326-AA1090EEA3AE', null, 'Supporting evidence base used', '1E25EA97-8A52-43CB-9D6B-9070EB599D6D', 1, '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 1, '8C6B2614-5E70-4D99-AF28-D6BFB19D8F56', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('3115FBB0-8795-4CDF-A68E-C6D18D9C1D99', 'Supporting comments', 'Supporting comments', '1E25EA97-8A52-43CB-9D6B-9070EB599D6D', 2, 'd297f63b-638a-4574-b042-97c248338a26', 0, null, 0, 0, null, 1 )

--ProfileQuestion: Q7
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('6D76E2FE-56E2-468B-8D5D-E7DD699E931E', 'Level of variability', 'Level of variability', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 7, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'Level of variability')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('D3D006DE-199D-4FC4-A8DC-EDC1D0A692ED', null, 'Level of variability', '6D76E2FE-56E2-468B-8D5D-E7DD699E931E', 1, 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 1, '4472C9E5-9983-4E3D-9C92-00CB856991E3', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('7E1D16E5-CA56-45F5-B4F7-0055F372A499', 'Supporting comments', 'Supporting comments', '6D76E2FE-56E2-468B-8D5D-E7DD699E931E', 2, 'd297f63b-638a-4574-b042-97c248338a26', 0, null, 0, 0, null, 1 )

--ProfileQuestion: Q8
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('E08BDE2B-BD56-4CDC-9641-E1A9DCF30D6B', 'Level of uncertainty', 'Level of uncertainty', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 8, 1, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'Level of uncertainty')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('174D1DE7-2536-405F-8A62-054327AC21C1', null, 'Level of variability', 'E08BDE2B-BD56-4CDC-9641-E1A9DCF30D6B', 1, 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 1, 'f41b0195-76f7-4b95-9c9c-2c1dcc376821', 0, 0, null, 0 )
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('8A7D9F3C-26FB-45C0-98D3-17BE25C8FF37', 'Supporting comments', 'Supporting comments', 'E08BDE2B-BD56-4CDC-9641-E1A9DCF30D6B', 2, 'd297f63b-638a-4574-b042-97c248338a26', 0, null, 0, 0, null, 1 )

--ProfileQuestion: Q9
INSERT INTO [ProfileQuestion] ([Id], [Name], [ShortName], [ProfileSectionId], [QuestionNumber], [IsPerSpecies], [IsRepeating], [UserGuidance], [IrrelevanceFieldId], [IrrelevanceValueId], [IrrelevanceFlag], [NonTechnicalName]) VALUES ('CBA1AB8C-B67C-46A7-94F7-2B7920FE5CD7', 'Risk summary', 'Risk summary', '158f8d0c-15a7-4f31-98fc-0c06196045d5', 9, 0, 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', null, null, null, 'Risk summary')
INSERT INTO [ProfileField]([Id],[Name],[ShortName],[ProfileQuestionId],[FieldNumber],[DataFieldTypeId],[IsMandatory],[ReferenceTableId],[IsReadOnlyCurrentSituation],[IsReadOnlyScenario],[DefaultValue],[IncludeInSummary]) VALUES ('807A3555-4C4B-4417-A6F3-40CD099AC388', null, 'Rish summary', 'CBA1AB8C-B67C-46A7-94F7-2B7920FE5CD7', 1, 'd297f63b-638a-4574-b042-97c248338a26', 1, null, 0, 0, null, 0 )

-- Base Section/Question/Field structure for species and profile versions
-- fix field numbers in SpeciesField table
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = 'd8508d02-644c-4db7-afe0-84f66da95f91'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = '08c76c6d-48f6-477c-b123-6820707b09ec'
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = 'ff59c6db-10ee-43d2-ac57-abd20cbd802f'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = '7641f411-ee1a-4135-a502-007ab080b41a'
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = '2b3e6845-4d43-4f03-9ace-5ef35d4dfe1b'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = '34119d63-c218-43e2-bebb-b2d91d57927d'
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = '3a5910e4-6e48-4edb-a916-40aaad39f122'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = '615589a7-8fe3-4070-82db-ea4161c346e0'
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = '33e63913-09d4-484e-8818-3485d2897fef'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = '03477d37-30cc-4878-826a-9414dd288d63'
UPDATE [SpeciesField] SET [FieldNumber] = 1 WHERE [Id] = 'e48aa9ca-4a0a-4c4c-b097-150333240874'
UPDATE [SpeciesField] SET [FieldNumber] = 2 WHERE [Id] = 'fe30e671-91eb-4f12-ab47-deb08473dfe7'

--Risk Section -- complete overhaul. (work item: 3735)

DELETE FROM [ProfileVersionFieldValue]
WHERE [ProfileVersionFieldValue].[Id] IN
(
SELECT [ProfileVersionFieldValue].[Id] FROM
	[ProfileVersionFieldValue] INNER JOIN
	[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk'	
)

DELETE FROM [ProfileField]
WHERE [ProfileField].[Id] IN
(
SELECT [ProfileField].[Id] FROM
	[ProfileField] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk'	
)

DELETE FROM [ProfileQuestion]
WHERE [ProfileQuestion].[Id] IN
(	
SELECT [ProfileQuestion].[Id] FROM
	[ProfileQuestion] INNER JOIN
	[ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
WHERE
	[ProfileSection].[ShortName] = 'Risk'	
)

--Deletions of risk reference tables
--Country level risk factors: 9E5675F2-5684-453D-894F-FEAEFDCF0986 (delete)
DELETE FROM [ReferenceValue] WHERE [ReferenceTableId] = '9E5675F2-5684-453D-894F-FEAEFDCF0986'
DELETE FROM [ReferenceTable] WHERE [Id] = '9E5675F2-5684-453D-894F-FEAEFDCF0986'
--Disease risk factors: EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5 (delete)
DELETE FROM [ReferenceValue] WHERE [ReferenceTableId] = 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5'
DELETE FROM [ReferenceTable] WHERE [Id] = 'EF0E0139-2434-4DF5-8B5E-8F52EA1C28A5'
--Processing risk factors: 7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96 (delete)
DELETE FROM [ReferenceValue] WHERE [ReferenceTableId] = '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96'
DELETE FROM [ReferenceTable] WHERE [Id] = '7B8C60C8-1B96-41F3-B6AE-FCA50B3EDF96'
--Prevelence estimation: 715FEA53-B81F-475D-9A62-77452D865065 (delete)
DELETE FROM [ReferenceValue] WHERE [ReferenceTableId] = '715FEA53-B81F-475D-9A62-77452D865065'
DELETE FROM [ReferenceTable] WHERE [Id] = '715FEA53-B81F-475D-9A62-77452D865065'

--Changes to risk reference tables
--Risk estimation: F51DBAF9-377F-48B4-9618-7964ABEB3B19 
-- remove the very high option
DELETE FROM [ReferenceValue] WHERE [Id] = 'D2DBB522-01FF-442C-9D63-32696952CA33'
--Supporting evidence: 8C6B2614-5E70-4D99-AF28-D6BFB19D8F56 
-- update one of the reference values
UPDATE [ReferenceValue] SET [LookupValue] = 'International disease monitoring (IDM) reports' WHERE [Id]='A5521425-48D8-4805-B458-A110F37F42A2'

--New risk reference tables
--Key risk factors 
--Instrinsic mitigating factors 
--Applied mitigating factors
--Applied additional mitigating factors
-- Key risk factors: 2B2C4BD9-0122-48AD-9546-008DB3AA275D
INSERT INTO [ReferenceTable] 
(
[Id],
[Name],
[IsMaintainable]
) 
VALUES 
(
'2B2C4BD9-0122-48AD-9546-008DB3AA275D',
'Key risk factors',
0
)

--values
--------
--Difficulty in clinical detection/Non-pathognomic clinical signs: 7FEDCCA9-D5D7-496A-850C-05916B10B517
--Potential for silent spread: 0462F9C5-9019-4E11-804D-116D07D0D74C
--Chronic persistence of disease: 2DCFBC71-C793-4992-8004-1CA6B99AAEFF
--Development of carrier state: 1E0F7270-C357-4569-A828-20BA65D693F9 
--Wide number of susceptible species: BC74A696-F9D7-4E34-BDA3-2745A6054939
--Ability to form wildlife reservoir: 37DC5B0A-22E0-4A4C-A15D-2757DB8D6737
--Numerous predilection sites: 1382B626-926B-4E18-B629-2CCF76CDD505
--Ease of transmission: B99FAE1B-00CA-478C-9853-2F69B656CA31
--Transmissible in processed products: F3C4C643-5CEC-4452-AFC9-35D7DDD14B68 
--Transmissible in unprocessed products: 6A3BBC3A-1C8C-4543-A140-3EF989579FB4 
--Current GB prevalence of infection: AE5E9D03-F0A8-4C2D-829C-52B849C989F9
--High environmental stability of agent: 11732457-D8B0-446C-9E45-587DDB4B91CC 
--Genetic shift: A2CDC6B4-2AE5-4CE2-B9B3-5DD2D8C4A6B8 
--Genetic drift: 8CC6AAD1-7BFA-4468-99F5-5EE585326424
--Developing antimicrobial resistance: 7D1763A0-000E-487A-9398-5FB6C0B2C211
--Presence of suitable vectors: EFDE70E7-1B3B-4EFE-9FC1-60515C10900C
--Windborne spread: 9D5AD7A1-11E7-406C-BECB-6A036B7F2DE3
--Climate change/Unexpected seasonal fluctuations: DE703063-9280-49DC-AD02-6DE8A9D48034
--Difficulty producing effective treatment: 0401B324-4791-44CE-A637-84DC5FB4338C
--Poor sensitivity of test used: 18828382-C967-42EF-804A-8943929E5895
--Poor specificity of test used: 7EEC3738-4174-44FF-ADBB-A229C1BE88B9
--No/little surveillance undertaken: D0CDF8F1-AA86-4984-9C9E-A9BD8C0321B0
--Change in method of surveillance: 2B844539-DD85-4924-B539-BD4C88D9348D 
--Non-existent/Inefficacious vaccine: 488D9211-8FF0-4C73-91B2-CFB3D599AE4C
--Lack of vaccine contingency plan: E48BE31D-09DF-4952-8005-DB2DD05E5F62
--Widespread worldwide agent distribution: 22B1D697-FFCE-4091-BD10-DB4280AB9359
--Current import policy: 11D8EBE8-961D-4019-8370-DF596CC5B953
--Presence of infection in trading partners: 28D832F3-9B8B-47E9-8AF8-EDD8B3DC2B1E
--Potential presence in imported products: 9197D03C-1D22-4A41-838D-F6F2895CFA0A
--Recent change to policy/legislation: 20BAB49F-3678-478B-BE89-F7E73162FD44
--Other (Please specify below): 9BF504B2-EF15-4F95-8778-F8B72DD60990
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('7FEDCCA9-D5D7-496A-850C-05916B10B517', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Difficulty in clinical detection/Non-pathognomic clinical signs', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('0462F9C5-9019-4E11-804D-116D07D0D74C', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Potential for silent spread', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('2DCFBC71-C793-4992-8004-1CA6B99AAEFF', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Chronic persistence of disease', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('1E0F7270-C357-4569-A828-20BA65D693F9', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Development of carrier state', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('BC74A696-F9D7-4E34-BDA3-2745A6054939', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Wide number of susceptible species', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('37DC5B0A-22E0-4A4C-A15D-2757DB8D6737', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Ability to form wildlife reservoir', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('1382B626-926B-4E18-B629-2CCF76CDD505', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Numerous predilection sites', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('B99FAE1B-00CA-478C-9853-2F69B656CA31', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Ease of transmission', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('F3C4C643-5CEC-4452-AFC9-35D7DDD14B68', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Transmissible in processed products', 9, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('6A3BBC3A-1C8C-4543-A140-3EF989579FB4', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Transmissible in unprocessed products', 10, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('AE5E9D03-F0A8-4C2D-829C-52B849C989F9', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Current GB prevalence of infection', 11, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('11732457-D8B0-446C-9E45-587DDB4B91CC', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'High environmental stability of agent', 12, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('A2CDC6B4-2AE5-4CE2-B9B3-5DD2D8C4A6B8', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Genetic shift', 13, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('8CC6AAD1-7BFA-4468-99F5-5EE585326424', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Genetic drift', 14, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('7D1763A0-000E-487A-9398-5FB6C0B2C211', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Developing antimicrobial resistance', 15, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('EFDE70E7-1B3B-4EFE-9FC1-60515C10900C', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Presence of suitable vectors', 16, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('9D5AD7A1-11E7-406C-BECB-6A036B7F2DE3', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Windborne spread', 17, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('DE703063-9280-49DC-AD02-6DE8A9D48034', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Climate change/Unexpected seasonal fluctuations', 18, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('0401B324-4791-44CE-A637-84DC5FB4338C', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Difficulty producing effective treatment', 19, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('18828382-C967-42EF-804A-8943929E5895', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Poor sensitivity of test used', 20, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('7EEC3738-4174-44FF-ADBB-A229C1BE88B9', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Poor specificity of test used', 21, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('D0CDF8F1-AA86-4984-9C9E-A9BD8C0321B0', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'No/little surveillance undertaken', 22, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('2B844539-DD85-4924-B539-BD4C88D9348D', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Change in method of surveillance', 23, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('488D9211-8FF0-4C73-91B2-CFB3D599AE4C', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Non-existent/Inefficacious vaccine', 24, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('E48BE31D-09DF-4952-8005-DB2DD05E5F62', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Lack of vaccine contingency plan', 25, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('22B1D697-FFCE-4091-BD10-DB4280AB9359', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Widespread worldwide agent distribution', 26, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('11D8EBE8-961D-4019-8370-DF596CC5B953', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Current import policy', 27, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('28D832F3-9B8B-47E9-8AF8-EDD8B3DC2B1E', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Presence of infection in trading partners', 28, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('9197D03C-1D22-4A41-838D-F6F2895CFA0A', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Potential presence in imported products', 29, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('20BAB49F-3678-478B-BE89-F7E73162FD44', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Recent change to policy/legislation', 30, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('9BF504B2-EF15-4F95-8778-F8B72DD60990', '2B2C4BD9-0122-48AD-9546-008DB3AA275D', 'Other (Please specify below)', 31, null, null )

-- Instrinsic mitigating factors: A0C380CA-38C2-4DBF-A9F3-12B94F430DF9
INSERT INTO [ReferenceTable] 
(
[Id],
[Name],
[IsMaintainable]
) 
VALUES 
(
'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9',
'Instrinsic mitigating factors',
0
)

--values
--------
--Seasonal distribution of vectors (i.e. vector-free period): 73347098-8726-4DE6-859E-0EA57FCDE31F
--Absence of suitable vectors: 9FFB20F3-3A9C-43D9-AB52-07F41732310D
--Limited worldwide distribution: C2F60D24-4D11-4690-922A-1543C81FAF9F
--Inhospitable climate: 23CDE52E-A87C-42E9-B63A-1741A05B0E1D
--Demographics/structure of population: 97E3137C-C383-47B7-AC66-18C4BA719214
--Pathognomic clinical signs: D944A581-5AC5-4F62-87DE-25DF32734721
--Absence of susceptible species: 818DB0CD-A11C-4E85-92E3-28602CD3A47A
--Poor transmissibility: A47BC0A8-5C35-4A60-B386-2AB059690CCA
--Genetic stability of agent: 66FEFD58-698E-44F4-9D88-2BF0CD304099
--Inability to form wildlife reservoir: 48680051-0C49-440B-9642-2BFC31C9C322
--Other (please specify below): 8DCD609D-9DF9-4DF5-9DE7-48964AE58E7C

INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('73347098-8726-4DE6-859E-0EA57FCDE31F', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Seasonal distribution of vectors', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('9FFB20F3-3A9C-43D9-AB52-07F41732310D', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Absence of suitable vectors', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('C2F60D24-4D11-4690-922A-1543C81FAF9F', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Limited worldwide distribution', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('23CDE52E-A87C-42E9-B63A-1741A05B0E1D', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Inhospitable climate', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('97E3137C-C383-47B7-AC66-18C4BA719214', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Demographics/structure of population', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('D944A581-5AC5-4F62-87DE-25DF32734721', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Pathognomic clinical signs', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('818DB0CD-A11C-4E85-92E3-28602CD3A47A', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Absence of susceptible species', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('A47BC0A8-5C35-4A60-B386-2AB059690CCA', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Poor transmissibility', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('66FEFD58-698E-44F4-9D88-2BF0CD304099', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Genetic stability of agent', 9, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('48680051-0C49-440B-9642-2BFC31C9C322', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Inability to form wildlife reservoir', 10, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('8DCD609D-9DF9-4DF5-9DE7-48964AE58E7C', 'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 'Other (please specify below)', 11, null, null )

-- Applied mitigating factors: ABD96FFA-219F-4B9F-AC09-476A75D98708
INSERT INTO [ReferenceTable] 
(
[Id],
[Name],
[IsMaintainable]
) 
VALUES 
(
'ABD96FFA-219F-4B9F-AC09-476A75D98708',
'Applied mitigating factors',
0
)

-- values
---------
--Notifiable/Reportable disease: 8CA29D41-D3B1-4EDB-A83C-060329214C44
--‘Test and slaughter’ policy: 4F6706BD-FDA8-4D49-A44E-08E4F21CCA10
--Movement restrictions: FAB50081-0C0A-4B41-B363-0DE86F25CC5A
--Vaccine efficacy: F19B85A7-C4C4-49BC-88F0-0F22534ED8AE
--Vaccine policy: F1EF1379-E5B3-41AE-8B8D-1A918E77CD91
--On-farm biosecurity measures: BE9777D4-D297-4610-868E-20FB41AD3C3C
--Off-farm biosecurity measures: EDB6EE7C-2F56-4308-AFFE-22FD699CD4A3
--Border inspection posts: 30C2AB7B-305E-45FA-A145-23238A9C8E85
--Import controls: 84C90E82-553B-430C-8B13-47E5613675C8
--Suitable methods of processing: 6A8B13D3-CC59-49CF-9063-4B542B647F30
--Absence of infection in trading partners: 3AA41FEC-1A1D-403E-BBDC-52EB6513E82E
--High level of surveillance undertaken: E78FB32A-3812-4217-9616-57180507F1C9
--SAPO legislation: 8A351511-7863-4CE9-93B6-6757DF949ED4
--Elimination of suitable vectors: DBB9FB95-5D07-4F08-BA51-6AA7419274AE
--National control programme: B2E6C5BD-9736-4A9D-A8BE-6EE72E650477
--High sensitivity of test used: F42597B9-8601-443B-AB92-7C86B71140AF
--High specificity of test used: 0190D0E1-8433-4815-8E6F-848D4DE2C379
--Readily treatable infection: AD11F938-5134-4001-94C0-97504E60699B
--Other (please specify below): 2EFA6967-21F9-449C-82F6-AAA81D90EFA5

INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('8CA29D41-D3B1-4EDB-A83C-060329214C44', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Notifiable/Reportable disease', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('4F6706BD-FDA8-4D49-A44E-08E4F21CCA10', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', '''Test and slaughter'' policy', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('FAB50081-0C0A-4B41-B363-0DE86F25CC5A', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Movement restrictions', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('F19B85A7-C4C4-49BC-88F0-0F22534ED8AE', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Vaccine efficacy', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('F1EF1379-E5B3-41AE-8B8D-1A918E77CD91', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Vaccine policy', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('BE9777D4-D297-4610-868E-20FB41AD3C3C', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'On-farm biosecurity measures', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('EDB6EE7C-2F56-4308-AFFE-22FD699CD4A3', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Off-farm biosecurity measures', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('30C2AB7B-305E-45FA-A145-23238A9C8E85', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Border inspection posts', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('84C90E82-553B-430C-8B13-47E5613675C8', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Import controls', 9, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('6A8B13D3-CC59-49CF-9063-4B542B647F30', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Suitable methods of processing', 10, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('3AA41FEC-1A1D-403E-BBDC-52EB6513E82E', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Absence of infection in trading partners', 11, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('E78FB32A-3812-4217-9616-57180507F1C9', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'High level of surveillance undertaken', 12, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('8A351511-7863-4CE9-93B6-6757DF949ED4', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'SAPO legislation', 13, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('DBB9FB95-5D07-4F08-BA51-6AA7419274AE', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Elimination of suitable vectors', 14, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('B2E6C5BD-9736-4A9D-A8BE-6EE72E650477', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'National control programme', 15, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('F42597B9-8601-443B-AB92-7C86B71140AF', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'High sensitivity of test used', 16, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('0190D0E1-8433-4815-8E6F-848D4DE2C379', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'High specificity of test used', 17, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('AD11F938-5134-4001-94C0-97504E60699B', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Readily treatable infection', 18, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('2EFA6967-21F9-449C-82F6-AAA81D90EFA5', 'ABD96FFA-219F-4B9F-AC09-476A75D98708', 'Other (please specify below)', 19, null, null )

-- Applied additional mitigating factors: E7C5D077-F472-464B-BAC6-12B7E9504584
INSERT INTO [ReferenceTable] 
(
[Id],
[Name],
[IsMaintainable]
) 
VALUES 
(
'E7C5D077-F472-464B-BAC6-12B7E9504584',
'Applied additional mitigating factors',
0
)

-- values
---------
--Notifiable/Reportable disease: F81C8CC0-B08C-4C56-AD50-041397C4771E
--‘Test and slaughter’ policy: 99842CE6-E0BD-417D-BBAE-06C0B2948018
--Movement restrictions: B2FD71C4-F50F-4BB9-8869-26BCE63136FB 
--Vaccine efficacy: A97D235C-7DE4-4224-A858-36A8F9393C40
--Vaccine policy: EF02C4C2-B019-4A24-8F34-3DC3C1AD8198
--On-farm biosecurity measures: DEC3119F-F67E-4407-A009-7E3E41BA0390
--Off-farm biosecurity measures: 5EDC51A9-0249-4B32-B146-8A6E47B57D28
--Border inspection posts: 34E8C243-EFB0-473D-92E3-8F427D7FB954
--Import controls: FB606BEF-4753-4273-839E-8FEFA56EFA63
--Suitable methods of processing: 4A7E46EB-0BA5-41F5-88D0-958FB555ED82
--Absence of infection in trading partners: BAFE3BFC-7E37-4C60-B298-A857F38067F1
--High level of surveillance undertaken: A64178A1-722F-4B98-A1B5-A89F532B243D
--SAPO legislation: 7CB57611-953D-4A4F-A432-A8B40BA3A984
--Elimination of suitable vectors: 010D8BEB-E9C5-4235-B301-BB218B81B94F
--National control programme: 9D582C3A-FCAD-4B06-A5A1-C25790124F75
--High sensitivity of test used: A4977626-1522-4194-848B-C5286631682D
--High specificity of test used: 8E8FFE4E-2B53-4675-A638-E885BB7A0418
--Improved treatment of infection/disease: E724855A-BC95-428E-BAF4-F5F7E03E4F1A
--Other (please specify below): 911BEB9A-270F-4639-A4D6-FE0013971951

INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('F81C8CC0-B08C-4C56-AD50-041397C4771E', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Notifiable/Reportable disease', 1, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('99842CE6-E0BD-417D-BBAE-06C0B2948018', 'E7C5D077-F472-464B-BAC6-12B7E9504584', '''Test and slaughter'' policy', 2, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('B2FD71C4-F50F-4BB9-8869-26BCE63136FB', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Movement restrictions', 3, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('A97D235C-7DE4-4224-A858-36A8F9393C40', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Vaccine efficacy', 4, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('EF02C4C2-B019-4A24-8F34-3DC3C1AD8198', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Vaccine policy', 5, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('DEC3119F-F67E-4407-A009-7E3E41BA0390', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'On-farm biosecurity measures', 6, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('5EDC51A9-0249-4B32-B146-8A6E47B57D28', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Off-farm biosecurity measures', 7, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('34E8C243-EFB0-473D-92E3-8F427D7FB954', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Border inspection posts', 8, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('FB606BEF-4753-4273-839E-8FEFA56EFA63', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Import controls', 9, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('4A7E46EB-0BA5-41F5-88D0-958FB555ED82', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Suitable methods of processing', 10, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('BAFE3BFC-7E37-4C60-B298-A857F38067F1', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Absence of infection in trading partners', 11, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('A64178A1-722F-4B98-A1B5-A89F532B243D', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'High level of surveillance undertaken', 12, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('7CB57611-953D-4A4F-A432-A8B40BA3A984', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'SAPO legislation', 13, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('010D8BEB-E9C5-4235-B301-BB218B81B94F', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Elimination of suitable vectors', 14, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('9D582C3A-FCAD-4B06-A5A1-C25790124F75', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'National control programme', 15, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('A4977626-1522-4194-848B-C5286631682D', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'High sensitivity of test used', 16, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('8E8FFE4E-2B53-4675-A638-E885BB7A0418', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'High specificity of test used', 17, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('E724855A-BC95-428E-BAF4-F5F7E03E4F1A', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Improved treatment of infection/disease', 18, null, null )
INSERT INTO [ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber], [EffectiveDateFrom], [EffectiveDateTo] ) VALUES ('911BEB9A-270F-4639-A4D6-FE0013971951', 'E7C5D077-F472-464B-BAC6-12B7E9504584', 'Other (please specify below)', 19, null, null )


--ProfileQuestion: Q1
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'0F37FF70-3BCB-49B7-B0A1-087771987D0F', 
'What are the key risk factors that could increase the level of (or at risk of introducing) infection/disease occurrence in G.B.', 
'What are the key risk factors affecting infection/disease', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
1, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'What are the key risk factors that could increase the level of (or at risk of introducing) infection/disease occurrence in G.B.'
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
[DefaultValue],
[IncludeInSummary])
VALUES 
(
'2BF45A2A-54D6-480F-9894-0AC47CE54F95', 
null, 
'Key risk factors', 
'0F37FF70-3BCB-49B7-B0A1-087771987D0F', 
1, 
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 
1,
'2B2C4BD9-0122-48AD-9546-008DB3AA275D', 
0, 
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary])
VALUES 
(
'EE9CB071-DE98-4E29-A9F6-131AB455DB6C', 
'Qualifying comments', 
'Qualifying comments', 
'0F37FF70-3BCB-49B7-B0A1-087771987D0F', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null, 
0, 
0, 
null, 
1 
)


--ProfileQuestion: Q2
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'94991AF7-EB9B-4F3F-9463-2479EEE2FFE9', 
'What are the key mitigating factors currently reducing the level of (or preventing) infection/disease occurrence in G.B.', 
'What are the key mitigating factors to reduce infection/disease', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
2, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'What are the key mitigating factors currently reducing the level of (or preventing) infection/disease occurrence in G.B.'
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
[DefaultValue],
[IncludeInSummary])
VALUES 
(
'27398A95-B630-46D1-B7E3-33BEA49623C7', 
'Instrinsic mitigating factors', 
'Instrinsic mitigating factors', 
'94991AF7-EB9B-4F3F-9463-2479EEE2FFE9', 
1, 
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 
1,
'A0C380CA-38C2-4DBF-A9F3-12B94F430DF9', 
0, 
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary])
VALUES 
(
'022F5F79-0773-476B-A73A-391D7A68E4AA', 
'Applied mitigating factors', 
'Applied mitigating factors', 
'94991AF7-EB9B-4F3F-9463-2479EEE2FFE9', 
2, 
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 
1,
'ABD96FFA-219F-4B9F-AC09-476A75D98708', 
0, 
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary])
VALUES 
(
'E1FAAC8E-65AB-4D06-B659-41D0FC920D85', 
'Qualifying comments', 
'Qualifying comments', 
'94991AF7-EB9B-4F3F-9463-2479EEE2FFE9', 
3, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0, 
0, 
null, 
0 
)

--ProfileQuestion: Q3
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'3ED56B05-6510-4F7D-9460-4ECF02D34BF5', 
'What are the key applied additional mitigating factors which could reduce the level of (or prevent) infection/disease occurrence in G.B.', 
'Key applied additional mitigating factors affecting infection/disease', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
3, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'What are the key applied additional mitigating factors which could reduce the level of (or prevent) infection/disease occurrence in G.B.'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'93E6F128-2154-49A4-9842-55AF4E55EA5B', 
null, 
'Key applied additional mitigating factors', 
'3ED56B05-6510-4F7D-9460-4ECF02D34BF5', 
1, 
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 
1,
'E7C5D077-F472-464B-BAC6-12B7E9504584', 
0,
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'39ED79BE-BE43-4F33-AE5A-589692D40480', 
'Qualifying comments',
'Qualifying comments', 
'3ED56B05-6510-4F7D-9460-4ECF02D34BF5', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0,
0, 
null, 
1 
)

--ProfileQuestion: Q4
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'4371D7B2-21E2-41E6-A571-64B6A5E23D0F', 
'Level of variability', 
'Level of variability', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
4, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'Level of variability'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'5E857081-2A35-4ABC-92A6-69B5AF45A5A9', 
null,
'Level of variability', 
'4371D7B2-21E2-41E6-A571-64B6A5E23D0F', 
1, 
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 
1,
'4472C9E5-9983-4E3D-9C92-00CB856991E3',
0,
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'863AD277-C82B-44CF-9FCF-8325AB0F60AA', 
'Supporting comments',
'Supporting comments', 
'4371D7B2-21E2-41E6-A571-64B6A5E23D0F', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0,
0, 
null, 
1 
)

--ProfileQuestion: Q5
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'8F603A38-BB4E-4065-9363-8A22D44BB45B', 
'Level of uncertainty', 
'Level of uncertainty', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
5, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'Level of uncertainty'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'F1FAF8F3-0A7D-4FED-8D4E-9BB41C4DB957', 
null,
'Level of uncertainty', 
'8F603A38-BB4E-4065-9363-8A22D44BB45B', 
1, 
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 
1,
'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
0,
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'4ACBA2A3-0560-4386-8E5F-9CCFA02F5954', 

'Supporting comments',
'Supporting comments', 
'8F603A38-BB4E-4065-9363-8A22D44BB45B', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0,
0, 
null, 
1 
)

--ProfileQuestion: Q6
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'8BC27978-625E-4559-8567-9ECB811EF9A8', 
'What is the current likelihood of a change to the level of infection/disease occurrence in G.B. in the next 12 months', 
'Risk estimation', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
6, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'What is the current likelihood of a change to the level of infection/disease occurrence in G.B. in the next 12 months'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'DA16CA94-EC3E-43B7-BB88-05122C90DAFF', 
'Risk estimation',
'Risk estimation', 
'8BC27978-625E-4559-8567-9ECB811EF9A8', 
1, 
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9', 
1,
'F51DBAF9-377F-48B4-9618-7964ABEB3B19',
0,
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'B74481A7-D232-4F51-81B3-0CB0005A4CCD', 
'Qualifying comments',
'Qualifying comments', 
'8BC27978-625E-4559-8567-9ECB811EF9A8', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
'F51DBAF9-377F-48B4-9618-7964ABEB3B19',
0,
0, 
null, 
1 
)

--ProfileQuestion: Q7
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'DCF4C29F-C1A9-4FA1-834B-13B165F7AA8C', 
'Risk summary',
'Risk summary', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
7, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'Risk summary'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'67036FD6-ED26-4C2B-A12D-25158B1078FE', 
null,
'Risk summary', 
'DCF4C29F-C1A9-4FA1-834B-13B165F7AA8C', 
1, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0,
0, 
null, 
1 
)

--ProfileQuestion: Q8
INSERT INTO [ProfileQuestion] 
(
[Id], 
[Name], 
[ShortName], 
[ProfileSectionId], 
[QuestionNumber], 
[IsPerSpecies], 
[IsRepeating], 
[UserGuidance], 
[IrrelevanceFieldId], 
[IrrelevanceValueId], 
[IrrelevanceFlag], 
[NonTechnicalName]
) 
VALUES 
(
'5F75AD01-F282-478F-BB37-2E7B1188657C', 
'What is the supporting evidence base used',
'What is the supporting evidence base used', 
'158f8d0c-15a7-4f31-98fc-0c06196045d5', 
8, 
0, 
0, 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
null, 
null, 
null, 
'What is the supporting evidence base used'
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'6C61357A-CDC0-4E33-ABA5-337DD2830041', 
null,
'Supporting evidence', 
'5F75AD01-F282-478F-BB37-2E7B1188657C', 
1, 
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89', 
1,
'8C6B2614-5E70-4D99-AF28-D6BFB19D8F56',
0,
0, 
null, 
1 
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
[DefaultValue],
[IncludeInSummary]
)
VALUES 
(
'7B35F206-AEDB-41BC-AD8B-347E7888D750', 
'Supporting comments',
'Supporting comments', 
'5F75AD01-F282-478F-BB37-2E7B1188657C', 
2, 
'd297f63b-638a-4574-b042-97c248338a26', 
1,
null,
0,
0, 
null, 
1 
)
--3730 a)
ALTER TABLE [dbo].[PrioritisationRankingRange] ADD
	[PrioritisationType] varchar(20) NULL
GO

UPDATE [dbo].[PrioritisationRankingRange] SET [PrioritisationType]='Profile'

ALTER TABLE [dbo].[PrioritisationRankingRange] 
	ALTER COLUMN [PrioritisationType] varchar(20) NOT NULL
GO

INSERT INTO [dbo].[PrioritisationRankingRange] 
	(
	[Id],
	[LowerBound],
	[UpperBound],
	[PrioritisationType])
VALUES
	(
	newid(),
	0,
	100,
	'Species'
	)
	
--3730 c)
ALTER TABLE [dbo].[PrioritisationCriterionValue]
	DROP COLUMN [LastUpdated]
ALTER TABLE [dbo].[SpeciesPrioritisationCriterionValue]
	DROP COLUMN [LastUpdated]
	
--3718 a)
UPDATE 
	[dbo].[ReferenceValue] 
SET 
	[SequenceNumber]=[SequenceNumber]+1 
WHERE 
	[ReferenceTableId]='3182F93A-71CF-41CD-915D-4989A8FB4876'

INSERT INTO 
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	) 
VALUES 
	(
	'48B0F405-A7F3-46DD-BC20-F455C83545AB',
	'3182F93A-71CF-41CD-915D-4989A8FB4876',
	'Zero',
	1
	)
	
UPDATE
	[dbo].[PrioritisationCriterionValue]
SET
	[SequenceNumber]=[SequenceNumber]+1
WHERE
	[PrioritisationCriterionId]='4A685626-A7D4-4F81-BBC3-08F6E6C32003'

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
	SELECT 
		'3D9783E5-61BC-4D24-A584-33AA80A1D0C8',
		'4A685626-A7D4-4F81-BBC3-08F6E6C32003',
		'Zero',
		[Score],
		1
	FROM 
		[dbo].[PrioritisationCriterionValue] 
	WHERE 
		[Id]='CA0E5DA1-4043-43C0-81B3-2A2ACB8E4D0B'
	
--3718 b)
INSERT INTO 
	[dbo].[ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'C9F3DA7B-2397-43E8-BBB6-4F4E1D5A79A6',
	'FFG Cost Level',
	0
	)
	
INSERT INTO 
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	) 
VALUES 
	(
	'6F05C40C-89CE-44A5-803B-2BA560F1C5D5',
	'C9F3DA7B-2397-43E8-BBB6-4F4E1D5A79A6',
	'Low',
	1
	)
INSERT INTO 
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	) 
VALUES 
	(
	'4C0AAC77-261B-48C1-808E-5841EE045997',
	'C9F3DA7B-2397-43E8-BBB6-4F4E1D5A79A6',
	'Medium',
	2
	)
INSERT INTO 
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	) 
VALUES 
	(
	'856B02A3-C628-4531-9ADB-363EC290ADDF',
	'C9F3DA7B-2397-43E8-BBB6-4F4E1D5A79A6',
	'High',
	3
	)

UPDATE 
	[dbo].[ProfileField]
SET
	[Name]='Supporting comments',
	[ShortName]='FFG costs summary comments',
	[FieldNumber]=2
WHERE
	[Id]='4376E65C-1319-4A06-987F-DA7A610BF78F'

INSERT INTO [dbo].[ProfileField]
	(
	[Id],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[ReferenceTableId],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[IncludeInSummary]
	)
VALUES
	(
	'1619C973-3ED8-4BB7-8D18-073190A26BAA',
	'FFG costs summary',
	'FD6AD7AC-5760-4652-9DDE-597CAEDEBD79',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'C9F3DA7B-2397-43E8-BBB6-4F4E1D5A79A6',
	0,
	0,
	1
	)
	
--2.11.4 a)

INSERT INTO
	[dbo].[ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'84A90644-B7B9-4F06-BEF3-96F15E2B9C5D',
	'Non-infectious issue cause',
	0
	)

INSERT INTO
	[dbo].[ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Infectious issue cause',
	0
	)

INSERT INTO
	[dbo].[ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'ACDP hazard group',
	0
	)

INSERT INTO
	[dbo].[ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'SAPO contaminant level',
	0
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'4EEA546C-5E6D-4281-A5CA-323FFE42154D',
	'84A90644-B7B9-4F06-BEF3-96F15E2B9C5D',
	'Intoxication',
	1
	)

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'6FB72CCD-5AB8-441B-9287-96C1ECADC195',
	'84A90644-B7B9-4F06-BEF3-96F15E2B9C5D',
	'Other',
	2
	)


INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'51D2E5A6-E54D-4E22-AA82-B5395C04FFBE',
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Bacteria',
	1
	)

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'D4346998-F3AF-4CCA-90C1-6A2D3E892410',
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Virus',
	2
	)	

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'7D603278-C8F3-4A34-9EC7-D3CF4A9C50D9',
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Fungal',
	3
	)	

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'BFC85E82-DA62-4B55-B95F-0F44A72B5035',
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Parasitic',
	4
	)	

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'9855A1A5-9643-4CCB-AB20-E26BCDBDA1E4',
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	'Other transmissible agent',
	5
	)
	

INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'F771D0CA-EFE1-4A59-98D1-581509C5BDC2',
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'0',
	1
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'170C0D2A-107D-46D3-B888-A2BAE1B0EB2B',
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'1',
	2
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'414F74E2-9959-4F48-BBFA-EADF2B5B45CA',
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'2',
	3
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'CA0E95BD-8B4E-45FE-BD2C-E8E521A8EFC9',
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'3',
	4
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'C36579A0-FB99-47CC-B5A9-B7362A5A9424',
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	'4',
	5
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'ABCAC022-7C34-4647-9EA0-16966F926335',
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'Not covered',
	1
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'D9825614-7354-4D47-959F-6E274C75B76F',
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'1',
	2
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'3E93C6EE-35D5-42AD-AC3B-3A5C5CEAD0B1',
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'2',
	3
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'603B0C83-5A8D-4DB5-9F39-1FC0C831C0F8',
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'3',
	4
	)
	
INSERT INTO [dbo].[ReferenceValue]
	(
	[Id],
    [ReferenceTableId],
    [LookupValue],
    [SequenceNumber]
	)
VALUES
	(
	'C844CB4B-4ED9-40FC-A175-5EF60E89DE6E',
	'F8DD3096-1215-4F0A-A534-62B210778109',
	'4',
	5
	)
	
--2.11.4 b)


INSERT INTO 
	[dbo].[ProfileSection]
	(
	[Id],
	[Name],
	[ShortName],
	[SectionNumber]
	)
VALUES
	(
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	'Characteristics of the agent',
	'Characteristics Of The Agent',
	4
	)
	
INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'165AC958-229D-4C5E-B127-9780CC8F9A62'
FROM
	[ProfileVersion]
	
UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=5
WHERE
	[Id]='404DD5D4-4447-4CAD-A0AB-C8F0DA284B49'
	
UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=6
WHERE
	[Id]='8D034220-78F9-47F0-8998-2F5144A531D0'
	
UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=7
WHERE
	[Id]='A17946FE-1FFB-4E2E-9E3B-0284B6F5D168'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=8
WHERE
	[Id]='EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE'
	
UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=9
WHERE
	[Id]='9BDAD251-9A9F-4A65-BFAB-D4A852526ABC'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=10
WHERE
	[Id]='158F8D0C-15A7-4F31-98FC-0C06196045D5'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=11
WHERE
	[Id]='7EB5FDDC-DF89-41A5-B486-374A656EDF5D'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=12
WHERE
	[Id]='C90FBBAD-BE8D-4317-BF7C-7A56B45B2828'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=13
WHERE
	[Id]='2F451B2B-7D6D-4DFF-8D22-73F133848634'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=14
WHERE
	[Id]='B71A47FA-7E4A-4CBA-B91C-C0D778068ABC'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=15
WHERE
	[Id]='164B8DA6-92BE-473B-B35C-585D72664E60'

UPDATE
	[dbo].[ProfileSection]
SET
	[SectionNumber]=16
WHERE
	[Id]='809D2408-82A1-45E1-9692-5CA76162D967'
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[NonTechnicalName]
	)
VALUES
	(
	'A38CAD57-DDA8-4EE1-80B9-D2923BB09034',
	'Is this disease/issue infectious?',
	'Is infectious',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	1,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	NULL,
	NULL,
	'Is this disease/issue infectious?'
	)
	
INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	null,
	'Is infectious',
	'A38CAD57-DDA8-4EE1-80B9-D2923BB09034',
	1,
	'B1A35FAB-D4CF-4797-8F81-474892DA5251',
	1,
	null,
	0,
	0,
	null,
	1
	)

INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'071CE906-B107-4A4B-AE7E-F51BA347877D',
	'What is the cause of the non-infectious issue being profiled?',
	'Noninfectious cause',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	2,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	1,
	'What is the cause of the non-infectious issue being profiled?'
	)
	
INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'FA2DF822-6B5B-4AE8-BB03-E486A8382455',
	null,
	'Noninfectious cause',
	'071CE906-B107-4A4B-AE7E-F51BA347877D',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'84A90644-B7B9-4F06-BEF3-96F15E2B9C5D',
	0,
	0,
	null,
	1
	)
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'E504EAB2-4401-4DA7-B619-C45F564DD547',
	'What is the cause of the infectious issue being profiled?',
	'Infectious cause',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	3,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	0,
	'What is the cause of the infectious issue being profiled?'
	)

INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'BAD98E54-8B70-45CE-B221-323744689928',
	null,
	'Infectious cause',
	'E504EAB2-4401-4DA7-B619-C45F564DD547',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'86E3A0EE-118F-4E92-B552-DC536634684C',
	0,
	0,
	null,
	1
	)

INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'3F5A4694-6A01-4ACF-9085-214A4597ED60',
	'Supporting comments',
	'Infectious cause comments',
	'E504EAB2-4401-4DA7-B619-C45F564DD547',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	null,
	0,
	0,
	null,
	1
	)

INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'21D1F795-DD4A-4F41-8C41-CDB28F668568',
	'Classification of the agent',
	'Agent classification',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	4,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	0,
	'Classification of the agent'
	)


INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'27E30D35-EA6B-42A8-BC1C-D00AEBF3C02C',
	null,
	'Agent classification',
	'21D1F795-DD4A-4F41-8C41-CDB28F668568',
	1,
	'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0',
	1,
	null,
	0,
	0,
	null,
	1
	)
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'F4976393-AC74-4B6E-92C7-BC71E4028CA8',
	'ACDP hazard group',
	'ACDP hazard group',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	5,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	0,
	'ACDP hazard group'
	)


INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'CE6D8A94-8625-4017-8D78-2A1D530FB3B4',
	null,
	'ACDP hazard group',
	'F4976393-AC74-4B6E-92C7-BC71E4028CA8',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'12788FCF-3BF8-48F3-8736-BC5CE5F8385A',
	0,
	0,
	null,
	1
	)
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'D1F5C0C2-693C-48EC-874E-728A05F4FD70',
	'SAPO containment level',
	'SAPO level',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	6,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	0,
	'SAPO containment level'
	)


INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'A9AC102E-F45C-4ABC-9CCC-A561F3D93DA4',
	null,
	'SAPO level',
	'D1F5C0C2-693C-48EC-874E-728A05F4FD70',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'F8DD3096-1215-4F0A-A534-62B210778109',
	0,
	0,
	null,
	1
	)
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'7C1FF790-3117-40F5-B71C-A2DD7433BDFB',
	'Laboratories licensed to handle organism',
	'Licensed labs',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	7,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6',
	NULL,
	0,
	'Laboratories licensed to handle organism'
	)


INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'86D8A2DB-2E04-482B-8797-54C437B72170',
	null,
	'Licensed labs',
	'7C1FF790-3117-40F5-B71C-A2DD7433BDFB',
	1,
	'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
	1,
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	0,
	0,
	null,
	1
	)

INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'87049F64-2B32-427F-B074-E03B66A4B21F',
	'Supporting comments',
	'Licensed labs comments',
	'7C1FF790-3117-40F5-B71C-A2DD7433BDFB',
	2,
	'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
	1,
	null,
	0,
	0,
	null,
	1
	)
	
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[IrrelevanceFieldId],
	[IrrelevanceValueId],
	[IrrelevanceFlag],
	[NonTechnicalName]
	)
VALUES
	(
	'AF0340A8-550B-4850-B171-481998133584',
	'Further information relevant to the agent',
	'Further agent info',
	'165AC958-229D-4C5E-B127-9780CC8F9A62',
	8,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
	null,
	NULL,
	null,
	'Further information relevant to the agent'
	)


INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'6BF59D9F-E9DF-4B40-9FBD-FEB63B0894E9',
	null,
	'Further agent info',
	'AF0340A8-550B-4850-B171-481998133584',
	1,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	null,
	0,
	0,
	null,
	1
	)
	
--2.6.4 a)
ALTER TABLE [dbo].[Species]
	DROP COLUMN [CommercialTrade]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImportanceOfExportTrade]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnLevelOfImports]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnIntraCommunityFlows]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnThirdCountryFlows]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ExportMarketValue]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [CommercialTradeComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImportanceOfExportTradeComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnLevelOfImportsComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnIntraCommunityFlowsComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ImpactOnThirdCountryFlowsComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [ExportMarketValueComments]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [GBHoldingCount]
GO

ALTER TABLE [dbo].[Species]
	DROP COLUMN [GBPopulation]
GO
	
ALTER TABLE [dbo].[Species] 
	DROP CONSTRAINT [DF_Species_EffectiveDateFrom]
GO

ALTER TABLE [dbo].[Species]
	ALTER COLUMN [EffectiveDateFrom] datetime NOT NULL
GO

ALTER TABLE [dbo].[Species]
	ALTER COLUMN [EffectiveDateTo] datetime NULL
GO

ALTER TABLE [dbo].[Species] 
	ADD  CONSTRAINT [DF_Species_EffectiveDateFrom]  DEFAULT (getdate()) 
	FOR [EffectiveDateFrom]
GO
	
	
--2.9.1 a)
ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [EffectiveDate] datetime NOT NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [LogDate] datetime NOT NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ADD [OldName] varchar(50) NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ADD [NewName] varchar(50) NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ADD [OldParent] varchar(50) NULL
GO
	
ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ADD [NewParent] varchar(50) NULL;
GO
	
WITH 
[Names_CTE]([Id], [OldName], [NewName])
AS
(
	SELECT 
		[SpeciesTableAuditLogId],
		[OldValue],
		[NewValue] 
	FROM 
		[dbo].[SpeciesTableAuditLogEntry]
	JOIN
		[dbo].[SpeciesTableAuditLog]
	ON	[SpeciesTableAuditLogEntry].[SpeciesTableAuditLogId]=[SpeciesTableAuditLog].[Id]
	WHERE 
		[SpeciesFieldId]='3bc53920-3aaf-43da-9753-a4feccf3fde4'
),
[Parents_CTE]([Id], [OldParent], [NewParent])
AS
(
	SELECT 
		[SpeciesTableAuditLogId],
		[OldValue],
		[NewValue] 
	FROM 
		[dbo].[SpeciesTableAuditLogEntry]
	JOIN
		[dbo].[SpeciesTableAuditLog]
	ON	[SpeciesTableAuditLogEntry].[SpeciesTableAuditLogId]=[SpeciesTableAuditLog].[Id]
	WHERE 
		[SpeciesFieldId]='d6ab8580-e240-412b-9915-f506db19f40d'
)
UPDATE 
	[dbo].[SpeciesTableAuditLog]
SET 
	[SpeciesTableAuditLog].[OldName]=[Names_CTE].[OldName], 
	[SpeciesTableAuditLog].[NewName]=[Names_CTE].[NewName],
	[SpeciesTableAuditLog].[OldParent]=[Parents_CTE].[OldParent], 
	[SpeciesTableAuditLog].[NewParent]=[Parents_CTE].[NewParent]
FROM [SpeciesTableAuditLog]
LEFT JOIN [Names_CTE] ON [SpeciesTableAuditLog].[Id]=[Names_CTE].[Id]
LEFT JOIN [Parents_CTE] ON [SpeciesTableAuditLog].[Id]=[Parents_CTE].[Id]

ALTER TABLE [dbo].[SpeciesTableAuditLogEntry]
	DROP CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesTableAuditLog]
GO

DELETE FROM
	[dbo].[SpeciesTableAuditLog]
WHERE
	[OldName] IS NULL AND
	[NewName] IS NULL AND
	[OldParent] IS NULL AND
	[NewParent] IS NULL


UPDATE
	[dbo].[SpeciesTableAuditLog]
SET
	[OldName]='- data not logged -'
WHERE
	[OldName] IS NULL

UPDATE
	[dbo].[SpeciesTableAuditLog]
SET
	[NewName]='- data not logged -'
WHERE
	[NewName] IS NULL

UPDATE
	[dbo].[SpeciesTableAuditLog]
SET
	[OldParent]='- data not logged -'
WHERE
	[OldParent] IS NULL

UPDATE
	[dbo].[SpeciesTableAuditLog]
SET
	[NewParent]='- data not logged -'
WHERE
	[NewParent] IS NULL

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [OldName] varchar(50) NOT NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [NewName] varchar(50) NOT NULL
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [OldParent] varchar(50) NOT NULL
GO
	
ALTER TABLE [dbo].[SpeciesTableAuditLog]
	ALTER COLUMN [NewParent] varchar(50) NOT NULL;
GO

--2.9.1 b)
DROP TABLE [dbo].[SpeciesTableAuditLogEntry]
GO

ALTER TABLE [dbo].[SpeciesTableAuditLog]
	DROP COLUMN [SpeciesName]
GO	

--2.7.2.3 New data items: Additional "Summary description" question (item 3738)
UPDATE [ProfileQuestion] SET [QuestionNumber] = 2 WHERE [Id] = 'D0086A85-E54B-4CA7-90E0-070915B76C3A'
UPDATE [ProfileQuestion] SET [QuestionNumber] = 3 WHERE [Id] = '602F2CA1-0DB9-4E1C-A2B6-9BF708CB7AB0'
UPDATE [ProfileQuestion] SET [QuestionNumber] = 4 WHERE [Id] = '2C870A8C-F90E-4961-9AA0-39203CE9B8A2'
UPDATE [ProfileQuestion] SET [QuestionNumber] = 5 WHERE [Id] = 'A8708502-9AE2-4DCD-9510-291B90658B19'
UPDATE [ProfileQuestion] SET [QuestionNumber] = 6 WHERE [Id] = '625EECF0-273D-410E-A251-D493CFBD54C4'

INSERT [ProfileQuestion]
(
[Id],
[Name],
[ShortName],
[ProfileSectionId],
[QuestionNumber],
[IsPerSpecies],
[IsRepeating],
[UserGuidance],
[IrrelevanceFieldId],
[IrrelevanceValueId],
[IrrelevanceFlag],
[NonTechnicalName]
)
VALUES
(
'3B08E866-095F-4ABC-9247-534C926E9F27',
'Summary description',
'Summary description',
'1ED0595D-3E1A-49D4-B340-C0D41E17D045',
1,
0,
0,
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
null,
null,
null,
'Summary Description'
)

INSERT INTO
	[dbo].[ProfileField]
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
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'8C045533-0055-4E85-9E0A-D6696DF7947C',
	null,
	'Summary description',
	'3B08E866-095F-4ABC-9247-534C926E9F27',
	1,
	'd297f63b-638a-4574-b042-97c248338a269',
	1,
	null,
	0,
	0,
	null,
	1
	)
--3744
ALTER TABLE [dbo].[SpeciesQuestion]
ADD [ShortName] varchar(80) NULL
GO

UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Identification Accuracy' WHERE [Id]='5630C7C7-B192-4415-867C-00A04BB6305A'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Commerical Trade' WHERE [Id]='CCCBFD7D-CF8C-49DD-822A-0DFC2B446239'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Livestock Contacts' WHERE [Id]='848E16D2-4243-4615-8415-11820A5F9A76'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Third Country Trade Export Consignments' WHERE [Id]='22DCE389-3D60-4F35-A58B-186E0B8B32BA'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Potential Level Of Imports' WHERE [Id]='EC2F6F45-A3F7-46D5-AECA-1993E40611D5'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Modal Type Of Group' WHERE [Id]='9D259F12-6301-42EF-BD9A-2301F8DBCFE3'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Isolation' WHERE [Id]='AB21BB0B-D5B7-4221-B096-3E0501FD2F92'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Ease Of Movement Investigation' WHERE [Id]='3F21C529-6883-4658-B79E-408F67BB7B2D'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Government Surveillance Scheme Samples Collected' WHERE [Id]='66835FBE-F278-4DF2-9866-4D21BA49C6E7'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Intracommunity Trade Export Consignments' WHERE [Id]='1863217E-E667-45E5-BFC1-6F863B5103A9'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Observance Of BioSec Protocols' WHERE [Id]='B60E99CD-1381-488E-9E02-73BBB1636CDE'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Assurance Schemes' WHERE [Id]='4682104E-2A53-44E6-9E23-76FC15EAC4B3'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Animal Contacts Elsewhere' WHERE [Id]='5BF9BB97-3495-45FB-88F4-7AAE8DA86D77'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Animals In GB' WHERE [Id]='B04DE56E-D027-4905-A32A-7AC6C3F487D4'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Carcase Submissions To VLA' WHERE [Id]='3EAEC91B-9883-46DC-B60C-86F48DF86056'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Records For Certain Types Of Holding' WHERE [Id]='7B85141F-B9B0-4852-B9CA-9FD575ADBA2B'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Testing or Treatment Regime' WHERE [Id]='E4E57D73-5B1F-4264-97E2-A241C9F22812'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Export Market Value' WHERE [Id]='AC02555E-8561-4C8A-AB03-A325C2B4E12F'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Degree Of Separation' WHERE [Id]='3556BEFC-9126-4A5C-A17F-A765B0EF1988'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Non Government Lab Testing' WHERE [Id]='8CFD9556-AA35-49F7-87D6-B8D3E11CBE8F'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Holdings in GB' WHERE [Id]='90E2020D-9F7A-43E3-BDB9-E6471098B671'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Importance Of Export Trade To Industry Sector' WHERE [Id]='75347697-DF29-4452-B2AD-EC3BB5BBF0C0'
UPDATE [dbo].[SpeciesQuestion] SET [ShortName]='Holdings That Keep Mixed Species' WHERE [Id]='E3CEE297-D9EE-4CEF-A4D3-F39ECB9E34B5'

ALTER TABLE [dbo].[SpeciesQuestion]
ALTER COLUMN [ShortName] varchar(80) NOT NULL
GO

UPDATE [dbo].[SpeciesField] SET [ShortName]='Holdings That Keep Mixed Species Comments' WHERE [Id]='6DA09A54-5282-4681-91D2-B3054AE6DE0D'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Holdings in GB Comments' WHERE [Id]='73EA7E50-0D42-464C-BF45-C417AE54D8BA'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Animals In GB Comments' WHERE [Id]='EDBA24BC-638F-4F74-BDB8-F54D517F8AF0'

UPDATE [dbo].[ProfileField] SET [ShortName] = 'Supporting Evidence Base Comments' WHERE [Id]='7B35F206-AEDB-41BC-AD8B-347E7888D750'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Variability Level Comments' WHERE [Id]='863AD277-C82B-44CF-9FCF-8325AB0F60AA'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Uncertainty Level Comments' WHERE [Id]='4ACBA2A3-0560-4386-8E5F-9CCFA02F5954'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Likelihood Of Occurence Change Comments' WHERE [Id]='B74481A7-D232-4F51-81B3-0CB0005A4CCD'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Increased Occurence Risk Factor Comments' WHERE [Id]='EE9CB071-DE98-4E29-A9F6-131AB455DB6C'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Decreased Occurence Mitigating Factor Comments' WHERE [Id]='E1FAAC8E-65AB-4D06-B659-41D0FC920D85'
UPDATE [dbo].[ProfileField] SET [ShortName] = 'Potential Decreasing Occurence Mitigating Factor Comments' WHERE [Id]='39ED79BE-BE43-4F33-AE5A-589692D40480'

UPDATE [dbo].[ProfileField] SET [ShortName]='Risk Estimation' WHERE [Id]='DA16CA94-EC3E-43B7-BB88-05122C90DAFF'
UPDATE [dbo].[ProfileField] SET [ShortName]='FFG Costs Summary' WHERE [Id]='1619C973-3ED8-4BB7-8D18-073190A26BAA'
UPDATE [dbo].[ProfileField] SET [ShortName]='Key Risk Factors' WHERE [Id]='2BF45A2A-54D6-480F-9894-0AC47CE54F95'
UPDATE [dbo].[ProfileField] SET [ShortName]='Infectious Cause Comments' WHERE [Id]='3F5A4694-6A01-4ACF-9085-214A4597ED60'
UPDATE [dbo].[ProfileField] SET [ShortName]='Risk Summary' WHERE [Id]='67036FD6-ED26-4C2B-A12D-25158B1078FE'
UPDATE [dbo].[ProfileField] SET [ShortName]='ACDP Hazard Group' WHERE [Id]='CE6D8A94-8625-4017-8D78-2A1D530FB3B4'
UPDATE [dbo].[ProfileField] SET [ShortName]='Infectious Cause' WHERE [Id]='BAD98E54-8B70-45CE-B221-323744689928'
UPDATE [dbo].[ProfileField] SET [ShortName]='Supporting Evidence' WHERE [Id]='6C61357A-CDC0-4E33-ABA5-337DD2830041'
UPDATE [dbo].[ProfileField] SET [ShortName]='Intrinsic Mitigating Factors' WHERE [Id]='27398A95-B630-46D1-B7E3-33BEA49623C7'
UPDATE [dbo].[ProfileField] SET [ShortName]='Applied Mitigating Factors' WHERE [Id]='022F5F79-0773-476B-A73A-391D7A68E4AA'
UPDATE [dbo].[ProfileField] SET [ShortName]='Is Infectious' WHERE [Id]='C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'
UPDATE [dbo].[ProfileField] SET [ShortName]='Licensed Labs' WHERE [Id]='86D8A2DB-2E04-482B-8797-54C437B72170'
UPDATE [dbo].[ProfileField] SET [ShortName]='Level Of Variability' WHERE [Id]='5E857081-2A35-4ABC-92A6-69B5AF45A5A9'
UPDATE [dbo].[ProfileField] SET [ShortName]='Level Of Uncertainty' WHERE [Id]='F1FAF8F3-0A7D-4FED-8D4E-9BB41C4DB957'
UPDATE [dbo].[ProfileField] SET [ShortName]='SAPO Level' WHERE [Id]='A9AC102E-F45C-4ABC-9CCC-A561F3D93DA4'
UPDATE [dbo].[ProfileField] SET [ShortName]='Agent Classification' WHERE [Id]='27E30D35-EA6B-42A8-BC1C-D00AEBF3C02C'
UPDATE [dbo].[ProfileField] SET [ShortName]='Summary Description' WHERE [Id]='8C045533-0055-4E85-9E0A-D6696DF7947C'
UPDATE [dbo].[ProfileField] SET [ShortName]='FFG Costs Summary Comments' WHERE [Id]='4376E65C-1319-4A06-987F-DA7A610BF78F'
UPDATE [dbo].[ProfileField] SET [ShortName]='Licensed Labs Comments' WHERE [Id]='87049F64-2B32-427F-B074-E03B66A4B21F'
UPDATE [dbo].[ProfileField] SET [ShortName]='Noninfectious Cause' WHERE [Id]='FA2DF822-6B5B-4AE8-BB03-E486A8382455'
UPDATE [dbo].[ProfileField] SET [ShortName]='Further Agent Info' WHERE [Id]='6BF59D9F-E9DF-4B40-9FBD-FEB63B0894E9'

UPDATE [dbo].[ProfileQuestion] SET [ShortName]='What Are The Key Risk Factors Affecting Infection Or Disease' WHERE [Id]='0F37FF70-3BCB-49B7-B0A1-087771987D0F'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Risk Summary' WHERE [Id]='DCF4C29F-C1A9-4FA1-834B-13B165F7AA8C'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='What Are The Key Mitigating Factors To Reduce Infection Or Disease' WHERE [Id]='94991AF7-EB9B-4F3F-9463-2479EEE2FFE9'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='What Is The Supporting Evidence Base Used' WHERE [Id]='5F75AD01-F282-478F-BB37-2E7B1188657C'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Further Agent Info' WHERE [Id]='AF0340A8-550B-4850-B171-481998133584'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Key Applied Additional Mitigating Factors Affecting Infection Or Disease' WHERE [Id]='3ED56B05-6510-4F7D-9460-4ECF02D34BF5'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Level Of Variability' WHERE [Id]='4371D7B2-21E2-41E6-A571-64B6A5E23D0F'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='SAPO Level' WHERE [Id]='D1F5C0C2-693C-48EC-874E-728A05F4FD70'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Level Of Uncertainty' WHERE [Id]='8F603A38-BB4E-4065-9363-8A22D44BB45B'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Licensed Labs' WHERE [Id]='7C1FF790-3117-40F5-B71C-A2DD7433BDFB'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Risk Estimation' WHERE [Id]='8BC27978-625E-4559-8567-9ECB811EF9A8'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='ACDP Hazard Group' WHERE [Id]='F4976393-AC74-4B6E-92C7-BC71E4028CA8'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Infectious Cause' WHERE [Id]='E504EAB2-4401-4DA7-B619-C45F564DD547'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Agent Classification' WHERE [Id]='21D1F795-DD4A-4F41-8C41-CDB28F668568'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Is Infectious' WHERE [Id]='A38CAD57-DDA8-4EE1-80B9-D2923BB09034'
UPDATE [dbo].[ProfileQuestion] SET [ShortName]='Noninfectious Cause' WHERE [Id]='071CE906-B107-4A4B-AE7E-F51BA347877D'

UPDATE [dbo].[SpeciesField] SET [ShortName]='Samples Collected Routinely For National Govt Schemes' WHERE [Id]='0E301C34-89A6-418C-B995-154BABD5445A'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Specific Holding Records' WHERE [Id]='D59C9118-E8F4-4A70-B0F6-1845C14F4156'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Samples Collected Routinely For Local Govt Schemes' WHERE [Id]='A16BAF3B-2904-4A6A-ADF0-1A2FD900AA08'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Isolation' WHERE [Id]='2A245EF3-33D1-4134-AA3D-26EF614E82B0'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Modal Type Of Group Of Species' WHERE [Id]='7CB1554F-8693-48BE-9BC3-418C2C1BA59D'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Seperation' WHERE [Id]='5BC535E4-DB66-4077-8786-4AA79D175869'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Mixed Species Holdings' WHERE [Id]='C7DBDBFE-F5C8-427B-89CE-5067B88C3D1F'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Animal Contacts Elsewhere' WHERE [Id]='9429482D-89F5-4465-8D02-56FB46A99305'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Level Of Carcase Submissions Commments' WHERE [Id]='FAD094A1-B3FE-4444-86EB-658B0C9FA0D7'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Level Of Carcase Submissions' WHERE [Id]='8EBEA30B-38F8-4674-B7D4-6BD793EB87F2'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Government Testing Comments' WHERE [Id]='76036510-8C5D-4B16-AAB1-7C22D52358B6'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Imported Livestock Testing Or Treatment Regime' WHERE [Id]='2A9A3DA3-E8A0-444D-87D9-AE961592D511'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Livestock Contacts' WHERE [Id]='05DF331C-30B8-43EF-9300-B5DCE9E9FE8C'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Samples Collected Routinely For National Govt Schemes Comments' WHERE [Id]='DEF98BB9-8165-439B-AC9D-D0EAFBF769BF'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Government Testing' WHERE [Id]='6B59E436-FC6B-4237-8035-D8076BD04767'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Samples Collected Routinely For Local Govt Schemes Comments' WHERE [Id]='B2F7AC6C-78ED-4F7D-A116-E485E71E60A6'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Assurance Schemes Apply To Livestock Of Species' WHERE [Id]='641C0C32-35EE-4442-AA40-E512962D2C04'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Ease Of Investigation Of Animal Movement' WHERE [Id]='C0C269CC-357E-4498-AA98-EC08BE05AAB6'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Observance Of Bio Security' WHERE [Id]='BC635D99-C57F-4E1B-82B2-F2D39410A764'
UPDATE [dbo].[SpeciesField] SET [ShortName]='Species Identification Accuracy' WHERE [Id]='F16A5742-C34B-4F34-8AFF-F46C3766C9BE'

--3739
INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[NonTechnicalName]
	)
VALUES
	(
	'F3E20C91-DD8B-4BD7-8E5F-D972F8BA60F7',
	'Potential to improve diagnostic capability',
	'Laboratory Test Potential Improvement',
	'7EB5FDDC-DF89-41A5-B486-374A656EDF5D',
	3,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
	'Potential to improve diagnostic capability'
	)

UPDATE
	[dbo].[ProfileField]
SET
	[Name]=null,
	[ProfileQuestionId]='F3E20C91-DD8B-4BD7-8E5F-D972F8BA60F7',
	[FieldNumber]=1
WHERE
	[Id]='B8F47BC9-3F3C-49A6-BAAF-18212973B185'
	
DELETE FROM [dbo].[ProfileVersionFieldValue] WHERE [ProfileFieldId]='B8F47BC9-3F3C-49A6-BAAF-18212973B185'

UPDATE
	[dbo].[ProfileField]
SET
	[FieldNumber]=[FieldNumber]-1
WHERE
	[Id] IN ('BC4E1B80-9592-43AE-AD57-ECCE10AF40F5','FDFBF94B-B5BE-4D55-AE38-42BF7634DA24',
			'7B12E7A9-55D4-4E86-8D5E-BB6C1698547A','53A3CBFB-0069-401A-9B24-A0BBFB944FC8')
			

--2.2.2

INSERT INTO [dbo].[ReferenceTable] ([Id], [Name], [IsMaintainable]) 
VALUES ('9C93AF64-7EF2-478D-8950-E9AAD2E71063','Spread limiting potential',0)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('F3064025-DFB1-45A8-A95A-C7800EBAE238','9C93AF64-7EF2-478D-8950-E9AAD2E71063','Low',1)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('BD575F0E-C80E-43D1-B2D3-2C0E41AD84A3','9C93AF64-7EF2-478D-8950-E9AAD2E71063','Medium',2)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('E042D47F-39D9-4F68-96DC-99D10E1726A8','9C93AF64-7EF2-478D-8950-E9AAD2E71063','High',3)

INSERT INTO [dbo].[ReferenceTable] ([Id], [Name], [IsMaintainable]) 
VALUES ('F76AE40D-FCBF-42D4-BE25-5FFAED510207','Understanding improvement potential',0)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('76C557A0-EFA2-4BAB-A643-700CFC51B896','F76AE40D-FCBF-42D4-BE25-5FFAED510207','Low',1)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('DBF64DB7-E30C-4C42-84ED-7C9BB9CB4862','F76AE40D-FCBF-42D4-BE25-5FFAED510207','Medium',2)
INSERT INTO [dbo].[ReferenceValue] ([Id], [ReferenceTableId], [LookupValue], [SequenceNumber])
VALUES ('508CEC34-19CE-437E-8B05-46E1206CBF3A','F76AE40D-FCBF-42D4-BE25-5FFAED510207','High',3)

UPDATE
	[dbo].[ProfileQuestion]
SET
	[QuestionNumber]=[QuestionNumber]+1
WHERE
	[ProfileSectionId]='9BDAD251-9A9F-4A65-BFAB-D4A852526ABC' AND
	[QuestionNumber]>=6

INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[NonTechnicalName]
	)
VALUES
	(
	'17589563-1313-4A63-967B-DD559CCFBAC8',
	'Potential to limit spread and/or severity of disease',
	'Potential To Limit Disease Spread Or Severity',
	'9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
	6,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
	'Potential to limit spread and/or severity of disease'
	)

INSERT INTO [ProfileField]
	(
	[Id],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[ReferenceTableId],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'4C19B276-7DF0-430B-9174-B12B2A1138BF',
	'Potential To Limit Disease Spread Or Severity',
	'17589563-1313-4A63-967B-DD559CCFBAC8',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'9C93AF64-7EF2-478D-8950-E9AAD2E71063',
	0,
	0,
	NULL,
	0
	)
	
UPDATE
	[dbo].[ProfileQuestion]
SET
	[QuestionNumber]=[QuestionNumber]+1
WHERE
	[ProfileSectionId]='99F0EE93-3E56-455C-8666-B0C9EB581589' AND
	[QuestionNumber]>=5

INSERT INTO
	[dbo].[ProfileQuestion]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileSectionId],
	[QuestionNumber],
	[IsPerSpecies],
	[IsRepeating],
	[UserGuidance],
	[NonTechnicalName]
	)
VALUES
	(
	'EA914FD3-C5BF-42F2-9732-34C698B3B711',
	'Potential to improve understanding of disease distribution',
	'Potential To Improve Distribution Understanding',
	'99F0EE93-3E56-455C-8666-B0C9EB581589',
	5,
	0,
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
	'Potential to improve understanding of disease distribution'
	)

INSERT INTO [ProfileField]
	(
	[Id],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[ReferenceTableId],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'76742694-CBD4-4AEC-A4D1-39C0A038BD06',
	'Potential To Improve Distribution Understanding',
	'EA914FD3-C5BF-42F2-9732-34C698B3B711',
	1,
	'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
	1,
	'F76AE40D-FCBF-42D4-BE25-5FFAED510207',
	0,
	0,
	NULL,
	0
	)
	
	INSERT INTO
	[dbo].[PrioritisationCategory]
	(
	[Id],
	[Name],
	[MinimumScore],
	[MaximumScore],
	[Modifier]
	)
VALUES
	(
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'Potential to add value',
	0,
	1,
	0.01
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'32C8D025-DA02-4B5B-8EB3-FF12825C24EE',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO01',
	'Potential to reduce risk of introduction',
	1,
	'23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'D4C5DDCE-0ED3-45C8-9A26-CF01B8D7A853',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO02',
	'Potential to limit spread and/or severity of disease',
	1,
	'4C19B276-7DF0-430B-9174-B12B2A1138BF'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'E9C81F83-C051-402A-9116-D93B3067A07C',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO03',
	'Potential to reduce further spread or human exposure',
	1,
	'8EA70BCB-19B7-4890-A51C-C7AC2525C275'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'98CA9BB1-9C80-40B3-94BC-8C2896D6B8A1',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO04',
	'Potential to improve understanding of disease distribution',
	1,
	'76742694-CBD4-4AEC-A4D1-39C0A038BD06'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'E2AB24FA-43A0-41E2-82BE-6DAF6AAA1F6C',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO05',
	'Potential to improve diagnostic capability',
	1,
	'B8F47BC9-3F3C-49A6-BAAF-18212973B185'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'C2713FD8-9173-4665-AC9D-D5F79CD16273',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO06',
	'Potential to increase understanding of disease epidemiology',
	1,
	'10CFFCD6-9393-4973-ABDE-72835C323F62'
	)

INSERT INTO
	[dbo].[PrioritisationCriterion]
	(
	[Id],
	[PrioritisationCategoryId],
	[Code],
	[Name],
	[Weighting],
	[TrueMapping]
	)
VALUES
	(
	'D30F036B-1873-4C25-BEDB-8A2088CC00B9',
	'5BDFAA18-F564-4352-8D20-8EE76F90D2BC',
	'GO07',
	'Potential to reduce welfare implications',
	1,
	'371A7645-068B-4195-8092-798ED57416EC'
	)
	
INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'32C8D025-DA02-4B5B-8EB3-FF12825C24EE',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'32C8D025-DA02-4B5B-8EB3-FF12825C24EE',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'32C8D025-DA02-4B5B-8EB3-FF12825C24EE',
	'High',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D4C5DDCE-0ED3-45C8-9A26-CF01B8D7A853',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D4C5DDCE-0ED3-45C8-9A26-CF01B8D7A853',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D4C5DDCE-0ED3-45C8-9A26-CF01B8D7A853',
	'High',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E9C81F83-C051-402A-9116-D93B3067A07C',
	'Not applicable',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E9C81F83-C051-402A-9116-D93B3067A07C',
	'Low',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E9C81F83-C051-402A-9116-D93B3067A07C',
	'Medium',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E9C81F83-C051-402A-9116-D93B3067A07C',
	'High',
	4,
	4
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'98CA9BB1-9C80-40B3-94BC-8C2896D6B8A1',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'98CA9BB1-9C80-40B3-94BC-8C2896D6B8A1',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'98CA9BB1-9C80-40B3-94BC-8C2896D6B8A1',
	'High',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E2AB24FA-43A0-41E2-82BE-6DAF6AAA1F6C',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E2AB24FA-43A0-41E2-82BE-6DAF6AAA1F6C',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'E2AB24FA-43A0-41E2-82BE-6DAF6AAA1F6C',
	'High',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'C2713FD8-9173-4665-AC9D-D5F79CD16273',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'C2713FD8-9173-4665-AC9D-D5F79CD16273',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'C2713FD8-9173-4665-AC9D-D5F79CD16273',
	'High',
	3,
	3
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D30F036B-1873-4C25-BEDB-8A2088CC00B9',
	'Low',
	1,
	1
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D30F036B-1873-4C25-BEDB-8A2088CC00B9',
	'Medium',
	2,
	2
	)

INSERT INTO
	[dbo].[PrioritisationCriterionValue]
	(
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	)
VALUES
	(
	newid(),
	'D30F036B-1873-4C25-BEDB-8A2088CC00B9',
	'High',
	3,
	3
	)

--3737
UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='Can rarely identify to an area (wildlife)'
WHERE
	[Id] = 'E4BC8CE3-34E0-4D4E-957E-DB5118CA1C2F'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='No id or association to an area'
WHERE
	[Id] = '9362A79F-E1F2-42BB-B90B-50DD85415D40'
	
INSERT INTO
	[dbo].[SpeciesField]
	(
		[Id],
		[Name],
		[ShortName],
		[FieldNumber],
		[DataFieldTypeId],
		[IsMandatory],
		[SpeciesQuestionId]
	)
	VALUES
	(
	'4D0014BF-6D19-4F83-BDB9-DB3AEA8FCF8A',
	'Supporting comments',
	'Assurance Schemes Apply To Livestock Of Species Comments',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	0,
	'4682104E-2A53-44E6-9E23-76FC15EAC4B3'
	)
	
DELETE FROM [dbo].[ProfileVersionFieldValue] WHERE [ProfileFieldId] = '3F5A4694-6A01-4ACF-9085-214A4597ED60'

DELETE FROM [dbo].[ProfileField] WHERE [Id]='3F5A4694-6A01-4ACF-9085-214A4597ED60'

UPDATE
	[dbo].[ProfileField]
SET
	[Name]='Supporting comments',
	[ShortName]='Infectious Cause Comments',
	[ProfileQuestionId]='E504EAB2-4401-4DA7-B619-C45F564DD547',
	[FieldNumber]=2
WHERE
	[Id]='3EC9ED6A-D7F0-4780-9954-E603479C8B17'

DELETE FROM [dbo].[ProfileVersionNoteQuestion] WHERE [ProfileQuestionId]='01889E3F-2F76-4C4A-8870-B291B3800587'

DELETE FROM [dbo].[ProfileQuestion] WHERE [Id]='01889E3F-2F76-4C4A-8870-B291B3800587'

UPDATE
	[dbo].[ProfileQuestion]
SET
	[QuestionNumber]=[QuestionNumber]-1
WHERE
	[ProfileSectionId]='03022A5F-37FE-4B5F-A93A-F1FC95555DF1' AND
	[QuestionNumber]>15
	
-- Add support for SSO users (3759) 
ALTER TABLE [User]
ADD [SsoUserId] uniqueidentifier NULL
GO

--3754
ALTER TABLE [dbo].[ProfileVersion]
	ADD [IsPublic] bit NULL
GO

UPDATE
	[dbo].[ProfileVersion]
SET
	[IsPublic] = 0

ALTER TABLE [dbo].[ProfileVersion]
	ALTER COLUMN [IsPublic] bit NOT NULL
	
--3758
ALTER TABLE [dbo].[StaticReportVersion]
	ADD [IsPublic] bit NULL
GO

UPDATE 
	[dbo].[StaticReportVersion]
SET 
	[IsPublic]=0

ALTER TABLE [dbo].[StaticReportVersion]
	ALTER COLUMN [IsPublic] bit NOT NULL
	

--Work Item: 3721: New data items: Surveillance
INSERT INTO [dbo].[luDataFieldType]
(
[Id],
[Name],
[SqlType],
[FieldValueColumn]
)
VALUES
(
'69754D65-0F13-4DB0-AFB1-3271AD64A7DB',
'Field Group',
NULL,
NULL
)

ALTER TABLE [dbo].[ProfileField] ADD
	[ProfileFieldGroupId] uniqueidentifier NULL
GO

ALTER TABLE [dbo].[ProfileField]
ALTER COLUMN [ProfileQuestionId] uniqueidentifier NULL

GO

ALTER TABLE dbo.ProfileField ADD CONSTRAINT
	FK_ProfileField_ProfileField FOREIGN KEY
	(
	ProfileFieldGroupId
	) REFERENCES dbo.ProfileField
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

ALTER TABLE [dbo].[ProfileField]
ADD CHECK ( [ProfileFieldGroupId] IS NULL OR [ProfileQuestionId] IS NULL )

GO

UPDATE [dbo].[ProfileQuestion]
SET
	[QuestionNumber] = 2 
WHERE  
	[Id] = 'f03e03a8-2bb8-4b05-87c5-c10b81bb960a'


--Question 1: Reference Tables
--Annual Cost: A975CDF0-CAE1-4E14-B524-F94A8405A4E7
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
'Annual Cost',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'F7783E73-4304-4ED7-944F-29C50F3E29F3',
'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
'Annual Cost A',
1
)
	
INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'4C05C981-D3B2-43E6-BFD3-12E6B1FAA253',
'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
'Annual Cost B',
2
)

--Event Cost: C7CFC85C-8E77-4A28-9FBD-3B3C63630E55
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
'Event Cost',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'B101D4D4-D6E7-49A3-8EC5-373A4639C6C8',
'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
'Event Cost A',
1
)
	
INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'0E13C6E6-F068-4E1A-AE68-43B3566BC139',
'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
'Event Cost B',
2
)

--Surveillance Sensitivity: 45499FF7-675A-4506-A75D-8FFAB37FCE1A
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'45499FF7-675A-4506-A75D-8FFAB37FCE1A',
'Surveillance Sensitivity',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'0650161F-0818-4D61-9CA6-656E6D62AA46',
'45499FF7-675A-4506-A75D-8FFAB37FCE1A',
'Poor',
1
)
	
INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'AC5F1C1D-19FA-41E4-8782-DFFAE4B52D37',
'45499FF7-675A-4506-A75D-8FFAB37FCE1A',
'Reasonable',
2
)

--Surveillance Specificity: E8605552-5BA1-4852-B803-589FB51DD775
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'E8605552-5BA1-4852-B803-589FB51DD775',
'Surveillance Specificity',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'E9515030-91CF-43D5-83B6-7F39C38CA6C4',
'E8605552-5BA1-4852-B803-589FB51DD775',
'Poor',
1
)
	
INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'5BAE1744-5028-4572-8DED-A345D85C2877',
'E8605552-5BA1-4852-B803-589FB51DD775',
'Reasonable',
2
)

--Commercially Sensitive: CA609893-9981-4E34-AE3B-9F3C0CF3AEFF
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF',
'Commercially Sensitive',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'1652A535-15E8-4967-95B2-D2DCFA22B556',
'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF',
'Yes',
1
)
	
INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'ADF472A6-A151-4105-B8C4-2DEFB015018B',
'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF',
'No',
2
)

--Brought To Attention: 05EA7631-39A7-4DA9-BB96-8CE259D88D01
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
'Brought To Attention',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'EF7F39CA-52E0-4931-B58D-501210FF188E',
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
'Immediately',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'CE989F02-5294-4859-845D-5D475D1B1B47',
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
'Monthly',
2
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'6D4273C6-8DF8-47F8-8BDA-E8AE25B189EB',
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
'Quarterly',
3
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'8B14B54C-62FE-4369-A4DF-B7AB9C220572',
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
'Yearly',
4
)

--Scope To Improve: 75B46A00-229F-4DEC-B214-DE620B293DC8
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'75B46A00-229F-4DEC-B214-DE620B293DC8',
'Scope To Improve',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'881145F9-8580-45C5-B883-DEBDB113CA33',
'75B46A00-229F-4DEC-B214-DE620B293DC8',
'Yes',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'88673663-0942-412E-A60D-A7112F07A56B',
'75B46A00-229F-4DEC-B214-DE620B293DC8',
'No',
2
)

--Implementation Cost: AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3',
'Implementation Cost',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'751AC697-456A-4EAE-9750-812487A39CCA',
'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3',
'Not applicable',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'D0292AB5-03F8-4AB3-BA08-8D2488FF017E',
'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3',
'Low',
2
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'A2492FAF-04CF-471D-B2DD-0B3C3151FB96',
'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3',
'Medium',
3
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'174C1ADE-ADF3-4F0A-AEAD-5E2F323FBB72',
'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3',
'High',
4
)


--Benefits From Implementation: 2034B05B-126E-416B-9D26-1D08CDECF516
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'2034B05B-126E-416B-9D26-1D08CDECF516',
'Benefits From Implementation',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'F2A019D4-113C-48E0-911D-D874490AABB4',
'2034B05B-126E-416B-9D26-1D08CDECF516',
'Not applicable',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'C93845A0-2C95-4CED-B447-4BFDA58D08FD',
'2034B05B-126E-416B-9D26-1D08CDECF516',
'Low',
2
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'ACA6F1C9-CB66-48BA-93A1-DE04F9B073CB',
'2034B05B-126E-416B-9D26-1D08CDECF516',
'Medium',
3
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'4E7E8F85-51B7-4E09-B510-23D76AC03E1F',
'2034B05B-126E-416B-9D26-1D08CDECF516',
'High',
4
)

--Data Sources: D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
'Data Sources',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'242A5E69-BF70-4B47-B62B-0636B3164F89',
'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
'Source A',
1,
'30 December 2008'
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'95381F46-17AA-4644-9E57-6F693EE3B022',
'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
'Source B',
2,
'30 December 2008'
)

--Contractor: 46A88759-A81C-44F2-9CBD-D1B45F8A7FDB
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
'Contractor',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'F4D88428-FACB-48C5-80D1-161E7300817F',
'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
'Contractor A',
1,
'30 December 2008'
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'AC356F62-2675-4C34-B40C-FB580D9D5D1D',
'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
'Contractor B',
2,
'30 December 2008'
)

--Surveillance Outcomes: 6FDF6590-D610-4200-B3EA-128A5BB838E2
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'6FDF6590-D610-4200-B3EA-128A5BB838E2',
'Surveillance Outcomes',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'CCDCA091-320D-401A-A4E4-70FD1CF14EA2',
'6FDF6590-D610-4200-B3EA-128A5BB838E2',
'Outcome A',
1,
'30 December 2008'
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom]
)
VALUES
(
'BFACA19A-9079-46FD-B6A9-E27D9E094A1C',
'6FDF6590-D610-4200-B3EA-128A5BB838E2',
'Outcome B',
2,
'30 December 2008'
)


--Question 3, reference tables
--Potential Cost: C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA',
'Potential Cost',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'20BBB0B7-64FC-4A5E-B61B-1129302603F3',
'C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA',
'Low',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'9E227DA1-48D5-4205-B822-F67074E24FDD',
'C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA',
'Medium',
2
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'1B18018B-4E6A-4819-A1AC-A5592DFFAC4F',
'C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA',
'High',
3
)

--Potential Benefit: 13CB2A3D-4FE4-4A36-A615-28351BB8BB55
INSERT INTO [dbo].[ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'13CB2A3D-4FE4-4A36-A615-28351BB8BB55',
'Potential Benefit',
0
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'4F59DCAF-72F8-4044-851A-E7E0CD316C1F',
'13CB2A3D-4FE4-4A36-A615-28351BB8BB55',
'Low',
1
)

INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'17DDFEE2-19B6-4653-B031-861EADEACA7B',
'13CB2A3D-4FE4-4A36-A615-28351BB8BB55',
'Medium',
2
)


INSERT INTO [dbo].[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber]
)
VALUES
(
'1238B7D1-0683-4B69-8E8D-44723A4FCB88',
'13CB2A3D-4FE4-4A36-A615-28351BB8BB55',
'High',
3
)

-- already existing reference tables
------------------------------------
--Surveillance Mechanisms: d41b31e1-d0c0-464d-b640-3d26dd21546e (found)
--Sample Type: 4050839d-dbaf-4418-adba-82ae11bfed31 (found)


--Question 1: Current surveillance activities: A310652A-D0D2-4357-88B5-ED12F089C125
INSERT INTO [dbo].[ProfileQuestion]
(
[Id],
[Name],
[ShortName],
[ProfileSectionId],
[QuestionNumber],
[IsPerSpecies],
[IsRepeating],
[UserGuidance],
[IrrelevanceFieldId],
[IrrelevanceValueId],
[IrrelevanceFlag],
[NonTechnicalName]
)
VALUES
(
'A310652A-D0D2-4357-88B5-ED12F089C125',
'Current surveillance activities',
'Current Surveillance Activities',
'c90fbbad-be8d-4317-bf7c-7a56b45b2828',
1,
0,
1,
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
null,
null,
null,
'Current surveillance activities'
)

--Fields:
------------------------
--Surveillance mechanism
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'955136C5-70EB-417D-8938-05D454EC2CD1',
'Surveillance mechanism',
'Surveillance Mechanism',
'A310652A-D0D2-4357-88B5-ED12F089C125',
1,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'd41b31e1-d0c0-464d-b640-3d26dd21546e',
0,
0,
NULL,
1,
NULL
)

--Surveillance project name
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'0A407C7B-BB6A-47A5-8718-A56EF7DBA7AF',
'Surveillance project name',
'Surveillance Project Name',
'A310652A-D0D2-4357-88B5-ED12F089C125',
2,
'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
1,
NULL,
0,
0,
NULL,
1,
NULL
)

--Purpose and detail
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'608C1A3E-2DB8-43C1-85C3-9139A8636B67',
'Purpose and detail',
'Purpose And Detail',
'A310652A-D0D2-4357-88B5-ED12F089C125',
3,
'd297f63b-638a-4574-b042-97c248338a26',
1,
NULL,
0,
0,
NULL,
0,
NULL
)

--Data sources
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'325A29CD-131A-4BEE-AE13-B9F099F31004',
'Data sources',
'Data Sources',
'A310652A-D0D2-4357-88B5-ED12F089C125',
4,
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
1,
'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
0,
0,
NULL,
0,
NULL
)

--Contractor
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'F2AE3FB2-7275-4C4C-8D20-155FD8659A20',
'Contractor',
'Contractor',
'A310652A-D0D2-4357-88B5-ED12F089C125',
5,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
0,
0,
NULL,
0,
NULL
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'CAC5500E-1BEE-4806-8000-C5B0D6084403',
'Supporting comments',
'Supporting Comments',
'A310652A-D0D2-4357-88B5-ED12F089C125',
6,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

--Annual cost
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'1F53D53C-4BB8-42AB-84DE-BC5C464DE165',
'Annual cost',
'Annual Cost',
'A310652A-D0D2-4357-88B5-ED12F089C125',
7,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
0,
0,
NULL,
0,
NULL
)

--Event cost
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'115011D4-3A2C-461D-8D64-8AE457F9DF73',
'Event cost',
'Event Cost',
'A310652A-D0D2-4357-88B5-ED12F089C125',
8,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
0,
'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
0,
0,
NULL,
0,
NULL
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'1813484A-6659-4A9A-AB68-C452D4D72D4C',
'Supporting comments',
'Supporting Comments',
'A310652A-D0D2-4357-88B5-ED12F089C125',
9,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

--Sensitivity
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'E1909890-8360-4D3A-A330-064A52160965',
'Sensitivity',
'Sensitivity',
'A310652A-D0D2-4357-88B5-ED12F089C125',
10,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'45499FF7-675A-4506-A75D-8FFAB37FCE1A',
0,
0,
NULL,
0,
NULL
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'7DCDF1A5-86AC-4054-8C80-942A6C4E65D6',
'Supporting comments',
'Supporting Comments',
'A310652A-D0D2-4357-88B5-ED12F089C125',
11,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

--Specificity
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'FA815268-4D5B-4C44-800D-0DC474FB8C08',
'Specificity',
'Specificity',
'A310652A-D0D2-4357-88B5-ED12F089C125',
12,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'E8605552-5BA1-4852-B803-589FB51DD775',
0,
0,
NULL,
0,
NULL
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'6143E8AC-523A-4BEF-851B-1E9D4C8993F9',
'Supporting comments',
'Supporting Comments',
'A310652A-D0D2-4357-88B5-ED12F089C125',
13,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

--Commercially sensitive
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'0E47E332-FE51-4386-9321-AA5F84DB0D0C',
'Commercially sensitive',
'Commercially Sensitive',
'A310652A-D0D2-4357-88B5-ED12F089C125',
14,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF',
0,
0,
NULL,
0,
NULL
)

--Where are the outcomes of this mechanism published?
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'BEB05082-D4E8-47A1-A885-4C6B77568A4A',
'Where are the outcomes of this mechanism published',
'Publisher',
'A310652A-D0D2-4357-88B5-ED12F089C125',
15,
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
0,
'6FDF6590-D610-4200-B3EA-128A5BB838E2',
0,
0,
NULL,
0,
NULL
)

--Who is influenced by these reports?
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'4210CA74-D671-4ABD-AD3A-BD1320CB3431',
'Who is influenced by these reports',
'Who Is Influenced',
'A310652A-D0D2-4357-88B5-ED12F089C125',
16,
'd297f63b-638a-4574-b042-97c248338a26',
1,
NULL,
0,
0,
NULL,
0,
NULL
)

--How rapidly is pertinent data from this surveillance mechanism normally brought to Defra’s attention?
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'C33ECCE9-45EA-4F8E-8D9B-31E730B588B6',
'How rapidly is pertinent data from this surveillance mechanism normally brought to Defra’s attention',
'Time To Be Brought To Attention',
'A310652A-D0D2-4357-88B5-ED12F089C125',
17,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
0,
0,
NULL,
0,
NULL
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'EBA52A78-FFE0-40AF-9397-928FAA7CBE9D',
'Supporting comments',
'Supporting Comments',
'A310652A-D0D2-4357-88B5-ED12F089C125',
18,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

-- This is the parent field of the folling seven fields.
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'D8DB1506-550D-4BAC-925B-12AD7952149D',
NULL,
'Surveillance Activities',
'A310652A-D0D2-4357-88B5-ED12F089C125',
19,
'69754D65-0F13-4DB0-AFB1-3271AD64A7DB',
0,
NULL,
0,
0,
NULL,
0,
NULL
)

--Inclusion criteria
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'2126F304-F99F-4B75-AC1B-718DA6A3A76A',
'Inclusion criteria',
'Inclusion criteria',
NULL,
1,
'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
1,
NULL,
0,
0,
NULL,
1,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Sample Collected
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'D6FF43FF-3A59-40D2-A02A-C99C77E75A7C',
'Samples collected',
'Samples collected',
NULL,
2,
'1b2bbbc3-1a25-4d20-8f8b-a19167f21c89',
1,
'4050839d-dbaf-4418-adba-82ae11bfed31',
0,
0,
NULL,
1,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'E6F6A44B-FE78-4C28-B37B-2E9094A58E59',
'Supporting comments',
'Supporting comments',
NULL,
3,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Is there scope to improve this surveillance approach?
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'49E184B7-024B-44FB-82B4-1D41A3C4F772',
'Is there scope to improve this surveillance approach',
'Scope To Improve Surveillance',
NULL,
4,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
NULL,
0,
0,
NULL,
0,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Supporting comments
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'69DFF2E9-FDC7-487E-9983-321E22B35939',
'Supporting comments',
'Supporting Comments',
NULL,
5,
'd297f63b-638a-4574-b042-97c248338a26',
0,
NULL,
0,
0,
NULL,
0,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Cost to implement such improvements
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'35A30BEC-AAD7-4F93-9784-A29DA5277254',
'Cost to implement such improvements',
'Cost Of Improvements',
NULL,
6,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
NULL,
0,
0,
NULL,
0,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Likely benefits from implementing improvements
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'9D0F3810-F4B6-4C23-AD50-4FCE8236EC4A',
'Likely benefits from implementing improvements',
'Benefits From Implementing Improvements',
NULL,
7,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
NULL,
0,
0,
NULL,
0,
'D8DB1506-550D-4BAC-925B-12AD7952149D'
)

--Question 2
------------
-- Is already handled

--Question 3: Identify any additional activities that would usefully enhance our understanding of the disease/issue profiled
INSERT INTO [dbo].[ProfileQuestion]
(
[Id],
[Name],
[ShortName],
[ProfileSectionId],
[QuestionNumber],
[IsPerSpecies],
[IsRepeating],
[UserGuidance],
[IrrelevanceFieldId],
[IrrelevanceValueId],
[IrrelevanceFlag],
[NonTechnicalName]
)
VALUES
(
'AF442375-7684-400B-8157-1B3BEE00F63D',
'Identify any additional activities that would usefully enhance our understanding of the disease/issue profiled',
'Identify Any Additional Activities',
'c90fbbad-be8d-4317-bf7c-7a56b45b2828',
3,
0,
0,
'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
null,
null,
null,
'Identify any additional activities that would usefully enhance our understanding of the disease/issue profiled'
)


--Question 3, Fields
--------------------
--Surveillance mechanism
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'98191A70-DA10-41BF-9B73-523AD111E625',
'Surveillance mechanism',
'Surveillance Mechanism',
'AF442375-7684-400B-8157-1B3BEE00F63D',
1,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'd41b31e1-d0c0-464d-b640-3d26dd21546e',
0,
0,
NULL,
0,
NULL
)

--Proposal
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'5C915877-0B29-48BB-ADB7-8775EDD642D4',
'Proposal',
'Proposal',
'AF442375-7684-400B-8157-1B3BEE00F63D',
2,
'd297f63b-638a-4574-b042-97c248338a26',
1,
NULL,
0,
0,
NULL,
0,
NULL
)

--Potential cost
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'59344725-4C01-4898-951A-7B091B84AAE4',
'Potential cost',
'Potential cost',
'AF442375-7684-400B-8157-1B3BEE00F63D',
3,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'C0EF93B4-7CAB-42C7-92D0-CF9A70589FCA',
0,
0,
NULL,
0,
NULL
)

--Potential benefit
INSERT INTO [dbo].[ProfileField]
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
[DefaultValue],
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'12B0135B-710A-4F31-A81F-53208C04C5D6',
'Potential benefit',
'Potential benefit',
'AF442375-7684-400B-8157-1B3BEE00F63D',
4,
'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
1,
'13CB2A3D-4FE4-4A36-A615-28351BB8BB55',
0,
0,
NULL,
0,
NULL
)

--Is there scope to improve this surveillance approach
UPDATE [dbo].[ProfileField]
SET [ReferenceTableId] = '75B46A00-229F-4DEC-B214-DE620B293DC8'
WHERE [Id] = '49E184B7-024B-44FB-82B4-1D41A3C4F772'

--Cost to implement such improvements
UPDATE [dbo].[ProfileField]
SET [ReferenceTableId] = 'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3'
WHERE [Id] = '9D0F3810-F4B6-4C23-AD50-4FCE8236EC4A'

--Likely benefits for implementing improvements
UPDATE [dbo].[ProfileField]
SET [ReferenceTableId] = '2034B05B-126E-416B-9D26-1D08CDECF516'
WHERE [Id] = '35A30BEC-AAD7-4F93-9784-A29DA5277254'

/* Error handling and logging

*/
DELETE FROM [ErrorLog]
GO

ALTER TABLE [ErrorLog]
ALTER COLUMN [ErrorType] varchar(255) NOT NULL
GO

ALTER TABLE [ErrorLog]
ALTER COLUMN [Exception] varchar(MAX) NOT NULL
GO

ALTER TABLE [ErrorLog]
DROP COLUMN [InnerException]
GO

ALTER TABLE [ErrorLog]
ALTER COLUMN [StackTrace] varchar(MAX) NOT NULL
GO

ALTER TABLE [ErrorLog]
DROP COLUMN [Location]
GO

ALTER TABLE [ErrorLog]
ADD [ApplicationName] varchar(100) NOT NULL
GO

ALTER TABLE [ErrorLog]
ADD [VersionName] varchar(100) NOT NULL
GO

ALTER TABLE [ErrorLog]
ADD [Request] varchar(255) NULL
GO

ALTER TABLE [ErrorLog]
ALTER COLUMN [LogDate] datetime NOT NULL
GO

ALTER TABLE [ErrorLog]
ALTER COLUMN [UserName] varchar(255) NOT NULL
GO

