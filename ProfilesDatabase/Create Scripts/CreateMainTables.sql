/* USER_TABLE: [dbo].[LegislativeReference]                                     */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LegislativeReference_ProfileVersionSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[LegislativeReference]'))
      ALTER TABLE [dbo].[LegislativeReference] DROP CONSTRAINT [FK_LegislativeReference_ProfileVersionSection]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSection]                                    */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSection_luSectionReviewFrequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSection]'))
      ALTER TABLE [dbo].[ProfileVersionSection] DROP CONSTRAINT [FK_ProfileVersionSection_luSectionReviewFrequency]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSection_luSectionReviewFrequency1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSection]'))
      ALTER TABLE [dbo].[ProfileVersionSection] DROP CONSTRAINT [FK_ProfileVersionSection_luSectionReviewFrequency1]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSection_ProfileSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSection]'))
      ALTER TABLE [dbo].[ProfileVersionSection] DROP CONSTRAINT [FK_ProfileVersionSection_ProfileSection]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSection_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSection]'))
      ALTER TABLE [dbo].[ProfileVersionSection] DROP CONSTRAINT [FK_ProfileVersionSection_ProfileVersion]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersion]                                           */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersion_luProfileVersionState]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersion]'))
      ALTER TABLE [dbo].[ProfileVersion] DROP CONSTRAINT [FK_ProfileVersion_luProfileVersionState]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersion_Profile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersion]'))
      ALTER TABLE [dbo].[ProfileVersion] DROP CONSTRAINT [FK_ProfileVersion_Profile]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterion]                                  */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PrioritisationCriterion_PrioritisationCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[PrioritisationCriterion]'))
      ALTER TABLE [dbo].[PrioritisationCriterion] DROP CONSTRAINT [FK_PrioritisationCriterion_PrioritisationCategory]
    GO
 /*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterionValue]                             */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PrioritisationCriterionValue_PrioritisationCriterion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PrioritisationCriterionValue]'))
      ALTER TABLE [dbo].[PrioritisationCriterionValue] DROP CONSTRAINT [FK_PrioritisationCriterionValue_PrioritisationCriterion]
    GO
   
/*                                                                            */
/* USER_TABLE: [dbo].[ProfileField]                                             */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileField_luDataFieldType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileField]'))
      ALTER TABLE [dbo].[ProfileField] DROP CONSTRAINT [FK_ProfileField_luDataFieldType]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileField_ProfileQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileField]'))
      ALTER TABLE [dbo].[ProfileField] DROP CONSTRAINT [FK_ProfileField_ProfileQuestion]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileField_ReferenceTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileField]'))
      ALTER TABLE [dbo].[ProfileField] DROP CONSTRAINT [FK_ProfileField_ReferenceTable]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileQuestion]                                          */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileQuestion_ProfileSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileQuestion]'))
      ALTER TABLE [dbo].[ProfileQuestion] DROP CONSTRAINT [FK_ProfileQuestion_ProfileSection]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[ProfileUser]                                              */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileUser_luProfileUserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileUser]'))
      ALTER TABLE [dbo].[ProfileUser] DROP CONSTRAINT [FK_ProfileUser_luProfileUserRole]
    GO
 
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileUser_Profile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileUser]'))
      ALTER TABLE [dbo].[ProfileUser] DROP CONSTRAINT [FK_ProfileUser_Profile]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileUser]'))
      ALTER TABLE [dbo].[ProfileUser] DROP CONSTRAINT [FK_ProfileUser_User]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpecies]                                    */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpecies_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpecies]'))
      ALTER TABLE [dbo].[ProfileVersionSpecies] DROP CONSTRAINT [FK_ProfileVersionSpecies_ProfileVersion]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpecies_Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpecies]'))
      ALTER TABLE [dbo].[ProfileVersionSpecies] DROP CONSTRAINT [FK_ProfileVersionSpecies_Species]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[Species]                                                  */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Species_Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
      ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_Species_Species]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesPrioritisation]                      */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesPrioritisation]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesPrioritisation_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesPrioritisation]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_ProfileVersion]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesPrioritisation_Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesPrioritisation]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_Species]
    GO
    
/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesQuestion]                            */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesQuestion_ProfileQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesQuestion]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion] DROP CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileQuestion]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesQuestion]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion] DROP CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesQuestion]'))
      ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion] DROP CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies1]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTableAuditLog]                                   */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReferenceTableAuditLog_ReferenceTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceTableAuditLog]'))
      ALTER TABLE [dbo].[ReferenceTableAuditLog] DROP CONSTRAINT [FK_ReferenceTableAuditLog_ReferenceTable]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReferenceTableAuditLog_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceTableAuditLog]'))
      ALTER TABLE [dbo].[ReferenceTableAuditLog] DROP CONSTRAINT [FK_ReferenceTableAuditLog_User]
    GO
    
/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceValue]                                           */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReferenceValue_ReferenceTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReferenceValue]'))
      ALTER TABLE [dbo].[ReferenceValue] DROP CONSTRAINT [FK_ReferenceValue_ReferenceTable]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[ReviewComment]                                            */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReviewComment_ProfileVersionSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReviewComment]'))
      ALTER TABLE [dbo].[ReviewComment] DROP CONSTRAINT [FK_ReviewComment_ProfileVersionSection]
    GO
 
/*                                                                            */
/* USER_TABLE: [dbo].[ScientificPaperReference]                                 */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScientificPaperReference_ProfileVersionSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScientificPaperReference]'))
      ALTER TABLE [dbo].[ScientificPaperReference] DROP CONSTRAINT [FK_ScientificPaperReference_ProfileVersionSection]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[SourceOfFurtherInformation]                               */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceOfFurtherInformation_ProfileVersionSection]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceOfFurtherInformation]'))
      ALTER TABLE [dbo].[SourceOfFurtherInformation] DROP CONSTRAINT [FK_SourceOfFurtherInformation_ProfileVersionSection]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesField]                                             */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesField_ReferenceTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpeciesField]'))
      ALTER TABLE [dbo].[SpeciesField] DROP CONSTRAINT [FK_SpeciesField_ReferenceTable]
    GO

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLog]                                     */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesTableAuditLog_Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpeciesTableAuditLog]'))
      ALTER TABLE [dbo].[SpeciesTableAuditLog] DROP CONSTRAINT [FK_SpeciesTableAuditLog_Species]
    GO
    
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesTableAuditLog_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpeciesTableAuditLog]'))
      ALTER TABLE [dbo].[SpeciesTableAuditLog] DROP CONSTRAINT [FK_SpeciesTableAuditLog_User]
    GO
/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLogEntry]                                */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesTableAuditLogEntry_SpeciesField]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpeciesTableAuditLogEntry]'))
      ALTER TABLE [dbo].[SpeciesTableAuditLogEntry] DROP CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesField]
    GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesTableAuditLogEntry_SpeciesTableAuditLog]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpeciesTableAuditLogEntry]'))
      ALTER TABLE [dbo].[SpeciesTableAuditLogEntry] DROP CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesTableAuditLog]
    GO


 /* USER_TABLE: [dbo].[ProfileSection]                                           */

IF OBJECT_ID ( N'[dbo].[ProfileSection]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileSection];
GO
/****** Object:  Table [dbo].[ProfileSection]    Script Date: 04/13/2007 09:41:47 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileSection](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[ShortName] [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
	[SectionNumber] [int] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[luProfileVersionState]                                    */

IF OBJECT_ID ( N'[dbo].[luProfileVersionState]' ) IS NOT NULL
	DROP TABLE [dbo].[luProfileVersionState];
GO
/****** Object:  Table [dbo].[luProfileVersionState]    Script Date: 04/13/2007 09:41:49 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[luProfileVersionState](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[Profile]                                                  */

IF OBJECT_ID ( N'[dbo].[Profile]' ) IS NOT NULL
	DROP TABLE [dbo].[Profile];
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 04/13/2007 09:41:51 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Profile](
	[Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersion]                                           */

IF OBJECT_ID ( N'[dbo].[ProfileVersion]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersion];
GO
/****** Object:  Table [dbo].[ProfileVersion]    Script Date: 04/13/2007 09:41:53 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileVersion](
	[Id] [uniqueidentifier] NOT NULL,
	[ProfileId] [uniqueidentifier] NOT NULL,
	[Title] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Description] [text] COLLATE Latin1_General_CI_AS NOT NULL,
	[VersionMajor] [tinyint] NOT NULL,
	[VersionMinor] [tinyint] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ProfileVersionStateId] [uniqueidentifier] NOT NULL,
	[AffectedSpeciesComments] text NULL,
	[EffectiveDateFrom] [smalldatetime] NOT NULL,
	[EffectiveDateTo] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[luSectionReviewFrequency]                                 */

IF OBJECT_ID ( N'[dbo].[luSectionReviewFrequency]' ) IS NOT NULL
	DROP TABLE [dbo].[luSectionReviewFrequency];
GO
/****** Object:  Table [dbo].[luSectionReviewFrequency]    Script Date: 04/13/2007 09:41:55 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[luSectionReviewFrequency](
	[Id] [uniqueidentifier] NOT NULL,
	[LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[EffectiveDateFrom] [smalldatetime] NOT NULL,
	[EffectiveDateTo] [smalldatetime] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSection]                                    */

IF OBJECT_ID ( N'[dbo].[ProfileVersionSection]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSection];
GO
/****** Object:  Table [dbo].[ProfileVersionSection]    Script Date: 04/13/2007 09:41:57 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileVersionSection](
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[TechnicalReviewFrequency] [uniqueidentifier] NULL,
	[PolicyReviewFrequency] [uniqueidentifier] NULL,
	[NextTechnicalReview] [smalldatetime] NULL,
	[NextPolicyReview] [smalldatetime] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[LegislativeReference]                                     */

IF OBJECT_ID ( N'[dbo].[LegislativeReference]' ) IS NOT NULL
	DROP TABLE [dbo].[LegislativeReference];
GO
/****** Object:  Table [dbo].[LegislativeReference]    Script Date: 04/13/2007 09:41:59 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[LegislativeReference](
	[Id] [uniqueidentifier] NOT NULL,
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[NoteText] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[luDataFieldType]                                          */

IF OBJECT_ID ( N'[dbo].[luDataFieldType]' ) IS NOT NULL
	DROP TABLE [dbo].[luDataFieldType];
GO
/****** Object:  Table [dbo].[luDataFieldType]    Script Date: 04/13/2007 09:42:01 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[luDataFieldType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[SqlType] [varchar](50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[luProfileUserRole]                                        */

IF OBJECT_ID ( N'[dbo].[luProfileUserRole]' ) IS NOT NULL
	DROP TABLE [dbo].[luProfileUserRole];
GO
/****** Object:  Table [dbo].[luProfileUserRole]    Script Date: 04/13/2007 09:42:03 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[luProfileUserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[IsContributor] [bit] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCategory]                                   */

IF OBJECT_ID ( N'[dbo].[PrioritisationCategory]' ) IS NOT NULL
	DROP TABLE [dbo].[PrioritisationCategory];
GO
/****** Object:  Table [dbo].[PrioritisationCategory]    Script Date: 04/13/2007 09:42:05 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PrioritisationCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterion]                                  */

IF OBJECT_ID ( N'[dbo].[PrioritisationCriterion]' ) IS NOT NULL
	DROP TABLE [dbo].[PrioritisationCriterion];
GO
/****** Object:  Table [dbo].[PrioritisationCriterion]    Script Date: 04/13/2007 09:42:07 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PrioritisationCriterion](
	[Id] [uniqueidentifier] NOT NULL,
	[PrioritisationCategoryId] [uniqueidentifier] NOT NULL,
	[Code] [varchar](5) COLLATE Latin1_General_CI_AS NOT NULL,
	[Name] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[Weighting] [int] NOT NULL,
	[MappingFlag] [uniqueidentifier] NULL,
	[TrueMapping] [uniqueidentifier] NOT NULL,
	[FalseMapping] [uniqueidentifier] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterionValue]                             */

IF OBJECT_ID ( N'[dbo].[PrioritisationCriterionValue]' ) IS NOT NULL
	DROP TABLE [dbo].[PrioritisationCriterionValue];
GO
/****** Object:  Table [dbo].[PrioritisationCriterionValue]    Script Date: 04/13/2007 09:42:09 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PrioritisationCriterionValue](
	[Id] [uniqueidentifier] NOT NULL,
	[PrioritisationCriterionId] [uniqueidentifier] NOT NULL,
	[CriterionValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Score] [int] NOT NULL,
	[SequenceNumber] tinyint NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationRankingRange]                               */

IF OBJECT_ID ( N'[dbo].[PrioritisationRankingRange]' ) IS NOT NULL
	DROP TABLE [dbo].[PrioritisationRankingRange];
GO
/****** Object:  Table [dbo].[PrioritisationRankingRange]    Script Date: 04/13/2007 09:42:11 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PrioritisationRankingRange](
	[Id] [uniqueidentifier] NOT NULL,
	[LowerBound] [int] NOT NULL,
	[UpperBound] [int] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTable]                                           */

IF OBJECT_ID ( N'[dbo].[ReferenceTable]' ) IS NOT NULL
	DROP TABLE [dbo].[ReferenceTable];
GO
/****** Object:  Table [dbo].[ReferenceTable]    Script Date: 04/13/2007 09:42:13 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReferenceTable](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[IsMaintainable] [bit] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileQuestion]                                          */

IF OBJECT_ID ( N'[dbo].[ProfileQuestion]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileQuestion];
GO
/****** Object:  Table [dbo].[ProfileQuestion]    Script Date: 04/13/2007 09:42:15 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileQuestion](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[ShortName] [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[QuestionNumber] [int] NOT NULL,
	[IsPerSpecies] [bit] NOT NULL,
	[IsRepeating] [bit] NOT NULL,
	[UserGuidance] [text] COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileField]                                             */

IF OBJECT_ID ( N'[dbo].[ProfileField]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileField];
GO
/****** Object:  Table [dbo].[ProfileField]    Script Date: 04/13/2007 09:42:17 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileField](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[ShortName] [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
	[ProfileQuestionId] [uniqueidentifier] NOT NULL,
	[FieldNumber] [int] NOT NULL,
	[DataFieldTypeId] [uniqueidentifier] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[ReferenceTableId] [uniqueidentifier] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[User]                                                     */

IF OBJECT_ID ( N'[dbo].[User]' ) IS NOT NULL
	DROP TABLE [dbo].[User];
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/13/2007 09:42:19 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[FullName] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[Organisation] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[IsProfileEditor] [bit] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileUser]                                              */

IF OBJECT_ID ( N'[dbo].[ProfileUser]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileUser];
GO
/****** Object:  Table [dbo].[ProfileUser]    Script Date: 04/13/2007 09:42:22 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileUser](
	[UserId] [uniqueidentifier] NOT NULL,
	[ProfileId] [uniqueidentifier] NOT NULL,
	[ProfileUserRoleId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[Species]                                                  */

IF OBJECT_ID ( N'[dbo].[Species]' ) IS NOT NULL
	DROP TABLE [dbo].[Species];
GO
/****** Object:  Table [dbo].[Species]    Script Date: 04/13/2007 09:42:24 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Species](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[CommercialTrade] [uniqueidentifier] NOT NULL,
	[ImportanceOfExportTrade] [uniqueidentifier] NOT NULL,
	[ImpactOnLevelOfImports] [uniqueidentifier] NOT NULL,
	[ImpactOnIntraCommunityFlows] [uniqueidentifier] NOT NULL,
	[ImpactOnThirdCountryFlows] [uniqueidentifier] NOT NULL,
	[ExportMarketValue] [uniqueidentifier] NOT NULL,
	[SequenceNumber] [int] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpecies]                                    */

IF OBJECT_ID ( N'[dbo].[ProfileVersionSpecies]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSpecies];
GO
/****** Object:  Table [dbo].[ProfileVersionSpecies]    Script Date: 04/13/2007 09:42:26 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileVersionSpecies](
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	[SpeciesAffectedComments] [text] COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesPrioritisation]                      */

IF OBJECT_ID ( N'[dbo].[ProfileVersionSpeciesPrioritisation]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSpeciesPrioritisation];
GO
/****** Object:  Table [dbo].[ProfileVersionSpeciesPrioritisation]    Script Date: 04/13/2007 09:42:28 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileVersionSpeciesPrioritisation](
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	[PrioritisationCriterionValueId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesQuestion]                            */

IF OBJECT_ID ( N'[dbo].[ProfileVersionSpeciesQuestion]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSpeciesQuestion];
GO
/****** Object:  Table [dbo].[ProfileVersionSpeciesQuestion]    Script Date: 04/13/2007 09:42:30 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProfileVersionSpeciesQuestion](
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	[ProfileQuestionId] [uniqueidentifier] NOT NULL,
	[CopyOfSpeciesId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTableAuditLog]                                   */

IF OBJECT_ID ( N'[dbo].[ReferenceTableAuditLog]' ) IS NOT NULL
	DROP TABLE [dbo].[ReferenceTableAuditLog];
GO
/****** Object:  Table [dbo].[ReferenceTableAuditLog]    Script Date: 04/13/2007 09:42:32 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReferenceTableAuditLog](
	[Id] [uniqueidentifier] NOT NULL,
	[ReferenceTableId] [uniqueidentifier] NOT NULL,
	[ReferenceValueId] [uniqueidentifier] NOT NULL,
	[OldLookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[NewLookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EffectiveDate] [smalldatetime] NOT NULL,
	[LogDate] [smalldatetime] NOT NULL,
	[Reason] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceValue]                                           */

IF OBJECT_ID ( N'[dbo].[ReferenceValue]' ) IS NOT NULL
	DROP TABLE [dbo].[ReferenceValue];
GO
/****** Object:  Table [dbo].[ReferenceValue]    Script Date: 04/13/2007 09:42:34 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReferenceValue](
	[Id] [uniqueidentifier] NOT NULL,
	[ReferenceTableId] [uniqueidentifier] NOT NULL,
	[LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[SequenceNumber] [tinyint] NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ReviewComment]                                            */

IF OBJECT_ID ( N'[dbo].[ReviewComment]' ) IS NOT NULL
	DROP TABLE [dbo].[ReviewComment];
GO
/****** Object:  Table [dbo].[ReviewComment]    Script Date: 04/13/2007 09:42:36 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReviewComment](
	[Id] [uniqueidentifier] NOT NULL,
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[CommentReference] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[Comment] [text] COLLATE Latin1_General_CI_AS NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[ScientificPaperReference]                                 */

IF OBJECT_ID ( N'[dbo].[ScientificPaperReference]' ) IS NOT NULL
	DROP TABLE [dbo].[ScientificPaperReference];
GO
/****** Object:  Table [dbo].[ScientificPaperReference]    Script Date: 04/13/2007 09:42:38 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ScientificPaperReference](
	[Id] [uniqueidentifier] NOT NULL,
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[NoteText] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[SourceOfFurtherInformation]                               */

IF OBJECT_ID ( N'[dbo].[SourceOfFurtherInformation]' ) IS NOT NULL
	DROP TABLE [dbo].[SourceOfFurtherInformation];
GO
/****** Object:  Table [dbo].[SourceOfFurtherInformation]    Script Date: 04/13/2007 09:42:40 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SourceOfFurtherInformation](
	[Id] [uniqueidentifier] NOT NULL,
	[ProfileVersionId] [uniqueidentifier] NOT NULL,
	[ProfileSectionId] [uniqueidentifier] NOT NULL,
	[NoteText] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesField]                                             */

IF OBJECT_ID ( N'[dbo].[SpeciesField]' ) IS NOT NULL
	DROP TABLE [dbo].[SpeciesField];
GO
/****** Object:  Table [dbo].[SpeciesField]    Script Date: 04/13/2007 09:42:42 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SpeciesField](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[ShortName] [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
	[FieldNumber] [int] NOT NULL,
	[ReferenceTableId] [uniqueidentifier] NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLog]                                     */

IF OBJECT_ID ( N'[dbo].[SpeciesTableAuditLog]' ) IS NOT NULL
	DROP TABLE [dbo].[SpeciesTableAuditLog];
GO
/****** Object:  Table [dbo].[SpeciesTableAuditLog]    Script Date: 04/13/2007 09:42:45 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SpeciesTableAuditLog](
	[Id] [uniqueidentifier] NOT NULL,
	[SpeciesId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EffectiveDate] [smalldatetime] NOT NULL,
	[LogDate] [smalldatetime] NOT NULL,
	[Reason] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]


/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLogEntry]                                */

IF OBJECT_ID ( N'[dbo].[SpeciesTableAuditLogEntry]' ) IS NOT NULL
	DROP TABLE [dbo].[SpeciesTableAuditLogEntry];
GO
/****** Object:  Table [dbo].[SpeciesTableAuditLogEntry]    Script Date: 04/13/2007 09:42:47 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SpeciesTableAuditLogEntry](
	[Id] [uniqueidentifier] NOT NULL,
	[SpeciesTableAuditLogId] [uniqueidentifier] NOT NULL,
	[SpeciesFieldId] [uniqueidentifier] NOT NULL,
	[OldValue] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[NewValue] [varchar](255) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]

-- ***** IDX_UserTable ***** --

/*                                                                            */
/* USER_TABLE: [dbo].[LegislativeReference]                                     */


ALTER TABLE [dbo].[LegislativeReference] ADD  CONSTRAINT [PK_LegislativeReference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSection]                                    */


ALTER TABLE [dbo].[ProfileVersionSection] ADD  CONSTRAINT [PK_ProfileVersionSection] PRIMARY KEY CLUSTERED 
(
	[ProfileVersionId] ASC,
	[ProfileSectionId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileSection]                                           */


ALTER TABLE [dbo].[ProfileSection] ADD  CONSTRAINT [PK_ProfileSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersion]                                           */


ALTER TABLE [dbo].[ProfileVersion] ADD  CONSTRAINT [PK_ProfileVersion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[luProfileVersionState]                                    */


ALTER TABLE [dbo].[luProfileVersionState] ADD  CONSTRAINT [PK_luProfileVersionState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[Profile]                                                  */


ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[luSectionReviewFrequency]                                 */


ALTER TABLE [dbo].[luSectionReviewFrequency] ADD  CONSTRAINT [PK_luSectionReviewFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[luDataFieldType]                                          */


ALTER TABLE [dbo].[luDataFieldType] ADD  CONSTRAINT [PK_luDataFieldType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[luProfileUserRole]                                        */


ALTER TABLE [dbo].[luProfileUserRole] ADD  CONSTRAINT [PK_luProfileUserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCategory]                                   */


ALTER TABLE [dbo].[PrioritisationCategory] ADD  CONSTRAINT [PK_PrioritisationCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterion]                                  */


ALTER TABLE [dbo].[PrioritisationCriterion] ADD  CONSTRAINT [PK_PrioritisationCriterion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterionValue]                             */


ALTER TABLE [dbo].[PrioritisationCriterionValue] ADD  CONSTRAINT [PK_PrioritisationCriterionValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationRankingRange]                               */


ALTER TABLE [dbo].[PrioritisationRankingRange] ADD  CONSTRAINT [PK_PrioritisationRankingRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileField]                                             */


ALTER TABLE [dbo].[ProfileField] ADD  CONSTRAINT [PK_ProfileField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTable]                                           */


ALTER TABLE [dbo].[ReferenceTable] ADD  CONSTRAINT [PK_ReferenceTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileQuestion]                                          */


ALTER TABLE [dbo].[ProfileQuestion] ADD  CONSTRAINT [PK_ProfileQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileUser]                                              */


ALTER TABLE [dbo].[ProfileUser] ADD  CONSTRAINT [PK_ProfileUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProfileId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[User]                                                     */


ALTER TABLE [dbo].[User] ADD  CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpecies]                                    */


ALTER TABLE [dbo].[ProfileVersionSpecies] ADD  CONSTRAINT [PK_ProfileVersionSpecies] PRIMARY KEY CLUSTERED 
(
	[ProfileVersionId] ASC,
	[SpeciesId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[Species]                                                  */


ALTER TABLE [dbo].[Species] ADD  CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesPrioritisation]                      */


ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] ADD  CONSTRAINT [PK_ProfileVersionSpeciesPrioritisation] PRIMARY KEY CLUSTERED 
(
	[ProfileVersionId] ASC,
	[SpeciesId] ASC,
	[PrioritisationCriterionValueId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesQuestion]                            */


ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion] ADD  CONSTRAINT [PK_ProfileVersionSpeciesQuestion] PRIMARY KEY CLUSTERED 
(
	[ProfileVersionId] ASC,
	[SpeciesId] ASC,
	[ProfileQuestionId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTableAuditLog]                                   */


ALTER TABLE [dbo].[ReferenceTableAuditLog] ADD  CONSTRAINT [PK_ReferenceTableAuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceValue]                                           */


ALTER TABLE [dbo].[ReferenceValue] ADD  CONSTRAINT [PK_ReferenceValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ReviewComment]                                            */


ALTER TABLE [dbo].[ReviewComment] ADD  CONSTRAINT [PK_ReviewComment2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[ScientificPaperReference]                                 */


ALTER TABLE [dbo].[ScientificPaperReference] ADD  CONSTRAINT [PK_ScientificPaperReference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[SourceOfFurtherInformation]                               */


ALTER TABLE [dbo].[SourceOfFurtherInformation] ADD  CONSTRAINT [PK_SourceOfFurtherInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesField]                                             */


ALTER TABLE [dbo].[SpeciesField] ADD  CONSTRAINT [PK_SpeciesField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLog]                                     */


ALTER TABLE [dbo].[SpeciesTableAuditLog] ADD  CONSTRAINT [PK_SpeciesTableAuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLogEntry]                                */


ALTER TABLE [dbo].[SpeciesTableAuditLogEntry] ADD  CONSTRAINT [PK_SpeciesTableAuditLogEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]

-- ***** DEF_UserTable ***** --

/*                                                                            */
/* USER_TABLE: [dbo].[LegislativeReference]                                     */

ALTER TABLE [dbo].[LegislativeReference] ADD  CONSTRAINT [DF_LegislativeReference_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersion]                                           */

ALTER TABLE [dbo].[ProfileVersion] ADD  CONSTRAINT [DF_ProfileVersion_Id]  DEFAULT (newid()) FOR [Id]
ALTER TABLE [dbo].[ProfileVersion] ADD  CONSTRAINT [DF_ProfileVersion_Description]  DEFAULT ('') FOR [Description]

/*                                                                            */
/* USER_TABLE: [dbo].[luProfileVersionState]                                    */

ALTER TABLE [dbo].[luProfileVersionState] ADD  CONSTRAINT [DF_luProfileVersionState_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[Profile]                                                  */

ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[luSectionReviewFrequency]                                 */

ALTER TABLE [dbo].[luSectionReviewFrequency] ADD  CONSTRAINT [DF_luSectionReviewFrequency_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[luDataFieldType]                                          */

ALTER TABLE [dbo].[luDataFieldType] ADD  CONSTRAINT [DF_luDataFieldType_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[luProfileUserRole]                                        */

ALTER TABLE [dbo].[luProfileUserRole] ADD  CONSTRAINT [DF_luProfileUserRole_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCategory]                                   */

ALTER TABLE [dbo].[PrioritisationCategory] ADD  CONSTRAINT [DF_PrioritisationCategory_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterion]                                  */

ALTER TABLE [dbo].[PrioritisationCriterion] ADD  CONSTRAINT [DF_PrioritisationCriterion_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterionValue]                             */

ALTER TABLE [dbo].[PrioritisationCriterionValue] ADD  CONSTRAINT [DF_PrioritisationCriterionValue_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationRankingRange]                               */

ALTER TABLE [dbo].[PrioritisationRankingRange] ADD  CONSTRAINT [DF_PrioritisationRankingRange_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileField]                                             */

ALTER TABLE [dbo].[ProfileField] ADD  CONSTRAINT [DF_ProfileField_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTable]                                           */

ALTER TABLE [dbo].[ReferenceTable] ADD  CONSTRAINT [DF_ReferenceTable_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileQuestion]                                          */

ALTER TABLE [dbo].[ProfileQuestion] ADD  CONSTRAINT [DF_ProfileQuestion_Id]  DEFAULT (newid()) FOR [Id]
ALTER TABLE [dbo].[ProfileQuestion] ADD  CONSTRAINT [DF_ProfileQuestion_IsRepeating]  DEFAULT ((0)) FOR [IsRepeating]

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileUser]                                              */

ALTER TABLE [dbo].[ProfileUser] ADD  CONSTRAINT [DF_ProfileUser_UserId]  DEFAULT (newid()) FOR [UserId]

/*                                                                            */
/* USER_TABLE: [dbo].[User]                                                     */

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAdmin]  DEFAULT ((0)) FOR [IsProfileEditor]

/*                                                                            */
/* USER_TABLE: [dbo].[Species]                                                  */

ALTER TABLE [dbo].[Species] ADD  CONSTRAINT [DF_Species_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTableAuditLog]                                   */

ALTER TABLE [dbo].[ReferenceTableAuditLog] ADD  CONSTRAINT [DF_ReferenceTableAuditLog_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceValue]                                           */

ALTER TABLE [dbo].[ReferenceValue] ADD  CONSTRAINT [DF_ReferenceValue_Id]  DEFAULT (newid()) FOR [Id]
ALTER TABLE [dbo].[ReferenceValue] ADD  CONSTRAINT [DF_ReferenceValue_SequenceNumber]  DEFAULT ((0)) FOR [SequenceNumber]

/*                                                                            */
/* USER_TABLE: [dbo].[ReviewComment]                                            */

ALTER TABLE [dbo].[ReviewComment] ADD  CONSTRAINT [DF_ReviewComment2_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[ScientificPaperReference]                                 */

ALTER TABLE [dbo].[ScientificPaperReference] ADD  CONSTRAINT [DF_ScientificPaperReference_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[SourceOfFurtherInformation]                               */

ALTER TABLE [dbo].[SourceOfFurtherInformation] ADD  CONSTRAINT [DF_SourceOfFurtherInformation_Id]  DEFAULT (newid()) FOR [Id]

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesField]                                             */

ALTER TABLE [dbo].[SpeciesField] ADD  CONSTRAINT [DF_SpeciesField_Id]  DEFAULT (newid()) FOR [Id]

-- ***** CHK_UserTable ***** --

-- ***** FK_UserTable ***** --

/*                                                                            */
/* USER_TABLE: [dbo].[LegislativeReference]                                     */

ALTER TABLE [dbo].[LegislativeReference]  WITH CHECK ADD  CONSTRAINT [FK_LegislativeReference_ProfileVersionSection] FOREIGN KEY([ProfileVersionId], [ProfileSectionId])
REFERENCES [dbo].[ProfileVersionSection] ([ProfileVersionId], [ProfileSectionId])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSection]                                    */

ALTER TABLE [dbo].[ProfileVersionSection]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSection_luSectionReviewFrequency] FOREIGN KEY([TechnicalReviewFrequency])
REFERENCES [dbo].[luSectionReviewFrequency] ([Id])
ALTER TABLE [dbo].[ProfileVersionSection]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSection_luSectionReviewFrequency1] FOREIGN KEY([PolicyReviewFrequency])
REFERENCES [dbo].[luSectionReviewFrequency] ([Id])
ALTER TABLE [dbo].[ProfileVersionSection]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSection_ProfileSection] FOREIGN KEY([ProfileSectionId])
REFERENCES [dbo].[ProfileSection] ([Id])
ALTER TABLE [dbo].[ProfileVersionSection]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSection_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [dbo].[ProfileVersion] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersion]                                           */

ALTER TABLE [dbo].[ProfileVersion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersion_luProfileVersionState] FOREIGN KEY([ProfileVersionStateId])
REFERENCES [dbo].[luProfileVersionState] ([Id])
ALTER TABLE [dbo].[ProfileVersion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersion_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterion]                                  */

ALTER TABLE [dbo].[PrioritisationCriterion]  WITH CHECK ADD  CONSTRAINT [FK_PrioritisationCriterion_PrioritisationCategory] FOREIGN KEY([PrioritisationCategoryId])
REFERENCES [dbo].[PrioritisationCategory] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[PrioritisationCriterionValue]                             */

ALTER TABLE [dbo].[PrioritisationCriterionValue]  WITH CHECK ADD  CONSTRAINT [FK_PrioritisationCriterionValue_PrioritisationCriterion] FOREIGN KEY([PrioritisationCriterionId])
REFERENCES [dbo].[PrioritisationCriterion] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileField]                                             */

ALTER TABLE [dbo].[ProfileField]  WITH CHECK ADD  CONSTRAINT [FK_ProfileField_luDataFieldType] FOREIGN KEY([DataFieldTypeId])
REFERENCES [dbo].[luDataFieldType] ([Id])
ALTER TABLE [dbo].[ProfileField]  WITH CHECK ADD  CONSTRAINT [FK_ProfileField_ProfileQuestion] FOREIGN KEY([ProfileQuestionId])
REFERENCES [dbo].[ProfileQuestion] ([Id])
ALTER TABLE [dbo].[ProfileField]  WITH CHECK ADD  CONSTRAINT [FK_ProfileField_ReferenceTable] FOREIGN KEY([ReferenceTableId])
REFERENCES [dbo].[ReferenceTable] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileQuestion]                                          */

ALTER TABLE [dbo].[ProfileQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileQuestion_ProfileSection] FOREIGN KEY([ProfileSectionId])
REFERENCES [dbo].[ProfileSection] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileUser]                                              */

ALTER TABLE [dbo].[ProfileUser]  WITH CHECK ADD  CONSTRAINT [FK_ProfileUser_luProfileUserRole] FOREIGN KEY([ProfileUserRoleId])
REFERENCES [dbo].[luProfileUserRole] ([Id])
ALTER TABLE [dbo].[ProfileUser]  WITH CHECK ADD  CONSTRAINT [FK_ProfileUser_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([Id])
ALTER TABLE [dbo].[ProfileUser]  WITH CHECK ADD  CONSTRAINT [FK_ProfileUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpecies]                                    */

ALTER TABLE [dbo].[ProfileVersionSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpecies_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [dbo].[ProfileVersion] ([Id])
ALTER TABLE [dbo].[ProfileVersionSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpecies_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[Species]                                                  */

ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species_Species] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Species] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesPrioritisation]                      */

ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue] FOREIGN KEY([PrioritisationCriterionValueId])
REFERENCES [dbo].[PrioritisationCriterionValue] ([Id])
ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_ProfileVersion] FOREIGN KEY([ProfileVersionId])
REFERENCES [dbo].[ProfileVersion] ([Id])
ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ProfileVersionSpeciesQuestion]                            */

ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileQuestion] FOREIGN KEY([ProfileQuestionId])
REFERENCES [dbo].[ProfileQuestion] ([Id])
ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
ALTER TABLE [dbo].[ProfileVersionSpeciesQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesQuestion_ProfileVersionSpecies1] FOREIGN KEY([ProfileVersionId], [CopyOfSpeciesId])
REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceTableAuditLog]                                   */

ALTER TABLE [dbo].[ReferenceTableAuditLog]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceTableAuditLog_ReferenceTable] FOREIGN KEY([ReferenceTableId])
REFERENCES [dbo].[ReferenceTable] ([Id])
ALTER TABLE [dbo].[ReferenceTableAuditLog]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceTableAuditLog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ReferenceValue]                                           */

ALTER TABLE [dbo].[ReferenceValue]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceValue_ReferenceTable] FOREIGN KEY([ReferenceTableId])
REFERENCES [dbo].[ReferenceTable] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[ReviewComment]                                            */

ALTER TABLE [dbo].[ReviewComment]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComment_ProfileVersionSection] FOREIGN KEY([ProfileVersionId], [ProfileSectionId])
REFERENCES [dbo].[ProfileVersionSection] ([ProfileVersionId], [ProfileSectionId])

/*                                                                            */
/* USER_TABLE: [dbo].[ScientificPaperReference]                                 */

ALTER TABLE [dbo].[ScientificPaperReference]  WITH CHECK ADD  CONSTRAINT [FK_ScientificPaperReference_ProfileVersionSection] FOREIGN KEY([ProfileVersionId], [ProfileSectionId])
REFERENCES [dbo].[ProfileVersionSection] ([ProfileVersionId], [ProfileSectionId])

/*                                                                            */
/* USER_TABLE: [dbo].[SourceOfFurtherInformation]                               */

ALTER TABLE [dbo].[SourceOfFurtherInformation]  WITH CHECK ADD  CONSTRAINT [FK_SourceOfFurtherInformation_ProfileVersionSection] FOREIGN KEY([ProfileVersionId], [ProfileSectionId])
REFERENCES [dbo].[ProfileVersionSection] ([ProfileVersionId], [ProfileSectionId])

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesField]                                             */

ALTER TABLE [dbo].[SpeciesField]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesField_ReferenceTable] FOREIGN KEY([ReferenceTableId])
REFERENCES [dbo].[ReferenceTable] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLog]                                     */

ALTER TABLE [dbo].[SpeciesTableAuditLog]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesTableAuditLog_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])
ALTER TABLE [dbo].[SpeciesTableAuditLog]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesTableAuditLog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])

/*                                                                            */
/* USER_TABLE: [dbo].[SpeciesTableAuditLogEntry]                                */

ALTER TABLE [dbo].[SpeciesTableAuditLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesField] FOREIGN KEY([SpeciesFieldId])
REFERENCES [dbo].[SpeciesField] ([Id])
ALTER TABLE [dbo].[SpeciesTableAuditLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesTableAuditLogEntry_SpeciesTableAuditLog] FOREIGN KEY([SpeciesTableAuditLogId])
REFERENCES [dbo].[SpeciesTableAuditLog] ([Id])

