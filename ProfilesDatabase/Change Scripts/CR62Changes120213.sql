--- CR62Changes.SQL: Adding new Profile Section 'Farming significance' ---

--- SUMMARY OF SCRIPT STEPS ----
--- 1. Delete any existing 'Farming significance' profile on the system 
--- 2. Create new 'Farming significance' profile section
--- 3. Map Profile Section to all Profile Versions
--- 4. Create new Profile Questions, fields and options with variables
		-- Questions 1-6 have 6 drop down options with supporting text box
		-- Questions 7-8 have multiple tick boxes with supporting text box
		-- Question 9 has a text box only
--- 5. Insert data created in step 4 into tables


------------ Script Settings ------------
SET NOCOUNT ON
-----------------------------------------

BEGIN TRAN

-- STEP 1. Delete any existing 'Farming significance' profile on the system 

	DECLARE @ProfileSectionId uniqueidentifier
	DECLARE @ProfileQuestionIds TABLE (Id uniqueidentifier)
	DECLARE @ProfileFieldIds TABLE (Id uniqueidentifier)
	DECLARE @ReferenceTableIds TABLE (Id uniqueidentifier)
	DECLARE @ReferenceValueIds TABLE (Id uniqueidentifier)
	SET @ProfileSectionId = '71068C3E-8D56-49BB-AA05-A91F5E1471E1'

	INSERT INTO @ProfileQuestionIds 
	SELECT Id FROM [dbo].[ProfileQuestion]
	WHERE ProfileSectionId = @ProfileSectionId

	INSERT INTO @ProfileFieldIds 
	SELECT Id FROM [dbo].[ProfileField]
	WHERE ProfileQuestionId IN
	(
		SELECT * FROM @ProfileQuestionIds
	)

	INSERT INTO @ReferenceTableIds 
	SELECT Id FROM [dbo].[ReferenceTable]
	WHERE Id IN
	(
		SELECT ReferenceTableId FROM [dbo].[ProfileField]
		WHERE Id IN
		(
			SELECT * FROM @ProfileFieldIds
		)
	)

	INSERT INTO @ReferenceValueIds
	SELECT Id FROM [dbo].[ReferenceValue]
	WHERE ReferenceTableId IN
	(
		SELECT * FROM @ReferenceTableIds
	)

	-- Delete Profile Section Users
	DELETE FROM [dbo].[ProfileSectionUser]
	WHERE ProfileSectionId = @ProfileSectionId

	-- Delete Profile Version Field Values
	DELETE FROM [dbo].[ProfileVersionFieldValue]
	WHERE ProfileFieldId IN
	(
		SELECT * FROM @ProfileFieldIds
	)

	-- Delete Profile Fields
	DELETE FROM [dbo].[ProfileField]
	WHERE Id IN 
	(
		SELECT * FROM @ProfileFieldIds
	)

	-- Delete Reference Values
	DELETE FROM [dbo].[ReferenceValue]
	WHERE Id IN
	(
		SELECT * FROM @ReferenceValueIds
	)

	-- Delete Reference tables
	DELETE FROM [dbo].[ReferenceTable]
	WHERE Id IN
	(
		SELECT * FROM @ReferenceTableIds
	)

	-- Delete Profile Questions
	DELETE FROM [dbo].[ProfileQuestion]
	WHERE Id IN 
	(
		SELECT * FROM @ProfileQuestionIds
	)

	-- Delete Review Comments
	DELETE FROM [dbo].[ReviewComment]
	WHERE ProfileSectionId = @ProfileSectionId

	-- Delete Profile Version Note Questions
	DELETE FROM [dbo].[ProfileVersionNoteQuestion]
	WHERE ProfileSectionId = @ProfileSectionId

	-- Delete Profile Version Section Users
	DELETE FROM [dbo].[ProfileVersionSectionUser]
	WHERE ProfileSectionId = @ProfileSectionId

	-- Delete Profile Version Sections
	DELETE FROM [dbo].[ProfileVersionSection]
	WHERE ProfileSectionId = @ProfileSectionId

	-- Delete Profile
	DELETE FROM [dbo].[ProfileSection]
	WHERE Id = @ProfileSectionId

	GO

-- STEP 2. Create new 'Farming significance' profile section

	DECLARE @ProfileSectionId uniqueidentifier
	DECLARE @Name varchar(200)
	DECLARE @ShortName varchar(80)
	DECLARE @SectionNumber int
	DECLARE @Note nvarchar(1000)

	SET @ProfileSectionId = '71068C3E-8D56-49BB-AA05-A91F5E1471E1'
	SET @Name = 'Farming significance'
	SET @ShortName = 'Farming significance'
	SET @SectionNumber = 17
	SET @Note = NULL

	IF NOT EXISTS (SELECT * FROM [dbo].[ProfileSection] WHERE [Id] = @ProfileSectionId)
	BEGIN

		INSERT INTO [dbo].[ProfileSection]
		(
			[Id]
			, [Name]
			, [ShortName]
			, [SectionNumber]
			, [Note]
		)
		VALUES
		(
			@ProfileSectionId
			, @Name
			, @ShortName
			, @SectionNumber
			, @Note
		)
	END

-- STEP 3. Map Profile Section to all Profile Versions

	-- Lookup Values For Review Frequencies
	DECLARE @ReviewFrequency_Annually uniqueidentifier
	DECLARE @ReviewFrequency_Every6Months uniqueidentifier
	DECLARE @ReviewFrequency_Every2Years uniqueidentifier
	DECLARE @ReviewFrequency_Quarterly uniqueidentifier
	SET @ReviewFrequency_Annually = '06788E48-149B-4B04-8EB6-40104E174E12'
	SET @ReviewFrequency_Every6Months = 'EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB'
	SET @ReviewFrequency_Every2Years = '90D4AC32-2598-49B5-A3A8-9F1A5F854ED7'
	SET @ReviewFrequency_Quarterly = '37481649-5986-47E8-B91D-BD73EBB479EB'
	
	-- Lookup Values for Review Status
	DECLARE @ReviewStatus_Active uniqueidentifier	 
	DECLARE @ReviewStatus_Proposed uniqueidentifier
	DECLARE @ReviewStatus_Complete uniqueidentifier	
	SET @ReviewStatus_Active = '20396B82-3122-4EBC-94DC-455F93A31C86' 
	SET @ReviewStatus_Proposed = 'E3402606-AC66-4D56-B407-B5BDF7E4DBD6'  
	SET @ReviewStatus_Complete = '16597B30-26E5-4BCB-8DBB-D8D8585CFAC3'
	
	-- Prepare profile version section data
	DECLARE @ProfileVersionId uniqueidentifier 
	DECLARE @TechnicalReviewFrequency uniqueidentifier
	DECLARE @PolicyReviewFrequency uniqueidentifier
	DECLARE @NextTechnicalReview smalldatetime
	DECLARE @NextPolicyReview smalldatetime
	DECLARE @PolicyReviewStatusId uniqueidentifier
	DECLARE @TechnicalReviewStatusId uniqueidentifier
	DECLARE @PolicyReviewCompleted datetime
	DECLARE @TechnicalReviewCompleted datetime
	DECLARE @AuthorReviewFrequency uniqueidentifier
	DECLARE @NextAuthorReview smalldatetime
	DECLARE @AuthorReviewStatusId uniqueidentifier
	DECLARE @AuthorReviewCompleted datetime
	SET @TechnicalReviewFrequency = null
	SET @PolicyReviewFrequency = null
	SET @NextTechnicalReview = null
	SET @NextPolicyReview = null
	SET @PolicyReviewStatusId = null
	SET @TechnicalReviewStatusId = null
	SET @PolicyReviewCompleted = null
	SET @TechnicalReviewCompleted = null
	SET @AuthorReviewFrequency = null
	SET @NextAuthorReview = null
	SET @AuthorReviewStatusId = null
	SET @AuthorReviewCompleted = null
	
	-- Prepare table to loop round all profile version Ids
	DECLARE @ProfileVersionIds TABLE (Id uniqueidentifier, RowNumber int)
	INSERT INTO @ProfileVersionIds
	SELECT Id, ROW_NUMBER() OVER (ORDER BY Id) as 'RowNumber'
	FROM [dbo].[ProfileVersion]
	
	-- Prepare variables to loop round profile version Ids
	DECLARE @Counter int 
	DECLARE @NumberOfProfileVersions int		
	SET @Counter = 1
	SET @NumberOfProfileVersions = (SELECT COUNT(*) FROM @ProfileVersionIds)
	
	-- Loop round all Profile Version Ids
	WHILE (@Counter <= @NumberOfProfileVersions)
	BEGIN
		SET @ProfileVersionId = (SELECT Id FROM @ProfileVersionIds WHERE RowNumber = @Counter)
		
		IF NOT EXISTS (SELECT * FROM ProfileVersionSection 
					   WHERE ProfileVersionId = @ProfileVersionId
					   AND ProfileSectionId = @ProfileSectionId)
		BEGIN	
			INSERT INTO [dbo].[ProfileVersionSection]
			(
				[ProfileVersionId]
				, [ProfileSectionId]
				, [TechnicalReviewFrequency]
				, [PolicyReviewFrequency]
				, [NextTechnicalReview]
				, [NextPolicyReview]
				, [PolicyReviewStatusId]
				, [TechnicalReviewStatusId]
				, [PolicyReviewCompleted]
				, [TechnicalReviewCompleted]
				, [AuthorReviewFrequency]
				, [NextAuthorReview]
				, [AuthorReviewStatusId]
				, [AuthorReviewCompleted]
			)
			VALUES
			(
				@ProfileVersionId
				, @ProfileSectionId
				, @TechnicalReviewFrequency
				, @PolicyReviewFrequency
				, @NextTechnicalReview
				, @NextPolicyReview
				, @PolicyReviewStatusId
				, @TechnicalReviewStatusId
				, @PolicyReviewCompleted
				, @TechnicalReviewCompleted
				, @AuthorReviewFrequency
				, @NextAuthorReview
				, @AuthorReviewStatusId
				, @AuthorReviewCompleted
			)
		END
	
		SET @Counter = @Counter + 1
	END

-- STEP 4. Create new Profile Questions, fields and options with variables

	-- Get Profile Field Types
	DECLARE @ProfileFieldType_FieldGroup uniqueidentifier
	DECLARE @ProfileFieldType_Boolean uniqueidentifier
	DECLARE @ProfileFieldType_List uniqueidentifier
	DECLARE @ProfileFieldType_ProfileVersionData uniqueidentifier
	DECLARE @ProfileFieldType_Decimal uniqueidentifier
	DECLARE @ProfileFieldType_Date uniqueidentifier
	DECLARE @ProfileFieldType_LongText uniqueidentifier
	DECLARE @ProfileFieldType_MultiValueList uniqueidentifier
	DECLARE @ProfileFieldType_Text uniqueidentifier
	SET @ProfileFieldType_FieldGroup = '69754D65-0F13-4DB0-AFB1-3271AD64A7DB'
	SET @ProfileFieldType_Boolean = 'B1A35FAB-D4CF-4797-8F81-474892DA5251'
	SET @ProfileFieldType_List = 'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9'
	SET @ProfileFieldType_ProfileVersionData = '0F7D5F99-364E-4442-ACCF-6FD61A98BFD1'
	SET @ProfileFieldType_Decimal = 'C7698CDD-BA52-4635-9C1D-8D69609E5716'
	SET @ProfileFieldType_Date = '18D206DE-4C28-4736-97DE-9054FF8A081E'
	SET @ProfileFieldType_LongText = 'D297F63B-638A-4574-B042-97C248338A26'
	SET @ProfileFieldType_MultiValueList = '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89'
	SET @ProfileFieldType_Text = 'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0'

	-- Question 1 Settings
		
		-- Reference table entries
		DECLARE @Id_Question1_ReferenceTable uniqueidentifier
		DECLARE @Name_Question1_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question1_ReferenceTable bit	
		SET @Id_Question1_ReferenceTable = '47165516-AD90-4458-9568-258FB9C6AF95'
		SET @Name_Question1_ReferenceTable = 'TO_CHANGE_Question 1 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question1_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question1_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue1 tinyint		
			SET @Id_Question1_ReferenceValue1 = '37D40FB8-9DEF-471A-9131-BCAA96939A8F' 
			SET @LookupValue_Question1_ReferenceValue1 = 'TO_CHANGE_Question 1 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question1_ReferenceValue1 = 1
			
			DECLARE @Id_Question1_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue2 tinyint		
			SET @Id_Question1_ReferenceValue2 = 'F7902785-9172-4370-A7BD-5DBFE781E5F2'
			SET @LookupValue_Question1_ReferenceValue2 = 'TO_CHANGE_Question 1 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question1_ReferenceValue2 = 2
			
			DECLARE @Id_Question1_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue3 tinyint		
			SET @Id_Question1_ReferenceValue3 = '3FED1882-B95E-4B8B-826D-24B26637543A' 
			SET @LookupValue_Question1_ReferenceValue3 = 'TO_CHANGE_Question 1 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question1_ReferenceValue3 = 3 
			
			DECLARE @Id_Question1_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue4 tinyint
			SET @Id_Question1_ReferenceValue4 = '6DC9DEC8-CC6D-4AD2-BEB7-746104D4B96B'
			SET @LookupValue_Question1_ReferenceValue4 = 'TO_CHANGE_Question 1 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question1_ReferenceValue4 = 4
			
			DECLARE @Id_Question1_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue5 tinyint		
			SET @Id_Question1_ReferenceValue5 = 'CFC0A37A-F2B2-4F0C-94A3-33547A1F8D55' 
			SET @LookupValue_Question1_ReferenceValue5 = 'TO_CHANGE_Question 1 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question1_ReferenceValue5 = 5
				
			DECLARE @Id_Question1_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question1_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question1_ReferenceValue6 tinyint
			SET @Id_Question1_ReferenceValue6 = 'EEBC0F46-9204-411A-A3B1-D40FB014D785' 
			SET @LookupValue_Question1_ReferenceValue6 = 'TO_CHANGE_Question 1 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question1_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question1_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question1_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question1_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question1_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question1_ProfileField1 uniqueidentifier
		DECLARE @Name_Question1_ProfileField1 varchar(200)
		DECLARE @ShortName_Question1_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question1_ProfileField1 int
		DECLARE @DataFieldTypeId_Question1_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question1_ProfileField1 bit
		DECLARE @ReferenceTableId_Question1_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question1_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question1_ProfileField1 bit
		DECLARE @DefaultValue_Question1_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question1_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question1_ProfileField1 uniqueidentifier	
		SET @Id_Question1_ProfileField1 = '116CC492-893E-4B44-A303-63852A6E446F'
		SET @Name_Question1_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question1_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question1_ProfileField1 = 1
		SET @DataFieldTypeId_Question1_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question1_ProfileField1 = 1
		SET @ReferenceTableId_Question1_ProfileField1 = @Id_Question1_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question1_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question1_ProfileField1 = 0
		SET @DefaultValue_Question1_ProfileField1 = null
		SET @IncludeInSummary_Question1_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question1_ProfileField1 = null
		
		DECLARE @Id_Question1_ProfileField2 uniqueidentifier
		DECLARE @Name_Question1_ProfileField2 varchar(200)
		DECLARE @ShortName_Question1_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question1_ProfileField2 int
		DECLARE @DataFieldTypeId_Question1_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question1_ProfileField2 bit
		DECLARE @ReferenceTableId_Question1_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question1_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question1_ProfileField2 bit
		DECLARE @DefaultValue_Question1_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question1_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question1_ProfileField2 uniqueidentifier
		SET @Id_Question1_ProfileField2 = '38DB5E3F-DFFF-4F58-8D43-617420CB40F7' 
		SET @Name_Question1_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question1_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question1_ProfileField2 = 2
		SET @DataFieldTypeId_Question1_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question1_ProfileField2 = 0
		SET @ReferenceTableId_Question1_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question1_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question1_ProfileField2 = 0
		SET @DefaultValue_Question1_ProfileField2 = null
		SET @IncludeInSummary_Question1_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question1_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question1_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question1_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question1_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question1_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question1_ProfileQuestion int
		DECLARE @IsPerSpecies_Question1_ProfileQuestion bit
		DECLARE @IsRepeating_Question1_ProfileQuestion bit
		DECLARE @UserGuidance_Question1_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question1_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question1_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question1_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question1_ProfileQuestion varchar(255)		
		SET @Id_Question1_ProfileQuestion = '2B0CED80-110F-4302-9C3F-71E103E70C10'
		SET @Name_Question1_ProfileQuestion = 'TO_CHANGE_Question 1 Name_TO_CHANGE'
		SET @ShortName_Question1_ProfileQuestion = 'TO_CHANGE_Question 1 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question1_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question1_ProfileQuestion = 1
		SET @IsPerSpecies_Question1_ProfileQuestion = 1
		SET @IsRepeating_Question1_ProfileQuestion = 0
		SET @UserGuidance_Question1_ProfileQuestion = 'TO_CHANGE_Question 1 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question1_ProfileQuestion = null
		SET @IrrelevanceValueId_Question1_ProfileQuestion = null
		SET @IrrelevanceFlag_Question1_ProfileQuestion = null
		SET @NonTechnicalName_Question1_ProfileQuestion = 'TO_CHANGE_Question 1 Non-Technical Name_TO_CHANGE'
		
	-- Question 2 Settings
		
		-- Reference table entries
		DECLARE @Id_Question2_ReferenceTable uniqueidentifier
		DECLARE @Name_Question2_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question2_ReferenceTable bit	
		SET @Id_Question2_ReferenceTable = '8C7F327B-4503-4D29-982D-4B03A9482D19'
		SET @Name_Question2_ReferenceTable = 'TO_CHANGE_Question 2 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question2_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question2_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue1 tinyint		
			SET @Id_Question2_ReferenceValue1 = '2EEB07F2-44C5-44E6-92D6-5AD3F41616A5'
			SET @LookupValue_Question2_ReferenceValue1 = 'TO_CHANGE_Question 2 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question2_ReferenceValue1 = 1
			
			DECLARE @Id_Question2_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue2 tinyint		
			SET @Id_Question2_ReferenceValue2 = '39482E7D-F4B4-477A-94A2-96475812DDC3'
			SET @LookupValue_Question2_ReferenceValue2 = 'TO_CHANGE_Question 2 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question2_ReferenceValue2 = 2
			
			DECLARE @Id_Question2_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue3 tinyint		
			SET @Id_Question2_ReferenceValue3 = '6461A8AE-B912-4AC5-BEBB-D76AA1F389DC' 
			SET @LookupValue_Question2_ReferenceValue3 = 'TO_CHANGE_Question 2 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question2_ReferenceValue3 = 3 
			
			DECLARE @Id_Question2_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue4 tinyint
			SET @Id_Question2_ReferenceValue4 = 'DF984218-A8CF-4864-BCE6-8E96AF5B7136'
			SET @LookupValue_Question2_ReferenceValue4 = 'TO_CHANGE_Question 2 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question2_ReferenceValue4 = 4
			
			DECLARE @Id_Question2_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue5 tinyint		
			SET @Id_Question2_ReferenceValue5 = 'F4D5096C-135D-47CA-922D-00191700B4F0' 
			SET @LookupValue_Question2_ReferenceValue5 = 'TO_CHANGE_Question 2 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question2_ReferenceValue5 = 5
				
			DECLARE @Id_Question2_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question2_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question2_ReferenceValue6 tinyint
			SET @Id_Question2_ReferenceValue6 = 'EB6BCAB0-1EAF-4473-8771-41ACF504C970' 
			SET @LookupValue_Question2_ReferenceValue6 = 'TO_CHANGE_Question 2 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question2_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question2_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question2_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question2_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question2_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question2_ProfileField1 uniqueidentifier
		DECLARE @Name_Question2_ProfileField1 varchar(200)
		DECLARE @ShortName_Question2_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question2_ProfileField1 int
		DECLARE @DataFieldTypeId_Question2_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question2_ProfileField1 bit
		DECLARE @ReferenceTableId_Question2_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question2_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question2_ProfileField1 bit
		DECLARE @DefaultValue_Question2_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question2_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question2_ProfileField1 uniqueidentifier	
		SET @Id_Question2_ProfileField1 = '83EBF12B-78B6-4145-AE13-92823EAA501D'
		SET @Name_Question2_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question2_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question2_ProfileField1 = 1
		SET @DataFieldTypeId_Question2_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question2_ProfileField1 = 1
		SET @ReferenceTableId_Question2_ProfileField1 = @Id_Question2_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question2_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question2_ProfileField1 = 0
		SET @DefaultValue_Question2_ProfileField1 = null
		SET @IncludeInSummary_Question2_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question2_ProfileField1 = null
		
		DECLARE @Id_Question2_ProfileField2 uniqueidentifier
		DECLARE @Name_Question2_ProfileField2 varchar(200)
		DECLARE @ShortName_Question2_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question2_ProfileField2 int
		DECLARE @DataFieldTypeId_Question2_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question2_ProfileField2 bit
		DECLARE @ReferenceTableId_Question2_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question2_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question2_ProfileField2 bit
		DECLARE @DefaultValue_Question2_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question2_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question2_ProfileField2 uniqueidentifier
		SET @Id_Question2_ProfileField2 = 'F3E33253-953E-43BB-8D97-2848FA21CAA4' 
		SET @Name_Question2_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question2_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question2_ProfileField2 = 2
		SET @DataFieldTypeId_Question2_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question2_ProfileField2 = 0
		SET @ReferenceTableId_Question2_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question2_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question2_ProfileField2 = 0
		SET @DefaultValue_Question2_ProfileField2 = null
		SET @IncludeInSummary_Question2_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question2_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question2_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question2_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question2_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question2_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question2_ProfileQuestion int
		DECLARE @IsPerSpecies_Question2_ProfileQuestion bit
		DECLARE @IsRepeating_Question2_ProfileQuestion bit
		DECLARE @UserGuidance_Question2_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question2_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question2_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question2_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question2_ProfileQuestion varchar(255)		
		SET @Id_Question2_ProfileQuestion = 'D2342F0F-61D5-4D8B-B692-47BE2BF29668'
		SET @Name_Question2_ProfileQuestion = 'TO_CHANGE_Question 2 Name_TO_CHANGE'
		SET @ShortName_Question2_ProfileQuestion = 'TO_CHANGE_Question 2 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question2_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question2_ProfileQuestion = 2
		SET @IsPerSpecies_Question2_ProfileQuestion = 1
		SET @IsRepeating_Question2_ProfileQuestion = 0
		SET @UserGuidance_Question2_ProfileQuestion = 'TO_CHANGE_Question 2 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question2_ProfileQuestion = null
		SET @IrrelevanceValueId_Question2_ProfileQuestion = null
		SET @IrrelevanceFlag_Question2_ProfileQuestion = null
		SET @NonTechnicalName_Question2_ProfileQuestion = 'TO_CHANGE_Question 2 Non-Technical Name_TO_CHANGE'
		
	
		
	-- Question 3 Settings
		
		-- Reference table entries
		DECLARE @Id_Question3_ReferenceTable uniqueidentifier
		DECLARE @Name_Question3_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question3_ReferenceTable bit	
		SET @Id_Question3_ReferenceTable = 'C23D8DAE-C36C-40F5-AC55-45440F88CBC0'
		SET @Name_Question3_ReferenceTable = 'TO_CHANGE_Question 3 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question3_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question3_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue1 tinyint		
			SET @Id_Question3_ReferenceValue1 = '03B9FBCB-149F-4127-9907-9AA0BE26316C' 
			SET @LookupValue_Question3_ReferenceValue1 = 'TO_CHANGE_Question 3 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question3_ReferenceValue1 = 1
			
			DECLARE @Id_Question3_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue2 tinyint		
			SET @Id_Question3_ReferenceValue2 = '210CB7B2-5073-425B-8479-20236CAE299D'
			SET @LookupValue_Question3_ReferenceValue2 = 'TO_CHANGE_Question 3 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question3_ReferenceValue2 = 2
			
			DECLARE @Id_Question3_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue3 tinyint		
			SET @Id_Question3_ReferenceValue3 = 'B25483A5-D021-4098-92EC-7FB8855D9854' 
			SET @LookupValue_Question3_ReferenceValue3 = 'TO_CHANGE_Question 3 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question3_ReferenceValue3 = 3 
			
			DECLARE @Id_Question3_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue4 tinyint
			SET @Id_Question3_ReferenceValue4 = '83549496-8903-447C-9D21-32B16D3649E7'
			SET @LookupValue_Question3_ReferenceValue4 = 'TO_CHANGE_Question 3 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question3_ReferenceValue4 = 4
			
			DECLARE @Id_Question3_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue5 tinyint		
			SET @Id_Question3_ReferenceValue5 = '35F77421-E2D8-48D9-87B8-2240EB10C9E2' 
			SET @LookupValue_Question3_ReferenceValue5 = 'TO_CHANGE_Question 3 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question3_ReferenceValue5 = 5
				
			DECLARE @Id_Question3_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question3_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question3_ReferenceValue6 tinyint
			SET @Id_Question3_ReferenceValue6 = 'CB274C27-7D7F-4631-8965-DBCEF0C3DCA2' 
			SET @LookupValue_Question3_ReferenceValue6 = 'TO_CHANGE_Question 3 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question3_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question3_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question3_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question3_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question3_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question3_ProfileField1 uniqueidentifier
		DECLARE @Name_Question3_ProfileField1 varchar(200)
		DECLARE @ShortName_Question3_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question3_ProfileField1 int
		DECLARE @DataFieldTypeId_Question3_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question3_ProfileField1 bit
		DECLARE @ReferenceTableId_Question3_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question3_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question3_ProfileField1 bit
		DECLARE @DefaultValue_Question3_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question3_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question3_ProfileField1 uniqueidentifier	
		SET @Id_Question3_ProfileField1 = '284D2B40-EA67-4343-BC20-AA3A04E556EC'
		SET @Name_Question3_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question3_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question3_ProfileField1 = 1
		SET @DataFieldTypeId_Question3_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question3_ProfileField1 = 1
		SET @ReferenceTableId_Question3_ProfileField1 = @Id_Question3_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question3_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question3_ProfileField1 = 0
		SET @DefaultValue_Question3_ProfileField1 = null
		SET @IncludeInSummary_Question3_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question3_ProfileField1 = null
		
		DECLARE @Id_Question3_ProfileField2 uniqueidentifier
		DECLARE @Name_Question3_ProfileField2 varchar(200)
		DECLARE @ShortName_Question3_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question3_ProfileField2 int
		DECLARE @DataFieldTypeId_Question3_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question3_ProfileField2 bit
		DECLARE @ReferenceTableId_Question3_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question3_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question3_ProfileField2 bit
		DECLARE @DefaultValue_Question3_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question3_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question3_ProfileField2 uniqueidentifier
		SET @Id_Question3_ProfileField2 = '500B9D28-A273-46E9-8D98-CDA564F980F7' 
		SET @Name_Question3_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question3_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question3_ProfileField2 = 2
		SET @DataFieldTypeId_Question3_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question3_ProfileField2 = 0
		SET @ReferenceTableId_Question3_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question3_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question3_ProfileField2 = 0
		SET @DefaultValue_Question3_ProfileField2 = null
		SET @IncludeInSummary_Question3_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question3_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question3_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question3_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question3_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question3_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question3_ProfileQuestion int
		DECLARE @IsPerSpecies_Question3_ProfileQuestion bit
		DECLARE @IsRepeating_Question3_ProfileQuestion bit
		DECLARE @UserGuidance_Question3_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question3_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question3_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question3_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question3_ProfileQuestion varchar(255)		
		SET @Id_Question3_ProfileQuestion = 'F457F791-E6D0-452E-B33B-024B567DBD12'
		SET @Name_Question3_ProfileQuestion = 'TO_CHANGE_Question 3 Name_TO_CHANGE'
		SET @ShortName_Question3_ProfileQuestion = 'TO_CHANGE_Question 3 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question3_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question3_ProfileQuestion = 3
		SET @IsPerSpecies_Question3_ProfileQuestion = 1
		SET @IsRepeating_Question3_ProfileQuestion = 0
		SET @UserGuidance_Question3_ProfileQuestion = 'TO_CHANGE_Question 3 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question3_ProfileQuestion = null
		SET @IrrelevanceValueId_Question3_ProfileQuestion = null
		SET @IrrelevanceFlag_Question3_ProfileQuestion = null
		SET @NonTechnicalName_Question3_ProfileQuestion = 'TO_CHANGE_Question 3 Non-Technical Name_TO_CHANGE'
		
	-- Question 4 Settings
		
		-- Reference table entries
		DECLARE @Id_Question4_ReferenceTable uniqueidentifier
		DECLARE @Name_Question4_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question4_ReferenceTable bit	
		SET @Id_Question4_ReferenceTable = '729F1C03-8468-4276-83A0-174FE7CCB0E5'
		SET @Name_Question4_ReferenceTable = 'TO_CHANGE_Question 4 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question4_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question4_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue1 tinyint		
			SET @Id_Question4_ReferenceValue1 = '1EC28FA0-C3D3-4F3B-AAB2-0B907F9EDE96' 
			SET @LookupValue_Question4_ReferenceValue1 = 'TO_CHANGE_Question 4 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question4_ReferenceValue1 = 1
			
			DECLARE @Id_Question4_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue2 tinyint		
			SET @Id_Question4_ReferenceValue2 = 'DD564A19-1165-4EFD-8005-8F1E0E2E38CC'
			SET @LookupValue_Question4_ReferenceValue2 = 'TO_CHANGE_Question 4 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question4_ReferenceValue2 = 2
			
			DECLARE @Id_Question4_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue3 tinyint		
			SET @Id_Question4_ReferenceValue3 = 'F5B516DF-DB84-4D88-B50B-9F169A92B241' 
			SET @LookupValue_Question4_ReferenceValue3 = 'TO_CHANGE_Question 4 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question4_ReferenceValue3 = 3 
			
			DECLARE @Id_Question4_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue4 tinyint
			SET @Id_Question4_ReferenceValue4 = '76F74EC7-5DFC-4FF5-ABD0-293F0927E7B0'
			SET @LookupValue_Question4_ReferenceValue4 = 'TO_CHANGE_Question 4 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question4_ReferenceValue4 = 4
			
			DECLARE @Id_Question4_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue5 tinyint		
			SET @Id_Question4_ReferenceValue5 = '745296F1-A164-4BC7-BE95-E09A0DD30681' 
			SET @LookupValue_Question4_ReferenceValue5 = 'TO_CHANGE_Question 4 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question4_ReferenceValue5 = 5
				
			DECLARE @Id_Question4_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question4_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question4_ReferenceValue6 tinyint
			SET @Id_Question4_ReferenceValue6 = 'A1B659B2-EB6B-4CE2-8CC2-AB8A5C1EF56F' 
			SET @LookupValue_Question4_ReferenceValue6 = 'TO_CHANGE_Question 4 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question4_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question4_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question4_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question4_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question4_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question4_ProfileField1 uniqueidentifier
		DECLARE @Name_Question4_ProfileField1 varchar(200)
		DECLARE @ShortName_Question4_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question4_ProfileField1 int
		DECLARE @DataFieldTypeId_Question4_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question4_ProfileField1 bit
		DECLARE @ReferenceTableId_Question4_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question4_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question4_ProfileField1 bit
		DECLARE @DefaultValue_Question4_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question4_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question4_ProfileField1 uniqueidentifier	
		SET @Id_Question4_ProfileField1 = 'BEA197E6-382D-4C98-B716-55CC71A2D5AA'
		SET @Name_Question4_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question4_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question4_ProfileField1 = 1
		SET @DataFieldTypeId_Question4_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question4_ProfileField1 = 1
		SET @ReferenceTableId_Question4_ProfileField1 = @Id_Question4_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question4_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question4_ProfileField1 = 0
		SET @DefaultValue_Question4_ProfileField1 = null
		SET @IncludeInSummary_Question4_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question4_ProfileField1 = null
		
		DECLARE @Id_Question4_ProfileField2 uniqueidentifier
		DECLARE @Name_Question4_ProfileField2 varchar(200)
		DECLARE @ShortName_Question4_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question4_ProfileField2 int
		DECLARE @DataFieldTypeId_Question4_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question4_ProfileField2 bit
		DECLARE @ReferenceTableId_Question4_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question4_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question4_ProfileField2 bit
		DECLARE @DefaultValue_Question4_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question4_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question4_ProfileField2 uniqueidentifier
		SET @Id_Question4_ProfileField2 = 'AC58A74D-3C58-4708-8744-35D2C5C0A34B' 
		SET @Name_Question4_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question4_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question4_ProfileField2 = 2
		SET @DataFieldTypeId_Question4_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question4_ProfileField2 = 0
		SET @ReferenceTableId_Question4_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question4_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question4_ProfileField2 = 0
		SET @DefaultValue_Question4_ProfileField2 = null
		SET @IncludeInSummary_Question4_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question4_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question4_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question4_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question4_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question4_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question4_ProfileQuestion int
		DECLARE @IsPerSpecies_Question4_ProfileQuestion bit
		DECLARE @IsRepeating_Question4_ProfileQuestion bit
		DECLARE @UserGuidance_Question4_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question4_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question4_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question4_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question4_ProfileQuestion varchar(255)		
		SET @Id_Question4_ProfileQuestion = 'CB7087E2-10D1-47DB-BCCF-BB96A6E61F32'
		SET @Name_Question4_ProfileQuestion = 'TO_CHANGE_Question 4 Name_TO_CHANGE'
		SET @ShortName_Question4_ProfileQuestion = 'TO_CHANGE_Question 4 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question4_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question4_ProfileQuestion = 4
		SET @IsPerSpecies_Question4_ProfileQuestion = 1
		SET @IsRepeating_Question4_ProfileQuestion = 0
		SET @UserGuidance_Question4_ProfileQuestion = 'TO_CHANGE_Question 4 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question4_ProfileQuestion = null
		SET @IrrelevanceValueId_Question4_ProfileQuestion = null
		SET @IrrelevanceFlag_Question4_ProfileQuestion = null
		SET @NonTechnicalName_Question4_ProfileQuestion = 'TO_CHANGE_Question 4 Non-Technical Name_TO_CHANGE'
		
	-- Question 5 Settings
		
		-- Reference table entries
		DECLARE @Id_Question5_ReferenceTable uniqueidentifier
		DECLARE @Name_Question5_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question5_ReferenceTable bit	
		SET @Id_Question5_ReferenceTable = 'A9C24AAB-EC84-4F57-BAD2-4AE5A7A16A7F'
		SET @Name_Question5_ReferenceTable = 'TO_CHANGE_Question 5 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question5_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question5_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue1 tinyint		
			SET @Id_Question5_ReferenceValue1 = '632F5464-B68E-4034-A6F1-D7075C83DD41' 
			SET @LookupValue_Question5_ReferenceValue1 = 'TO_CHANGE_Question 5 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question5_ReferenceValue1 = 1
			
			DECLARE @Id_Question5_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue2 tinyint		
			SET @Id_Question5_ReferenceValue2 = '548FC5EB-4527-40D9-89EB-25AEC169FED9'
			SET @LookupValue_Question5_ReferenceValue2 = 'TO_CHANGE_Question 5 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question5_ReferenceValue2 = 2
			
			DECLARE @Id_Question5_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue3 tinyint		
			SET @Id_Question5_ReferenceValue3 = '6C2DF260-7252-4B80-8FA3-CFFBA9EAF6F0' 
			SET @LookupValue_Question5_ReferenceValue3 = 'TO_CHANGE_Question 5 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question5_ReferenceValue3 = 3 
			
			DECLARE @Id_Question5_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue4 tinyint
			SET @Id_Question5_ReferenceValue4 = '2D1CE3A3-DF7A-4081-9DE8-791140A5D1DD'
			SET @LookupValue_Question5_ReferenceValue4 = 'TO_CHANGE_Question 5 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question5_ReferenceValue4 = 4
			
			DECLARE @Id_Question5_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue5 tinyint		
			SET @Id_Question5_ReferenceValue5 = 'B8DFA00F-404E-4F90-97B2-736C8F8CAD71' 
			SET @LookupValue_Question5_ReferenceValue5 = 'TO_CHANGE_Question 5 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question5_ReferenceValue5 = 5
				
			DECLARE @Id_Question5_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question5_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question5_ReferenceValue6 tinyint
			SET @Id_Question5_ReferenceValue6 = '36F076DD-17D8-4F8F-8677-D2D64981EB58' 
			SET @LookupValue_Question5_ReferenceValue6 = 'TO_CHANGE_Question 5 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question5_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question5_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question5_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question5_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question5_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question5_ProfileField1 uniqueidentifier
		DECLARE @Name_Question5_ProfileField1 varchar(200)
		DECLARE @ShortName_Question5_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question5_ProfileField1 int
		DECLARE @DataFieldTypeId_Question5_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question5_ProfileField1 bit
		DECLARE @ReferenceTableId_Question5_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question5_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question5_ProfileField1 bit
		DECLARE @DefaultValue_Question5_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question5_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question5_ProfileField1 uniqueidentifier	
		SET @Id_Question5_ProfileField1 = '18AEFF46-1B3F-483E-BE28-E0E278CE6AA1'
		SET @Name_Question5_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question5_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question5_ProfileField1 = 1
		SET @DataFieldTypeId_Question5_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question5_ProfileField1 = 1
		SET @ReferenceTableId_Question5_ProfileField1 = @Id_Question5_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question5_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question5_ProfileField1 = 0
		SET @DefaultValue_Question5_ProfileField1 = null
		SET @IncludeInSummary_Question5_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question5_ProfileField1 = null
		
		DECLARE @Id_Question5_ProfileField2 uniqueidentifier
		DECLARE @Name_Question5_ProfileField2 varchar(200)
		DECLARE @ShortName_Question5_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question5_ProfileField2 int
		DECLARE @DataFieldTypeId_Question5_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question5_ProfileField2 bit
		DECLARE @ReferenceTableId_Question5_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question5_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question5_ProfileField2 bit
		DECLARE @DefaultValue_Question5_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question5_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question5_ProfileField2 uniqueidentifier
		SET @Id_Question5_ProfileField2 = '513BB0B7-E0C9-4DF3-9447-8006B943AA1E' 
		SET @Name_Question5_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question5_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question5_ProfileField2 = 2
		SET @DataFieldTypeId_Question5_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question5_ProfileField2 = 0
		SET @ReferenceTableId_Question5_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question5_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question5_ProfileField2 = 0
		SET @DefaultValue_Question5_ProfileField2 = null
		SET @IncludeInSummary_Question5_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question5_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question5_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question5_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question5_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question5_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question5_ProfileQuestion int
		DECLARE @IsPerSpecies_Question5_ProfileQuestion bit
		DECLARE @IsRepeating_Question5_ProfileQuestion bit
		DECLARE @UserGuidance_Question5_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question5_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question5_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question5_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question5_ProfileQuestion varchar(255)		
		SET @Id_Question5_ProfileQuestion = '31CA5D2E-83B3-4B01-9A84-0D64C1258A4A'
		SET @Name_Question5_ProfileQuestion = 'TO_CHANGE_Question 5 Name_TO_CHANGE'
		SET @ShortName_Question5_ProfileQuestion = 'TO_CHANGE_Question 5 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question5_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question5_ProfileQuestion = 5
		SET @IsPerSpecies_Question5_ProfileQuestion = 1
		SET @IsRepeating_Question5_ProfileQuestion = 0
		SET @UserGuidance_Question5_ProfileQuestion = 'TO_CHANGE_Question 5 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question5_ProfileQuestion = null
		SET @IrrelevanceValueId_Question5_ProfileQuestion = null
		SET @IrrelevanceFlag_Question5_ProfileQuestion = null
		SET @NonTechnicalName_Question5_ProfileQuestion = 'TO_CHANGE_Question 5 Non-Technical Name_TO_CHANGE'
		
	-- Question 6 Settings
		
		-- Reference table entries
		DECLARE @Id_Question6_ReferenceTable uniqueidentifier
		DECLARE @Name_Question6_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question6_ReferenceTable bit	
		SET @Id_Question6_ReferenceTable = 'EE0FE2A3-B230-4936-BFBC-D9C2AA137B09'
		SET @Name_Question6_ReferenceTable = 'TO_CHANGE_Question 6 Drop Down Option Name_TO_CHANGE'
		SET @IsMaintainable_Question6_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question6_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue1 tinyint		
			SET @Id_Question6_ReferenceValue1 = '61DFF6C4-4B58-45A4-98A4-C36DD57EA2D9' 
			SET @LookupValue_Question6_ReferenceValue1 = 'TO_CHANGE_Question 6 Drop Down Value 1_TO_CHANGE'
			SET @SequenceNumber_Question6_ReferenceValue1 = 1
			
			DECLARE @Id_Question6_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue2 tinyint		
			SET @Id_Question6_ReferenceValue2 = '551C2F48-AA2C-4294-8229-2EC7A7DE2803'
			SET @LookupValue_Question6_ReferenceValue2 = 'TO_CHANGE_Question 6 Drop Down Value 2_TO_CHANGE'
			SET @SequenceNumber_Question6_ReferenceValue2 = 2
			
			DECLARE @Id_Question6_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue3 tinyint		
			SET @Id_Question6_ReferenceValue3 = 'EB76660D-D30A-44B8-A6AC-26D83280455A' 
			SET @LookupValue_Question6_ReferenceValue3 = 'TO_CHANGE_Question 6 Drop Down Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question6_ReferenceValue3 = 3 
			
			DECLARE @Id_Question6_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue4 tinyint
			SET @Id_Question6_ReferenceValue4 = 'E4E89A15-A60F-4795-BEFE-7DCEAE1C3A03'
			SET @LookupValue_Question6_ReferenceValue4 = 'TO_CHANGE_Question 6 Drop Down Value 4_TO_CHANGE'
			SET @SequenceNumber_Question6_ReferenceValue4 = 4
			
			DECLARE @Id_Question6_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue5 tinyint		
			SET @Id_Question6_ReferenceValue5 = '4C76195F-E3D7-4556-9DB1-949C7EE71921' 
			SET @LookupValue_Question6_ReferenceValue5 = 'TO_CHANGE_Question 6 Drop Down Value 5_TO_CHANGE'
			SET @SequenceNumber_Question6_ReferenceValue5 = 5
				
			DECLARE @Id_Question6_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question6_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question6_ReferenceValue6 tinyint
			SET @Id_Question6_ReferenceValue6 = 'ACC694E1-F422-411B-814E-E7FEAF4BF3FA' 
			SET @LookupValue_Question6_ReferenceValue6 = 'TO_CHANGE_Question 6 Drop Down Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question6_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question6_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question6_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question6_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question6_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question6_ProfileField1 uniqueidentifier
		DECLARE @Name_Question6_ProfileField1 varchar(200)
		DECLARE @ShortName_Question6_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question6_ProfileField1 int
		DECLARE @DataFieldTypeId_Question6_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question6_ProfileField1 bit
		DECLARE @ReferenceTableId_Question6_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question6_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question6_ProfileField1 bit
		DECLARE @DefaultValue_Question6_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question6_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question6_ProfileField1 uniqueidentifier	
		SET @Id_Question6_ProfileField1 = '7136E635-DFFC-40B5-A9DC-8596717453EE'
		SET @Name_Question6_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question6_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question6_ProfileField1 = 1
		SET @DataFieldTypeId_Question6_ProfileField1 = @ProfileFieldType_List
		SET @IsMandatory_Question6_ProfileField1 = 1
		SET @ReferenceTableId_Question6_ProfileField1 = @Id_Question6_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question6_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question6_ProfileField1 = 0
		SET @DefaultValue_Question6_ProfileField1 = null
		SET @IncludeInSummary_Question6_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question6_ProfileField1 = null
		
		DECLARE @Id_Question6_ProfileField2 uniqueidentifier
		DECLARE @Name_Question6_ProfileField2 varchar(200)
		DECLARE @ShortName_Question6_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question6_ProfileField2 int
		DECLARE @DataFieldTypeId_Question6_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question6_ProfileField2 bit
		DECLARE @ReferenceTableId_Question6_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question6_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question6_ProfileField2 bit
		DECLARE @DefaultValue_Question6_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question6_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question6_ProfileField2 uniqueidentifier
		SET @Id_Question6_ProfileField2 = '25A57C29-46E2-470D-A39D-10DC8D839EEF' 
		SET @Name_Question6_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question6_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question6_ProfileField2 = 2
		SET @DataFieldTypeId_Question6_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question6_ProfileField2 = 0
		SET @ReferenceTableId_Question6_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question6_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question6_ProfileField2 = 0
		SET @DefaultValue_Question6_ProfileField2 = null
		SET @IncludeInSummary_Question6_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question6_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question6_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question6_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question6_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question6_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question6_ProfileQuestion int
		DECLARE @IsPerSpecies_Question6_ProfileQuestion bit
		DECLARE @IsRepeating_Question6_ProfileQuestion bit
		DECLARE @UserGuidance_Question6_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question6_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question6_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question6_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question6_ProfileQuestion varchar(255)		
		SET @Id_Question6_ProfileQuestion = '1079680F-A242-4176-9971-0C19388AEE6B'
		SET @Name_Question6_ProfileQuestion = 'TO_CHANGE_Question 6 Name_TO_CHANGE'
		SET @ShortName_Question6_ProfileQuestion = 'TO_CHANGE_Question 6 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question6_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question6_ProfileQuestion = 6
		SET @IsPerSpecies_Question6_ProfileQuestion = 1
		SET @IsRepeating_Question6_ProfileQuestion = 0
		SET @UserGuidance_Question6_ProfileQuestion = 'TO_CHANGE_Question 6 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question6_ProfileQuestion = null
		SET @IrrelevanceValueId_Question6_ProfileQuestion = null
		SET @IrrelevanceFlag_Question6_ProfileQuestion = null
		SET @NonTechnicalName_Question6_ProfileQuestion = 'TO_CHANGE_Question 6 Non-Technical Name_TO_CHANGE'
		
	-- Question 7 Settings
		
		-- Reference table entries
		DECLARE @Id_Question7_ReferenceTable uniqueidentifier
		DECLARE @Name_Question7_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question7_ReferenceTable bit	
		SET @Id_Question7_ReferenceTable = '9FDABF42-0823-4367-867D-251C07F841F6'
		SET @Name_Question7_ReferenceTable = 'TO_CHANGE_Question 7 Tick Box Option Name_TO_CHANGE'
		SET @IsMaintainable_Question7_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question7_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue1 tinyint		
			SET @Id_Question7_ReferenceValue1 = 'CDC7FA6F-79C4-4EAE-A87E-77879A26F79E' 
			SET @LookupValue_Question7_ReferenceValue1 = 'TO_CHANGE_Question 7 Tick Box Value 1_TO_CHANGE'
			SET @SequenceNumber_Question7_ReferenceValue1 = 1
			
			DECLARE @Id_Question7_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue2 tinyint		
			SET @Id_Question7_ReferenceValue2 = 'D8D1EA7C-25FF-4169-A345-A9F09C8C6C9A'
			SET @LookupValue_Question7_ReferenceValue2 = 'TO_CHANGE_Question 7 Tick Box Value 2_TO_CHANGE'
			SET @SequenceNumber_Question7_ReferenceValue2 = 2
			
			DECLARE @Id_Question7_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue3 tinyint		
			SET @Id_Question7_ReferenceValue3 = '1B487B2B-34CE-4B78-AEF3-20756426A375' 
			SET @LookupValue_Question7_ReferenceValue3 = 'TO_CHANGE_Question 7 Tick Box Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question7_ReferenceValue3 = 3 
			
			DECLARE @Id_Question7_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue4 tinyint
			SET @Id_Question7_ReferenceValue4 = '783A1B15-71F4-4976-B01C-549E05DB5EB0'
			SET @LookupValue_Question7_ReferenceValue4 = 'TO_CHANGE_Question 7 Tick Box Value 4_TO_CHANGE'
			SET @SequenceNumber_Question7_ReferenceValue4 = 4
			
			DECLARE @Id_Question7_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue5 tinyint		
			SET @Id_Question7_ReferenceValue5 = '5FE9AA27-B292-4953-B9FF-2F1835FA8C26' 
			SET @LookupValue_Question7_ReferenceValue5 = 'TO_CHANGE_Question 7 Tick Box Value 5_TO_CHANGE'
			SET @SequenceNumber_Question7_ReferenceValue5 = 5
				
			DECLARE @Id_Question7_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question7_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question7_ReferenceValue6 tinyint
			SET @Id_Question7_ReferenceValue6 = '006E31DA-116B-4E35-B94A-CCD07D618051' 
			SET @LookupValue_Question7_ReferenceValue6 = 'TO_CHANGE_Question 7 Tick Box Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question7_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question7_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question7_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question7_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question7_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question7_ProfileField1 uniqueidentifier
		DECLARE @Name_Question7_ProfileField1 varchar(200)
		DECLARE @ShortName_Question7_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question7_ProfileField1 int
		DECLARE @DataFieldTypeId_Question7_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question7_ProfileField1 bit
		DECLARE @ReferenceTableId_Question7_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question7_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question7_ProfileField1 bit
		DECLARE @DefaultValue_Question7_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question7_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question7_ProfileField1 uniqueidentifier	
		SET @Id_Question7_ProfileField1 = 'D060C594-6ED7-40D1-A882-82040FBB3CB2'
		SET @Name_Question7_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question7_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question7_ProfileField1 = 1
		SET @DataFieldTypeId_Question7_ProfileField1 = @ProfileFieldType_MultiValueList
		SET @IsMandatory_Question7_ProfileField1 = 1
		SET @ReferenceTableId_Question7_ProfileField1 = @Id_Question7_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question7_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question7_ProfileField1 = 0
		SET @DefaultValue_Question7_ProfileField1 = null
		SET @IncludeInSummary_Question7_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question7_ProfileField1 = null
		
		DECLARE @Id_Question7_ProfileField2 uniqueidentifier
		DECLARE @Name_Question7_ProfileField2 varchar(200)
		DECLARE @ShortName_Question7_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question7_ProfileField2 int
		DECLARE @DataFieldTypeId_Question7_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question7_ProfileField2 bit
		DECLARE @ReferenceTableId_Question7_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question7_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question7_ProfileField2 bit
		DECLARE @DefaultValue_Question7_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question7_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question7_ProfileField2 uniqueidentifier
		SET @Id_Question7_ProfileField2 = '0172216C-3DB8-429B-835C-A252B2CE8D85' 
		SET @Name_Question7_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question7_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question7_ProfileField2 = 2
		SET @DataFieldTypeId_Question7_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question7_ProfileField2 = 0
		SET @ReferenceTableId_Question7_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question7_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question7_ProfileField2 = 0
		SET @DefaultValue_Question7_ProfileField2 = null
		SET @IncludeInSummary_Question7_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question7_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question7_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question7_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question7_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question7_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question7_ProfileQuestion int
		DECLARE @IsPerSpecies_Question7_ProfileQuestion bit
		DECLARE @IsRepeating_Question7_ProfileQuestion bit
		DECLARE @UserGuidance_Question7_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question7_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question7_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question7_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question7_ProfileQuestion varchar(255)		
		SET @Id_Question7_ProfileQuestion = '769DAB43-2342-4FA0-A000-5D49BC73A452'
		SET @Name_Question7_ProfileQuestion = 'TO_CHANGE_Question 7 Name_TO_CHANGE'
		SET @ShortName_Question7_ProfileQuestion = 'TO_CHANGE_Question 7 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question7_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question7_ProfileQuestion = 7
		SET @IsPerSpecies_Question7_ProfileQuestion = 1
		SET @IsRepeating_Question7_ProfileQuestion = 0
		SET @UserGuidance_Question7_ProfileQuestion = 'TO_CHANGE_Question 7 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question7_ProfileQuestion = null
		SET @IrrelevanceValueId_Question7_ProfileQuestion = null
		SET @IrrelevanceFlag_Question7_ProfileQuestion = null
		SET @NonTechnicalName_Question7_ProfileQuestion = 'TO_CHANGE_Question 7 Non-Technical Name_TO_CHANGE'
		
	-- Question 8 Settings
		
		-- Reference table entries
		DECLARE @Id_Question8_ReferenceTable uniqueidentifier
		DECLARE @Name_Question8_ReferenceTable varchar(50)
		DECLARE @IsMaintainable_Question8_ReferenceTable bit	
		SET @Id_Question8_ReferenceTable = 'B7639CDA-A8FE-4473-8A77-EF171369EAE2'
		SET @Name_Question8_ReferenceTable = 'TO_CHANGE_Question 8 Tick Box Option Name_TO_CHANGE'
		SET @IsMaintainable_Question8_ReferenceTable = 1
		
			-- Reference value entries
			DECLARE @Id_Question8_ReferenceValue1 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue1 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue1 tinyint		
			SET @Id_Question8_ReferenceValue1 = '7C0549FD-CF2F-49DB-BF35-CA19615D315E' 
			SET @LookupValue_Question8_ReferenceValue1 = 'TO_CHANGE_Question 8 Tick Box Value 1_TO_CHANGE'
			SET @SequenceNumber_Question8_ReferenceValue1 = 1
			
			DECLARE @Id_Question8_ReferenceValue2 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue2 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue2 tinyint		
			SET @Id_Question8_ReferenceValue2 = '547F4EA7-ACF6-45FF-82A8-C6A4B885946B'
			SET @LookupValue_Question8_ReferenceValue2 = 'TO_CHANGE_Question 8 Tick Box Value 2_TO_CHANGE'
			SET @SequenceNumber_Question8_ReferenceValue2 = 2
			
			DECLARE @Id_Question8_ReferenceValue3 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue3 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue3 tinyint		
			SET @Id_Question8_ReferenceValue3 = '470857DB-FECE-41D3-8211-4A929D7406E4' 
			SET @LookupValue_Question8_ReferenceValue3 = 'TO_CHANGE_Question 8 Tick Box Value 3_TO_CHANGE' 
			SET @SequenceNumber_Question8_ReferenceValue3 = 3 
			
			DECLARE @Id_Question8_ReferenceValue4 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue4 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue4 tinyint
			SET @Id_Question8_ReferenceValue4 = '10CF9523-C7A4-4EAD-93C2-513E0A22F813'
			SET @LookupValue_Question8_ReferenceValue4 = 'TO_CHANGE_Question 8 Tick Box Value 4_TO_CHANGE'
			SET @SequenceNumber_Question8_ReferenceValue4 = 4
			
			DECLARE @Id_Question8_ReferenceValue5 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue5 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue5 tinyint		
			SET @Id_Question8_ReferenceValue5 = '06C14BA0-2A85-43FA-8CDD-1444CEC1B6EA' 
			SET @LookupValue_Question8_ReferenceValue5 = 'TO_CHANGE_Question 8 Tick Box Value 5_TO_CHANGE'
			SET @SequenceNumber_Question8_ReferenceValue5 = 5
				
			DECLARE @Id_Question8_ReferenceValue6 uniqueidentifier
			DECLARE @LookupValue_Question8_ReferenceValue6 varchar(255)
			DECLARE @SequenceNumber_Question8_ReferenceValue6 tinyint
			SET @Id_Question8_ReferenceValue6 = '34FE6734-2E38-4073-BC2F-389C851AA7C7' 
			SET @LookupValue_Question8_ReferenceValue6 = 'TO_CHANGE_Question 8 Tick Box Value 6_TO_CHANGE' 
			SET @SequenceNumber_Question8_ReferenceValue6 = 6
			
			DECLARE @EffectiveDateFrom_Question8_ReferenceValue datetime
			DECLARE @EffectiveDateTo_Question8_ReferenceValue datetime		
			SET @EffectiveDateFrom_Question8_ReferenceValue = GETDATE() 
			SET @EffectiveDateTo_Question8_ReferenceValue = null
		
		-- Profile field Entries
		DECLARE @Id_Question8_ProfileField1 uniqueidentifier
		DECLARE @Name_Question8_ProfileField1 varchar(200)
		DECLARE @ShortName_Question8_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question8_ProfileField1 int
		DECLARE @DataFieldTypeId_Question8_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question8_ProfileField1 bit
		DECLARE @ReferenceTableId_Question8_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question8_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question8_ProfileField1 bit
		DECLARE @DefaultValue_Question8_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question8_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question8_ProfileField1 uniqueidentifier	
		SET @Id_Question8_ProfileField1 = '664CDA30-9F40-4BDE-89C7-DABC654A2B0A'
		SET @Name_Question8_ProfileField1 = 'TO_CHANGE_Field 1 Name_TO_CHANGE'
		SET @ShortName_Question8_ProfileField1  = 'TO_CHANGE_Field 1 Short Name_TO_CHANGE'
		SET @FieldNumber_Question8_ProfileField1 = 1
		SET @DataFieldTypeId_Question8_ProfileField1 = @ProfileFieldType_MultiValueList
		SET @IsMandatory_Question8_ProfileField1 = 1
		SET @ReferenceTableId_Question8_ProfileField1 = @Id_Question8_ReferenceTable
		SET @IsReadOnlyCurrentSituation_Question8_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question8_ProfileField1 = 0
		SET @DefaultValue_Question8_ProfileField1 = null
		SET @IncludeInSummary_Question8_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question8_ProfileField1 = null
		
		DECLARE @Id_Question8_ProfileField2 uniqueidentifier
		DECLARE @Name_Question8_ProfileField2 varchar(200)
		DECLARE @ShortName_Question8_ProfileField2 varchar(80)
		DECLARE @FieldNumber_Question8_ProfileField2 int
		DECLARE @DataFieldTypeId_Question8_ProfileField2 uniqueidentifier
		DECLARE @IsMandatory_Question8_ProfileField2 bit
		DECLARE @ReferenceTableId_Question8_ProfileField2 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question8_ProfileField2 bit
		DECLARE @IsReadOnlyScenario_Question8_ProfileField2 bit
		DECLARE @DefaultValue_Question8_ProfileField2 varchar(max)
		DECLARE @IncludeInSummary_Question8_ProfileField2 bit
		DECLARE @ProfileFieldGroupId_Question8_ProfileField2 uniqueidentifier
		SET @Id_Question8_ProfileField2 = '33B96E25-E3D2-4F6E-B8DA-7AE352087481' 
		SET @Name_Question8_ProfileField2 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question8_ProfileField2  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question8_ProfileField2 = 2
		SET @DataFieldTypeId_Question8_ProfileField2 = @ProfileFieldType_LongText
		SET @IsMandatory_Question8_ProfileField2 = 0
		SET @ReferenceTableId_Question8_ProfileField2 = null
		SET @IsReadOnlyCurrentSituation_Question8_ProfileField2 = 0
		SET @IsReadOnlyScenario_Question8_ProfileField2 = 0
		SET @DefaultValue_Question8_ProfileField2 = null
		SET @IncludeInSummary_Question8_ProfileField2 = 1
		SET @ProfileFieldGroupId_Question8_ProfileField2 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question8_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question8_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question8_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question8_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question8_ProfileQuestion int
		DECLARE @IsPerSpecies_Question8_ProfileQuestion bit
		DECLARE @IsRepeating_Question8_ProfileQuestion bit
		DECLARE @UserGuidance_Question8_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question8_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question8_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question8_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question8_ProfileQuestion varchar(255)		
		SET @Id_Question8_ProfileQuestion = '1BCF321B-DE26-4C74-8326-E19D1AD34F03'
		SET @Name_Question8_ProfileQuestion = 'TO_CHANGE_Question 8 Name_TO_CHANGE'
		SET @ShortName_Question8_ProfileQuestion = 'TO_CHANGE_Question 8 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question8_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question8_ProfileQuestion = 8
		SET @IsPerSpecies_Question8_ProfileQuestion = 1
		SET @IsRepeating_Question8_ProfileQuestion = 0
		SET @UserGuidance_Question8_ProfileQuestion = 'TO_CHANGE_Question 8 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question8_ProfileQuestion = null
		SET @IrrelevanceValueId_Question8_ProfileQuestion = null
		SET @IrrelevanceFlag_Question8_ProfileQuestion = null
		SET @NonTechnicalName_Question8_ProfileQuestion = 'TO_CHANGE_Question 8 Non-Technical Name_TO_CHANGE'
		
	-- Question 9 Settings
		
		-- Profile field Entries		
		DECLARE @Id_Question9_ProfileField1 uniqueidentifier
		DECLARE @Name_Question9_ProfileField1 varchar(200)
		DECLARE @ShortName_Question9_ProfileField1 varchar(80)
		DECLARE @FieldNumber_Question9_ProfileField1 int
		DECLARE @DataFieldTypeId_Question9_ProfileField1 uniqueidentifier
		DECLARE @IsMandatory_Question9_ProfileField1 bit
		DECLARE @ReferenceTableId_Question9_ProfileField1 uniqueidentifier
		DECLARE @IsReadOnlyCurrentSituation_Question9_ProfileField1 bit
		DECLARE @IsReadOnlyScenario_Question9_ProfileField1 bit
		DECLARE @DefaultValue_Question9_ProfileField1 varchar(max)
		DECLARE @IncludeInSummary_Question9_ProfileField1 bit
		DECLARE @ProfileFieldGroupId_Question9_ProfileField1 uniqueidentifier
		SET @Id_Question9_ProfileField1 = 'C94B1128-8448-440D-BEFD-D94C1E3C00B1' 
		SET @Name_Question9_ProfileField1 = 'TO_CHANGE_Field 2 Name_TO_CHANGE'
		SET @ShortName_Question9_ProfileField1  = 'TO_CHANGE_Field 2 Short Name_TO_CHANGE'
		SET @FieldNumber_Question9_ProfileField1 = 2
		SET @DataFieldTypeId_Question9_ProfileField1 = @ProfileFieldType_LongText
		SET @IsMandatory_Question9_ProfileField1 = 0
		SET @ReferenceTableId_Question9_ProfileField1 = null
		SET @IsReadOnlyCurrentSituation_Question9_ProfileField1 = 0
		SET @IsReadOnlyScenario_Question9_ProfileField1 = 0
		SET @DefaultValue_Question9_ProfileField1 = null
		SET @IncludeInSummary_Question9_ProfileField1 = 1
		SET @ProfileFieldGroupId_Question9_ProfileField1 = null
		
		-- Profile Question Entries (mandatory)
		DECLARE @Id_Question9_ProfileQuestion uniqueidentifier
		DECLARE @Name_Question9_ProfileQuestion varchar(225)
		DECLARE @ShortName_Question9_ProfileQuestion varchar(80)
		DECLARE @ProfileSectionId_Question9_ProfileQuestion uniqueidentifier
		DECLARE @QuestionNumber_Question9_ProfileQuestion int
		DECLARE @IsPerSpecies_Question9_ProfileQuestion bit
		DECLARE @IsRepeating_Question9_ProfileQuestion bit
		DECLARE @UserGuidance_Question9_ProfileQuestion nvarchar(1000)
		DECLARE @IrrelevanceFieldId_Question9_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceValueId_Question9_ProfileQuestion uniqueidentifier
		DECLARE @IrrelevanceFlag_Question9_ProfileQuestion bit
		DECLARE @NonTechnicalName_Question9_ProfileQuestion varchar(255)		
		SET @Id_Question9_ProfileQuestion = '365EE75C-91A7-4805-A738-D3F1F53DA27F'
		SET @Name_Question9_ProfileQuestion = 'TO_CHANGE_Question 9 Name_TO_CHANGE'
		SET @ShortName_Question9_ProfileQuestion = 'TO_CHANGE_Question 9 Short Name_TO_CHANGE'
		SET @ProfileSectionId_Question9_ProfileQuestion = @ProfileSectionId
		SET @QuestionNumber_Question9_ProfileQuestion = 9
		SET @IsPerSpecies_Question9_ProfileQuestion = 1
		SET @IsRepeating_Question9_ProfileQuestion = 0
		SET @UserGuidance_Question9_ProfileQuestion = 'TO_CHANGE_Question 9 User Guidance_TO_CHANGE'
		SET @IrrelevanceFieldId_Question9_ProfileQuestion = null
		SET @IrrelevanceValueId_Question9_ProfileQuestion = null
		SET @IrrelevanceFlag_Question9_ProfileQuestion = null
		SET @NonTechnicalName_Question9_ProfileQuestion = 'TO_CHANGE_Question 9 Non-Technical Name_TO_CHANGE'
	
-- STEP 5. Insert data created in step 4 into tables
	
		-- Insert all Question 1 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question1_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question1_ReferenceTable
				, @Name_Question1_ReferenceTable
				, @IsMaintainable_Question1_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue1
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue1
				, @SequenceNumber_Question1_ReferenceValue1
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue2
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue2
				, @SequenceNumber_Question1_ReferenceValue2
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue3
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue3
				, @SequenceNumber_Question1_ReferenceValue3
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue4
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue4
				, @SequenceNumber_Question1_ReferenceValue4
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue5
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue5
				, @SequenceNumber_Question1_ReferenceValue5
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question1_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question1_ReferenceValue6
				, @Id_Question1_ReferenceTable
				, @LookupValue_Question1_ReferenceValue6
				, @SequenceNumber_Question1_ReferenceValue6
				, @EffectiveDateFrom_Question1_ReferenceValue
				, @EffectiveDateTo_Question1_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question1_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question1_ProfileQuestion
				, @Name_Question1_ProfileQuestion
				, @ShortName_Question1_ProfileQuestion
				, @ProfileSectionId_Question1_ProfileQuestion
				, @QuestionNumber_Question1_ProfileQuestion
				, @IsPerSpecies_Question1_ProfileQuestion
				, @IsRepeating_Question1_ProfileQuestion
				, @UserGuidance_Question1_ProfileQuestion
				, @IrrelevanceFieldId_Question1_ProfileQuestion
				, @IrrelevanceValueId_Question1_ProfileQuestion
				, @IrrelevanceFlag_Question1_ProfileQuestion
				, @NonTechnicalName_Question1_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question1_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question1_ProfileField1
				, @Name_Question1_ProfileField1
				, @ShortName_Question1_ProfileField1
				, @Id_Question1_ProfileQuestion
				, @FieldNumber_Question1_ProfileField1
				, @DataFieldTypeId_Question1_ProfileField1
				, @IsMandatory_Question1_ProfileField1
				, @ReferenceTableId_Question1_ProfileField1
				, @IsReadOnlyCurrentSituation_Question1_ProfileField1
				, @IsReadOnlyScenario_Question1_ProfileField1
				, @DefaultValue_Question1_ProfileField1
				, @IncludeInSummary_Question1_ProfileField1
				, @ProfileFieldGroupId_Question1_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question1_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question1_ProfileField2
				, @Name_Question1_ProfileField2
				, @ShortName_Question1_ProfileField2
				, @Id_Question1_ProfileQuestion
				, @FieldNumber_Question1_ProfileField2
				, @DataFieldTypeId_Question1_ProfileField2
				, @IsMandatory_Question1_ProfileField2
				, @ReferenceTableId_Question1_ProfileField2
				, @IsReadOnlyCurrentSituation_Question1_ProfileField2
				, @IsReadOnlyScenario_Question1_ProfileField2
				, @DefaultValue_Question1_ProfileField2
				, @IncludeInSummary_Question1_ProfileField2
				, @ProfileFieldGroupId_Question1_ProfileField2
			)
		END
		
		-- Insert all Question 2 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question2_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question2_ReferenceTable
				, @Name_Question2_ReferenceTable
				, @IsMaintainable_Question2_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue1
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue1
				, @SequenceNumber_Question2_ReferenceValue1
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue2
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue2
				, @SequenceNumber_Question2_ReferenceValue2
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue3
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue3
				, @SequenceNumber_Question2_ReferenceValue3
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue4
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue4
				, @SequenceNumber_Question2_ReferenceValue4
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue5
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue5
				, @SequenceNumber_Question2_ReferenceValue5
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question2_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question2_ReferenceValue6
				, @Id_Question2_ReferenceTable
				, @LookupValue_Question2_ReferenceValue6
				, @SequenceNumber_Question2_ReferenceValue6
				, @EffectiveDateFrom_Question2_ReferenceValue
				, @EffectiveDateTo_Question2_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question2_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question2_ProfileQuestion
				, @Name_Question2_ProfileQuestion
				, @ShortName_Question2_ProfileQuestion
				, @ProfileSectionId_Question2_ProfileQuestion
				, @QuestionNumber_Question2_ProfileQuestion
				, @IsPerSpecies_Question2_ProfileQuestion
				, @IsRepeating_Question2_ProfileQuestion
				, @UserGuidance_Question2_ProfileQuestion
				, @IrrelevanceFieldId_Question2_ProfileQuestion
				, @IrrelevanceValueId_Question2_ProfileQuestion
				, @IrrelevanceFlag_Question2_ProfileQuestion
				, @NonTechnicalName_Question2_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question2_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question2_ProfileField1
				, @Name_Question2_ProfileField1
				, @ShortName_Question2_ProfileField1
				, @Id_Question2_ProfileQuestion
				, @FieldNumber_Question2_ProfileField1
				, @DataFieldTypeId_Question2_ProfileField1
				, @IsMandatory_Question2_ProfileField1
				, @ReferenceTableId_Question2_ProfileField1
				, @IsReadOnlyCurrentSituation_Question2_ProfileField1
				, @IsReadOnlyScenario_Question2_ProfileField1
				, @DefaultValue_Question2_ProfileField1
				, @IncludeInSummary_Question2_ProfileField1
				, @ProfileFieldGroupId_Question2_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question2_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question2_ProfileField2
				, @Name_Question2_ProfileField2
				, @ShortName_Question2_ProfileField2
				, @Id_Question2_ProfileQuestion
				, @FieldNumber_Question2_ProfileField2
				, @DataFieldTypeId_Question2_ProfileField2
				, @IsMandatory_Question2_ProfileField2
				, @ReferenceTableId_Question2_ProfileField2
				, @IsReadOnlyCurrentSituation_Question2_ProfileField2
				, @IsReadOnlyScenario_Question2_ProfileField2
				, @DefaultValue_Question2_ProfileField2
				, @IncludeInSummary_Question2_ProfileField2
				, @ProfileFieldGroupId_Question2_ProfileField2
			)
		END
		
		-- Insert all Question 3 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question3_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question3_ReferenceTable
				, @Name_Question3_ReferenceTable
				, @IsMaintainable_Question3_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue1
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue1
				, @SequenceNumber_Question3_ReferenceValue1
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue2
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue2
				, @SequenceNumber_Question3_ReferenceValue2
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue3
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue3
				, @SequenceNumber_Question3_ReferenceValue3
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue4
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue4
				, @SequenceNumber_Question3_ReferenceValue4
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue5
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue5
				, @SequenceNumber_Question3_ReferenceValue5
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question3_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question3_ReferenceValue6
				, @Id_Question3_ReferenceTable
				, @LookupValue_Question3_ReferenceValue6
				, @SequenceNumber_Question3_ReferenceValue6
				, @EffectiveDateFrom_Question3_ReferenceValue
				, @EffectiveDateTo_Question3_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question3_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question3_ProfileQuestion
				, @Name_Question3_ProfileQuestion
				, @ShortName_Question3_ProfileQuestion
				, @ProfileSectionId_Question3_ProfileQuestion
				, @QuestionNumber_Question3_ProfileQuestion
				, @IsPerSpecies_Question3_ProfileQuestion
				, @IsRepeating_Question3_ProfileQuestion
				, @UserGuidance_Question3_ProfileQuestion
				, @IrrelevanceFieldId_Question3_ProfileQuestion
				, @IrrelevanceValueId_Question3_ProfileQuestion
				, @IrrelevanceFlag_Question3_ProfileQuestion
				, @NonTechnicalName_Question3_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question3_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question3_ProfileField1
				, @Name_Question3_ProfileField1
				, @ShortName_Question3_ProfileField1
				, @Id_Question3_ProfileQuestion
				, @FieldNumber_Question3_ProfileField1
				, @DataFieldTypeId_Question3_ProfileField1
				, @IsMandatory_Question3_ProfileField1
				, @ReferenceTableId_Question3_ProfileField1
				, @IsReadOnlyCurrentSituation_Question3_ProfileField1
				, @IsReadOnlyScenario_Question3_ProfileField1
				, @DefaultValue_Question3_ProfileField1
				, @IncludeInSummary_Question3_ProfileField1
				, @ProfileFieldGroupId_Question3_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question3_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question3_ProfileField2
				, @Name_Question3_ProfileField2
				, @ShortName_Question3_ProfileField2
				, @Id_Question3_ProfileQuestion
				, @FieldNumber_Question3_ProfileField2
				, @DataFieldTypeId_Question3_ProfileField2
				, @IsMandatory_Question3_ProfileField2
				, @ReferenceTableId_Question3_ProfileField2
				, @IsReadOnlyCurrentSituation_Question3_ProfileField2
				, @IsReadOnlyScenario_Question3_ProfileField2
				, @DefaultValue_Question3_ProfileField2
				, @IncludeInSummary_Question3_ProfileField2
				, @ProfileFieldGroupId_Question3_ProfileField2
			)
		END
		
		-- Insert all Question 4 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question4_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question4_ReferenceTable
				, @Name_Question4_ReferenceTable
				, @IsMaintainable_Question4_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue1
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue1
				, @SequenceNumber_Question4_ReferenceValue1
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue2
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue2
				, @SequenceNumber_Question4_ReferenceValue2
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue3
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue3
				, @SequenceNumber_Question4_ReferenceValue3
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue4
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue4
				, @SequenceNumber_Question4_ReferenceValue4
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue5
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue5
				, @SequenceNumber_Question4_ReferenceValue5
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question4_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question4_ReferenceValue6
				, @Id_Question4_ReferenceTable
				, @LookupValue_Question4_ReferenceValue6
				, @SequenceNumber_Question4_ReferenceValue6
				, @EffectiveDateFrom_Question4_ReferenceValue
				, @EffectiveDateTo_Question4_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question4_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question4_ProfileQuestion
				, @Name_Question4_ProfileQuestion
				, @ShortName_Question4_ProfileQuestion
				, @ProfileSectionId_Question4_ProfileQuestion
				, @QuestionNumber_Question4_ProfileQuestion
				, @IsPerSpecies_Question4_ProfileQuestion
				, @IsRepeating_Question4_ProfileQuestion
				, @UserGuidance_Question4_ProfileQuestion
				, @IrrelevanceFieldId_Question4_ProfileQuestion
				, @IrrelevanceValueId_Question4_ProfileQuestion
				, @IrrelevanceFlag_Question4_ProfileQuestion
				, @NonTechnicalName_Question4_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question4_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question4_ProfileField1
				, @Name_Question4_ProfileField1
				, @ShortName_Question4_ProfileField1
				, @Id_Question4_ProfileQuestion
				, @FieldNumber_Question4_ProfileField1
				, @DataFieldTypeId_Question4_ProfileField1
				, @IsMandatory_Question4_ProfileField1
				, @ReferenceTableId_Question4_ProfileField1
				, @IsReadOnlyCurrentSituation_Question4_ProfileField1
				, @IsReadOnlyScenario_Question4_ProfileField1
				, @DefaultValue_Question4_ProfileField1
				, @IncludeInSummary_Question4_ProfileField1
				, @ProfileFieldGroupId_Question4_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question4_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question4_ProfileField2
				, @Name_Question4_ProfileField2
				, @ShortName_Question4_ProfileField2
				, @Id_Question4_ProfileQuestion
				, @FieldNumber_Question4_ProfileField2
				, @DataFieldTypeId_Question4_ProfileField2
				, @IsMandatory_Question4_ProfileField2
				, @ReferenceTableId_Question4_ProfileField2
				, @IsReadOnlyCurrentSituation_Question4_ProfileField2
				, @IsReadOnlyScenario_Question4_ProfileField2
				, @DefaultValue_Question4_ProfileField2
				, @IncludeInSummary_Question4_ProfileField2
				, @ProfileFieldGroupId_Question4_ProfileField2
			)
		END
		
		-- Insert all Question 5 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question5_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question5_ReferenceTable
				, @Name_Question5_ReferenceTable
				, @IsMaintainable_Question5_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue1
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue1
				, @SequenceNumber_Question5_ReferenceValue1
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue2
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue2
				, @SequenceNumber_Question5_ReferenceValue2
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue3
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue3
				, @SequenceNumber_Question5_ReferenceValue3
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue4
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue4
				, @SequenceNumber_Question5_ReferenceValue4
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue5
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue5
				, @SequenceNumber_Question5_ReferenceValue5
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question5_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question5_ReferenceValue6
				, @Id_Question5_ReferenceTable
				, @LookupValue_Question5_ReferenceValue6
				, @SequenceNumber_Question5_ReferenceValue6
				, @EffectiveDateFrom_Question5_ReferenceValue
				, @EffectiveDateTo_Question5_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question5_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question5_ProfileQuestion
				, @Name_Question5_ProfileQuestion
				, @ShortName_Question5_ProfileQuestion
				, @ProfileSectionId_Question5_ProfileQuestion
				, @QuestionNumber_Question5_ProfileQuestion
				, @IsPerSpecies_Question5_ProfileQuestion
				, @IsRepeating_Question5_ProfileQuestion
				, @UserGuidance_Question5_ProfileQuestion
				, @IrrelevanceFieldId_Question5_ProfileQuestion
				, @IrrelevanceValueId_Question5_ProfileQuestion
				, @IrrelevanceFlag_Question5_ProfileQuestion
				, @NonTechnicalName_Question5_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question5_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question5_ProfileField1
				, @Name_Question5_ProfileField1
				, @ShortName_Question5_ProfileField1
				, @Id_Question5_ProfileQuestion
				, @FieldNumber_Question5_ProfileField1
				, @DataFieldTypeId_Question5_ProfileField1
				, @IsMandatory_Question5_ProfileField1
				, @ReferenceTableId_Question5_ProfileField1
				, @IsReadOnlyCurrentSituation_Question5_ProfileField1
				, @IsReadOnlyScenario_Question5_ProfileField1
				, @DefaultValue_Question5_ProfileField1
				, @IncludeInSummary_Question5_ProfileField1
				, @ProfileFieldGroupId_Question5_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question5_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question5_ProfileField2
				, @Name_Question5_ProfileField2
				, @ShortName_Question5_ProfileField2
				, @Id_Question5_ProfileQuestion
				, @FieldNumber_Question5_ProfileField2
				, @DataFieldTypeId_Question5_ProfileField2
				, @IsMandatory_Question5_ProfileField2
				, @ReferenceTableId_Question5_ProfileField2
				, @IsReadOnlyCurrentSituation_Question5_ProfileField2
				, @IsReadOnlyScenario_Question5_ProfileField2
				, @DefaultValue_Question5_ProfileField2
				, @IncludeInSummary_Question5_ProfileField2
				, @ProfileFieldGroupId_Question5_ProfileField2
			)
		END
		
		-- Insert all Question 6 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question6_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question6_ReferenceTable
				, @Name_Question6_ReferenceTable
				, @IsMaintainable_Question6_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue1
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue1
				, @SequenceNumber_Question6_ReferenceValue1
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue2
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue2
				, @SequenceNumber_Question6_ReferenceValue2
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue3
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue3
				, @SequenceNumber_Question6_ReferenceValue3
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue4
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue4
				, @SequenceNumber_Question6_ReferenceValue4
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue5
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue5
				, @SequenceNumber_Question6_ReferenceValue5
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question6_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question6_ReferenceValue6
				, @Id_Question6_ReferenceTable
				, @LookupValue_Question6_ReferenceValue6
				, @SequenceNumber_Question6_ReferenceValue6
				, @EffectiveDateFrom_Question6_ReferenceValue
				, @EffectiveDateTo_Question6_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question6_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question6_ProfileQuestion
				, @Name_Question6_ProfileQuestion
				, @ShortName_Question6_ProfileQuestion
				, @ProfileSectionId_Question6_ProfileQuestion
				, @QuestionNumber_Question6_ProfileQuestion
				, @IsPerSpecies_Question6_ProfileQuestion
				, @IsRepeating_Question6_ProfileQuestion
				, @UserGuidance_Question6_ProfileQuestion
				, @IrrelevanceFieldId_Question6_ProfileQuestion
				, @IrrelevanceValueId_Question6_ProfileQuestion
				, @IrrelevanceFlag_Question6_ProfileQuestion
				, @NonTechnicalName_Question6_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question6_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question6_ProfileField1
				, @Name_Question6_ProfileField1
				, @ShortName_Question6_ProfileField1
				, @Id_Question6_ProfileQuestion
				, @FieldNumber_Question6_ProfileField1
				, @DataFieldTypeId_Question6_ProfileField1
				, @IsMandatory_Question6_ProfileField1
				, @ReferenceTableId_Question6_ProfileField1
				, @IsReadOnlyCurrentSituation_Question6_ProfileField1
				, @IsReadOnlyScenario_Question6_ProfileField1
				, @DefaultValue_Question6_ProfileField1
				, @IncludeInSummary_Question6_ProfileField1
				, @ProfileFieldGroupId_Question6_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question6_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question6_ProfileField2
				, @Name_Question6_ProfileField2
				, @ShortName_Question6_ProfileField2
				, @Id_Question6_ProfileQuestion
				, @FieldNumber_Question6_ProfileField2
				, @DataFieldTypeId_Question6_ProfileField2
				, @IsMandatory_Question6_ProfileField2
				, @ReferenceTableId_Question6_ProfileField2
				, @IsReadOnlyCurrentSituation_Question6_ProfileField2
				, @IsReadOnlyScenario_Question6_ProfileField2
				, @DefaultValue_Question6_ProfileField2
				, @IncludeInSummary_Question6_ProfileField2
				, @ProfileFieldGroupId_Question6_ProfileField2
			)
		END
		
		-- Insert all Question 7 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question7_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question7_ReferenceTable
				, @Name_Question7_ReferenceTable
				, @IsMaintainable_Question7_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue1
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue1
				, @SequenceNumber_Question7_ReferenceValue1
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue2
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue2
				, @SequenceNumber_Question7_ReferenceValue2
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue3
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue3
				, @SequenceNumber_Question7_ReferenceValue3
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue4
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue4
				, @SequenceNumber_Question7_ReferenceValue4
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue5
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue5
				, @SequenceNumber_Question7_ReferenceValue5
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question7_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question7_ReferenceValue6
				, @Id_Question7_ReferenceTable
				, @LookupValue_Question7_ReferenceValue6
				, @SequenceNumber_Question7_ReferenceValue6
				, @EffectiveDateFrom_Question7_ReferenceValue
				, @EffectiveDateTo_Question7_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question7_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question7_ProfileQuestion
				, @Name_Question7_ProfileQuestion
				, @ShortName_Question7_ProfileQuestion
				, @ProfileSectionId_Question7_ProfileQuestion
				, @QuestionNumber_Question7_ProfileQuestion
				, @IsPerSpecies_Question7_ProfileQuestion
				, @IsRepeating_Question7_ProfileQuestion
				, @UserGuidance_Question7_ProfileQuestion
				, @IrrelevanceFieldId_Question7_ProfileQuestion
				, @IrrelevanceValueId_Question7_ProfileQuestion
				, @IrrelevanceFlag_Question7_ProfileQuestion
				, @NonTechnicalName_Question7_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question7_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question7_ProfileField1
				, @Name_Question7_ProfileField1
				, @ShortName_Question7_ProfileField1
				, @Id_Question7_ProfileQuestion
				, @FieldNumber_Question7_ProfileField1
				, @DataFieldTypeId_Question7_ProfileField1
				, @IsMandatory_Question7_ProfileField1
				, @ReferenceTableId_Question7_ProfileField1
				, @IsReadOnlyCurrentSituation_Question7_ProfileField1
				, @IsReadOnlyScenario_Question7_ProfileField1
				, @DefaultValue_Question7_ProfileField1
				, @IncludeInSummary_Question7_ProfileField1
				, @ProfileFieldGroupId_Question7_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question7_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question7_ProfileField2
				, @Name_Question7_ProfileField2
				, @ShortName_Question7_ProfileField2
				, @Id_Question7_ProfileQuestion
				, @FieldNumber_Question7_ProfileField2
				, @DataFieldTypeId_Question7_ProfileField2
				, @IsMandatory_Question7_ProfileField2
				, @ReferenceTableId_Question7_ProfileField2
				, @IsReadOnlyCurrentSituation_Question7_ProfileField2
				, @IsReadOnlyScenario_Question7_ProfileField2
				, @DefaultValue_Question7_ProfileField2
				, @IncludeInSummary_Question7_ProfileField2
				, @ProfileFieldGroupId_Question7_ProfileField2
			)
		END
		
		-- Insert all Question 8 Data	
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceTable] WHERE Id = @Id_Question8_ReferenceTable)
		BEGIN
			INSERT INTO [dbo].[ReferenceTable]
			(
				[Id]
				, [Name]
				, [IsMaintainable]
			)
			VALUES
			(
				@Id_Question8_ReferenceTable
				, @Name_Question8_ReferenceTable
				, @IsMaintainable_Question8_ReferenceTable
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue1)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue1
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue1
				, @SequenceNumber_Question8_ReferenceValue1
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue2)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue2
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue2
				, @SequenceNumber_Question8_ReferenceValue2
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue3)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue3
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue3
				, @SequenceNumber_Question8_ReferenceValue3
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue4)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue4
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue4
				, @SequenceNumber_Question8_ReferenceValue4
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue5)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue5
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue5
				, @SequenceNumber_Question8_ReferenceValue5
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ReferenceValue] WHERE Id = @Id_Question8_ReferenceValue6)
		BEGIN
			INSERT INTO [dbo].[ReferenceValue]
			(
				[Id]
				, [ReferenceTableId]
				, [LookupValue]
				, [SequenceNumber]
				, [EffectiveDateFrom]
				, [EffectiveDateTo]
			)
			VALUES
			(
				@Id_Question8_ReferenceValue6
				, @Id_Question8_ReferenceTable
				, @LookupValue_Question8_ReferenceValue6
				, @SequenceNumber_Question8_ReferenceValue6
				, @EffectiveDateFrom_Question8_ReferenceValue
				, @EffectiveDateTo_Question8_ReferenceValue
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question8_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question8_ProfileQuestion
				, @Name_Question8_ProfileQuestion
				, @ShortName_Question8_ProfileQuestion
				, @ProfileSectionId_Question8_ProfileQuestion
				, @QuestionNumber_Question8_ProfileQuestion
				, @IsPerSpecies_Question8_ProfileQuestion
				, @IsRepeating_Question8_ProfileQuestion
				, @UserGuidance_Question8_ProfileQuestion
				, @IrrelevanceFieldId_Question8_ProfileQuestion
				, @IrrelevanceValueId_Question8_ProfileQuestion
				, @IrrelevanceFlag_Question8_ProfileQuestion
				, @NonTechnicalName_Question8_ProfileQuestion
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question8_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question8_ProfileField1
				, @Name_Question8_ProfileField1
				, @ShortName_Question8_ProfileField1
				, @Id_Question8_ProfileQuestion
				, @FieldNumber_Question8_ProfileField1
				, @DataFieldTypeId_Question8_ProfileField1
				, @IsMandatory_Question8_ProfileField1
				, @ReferenceTableId_Question8_ProfileField1
				, @IsReadOnlyCurrentSituation_Question8_ProfileField1
				, @IsReadOnlyScenario_Question8_ProfileField1
				, @DefaultValue_Question8_ProfileField1
				, @IncludeInSummary_Question8_ProfileField1
				, @ProfileFieldGroupId_Question8_ProfileField1
			)
		END
		
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question8_ProfileField2)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question8_ProfileField2
				, @Name_Question8_ProfileField2
				, @ShortName_Question8_ProfileField2
				, @Id_Question8_ProfileQuestion
				, @FieldNumber_Question8_ProfileField2
				, @DataFieldTypeId_Question8_ProfileField2
				, @IsMandatory_Question8_ProfileField2
				, @ReferenceTableId_Question8_ProfileField2
				, @IsReadOnlyCurrentSituation_Question8_ProfileField2
				, @IsReadOnlyScenario_Question8_ProfileField2
				, @DefaultValue_Question8_ProfileField2
				, @IncludeInSummary_Question8_ProfileField2
				, @ProfileFieldGroupId_Question8_ProfileField2
			)
		END
		
		-- Insert all Question 9 data
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileQuestion] WHERE Id = @Id_Question9_ProfileQuestion)
		BEGIN 
			INSERT INTO [dbo].[ProfileQuestion] 
			(
				Id
				, [Name]
				, [ShortName]
				, [ProfileSectionId]
				, [QuestionNumber]
				, [IsPerSpecies]
				, [IsRepeating]
				, [UserGuidance]
				, [IrrelevanceFieldId]
				, [IrrelevanceValueId]
				, [IrrelevanceFlag]
				, [NonTechnicalName]
			)
			VALUES
			(
				@Id_Question9_ProfileQuestion
				, @Name_Question9_ProfileQuestion
				, @ShortName_Question9_ProfileQuestion
				, @ProfileSectionId_Question9_ProfileQuestion
				, @QuestionNumber_Question9_ProfileQuestion
				, @IsPerSpecies_Question9_ProfileQuestion
				, @IsRepeating_Question9_ProfileQuestion
				, @UserGuidance_Question9_ProfileQuestion
				, @IrrelevanceFieldId_Question9_ProfileQuestion
				, @IrrelevanceValueId_Question9_ProfileQuestion
				, @IrrelevanceFlag_Question9_ProfileQuestion
				, @NonTechnicalName_Question9_ProfileQuestion
			)
		END
				
		IF NOT EXISTS (SELECT * FROM [dbo].[ProfileField] WHERE Id = @Id_Question9_ProfileField1)
		BEGIN 
			INSERT INTO [dbo].[ProfileField]
			(
				[Id]
				, [Name]
				, [ShortName]
				, [ProfileQuestionId]
				, [FieldNumber]
				, [DataFieldTypeId]
				, [IsMandatory]
				, [ReferenceTableId]
				, [IsReadOnlyCurrentSituation]
				, [IsReadOnlyScenario]
				, [DefaultValue]
				, [IncludeInSummary]
				, [ProfileFieldGroupId]
			)
			VALUES
			(
				@Id_Question9_ProfileField1
				, @Name_Question9_ProfileField1
				, @ShortName_Question9_ProfileField1
				, @Id_Question9_ProfileQuestion
				, @FieldNumber_Question9_ProfileField1
				, @DataFieldTypeId_Question9_ProfileField1
				, @IsMandatory_Question9_ProfileField1
				, @ReferenceTableId_Question9_ProfileField1
				, @IsReadOnlyCurrentSituation_Question9_ProfileField1
				, @IsReadOnlyScenario_Question9_ProfileField1
				, @DefaultValue_Question9_ProfileField1
				, @IncludeInSummary_Question9_ProfileField1
				, @ProfileFieldGroupId_Question9_ProfileField1
			)
		END

COMMIT TRAN



