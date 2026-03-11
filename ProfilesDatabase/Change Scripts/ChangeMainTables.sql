/*
Changes for CR004 and CR005
*/

-- remove the SpeciesAffectedComments column from ProfileVersionSpecies; this data should be stored in
-- EpidemiologySpecies so that it can be handled by the View/Edit Profile code
ALTER TABLE dbo.ProfileVersionSpecies
	DROP COLUMN SpeciesAffectedComments
GO

-- add columns to PrioritisationCategory to record the field that causes the category to be considered
-- irrelevant for the prioritisation calculation
ALTER TABLE dbo.PrioritisationCategory ADD
	IrrelevanceFieldId uniqueidentifier NULL,
	IrrelevanceValueId uniqueidentifier NULL,
	IrrelevanceFlag bit NULL
GO
ALTER TABLE dbo.PrioritisationCategory ADD CONSTRAINT
	FK_PrioritisationCategory_ProfileField FOREIGN KEY
	(
	IrrelevanceFieldId
	) REFERENCES dbo.ProfileField
	(
	Id
	)
GO

ALTER TABLE dbo.PrioritisationCategory ADD CONSTRAINT
	FK_PrioritisationCategory_ReferenceValue FOREIGN KEY
	(
	IrrelevanceValueId
	) REFERENCES dbo.ReferenceValue
	(
	Id
	)
GO

UPDATE
	PrioritisationCategory
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'cbb4614a-4964-4cd1-8859-829d08ca3dfb' -- No
WHERE
	Id = '0be9f729-8669-4cca-9426-7737f75397d9' -- Public Health
GO

UPDATE
	PrioritisationCategory
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare indicator
	IrrelevanceFlag = 0
WHERE
	Id = 'a873901c-dea8-4c0f-855f-a5aefaa2f704' -- Welfare
GO

UPDATE
	PrioritisationCategory
SET
	IrrelevanceFieldId = 'a989643b-5622-4c36-b432-d2c3899b3bf4', -- Statutory obligation to control
	IrrelevanceValueId = '31617ce7-058c-44ac-a1e0-e183f56173fd' -- None
WHERE
	Id = 'a1ea4c86-d087-4a54-b3a0-5ca33288a346' -- International Trade
GO

/*
Changes for CR06
*/

ALTER TABLE dbo.ProfileVersion
	DROP COLUMN IsCurrent, IsDeleted
	GO

/*
Changes following database review by Simon (17 May 2007)
*/
-- add constraint to ReviewComment table, as per Simon's DB review
ALTER TABLE [dbo].[ReviewComment] WITH CHECK ADD CONSTRAINT [FK_ReviewComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO

-- remove the default from ProfileUser as it doesn't make sense to
-- autogenerate keys for this table
ALTER TABLE [dbo].[ProfileUser] DROP CONSTRAINT [DF_ProfileUser_UserId]
GO

-- add a ProfileVersionUser table to handle the requirement for
-- contribution dates
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileVersionUser](
	[UserId] [uniqueidentifier] NOT NULL,
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ContributionDate] [smalldatetime] NULL,
	[LastUpdated] [timestamp] NOT NULL
 CONSTRAINT [PK_ProfileVersionUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProfileVersionId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProfileVersionUser] WITH CHECK ADD CONSTRAINT [FK_ProfileVersionUser_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [dbo].[ProfileVersion] ([Id])
GO
ALTER TABLE [dbo].[ProfileVersionUser] WITH CHECK ADD CONSTRAINT [FK_ProfileVersionUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO

-- add effective dates to the species table
ALTER TABLE [Species]
ADD
	[EffectiveDateFrom] smalldatetime NULL CONSTRAINT [DF_Species_EffectiveDateFrom]  DEFAULT (getdate()),
	[EffectiveDateTo] smalldatetime NULL
GO

UPDATE
	[Species]
SET
	[EffectiveDateFrom] = GETDATE()
GO

ALTER TABLE [Species]
ALTER COLUMN
	[EffectiveDateFrom] smalldatetime NOT NULL
GO

-- Add timestamp columns
ALTER TABLE [LegislativeReference]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [ProfileVersionSection]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [ScientificPaperReference]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [SourceOfFurtherInformation]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [PrioritisationRankingRange]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [User]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [ReviewComment]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [Species]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [PrioritisationCriterionValue]
ADD [LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [ProfileVersion]
ADD [LastUpdated] timestamp NOT NULL
GO

-- Add timestamp columns
ALTER TABLE [ProfileQuestion]
ADD [LastUpdated] timestamp NOT NULL
GO

/*
31/05/2007 LL
Alter luSectionReviewFrequency to delete columns EffectiveDateFrom & EffectiveDateTo as these are not required
Add column SequenceNumber to record order that the look-up values should be displayed
Populate column SequenceNumber
*/

ALTER TABLE [luSectionReviewFrequency]
DROP COLUMN [EffectiveDateFrom], [EffectiveDateTo]
GO

ALTER TABLE [luSectionReviewFrequency]
ADD [SequenceNumber] TINYINT NULL
GO

UPDATE [luSectionReviewFrequency]
SET	[SequenceNumber] = 1
WHERE [Id] = '37481649-5986-47e8-b91d-bd73ebb479eb'
GO

UPDATE [luSectionReviewFrequency]
SET	[SequenceNumber] = 2
WHERE [Id] = 'eee5d6a5-327a-48b0-9ff8-7da28dce0feb'
GO

UPDATE [luSectionReviewFrequency]
SET	[SequenceNumber] = 3
WHERE [Id] = '06788e48-149b-4b04-8eb6-40104e174e12'
GO

UPDATE [luSectionReviewFrequency]
SET	[SequenceNumber] = 4
WHERE [Id] = '90d4ac32-2598-49b5-a3a8-9f1a5f854ed7'
GO

ALTER TABLE [luSectionReviewFrequency]
ALTER COLUMN [SequenceNumber] TINYINT NOT NULL
GO

/*
28/6/07 RJN
Changes to profiles metadata to support inter-question dependencies
*/
DROP TABLE ProfileVersionSpeciesQuestion
GO

-- add columns to ProfileQuestion to record the field that causes the question to be considered
-- irrelevant
ALTER TABLE dbo.ProfileQuestion ADD
	IrrelevanceFieldId uniqueidentifier NULL,
	IrrelevanceValueId uniqueidentifier NULL,
	IrrelevanceFlag bit NULL
GO
ALTER TABLE dbo.ProfileQuestion ADD CONSTRAINT
	FK_ProfileQuestion_ProfileField FOREIGN KEY
	(
	IrrelevanceFieldId
	) REFERENCES dbo.ProfileField
	(
	Id
	)
GO

ALTER TABLE dbo.ProfileQuestion ADD CONSTRAINT
	FK_ProfileQuestion_ReferenceValue FOREIGN KEY
	(
	IrrelevanceValueId
	) REFERENCES dbo.ReferenceValue
	(
	Id
	)
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '367ef28d-31a3-46d0-b2a4-beb38272ed5a', -- GB Presence Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '745A30C4-5098-4D02-91B2-55E75F54551F' -- 2.2 Current holding level prevalence of the endemic infection or issue in Great Britain
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '367ef28d-31a3-46d0-b2a4-beb38272ed5a', -- GB Presence Indicator
	IrrelevanceFlag = 1 -- Yes
WHERE
	Id = 'FBF10EF6-3DFE-4409-BC6F-E9D0A7316368' -- 2.3 Date of most recent occurrence in Great Britain
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '367ef28d-31a3-46d0-b2a4-beb38272ed5a', -- GB Presence Indicator
	IrrelevanceFlag = 1 -- Yes
WHERE
	Id = '55C96DCC-03E8-4650-A055-C97CAAD5BE01' -- 2.4 Risk of introduction of this disease/agent/issue into animals in Great Britain
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = 'CA2A4681-77BE-4056-8AE5-F09D64D95E60' -- 4.2 Impact on freedom from hunger and thirst in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '189E764F-21FB-4EBE-8E50-5262152BCFBF' -- 4.3 Impact on freedom from discomfort in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '61E59EA4-AA92-484B-8151-0BBE0BA1BD7C' -- 4.4 Impact on freedom from pain or injury or disease in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '3729B39A-9546-4EC9-BFF4-263F0A074820' -- 4.5 Impact on freedom to express normal behaviour in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '9D9F02FE-2028-4CF9-912B-F2153293828D' -- 4.6 Impact on freedom from fear and distress in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '13B0550B-7F49-4998-98B0-AC4950DA6743' -- 4.7 Potential to reduce welfare implications in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '39c11421-1494-4a29-98f1-0cf7fd363b37', -- Welfare Issue Indicator
	IrrelevanceFlag = 0 -- No
WHERE
	Id = '56A3F23B-B097-4203-8295-3DE62F1725ED' -- 4.8 Proportion of infected and/or affected animals suffering more severely than the mode in this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '418F7B77-78E8-455D-A307-05DA702B16A4' -- 5.2 The level of human-animal (or products) interaction/exposure relating to this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'D298E014-DF8D-4680-B93E-CB62CB2DE2C8' -- 5.3 Methods of transmission to humans
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'F868A520-F31A-43E7-9B93-87E4508073B1' -- 5.4 Proportion of human cases in GB attributable to exposure to animals or animal products of this species from Great Britain
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'CB1DE3F4-FD98-46A2-BC82-12FC88D76EED' -- 5.5 Symptoms of human disease
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'B35E3C7F-0651-42FC-B427-6D6D1926F3D1' -- 5.6 Transmissibility between humans in GB society
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'B6BECBDB-CDFE-4695-BD5C-0BB72344C78A' -- 5.7 Modal severity of Human Disease
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '957DBA98-8C70-478A-84FB-97B1BA35E53F' -- 5.8 Likelihood of serious human morbidity
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '585637C0-257C-4366-8819-AAAF8D85A23B' -- 5.9 Prevalence and geographic distribution of human disease
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '79F66ED7-4939-4FF8-9195-6F4AEA723FB2' -- 5.10 Annual number of human cases of the disease in Great Britain
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '6626AA73-8321-4128-961C-88CD5DE73D8D' -- 5.11 Average cost per case
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = 'D317E180-917A-413B-8606-D0BD4CBC175A' -- 5.12 Indirect economic costs of human illness in GB
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = '383289e8-44d0-464d-ad77-9f4c1bd7d658', -- Zoonotic Indicator
	IrrelevanceValueId = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB' -- No
WHERE
	Id = '50F4BC33-0011-48E0-9567-B8AE9F891261' -- 5.12 Uncertainty: Assessment of the current state of knowledge of the public health significance of this infection or issue
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = 'EDD8D3A8-C7A1-4B60-A025-5D5BFF2A6CD7' -- 11.3 Estimated impact on export market value as a proportion of the whole of the GB trade derived from this species (i.e. live animals and germplasm and products)
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = 'DAAC3F4D-106E-4417-ACC7-92D8309C945F' -- 11.4 Estimated impact on resources and time required to re-establish intra-community trading status
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = 'A9AE1563-C6AA-47CC-9562-B62643DF1E48' -- 11.5 Estimated impact on potential for restricting impact by regionalisation/compartmentalisation
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = '4D00439E-740C-4037-8D30-2E26046AE558' -- 11.6 Estimated impact on range of commodities, the export of which (from GB), is/would be compromised by the profiled disease or issue
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = '4F6FD1E5-F8D8-4169-B3BE-48229F07CAFF' -- 11.7 Estimated impact on government facilitation of intra-community trade flows in animals/commodities at risk from this disease or issue for this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = '4F14D5E9-E6FD-40F5-BE80-4DF7BDFE062E' -- 11.8 Estimated impact on government facilitation of third-country trade flows in animals/commodities at risk from this disease or issue for this species
GO

UPDATE
	ProfileQuestion
SET
	IrrelevanceFieldId = 'A989643B-5622-4C36-B432-D2C3899B3BF4', -- Statutory obligation to control
	IrrelevanceValueId = '31617CE7-058C-44AC-A1E0-E183F56173FD' -- None
WHERE
	Id = '7D177709-095F-4220-9C2D-B9FC9164C141' -- 11.9 Estimated impact on export market value for this species
GO

ALTER TABLE dbo.ProfileField ADD
	IsReadOnly bit NOT NULL CONSTRAINT DF_ProfileField_IsReadOnly DEFAULT 0
GO

UPDATE
	ProfileField
SET
	IsReadOnly = 1
WHERE
	Id IN
		(
		'8B5240E4-59F3-429A-9C62-2EF561201BB8',
		'9A429CF0-7435-470D-9C22-319708F1E721',
		'34A3D221-92EE-4DD1-B59C-67D814CA7FE7',
		'F2801477-78C8-4A34-A35B-8B64CDFEB471',
		'CFD4A65F-A2ED-4C45-9FFF-E41DDCB9E38E'
		)	
GO

/* RJN 30 July 2007
Changes for CR14
*/

-- Legislative references

ALTER TABLE [LegislativeReference]
ALTER COLUMN [NoteText] text NOT NULL
GO

ALTER TABLE [LegislativeReference]
DROP COLUMN [LastUpdated]
GO

ALTER TABLE [LegislativeReference]
ADD [QuestionReference] varchar(255) NULL
GO

UPDATE [LegislativeReference] SET [QuestionReference] = '1'
GO

ALTER TABLE [LegislativeReference]
ALTER COLUMN [QuestionReference] varchar(255) NOT NULL
GO

ALTER TABLE [LegislativeReference]
ADD [LastUpdated] timestamp NOT NULL
GO

-- Scientific paper references
ALTER TABLE [ScientificPaperReference]
ALTER COLUMN [NoteText] text NOT NULL
GO

ALTER TABLE [ScientificPaperReference]
DROP COLUMN [LastUpdated]
GO

ALTER TABLE [ScientificPaperReference]
ADD [QuestionReference] varchar(255) NULL
GO

UPDATE [ScientificPaperReference] SET [QuestionReference] = '1'
GO

ALTER TABLE [ScientificPaperReference]
ALTER COLUMN [QuestionReference] varchar(255) NOT NULL
GO

ALTER TABLE [ScientificPaperReference]
ADD [LastUpdated] timestamp NOT NULL
GO

-- Sources of further information
ALTER TABLE [SourceOfFurtherInformation]
ALTER COLUMN [NoteText] text NOT NULL
GO

ALTER TABLE [SourceOfFurtherInformation]
DROP COLUMN [LastUpdated]
GO

ALTER TABLE [SourceOfFurtherInformation]
ADD [QuestionReference] varchar(255) NULL
GO

UPDATE [SourceOfFurtherInformation] SET [QuestionReference] = '1'
GO

ALTER TABLE [SourceOfFurtherInformation]
ALTER COLUMN [QuestionReference] varchar(255) NOT NULL
GO

ALTER TABLE [SourceOfFurtherInformation]
ADD [LastUpdated] timestamp NOT NULL
GO

/*RJN 3 August 2007
Changes to fix problem with Species maintenance */

DELETE FROM dbo.SpeciesTableAuditLogEntry
GO

DELETE FROM dbo.SpeciesTableAuditLog
GO

ALTER TABLE dbo.SpeciesTableAuditLog
	DROP CONSTRAINT FK_SpeciesTableAuditLog_Species
GO

ALTER TABLE dbo.SpeciesTableAuditLog
	DROP COLUMN SpeciesId
GO

ALTER TABLE dbo.SpeciesTableAuditLog
	ADD [SpeciesName] varchar(50) NOT NULL
GO

/*RJN 6 August 2007
*/
ALTER TABLE [ProfileQuestion] ALTER COLUMN [Name] varchar(255) NULL
GO

/*RJN 14 August 2007
Prioritisation changes
*/

ALTER TABLE dbo.PrioritisationCategory ADD
	MinimumScore int NOT NULL CONSTRAINT DF_PrioritisationCategory_MinimumScore DEFAULT 0,
	MaximumScore int NOT NULL CONSTRAINT DF_PrioritisationCategory_MaximumScore DEFAULT 0,
	Modifier decimal(15, 10) NOT NULL CONSTRAINT DF_PrioritisationCategory_Modifier DEFAULT 0
GO

CREATE TABLE [dbo].[PrioritisationScore](
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	[PrioritisationCategoryId] [uniqueidentifier] NULL,
	[Score] [int] NOT NULL,
	[Rank] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PrioritisationScore]  WITH CHECK ADD  CONSTRAINT [FK_PrioritisationScore_PrioritisationCategory] FOREIGN KEY([PrioritisationCategoryId])
REFERENCES [dbo].[PrioritisationCategory] ([Id])
GO
ALTER TABLE [dbo].[PrioritisationScore]  WITH CHECK ADD  CONSTRAINT [FK_PrioritisationScore_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [dbo].[ProfileVersion] ([Id])
GO
ALTER TABLE [dbo].[PrioritisationScore]  WITH CHECK ADD  CONSTRAINT [FK_PrioritisationScore_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])



/*RDB 21st August 2007
*/

CREATE TABLE [dbo].[ErrorLog](
	[Id] [uniqueidentifier] NOT NULL,
	[ErrorType] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[Exception] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
	[InnerException] [varchar](255) COLLATE Latin1_General_CI_AS NULL,
	[StackTrace] [text] COLLATE Latin1_General_CI_AS NULL,
	[Location] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
	[LogDate] [smalldatetime] NULL,
	[Username] [varchar](50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/* RJN 18 September 2007*/
-- extend Title column to allow up to 255 characters (UBUG 2268)
ALTER TABLE [ProfileVersion]
ALTER COLUMN [Title] varchar(255) NOT NULL
GO

/* RJN 5 October 2007*/
ALTER TABLE [PrioritisationCategory]
ALTER COLUMN [Modifier] decimal(25,10) NOT NULL
GO

/* RJN 15 November 2007
Release 2 changes */
ALTER TABLE [ProfileVersion]
DROP DF_ProfileVersion_Description
GO

ALTER TABLE [ProfileVersion]
DROP COLUMN [Description]
GO

ALTER TABLE [ProfileVersion]
DROP COLUMN [AffectedSpeciesComments]
GO

/*RJN 21 November 2007
Release 2 changes - UATD05 Species Trade Data */
ALTER TABLE [SpeciesField]
ADD [DataFieldTypeId] uniqueidentifier NOT NULL
GO

ALTER TABLE [SpeciesField]
ADD [IsMandatory] bit NOT NULL
GO

ALTER TABLE [dbo].[SpeciesField]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesField_luDataFieldType] FOREIGN KEY([DataFieldTypeId])
REFERENCES [dbo].[luDataFieldType] ([Id])
GO

ALTER TABLE [Species]
ADD [CommercialTradeComments] text NULL
GO

ALTER TABLE [Species]
ADD [ImportanceOfExportTradeComments] text NULL
GO

ALTER TABLE [Species]
ADD [ImpactOnLevelOfImportsComments] text NULL
GO

ALTER TABLE [Species]
ADD [ImpactOnIntraCommunityFlowsComments] text NULL
GO

ALTER TABLE [Species]
ADD [ImpactOnThirdCountryFlowsComments] text NULL
GO

ALTER TABLE [Species]
ADD [ExportMarketValueComments] text NULL
GO

/*RJN 29 November 2007
Release 2 changes - changes for the move to 4 profile reports rather than just the 1 */
CREATE TABLE [dbo].[luProfileReport](
	Id uniqueidentifier NOT NULL,
	ReportName varchar(255) NOT NULL,
	DisplayName varchar(255) NOT NULL,
	SequenceNumber tinyint NOT NULL
 CONSTRAINT [PK_luProfileReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[luProfileReport] ADD CONSTRAINT
	DF_luProfileReport_Id DEFAULT newid() FOR Id
GO

INSERT INTO [luProfileReport]
	(
	[Id],
	[DisplayName],
	[ReportName],
	[SequenceNumber]
	)
VALUES
	(
	'cae9a854-89b6-43f6-9a64-82015840b433',
	'Full profile',
	'FullProfileGUID',
	1
	)

INSERT INTO [luProfileReport]
	(
	[Id],
	[DisplayName],
	[ReportName],
	[SequenceNumber]
	)
VALUES
	(
	'b466cfef-3937-4ee8-9ae8-cfbf675c77e5',
	'Summary prioritisation report',
	'SummaryPrioritisationGUID',
	2
	)

INSERT INTO [luProfileReport]
	(
	[Id],
	[DisplayName],
	[ReportName],
	[SequenceNumber]
	)
VALUES
	(
	'83269fcd-e1c5-4891-9b99-75accf116c60',
	'Summary profile',
	'SummaryProfileGUID',
	3
	)
	
INSERT INTO [luProfileReport]
	(
	[Id],
	[DisplayName],
	[ReportName],
	[SequenceNumber]
	)
VALUES
	(
	'686f966c-d9bb-4ffe-82ae-10074e2ac6d7',
	'Question and answer sheet',
	'QABriefGUID',
	4
	)
GO

CREATE TABLE [dbo].[ProfileVersionReport](
	ProfileVersionId uniqueidentifier NOT NULL,
	ProfileReportId uniqueidentifier NOT NULL,
	PdfData image NOT NULL
 CONSTRAINT [PK_ProfileVersionReport] PRIMARY KEY CLUSTERED 
(
	ProfileVersionId,
	ProfileReportId
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE dbo.ProfileVersionReport ADD CONSTRAINT
	FK_ProfileVersionReport_ProfileVersion FOREIGN KEY
	(
	ProfileVersionId
	) REFERENCES dbo.ProfileVersion
	(
	Id
	) 	
GO

ALTER TABLE dbo.ProfileVersionReport ADD CONSTRAINT
	FK_ProfileVersionReport_luProfileReport FOREIGN KEY
	(
	ProfileReportId
	) REFERENCES dbo.luProfileReport
	(
	Id
	) 
GO

/* RJN 04/01/2008
 2764 Prioritisation criteria need renaming */
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual number of human cases of the disease in GB'
WHERE
	[Code] = 'PH01'

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Modal severity of human disease'
WHERE
	[Code] = 'PH02'
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Transmissibility between humans in GB society'
WHERE
	[Code] = 'PH03'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Average cost per case'
WHERE
	[Code] = 'PH06'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Indirect economic costs of human illness'
WHERE
	[Code] = 'PH07'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Proportion of human cases in GB attributable to exposure to animals or animal products from GB'
WHERE
	[Code] = 'PH08'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Uncertainty: Assessment of the current state of knowledge of the public health significance of this infection or issue'
WHERE
	[Code] = 'PH09'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Likelihood of serious human morbidity'
WHERE
	[Code] = 'PH10'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Level of human-animal (or products) interaction/ exposure'
WHERE
	[Code] = 'PH11'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Number of clinical cases, at the modal severity, per year in GB'
WHERE
	[Code] = 'WE01'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Modal duration of welfare impact experienced by animals in GB'
WHERE
	[Code] = 'WE03'	

UPDATE
	[PrioritisationCriterion]
SET
	[Code] = 'WE07',
	[Name] = 'Impact on freedom from hunger and thirst'
WHERE
	[Code] = 'WE05'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from discomfort'
WHERE
	[Code] = 'WE08'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from pain, injury or disease'
WHERE
	[Code] = 'WE09'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom to express normal behaviour'
WHERE
	[Code] = 'WE10'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from fear and distress'
WHERE
	[Code] = 'WE11'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Welfare impact of likely or statutory control measures'
WHERE
	[Code] = 'WE12'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Proportion of infected and/or affected animals affected suffering more severely than the mode'
WHERE
	[Code] = 'WE13'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Total potential unplanned cost to exchequer'
WHERE
	[Code] = 'WS08'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the global environment'
WHERE
	[Code] = 'WS21'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the local environment'
WHERE
	[Code] = 'WS22'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the sector that produces this species'
WHERE
	[Code] = 'WS23'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the wider rural community'
WHERE
	[Code] = 'WS24'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for restricting impact by regionalisation/ zoning or compartmentalisation'
WHERE
	[Code] = 'IT01'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Relative importance of export trade to the industry sector'
WHERE
	[Code] = 'IT03'	
	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Resource and time required to re-establish intra-community trading status'
WHERE
	[Code] = 'IT04'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Is there an obligation to control this disease under EU law?'
WHERE
	[Code] = 'IT06'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact of this disease on the breadth of trade in animals and animal products (live animals and/or products)'
WHERE
	[Code] = 'IT07'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual level of export consignments containing animals/ commodities of this species sent into intracommunity trade'
WHERE
	[Code] = 'IT08'	
		
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual level of export consignments containing animals/ commodities of this species sent into third country trade'
WHERE
	[Code] = 'IT09'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Current holding level prevalence / Risk of introduction into animals in GB'
WHERE
	[Code] = 'RE01'	
	
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Rate of spread on and between affected premises'
WHERE
	[Code] = 'RE02'	

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Efficacy and practicality of control applied at the holding level'
WHERE
	[Code] = 'RE03'	
	
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Efficacy of control measures to prevent dissemination in or between animals that are implemented above holding level'
WHERE
	[Code] = 'RE04'		

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for risk change in animals in GB'
WHERE
	[Code] = 'RE06'	
		
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for silent spread'
WHERE
	[Code] = 'RE08'	

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Is there a reservoir in GB for this disease/agent in another species or vector'
WHERE
	[Code] = 'RE10'	
		
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Uptake of control measures applied at the holding level by keepers of this species'
WHERE
	[Code] = 'RE11'		

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Level of national preparedness or level of implementation for endemics/welfare issues'
WHERE
	[Code] = 'RE12'	

GO

-- UATD32 Changes to static reporting

CREATE TABLE [dbo].[StaticReport](
	Id uniqueidentifier NOT NULL
 CONSTRAINT [PK_StaticReport] PRIMARY KEY CLUSTERED 
(
	Id
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StaticReportVersion](
	Id uniqueidentifier NOT NULL,
	StaticReportId uniqueidentifier NOT NULL,
	Title varchar(255) NOT NULL,
	VersionMajor tinyint NOT NULL,
	EffectiveDateFrom smalldatetime NOT NULL,
	EffectiveDateTo smalldatetime NULL,
	PdfData image NOT NULL
 CONSTRAINT [PK_StaticReportVersion] PRIMARY KEY CLUSTERED 
(
	Id
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE dbo.StaticReportVersion ADD CONSTRAINT
	FK_StaticReportVersion_StaticReport FOREIGN KEY
	(
	StaticReportId
	) REFERENCES dbo.StaticReport
	(
	Id
	) 	
GO

/*CR27: Make review comments threaded */
ALTER TABLE [ReviewComment]
ADD [ParentId] uniqueidentifier NULL
GO

ALTER TABLE [dbo].[ReviewComment]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComment_ReviewComment] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ReviewComment] ([Id])
GO

/*2.2.7	Visual indicators for the completion of profiles */
ALTER TABLE [ProfileVersionSection]
ADD [IsValid] bit NULL
GO

UPDATE
	[ProfileVersionSection]
SET
	[IsValid] = 0
GO

ALTER TABLE [ProfileVersionSection]
ALTER COLUMN [IsValid] bit NOT NULL
GO

/* 2.2.12 New user type – Policy Profile Users */
ALTER TABLE [User]
ADD [IsPolicyProfileUser] bit NULL
GO

UPDATE
	[User]
SET
	[IsPolicyProfileUser] = 0
GO

ALTER TABLE [User]
ALTER COLUMN [IsPolicyProfileUser] bit NOT NULL
GO

/* 2.2.13 Calculating prioritisation scores for draft profiles */
ALTER TABLE [ProfileVersionSpeciesPrioritisation]
DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_Species]
GO

ALTER TABLE [ProfileVersionSpeciesPrioritisation]
DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_ProfileVersion]
GO

ALTER TABLE [ProfileVersionSpeciesPrioritisation]
DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]
GO

DROP TABLE [ProfileVersionSpeciesPrioritisation]
GO

CREATE TABLE [ProfileVersionPrioritisedSpecies]
	(
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	CONSTRAINT [PK_ProfileVersionPrioritisedSpecies] PRIMARY KEY CLUSTERED 
		(
		[ProfileVersionId],
		[SpeciesId]
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

ALTER TABLE [ProfileVersionPrioritisedSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionPrioritisedSpecies_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [ProfileVersion] ([Id])
GO

ALTER TABLE [ProfileVersionPrioritisedSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionPrioritisedSpecies_Species] FOREIGN KEY([SpeciesId])
REFERENCES [Species] ([Id])
GO

CREATE TABLE ProfileVersionSpeciesPrioritisation
	(
	ProfileVersionId uniqueidentifier NOT NULL,
	SpeciesId uniqueidentifier NOT NULL,
	PrioritisationCriterionId uniqueidentifier NOT NULL,
	PrioritisationCriterionValueId uniqueidentifier NULL
	)  ON [PRIMARY]
GO

ALTER TABLE ProfileVersionSpeciesPrioritisation ADD CONSTRAINT
	PK_ProfileVersionSpeciesPrioritisation PRIMARY KEY CLUSTERED 
	(
	ProfileVersionId,
	SpeciesId,
	PrioritisationCriterionId
	) ON [PRIMARY]
GO

ALTER TABLE ProfileVersionSpeciesPrioritisation ADD CONSTRAINT
	FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue FOREIGN KEY
	(
	PrioritisationCriterionValueId
	) REFERENCES PrioritisationCriterionValue
	(
	Id
	) 
GO

ALTER TABLE ProfileVersionSpeciesPrioritisation ADD CONSTRAINT
	FK_ProfileVersionSpeciesPrioritisation_ProfileVersionPrioritisedSpecies FOREIGN KEY
	(
	ProfileVersionId,
	SpeciesId
	) REFERENCES ProfileVersionPrioritisedSpecies
	(
	ProfileVersionId,
	SpeciesId
	) 
GO

ALTER TABLE ProfileVersionSpeciesPrioritisation ADD CONSTRAINT
	FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterion FOREIGN KEY
	(
	PrioritisationCriterionId
	) REFERENCES PrioritisationCriterion
	(
	Id
	) 
GO

--
ALTER TABLE [ProfileVersionPrioritisedSpecies]
ADD [AffectedSpeciesId] uniqueidentifier NOT NULL
GO

ALTER TABLE [ProfileVersionPrioritisedSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionPrioritisedSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId],[AffectedSpeciesId])
REFERENCES [ProfileVersionSpecies] ([ProfileVersionId],[SpeciesId])
GO

ALTER TABLE [ProfileVersionSpeciesPrioritisation]
ADD [IsMissing] bit NOT NULL
GO

ALTER TABLE [PrioritisationScore]
ALTER COLUMN [Score] int NULL
GO

ALTER TABLE [PrioritisationScore]
ALTER COLUMN [Rank] int NULL
GO

/*CR29 User manuals */
ALTER TABLE [StaticReport]
ADD [IsUserManual] bit NULL
GO

UPDATE [StaticReport]
SET [IsUserManual] = 0
GO

ALTER TABLE [StaticReport]
ALTER COLUMN [IsUserManual] bit NOT NULL
GO

/*Changes for CR31 */

/* Add Note to ProfileSection so it can be displayed in the Full profile report*/
 ALTER TABLE
  [ProfileSection]
  ADD [Note] text NULL
  GO
  
UPDATE
	[ProfileSection]
SET
	[Note] = 'Note: the type (if any, which is dependent on the profiled disease or issue) and efficiency of disease surveillance varies between countries, so a lack of reports of the presence of a disease or issue in a country or region may not mean the disease is absent. Furthermore, in some species infections may not cause disease, and so infection may be present but not apparent. Detecting infection in these circumstances, particularly in wildlife species may be difficult.'
WHERE
	[ShortName] = 'Geographic Distribution'

UPDATE
	[ProfileSection]
SET
	[Note] = 'Some infections or issues being profiled have no effect on welfare. Therefore there may only be an entry for the first and last questions in this section.'
WHERE
	[ShortName] = 'Animal Welfare'
	
UPDATE
	[ProfileSection]
SET
	[Note] = 'Some infections or issues being profiled have no effect on human health. Therefore there may only be an entry for the first and last questions in this section'
WHERE
	[ShortName] = 'Human Health'
GO

/* Phase2Release2Changes */
/*2.2.10 Automatic capture of author information */
/*1.1.1 Remove the old, usused "contribution date" feature  */

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]') AND name = N'PK_ProfileVersionUser')
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [PK_ProfileVersionUser]

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionUser_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]'))
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [FK_ProfileVersionUser_ProfileVersion]

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]'))
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [FK_ProfileVersionUser_User]

GO
DROP TABLE [dbo].[ProfileVersionUser]

/* 1.1.2 Capture author information */
GO
IF OBJECT_ID ( N'[dbo].[ProfileVersionSectionUser]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSectionUser];
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileVersionSectionUser]
	(
	ProfileVersionId uniqueidentifier NOT NULL,
	ProfileSectionId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	LastContributionDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfileVersionSectionUser] ADD CONSTRAINT
	PK_ProfileVersionSectionUser PRIMARY KEY CLUSTERED 
	(
	ProfileVersionId,
	ProfileSectionId,
	UserId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_ProfileVersion FOREIGN KEY
	(
	ProfileVersionId
	) REFERENCES dbo.ProfileVersion
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_ProfileSection FOREIGN KEY
	(
	ProfileSectionId
	) REFERENCES dbo.ProfileSection
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_User FOREIGN KEY
	(
	UserId
	) REFERENCES dbo.[User]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO


/* 2.3.5 Access control at section level: Enforcing permissions at section level */
GO
CREATE TABLE dbo.ProfileSectionUser
	(
	UserId uniqueidentifier NOT NULL,
	ProfileId uniqueidentifier NOT NULL,
	ProfileSectionId uniqueidentifier NOT NULL
	)  ON [PRIMARY]
GO

ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	PK_ProfileSectionUser PRIMARY KEY CLUSTERED 
	(
	UserId,
	ProfileId,
	ProfileSectionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	FK_ProfileSectionUser_ProfileUser FOREIGN KEY
	(
	UserId,
	ProfileId
	) REFERENCES dbo.ProfileUser
	(
	UserId,
	ProfileId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

GO
ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	FK_ProfileSectionUser_ProfileSection FOREIGN KEY
	(
	ProfileSectionId
	) REFERENCES dbo.ProfileSection
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

INSERT INTO ProfileSectionUser
(
UserId,
ProfileId,
ProfileSectionId
)
SELECT ProfileUser.UserId, ProfileUser.ProfileId, ProfileSection.Id FROM ProfileUser
INNER JOIN luProfileUserRole ON ProfileUser.ProfileUserRoleId = luProfileUserRole.Id
CROSS JOIN ProfileSection
WHERE luProfileUserRole.IsContributor = 1

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

--Release 2 Phase 3
--2.7 - Enhancements to references -

-- new tables:
--		luProfileNoteType
--		ProfileVersionNote
--		ProfileVersionNoteQuestion

--2.7 a)
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

--2.7 b)
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

--2.7 c)
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
	ProfileVersionNoteId
	) REFERENCES [dbo].[ProfileQuestion]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO

DROP TABLE [dbo].[LegislativeReference]
DROP TABLE [dbo].[ScientificPaperReference]
DROP TABLE [dbo].[SourceOfFurtherInformation]