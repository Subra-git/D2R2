	INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '1ED0595D-3E1A-49D4-B340-C0D41E17D045',
      
          'Summary'
        ,
      'Summary',
      1
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      'B71A47FA-7E4A-4CBA-B91C-C0D778068ABC',
      
          'Opportunity to add value'
        ,
      'Opportunity To Add Value',
      12
      )


	INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '164B8DA6-92BE-473B-B35C-585D72664E60',
      
          'Public and stakeholder perception'
        ,
      'Public And Stakeholder Perception',
      13
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '809D2408-82A1-45E1-9692-5CA76162D967',
      
          'Areas of uncertainty'
        ,
      'Areas Of Uncertainty',
      14
      )

 INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'1ED0595D-3E1A-49D4-B340-C0D41E17D045' -- Summary
FROM
	[ProfileVersion]

INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'B71A47FA-7E4A-4CBA-B91C-C0D778068ABC' -- Opportunity to add value
FROM
	[ProfileVersion]

INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'164B8DA6-92BE-473B-B35C-585D72664E60' -- Public and stakeholder perception
FROM
	[ProfileVersion]

INSERT INTO [ProfileVersionSection]
	(
	[ProfileVersionId],
	[ProfileSectionId]
	)
SELECT
	[Id],
	'809D2408-82A1-45E1-9692-5CA76162D967' -- Areas of uncertainty
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
      [UserGuidance]
      )
      VALUES
      (
      'd0086a85-e54b-4ca7-90e0-070915b76c3a',
      
          'Description'

      ,
      'Description',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      '602f2ca1-0db9-4e1c-a2b6-9bf708cb7ab0',
      
          'Affected species comments'

      ,
      'Affected Species Comments',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      '625eecf0-273d-410e-a251-d493cfbd54c4',
      
          'Revision history'

      ,
      'Revision History',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      'E15E60A1-639D-4FAC-9DFD-EA12E432CBC6',
      
          'Opportunity to add value summary'

      ,
      'Opportunity To Add Value Summary',
      'b71a47fa-7e4a-4cba-b91c-c0d778068abc',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      '7CCE0546-D9C0-4AAE-9ADA-A601819036DE',
      
          'Public and stakeholder perception summary'

      ,
      'Public And Stakeholder Perception Summary',
      '164b8da6-92be-473b-b35c-585d72664e60',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      'FD6AD7AC-5760-4652-9DDE-597CAEDEBD79',
      
          'FFG costs summary'

      ,
      'FFG Costs Summary',
      'a17946fe-1ffb-4e2e-9e3b-0284b6f5d168',
      8,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      [UserGuidance]
      )
      VALUES
      (
      '1D6EC9BC-76A9-4C7A-AEC8-DB3FB85F7DD1',
      
          'Areas of uncertainty summary'

      ,
      'Areas Of Uncertainty Summary',
      '809d2408-82a1-45e1-9692-5ca76162d967',
      1,
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
      [IsReadOnly]
      )
      VALUES
      (
      'E8177ECD-2028-48D0-9DCB-2C44ACBBEEDC',
      
          NULL
        ,
      'Description',
      'd0086a85-e54b-4ca7-90e0-070915b76c3a',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      '2B257288-DEAC-48CA-B137-1B2FA29C1F52',
      
          NULL
        ,
      'Affected Species Comments',
      '602f2ca1-0db9-4e1c-a2b6-9bf708cb7ab0',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      '1DEA58BE-575F-4A3D-9BD7-95E836759791',
      
          NULL
        ,
      'Revision History',
      '625eecf0-273d-410e-a251-d493cfbd54c4',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      'C69AA48F-94F0-451A-A733-1F50A4C18CFB',
      
          NULL
        ,
      'Opportunity To Add Value Summary',
      'e15e60a1-639d-4fac-9dfd-ea12e432cbc6',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      '8341765E-42DD-4EC8-A977-4C4181450F3D',
      
          NULL
        ,
      'Public And Stakeholder Perception Summary',
      '7cce0546-d9c0-4aae-9ada-a601819036de',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      '4376E65C-1319-4A06-987F-DA7A610BF78F',
      
          NULL
        ,
      'FFG Costs Summary',
      'fd6ad7ac-5760-4652-9dde-597caedebd79',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
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
      [IsReadOnly]
      )
      VALUES
      (
      '0FD52ACB-4095-407A-B6F1-E7FD020D0DBB',
      
          NULL
        ,
      'Areas Of Uncertainty Summary',
      '1d6ec9bc-76a9-4c7a-aec8-db3fb85f7dd1',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
      GO
      
      -- CREATE TABLE AreasOfUncertainty
        CREATE TABLE [dbo].[AreasOfUncertainty](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [AreasOfUncertaintySummary] text NULL,
        
        CONSTRAINT [PK_AreasOfUncertainty] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from AreasOfUncertainty to ProfileVersion table
        ALTER TABLE [dbo].[AreasOfUncertainty]  WITH CHECK ADD  CONSTRAINT [FK_AreasOfUncertainty_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      -- CREATE TABLE OpportunityToAddValue
        CREATE TABLE [dbo].[OpportunityToAddValue](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [OpportunityToAddValueSummary] text NULL,
        
        CONSTRAINT [PK_OpportunityToAddValue] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from OpportunityToAddValue to ProfileVersion table
        ALTER TABLE [dbo].[OpportunityToAddValue]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityToAddValue_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO      

    -- CREATE TABLE PublicAndStakeholderPerception
        CREATE TABLE [dbo].[PublicAndStakeholderPerception](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [PublicAndStakeholderPerceptionSummary] text NULL,
        
        CONSTRAINT [PK_PublicAndStakeholderPerception] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from PublicAndStakeholderPerception to ProfileVersion table
        ALTER TABLE [dbo].[PublicAndStakeholderPerception]  WITH CHECK ADD  CONSTRAINT [FK_PublicAndStakeholderPerception_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
 
    -- CREATE TABLE Summary
        CREATE TABLE [dbo].[Summary](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [Description] text NULL,
        
          [AffectedSpeciesComments] text NULL,
        
          [RevisionHistory] text NULL,
        
        CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from Summary to ProfileVersion table
        ALTER TABLE [dbo].[Summary]  WITH CHECK ADD  CONSTRAINT [FK_Summary_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
   
		ALTER TABLE [WiderSociety]
		ADD [FFGCostsSummary] text NULL
		GO
		
		INSERT INTO [Summary]
			(
			[ProfileVersionId],
			[Description],
			[AffectedSpeciesComments]
			)
		SELECT
			[Id],
			[Description],
			[AffectedSpeciesComments]
		FROM
			[ProfileVersion]
		GO
		
		INSERT INTO [AreasOfUncertainty]
			(
			[ProfileVersionId]
			)
		SELECT
			[Id]
		FROM
			[ProfileVersion]
		GO
		
		INSERT INTO [OpportunityToAddValue]
			(
			[ProfileVersionId]
			)
		SELECT
			[Id]
		FROM
			[ProfileVersion]
		GO
		
		INSERT INTO [PublicAndStakeholderPerception]
			(
			[ProfileVersionId]
			)
		SELECT
			[Id]
		FROM
			[ProfileVersion]
		GO

ALTER TABLE [ProfileVersion]
DROP DF_ProfileVersion_Description
GO

ALTER TABLE [ProfileVersion]
DROP COLUMN [Description]
GO

ALTER TABLE [ProfileVersion]
DROP COLUMN [AffectedSpeciesComments]
GO

UPDATE
	[ProfileField]
SET
	[Name] = 'Typical incubation period range (lower value)',
	[ShortName] = 'Incubation Period Typical Lower'
WHERE
	[Id] = '55C4B147-FFFE-438F-9000-74E51E2DE48E'

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
      [IsReadOnly]
      )
      VALUES
      (
      'D0B7A0FA-4A8F-4B3A-8658-77CC09A94B24',
      
          'Typical incubation period range (upper value)'
        ,
      'Incubation Period Typical Upper',
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      2,
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      1,
      NULL,0
      )

UPDATE
	[ProfileField]
SET
	[FieldNumber] = 3
WHERE
	[Id] = 'DDE32F7E-D15D-4791-BE95-8AC56EA7584D' --Incubation Period Minimum

UPDATE
	[ProfileField]
SET
	[FieldNumber] = 4
WHERE
	[Id] = '12FF0BBD-B7A2-4401-82B3-55A2E020FD8C' -- Incubation Period Maximum

GO

ALTER TABLE [EpidemiologySpecies]
ADD [IncubationPeriodTypicalLower] money NULL
GO

ALTER TABLE [EpidemiologySpecies]
ADD [IncubationPeriodTypicalUpper] money NULL
GO

UPDATE
	[EpidemiologySpecies]
SET
	[IncubationPeriodTypicalLower] = [IncubationPeriodTypical]
GO

ALTER TABLE [EpidemiologySpecies]
DROP COLUMN [IncubationPeriodTypical]
GO

-- changes for UATD05 Species Trade Data
ALTER TABLE [SpeciesField]
ADD [DataFieldTypeId] uniqueidentifier NULL
GO

ALTER TABLE [SpeciesField]
ADD [IsMandatory] bit NULL
GO

UPDATE
	[SpeciesField]
SET
	[DataFieldTypeId] = 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',  --list
	[IsMandatory] = 1

UPDATE
	[SpeciesField]
SET
	[DataFieldTypeId] = 'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0' -- text
WHERE
	[Name] = 'Name'

UPDATE
	[SpeciesField]
SET
	[IsMandatory] = 0
WHERE
	[Name] = 'Parent'

ALTER TABLE [SpeciesField]
ALTER COLUMN [DataFieldTypeId] uniqueidentifier NOT NULL
GO

ALTER TABLE [SpeciesField]
ALTER COLUMN [IsMandatory] bit NOT NULL
GO

ALTER TABLE [dbo].[SpeciesField]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesField_luDataFieldType] FOREIGN KEY([DataFieldTypeId])
REFERENCES [dbo].[luDataFieldType] ([Id])
GO

INSERT INTO [SpeciesField]
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
      '7641f411-ee1a-4135-a502-007ab080b41a',
      
          'Annual level of export consignments containing animals commodities of this species/group sent into third country trade: Supporting comments'
        ,
      'Impact On Third Country Flows Comments',
      12,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )

INSERT INTO [SpeciesField]
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
      '08c76c6d-48f6-477c-b123-6820707b09ec',
      
          'Is there substantial commercial trade in this species/group: Supporting comments'
        ,
      'Commercial Trade Comments',
      4,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          0        
      )

INSERT INTO [SpeciesField]
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
      '03477d37-30cc-4878-826a-9414dd288d63',
      
          'Export market value for this species/group: Supporting comments'
        ,
      'Export Market Value Comments',
      14,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
INSERT INTO [SpeciesField]
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
      '34119d63-c218-43e2-bebb-b2d91d57927d',
      
          'Potential level of imports for this species/group: Supporting comments'
        ,
      'Impact On Level Of Imports Comments',
      8,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
INSERT INTO [SpeciesField]
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
      'fe30e671-91eb-4f12-ab47-deb08473dfe7',
      
          'Relative importance of export trade to the industry sector: Supporting comments'
        ,
      'Importance Of Export Trade Comments',
      6,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
      INSERT INTO [SpeciesField]
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
      '615589a7-8fe3-4070-82db-ea4161c346e0',
      
          'Annual level of export consignments containing animals/commodities in this species/group sent into intracommunity trade: Supporting comments'
        ,
      'Impact On Intra Community Flows Comments',
      10,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
      UPDATE
		[SpeciesField]
	SET
		[FieldNumber] = 5
	WHERE
		[ShortName] = 'Importance Of Export Trade'
		
	 UPDATE
		[SpeciesField]
	SET
		[FieldNumber] = 7
	WHERE
		[ShortName] = 'Impact On Level Of Imports'

      UPDATE
		[SpeciesField]
	SET
		[FieldNumber] = 9
	WHERE
		[ShortName] = 'Impact On Intra Community Flows'

      UPDATE
		[SpeciesField]
	SET
		[FieldNumber] = 11
	WHERE
		[ShortName] = 'Impact On Third Country Flows'

      UPDATE
		[SpeciesField]
	SET
		[FieldNumber] = 13
	WHERE
		[ShortName] = 'Export Market Value'
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

UPDATE
	[Species]
SET
	[CommercialTradeComments] = 'Not commercially traded',
	[ImportanceOfExportTradeComments] = 'Not commercially traded',
	[ImpactOnLevelOfImportsComments] = 'Not commercially traded',
	[ImpactOnIntraCommunityFlowsComments] = 'Not commercially traded',
	[ImpactOnThirdCountryFlowsComments] = 'Not commercially traded',
	[ExportMarketValueComments] = 'Not commercially traded'
WHERE
	[CommercialTrade] = '5d3b5094-2432-47c5-b3b0-b15e317fb5d6' -- not commercially traded
	
UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Commercial Trade Comments'

UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Importance Of Export Trade Comments'

UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Impact On Level Of Imports Comments'
	
UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Impact On Intra Community Flows Comments'

UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Impact On Third Country Flows Comments'
	
UPDATE
	[ProfileField]
SET
	[IsReadOnly] = 1
WHERE
	[ShortName] = 'Export Market Value Comments'
GO

-- changes for the move to 4 profile reports rather than just the 1
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