/*CR27: Make review comments threaded */
ALTER TABLE [ReviewComment]
ADD [ParentId] uniqueidentifier NULL
GO

ALTER TABLE [dbo].[ReviewComment]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComment_ReviewComment] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ReviewComment] ([Id])
GO

ALTER TABLE [ReviewComment]
ADD [Subject] varchar(255) NULL
GO

UPDATE
	[ReviewComment]
SET
	[Subject] = SUBSTRING([Comment], 1, 255)
GO

ALTER TABLE [ReviewComment]
ALTER COLUMN [Subject] varchar(255) NOT NULL
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

-- also generate ProfileVersionIsValidScript and execute
-- also rerun MigrationZeroLengthTextBugFix051207.sql
-- also run CreateMainStoredProcedures.sql
-- also run CreateProfileStoredProcedures.sql
-- check there are no published profiles; if there are, need to regenerate the prioritisation scores