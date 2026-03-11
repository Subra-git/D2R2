-- APHA D2R2 v2 Questions Update Script

-- FIELD ID for 1.5 Boolean : User Stories 4865 and 4866
DECLARE @Field_1_5 uniqueidentifier = 'B93EE197-9E69-4E22-86BD-02B2C55223FB'
DECLARE @LongTextDataType uniqueidentifier = 'D297F63B-638A-4574-B042-97C248338A26'


-- When Q 1.5 is set to YES, the following sections should hide
/*
Already hidden question numbers:
									3.21
									3.22
									11.2
									11.3
New Numbers to hide:
*/
UPDATE [ProfileQuestion]
	SET [IrrelevanceFieldId] = @Field_1_5,
	[IrrelevanceFlag] = 0
	WHERE [ProfileQuestion].[Id] IN
	('EA914FD3-C5BF-42F2-9732-34C698B3B711' --Question 2.5
	,'03005543-E9F3-46C8-B931-2AD4C6BEC38B' --Question 3.2
	,'6DE18354-7BFF-45AE-B632-34F76E1A8A8D' --Question 3.19
	,'8E8EB69C-0450-4C65-89AA-3B7B223F1B08' --Question 9.5
	,'17589563-1313-4A63-967B-DD559CCFBAC8' --Question 9.6
	,'53A4A7F1-8300-4E9A-8F5B-726D46F7B4D1' --Question 9.7
	,'F3E20C91-DD8B-4BD7-8E5F-D972F8BA60F7' --Question 11.4
	)


-- Section 9 - New Question 0  : User Story 4867
DECLARE @Section_9_Id uniqueidentifier = '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC'
DECLARE @NewQuestionID uniqueidentifier = '517ABF1B-7D10-4B1E-B233-098B9BFA7754' --newid()
DECLARE @NewFieldID uniqueidentifier = 'DB29D553-6953-4462-966E-63FE3269E98A' --newid()

IF NOT EXISTS(SELECT * FROM [ProfileQuestion] WHERE [Id] = @NewQuestionID)
	BEGIN
			INSERT INTO [dbo].[ProfileQuestion]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileSectionId]
			   ,[QuestionNumber]
			   ,[IsPerSpecies]
			   ,[IsRepeating]
			   ,[UserGuidance]
			   ,[IrrelevanceFieldId]
			   ,[IrrelevanceValueId]
			   ,[IrrelevanceFlag]
			   ,[NonTechnicalName])
			VALUES
			   (@NewQuestionID
			   ,'What are the drivers for currently undertaking control of this issue?'
			   ,'Current control drivers for this issue'
			   ,@Section_9_Id
			   ,0
			   ,0
			   ,0
			   ,'This is to capture the drivers for controlling the disease (OIE/ trade/ domestic policy rationale)'
			   ,null
			   ,null
			   ,null
			   ,'What are the drivers for currently undertaking control of this issue?')
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileQuestion]
			SET 
			   [Name] = 'What are the drivers for currently undertaking control of this issue?'
			   ,[ShortName] = 'Current control drivers for this issue'
			   ,[ProfileSectionId] = @Section_9_Id
			   ,[QuestionNumber] = 0
			   ,[IsPerSpecies] = 0
			   ,[IsRepeating] = 0
			   ,[UserGuidance] = 'This is to capture the drivers for controlling the disease (OIE/ trade/ domestic policy rationale)'
			   ,[IrrelevanceFieldId] = null
			   ,[IrrelevanceValueId] = null
			   ,[IrrelevanceFlag] = null
			   ,[NonTechnicalName] = 'What are the drivers for currently undertaking control of this issue?'
			WHERE [Id] = @NewQuestionID

	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID
			   ,null
			   ,'Description'
			   ,@NewQuestionID
			   ,1
			   ,@LongTextDataType -- Long Text
			   ,1
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1     
			   ,null
			   ,1)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = null
			   ,[ShortName] = 'Description'
			   ,[ProfileQuestionId] = @NewQuestionID
			   ,[FieldNumber] = 1
			   ,[DataFieldTypeId] = @LongTextDataType
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			WHERE [Id] = @NewFieldID

	END

UPDATE [ProfileQuestion]
	SET [IrrelevanceFieldId] = @Field_1_5,
	[IrrelevanceFlag] = 0
	WHERE [ProfileQuestion].[Id] = @NewQuestionID


-- Non-mandatory Questions : User Story 4859
/* Fields belonging to the following questions are being made non-mandatory:

1.2 Description
4.8 Further information relevant to the agent 
5.10 (entry required for each profiled species) Potential to reduce welfare implications in each species/group  
6.9 (if present) Prevalence and geographic distribution  
8.3 Applicable legislation/mandates  
10.1 What are the key risk factors that could increase the level of infection/disease, or increase the risk of introducing this infection/disease  
10.2 What are the key mitigating factors that currently control or prevent infection/disease occurrence in G.B. 
10.3 What are the key additional mitigating factors that could be applied to control or prevent infection/disease occurrence in G.B. 
10.4 Level of inherent biological variability

*/

UPDATE [dbo].[ProfileField]
SET [IsMandatory] = 0 
WHERE [Id] IN (
	'E8177ECD-2028-48D0-9DCB-2C44ACBBEEDC'  --1.2
	,'6BF59D9F-E9DF-4B40-9FBD-FEB63B0894E9' --4.8
	,'371A7645-068B-4195-8092-798ED57416EC' -- 5.10 field 1
	,'C04698DF-734C-48F3-AD1B-E2097AF20280' -- 5.10 field 2
	,'0A8E869F-639C-4FF6-BFC4-F2CE77DDFD4E' -- 6.9 field 1
	,'F2802D49-C0D4-4A7F-BED0-B8A8970EA531' -- 6.9 field 2
	,'D91E8E19-8CE8-4FBB-859E-71590DAE54ED' -- 8.3 field 1
	,'C8348A4B-14DF-4665-B453-68AF2AE6226F' -- 8.3 field 2
	,'EE9CB071-DE98-4E29-A9F6-131AB455DB6C' -- 10.1 field 4
	,'E1FAAC8E-65AB-4D06-B659-41D0FC920D85' -- 10.2 field 3
	,'39ED79BE-BE43-4F33-AE5A-589692D40480' -- 10.3 field 2
	,'5E857081-2A35-4ABC-92A6-69B5AF45A5A9' -- 10.4 field 1
	,'863AD277-C82B-44CF-9FCF-8325AB0F60AA' -- 10.4 field 2
)


-- Updated Question 2.1 : User Story 4896
DECLARE @Question2_1_Id uniqueidentifier = '93B12402-F412-4227-9E86-B929F5C42171'
DECLARE @ReferenceTableId uniqueidentifier = (SELECT TOP 1 [ID] FROM [ReferenceTable] WHERE [Name] = 'Present in the United Kingdom')
IF @ReferenceTableId IS NULL
BEGIN 
	SELECT @ReferenceTableId = newid()
END
												
DECLARE @QuestionFieldId uniqueidentifier = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A' --GB Presence Indicator list field
DECLARE @UKCommentsFieldId uniqueidentifier = 'B97082F0-091A-40BB-A028-531B5D024589' --GB Presence Indicator Comments text field
DECLARE @ListDataFieldType uniqueidentifier = 'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9' -- List

DECLARE @YesFieldValue uniqueidentifier = (SELECT TOP 1 [ID] FROM [ReferenceValue] WHERE [ReferenceTableId] = @ReferenceTableId AND [LookupValue] = 'Yes - consistent across UK')

IF @YesFieldValue IS NULL
BEGIN
	SELECT @YesFieldValue = '2C642201-C7E1-4947-8BCB-CE9F726F5EA0' --newid()
END

DECLARE @PartialYesFieldValue uniqueidentifier = (SELECT TOP 1 [ID] FROM [ReferenceValue] WHERE [ReferenceTableId] = @ReferenceTableId AND [LookupValue] = 'Yes - varies across UK')

IF @PartialYesFieldValue IS NULL
BEGIN
	SELECT @PartialYesFieldValue = 'c26801ea-2a92-4e59-be3e-366bb8f3b38f' --newid()
END

DECLARE @NoFieldValue uniqueidentifier = (SELECT TOP 1 [ID] FROM [ReferenceValue] WHERE [ReferenceTableId] = @ReferenceTableId AND [LookupValue] = 'No')
IF @NoFieldValue IS NULL
BEGIN
	SELECT @NoFieldValue = '19BF7BF5-86AF-419C-97A2-0587CCAC91AA' --newid()
END

UPDATE [dbo].[ProfileQuestion]
SET [Name] = 'Is this disease or infection currently present in the United Kingdom?'
WHERE [Id] = @Question2_1_Id

IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [ID] = @ReferenceTableId)
BEGIN
		INSERT INTO [dbo].[ReferenceTable]
           ([Id]
           ,[Name]
           ,[IsMaintainable])
		VALUES
           (@ReferenceTableId
           ,'Present in the United Kingdom'
           ,0)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [ID] = @YesFieldValue)
BEGIN
		INSERT INTO [dbo].[ReferenceValue]
           ([Id]
           ,[ReferenceTableId]
           ,[LookupValue]
           ,[SequenceNumber]
           ,[EffectiveDateFrom]
           ,[EffectiveDateTo])
		VALUES
           (@YesFieldValue, @ReferenceTableId, 'Yes - consistent across UK', 3, null, null)
           ,(@PartialYesFieldValue, @ReferenceTableId, 'Yes - varies across UK', 2, null, null)
           ,(@NoFieldValue, @ReferenceTableId, 'No', 1, null, null)
END

UPDATE [dbo].[ProfileField]
SET [ReferenceTableId] = @ReferenceTableId,
	[DataFieldTypeId] = @ListDataFieldType
WHERE [Id] = @QuestionFieldId


-- Data Migration for existing data with boolean value to list value.

UPDATE [dbo].[ProfileVersionFieldValue]
   SET [BooleanValue] = null
      ,[ListValue] = @YesFieldValue
      
 WHERE [ProfileFieldId] = @QuestionFieldId
	AND [BooleanValue] = 1

	
UPDATE [dbo].[ProfileVersionFieldValue]
   SET [BooleanValue] = null
      ,[ListValue] = @NoFieldValue
      
 WHERE [ProfileFieldId] = @QuestionFieldId
	AND [BooleanValue] = 0


UPDATE [dbo].[ProfileQuestion]
   SET IrrelevanceFlag = null
	  ,IrrelevanceValueId = @NoFieldValue

 WHERE [IrrelevanceFieldId] = @QuestionFieldId
	AND IrrelevanceFlag = 0


UPDATE [dbo].[ProfileQuestion]
   SET IrrelevanceFlag = null
	  ,IrrelevanceValueId = @YesFieldValue

 WHERE [IrrelevanceFieldId] = @QuestionFieldId
	AND IrrelevanceFlag = 1


-- Introducing the concept of a field within a question driving visibility of other fields of the same question
IF NOT EXISTS(SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProfileField'
AND COLUMN_NAME = 'RelevanceFieldId')
BEGIN
	ALTER TABLE [ProfileField]
	ADD RelevanceFieldId uniqueidentifier null

	ALTER TABLE [dbo].[ProfileField]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileField_ProfileField_RelevanceFieldId] FOREIGN KEY([RelevanceFieldId])
	REFERENCES [dbo].[ProfileField] ([Id])

	ALTER TABLE [dbo].[ProfileField] CHECK CONSTRAINT [FK_ProfileField_ProfileField_RelevanceFieldId]
END

IF NOT EXISTS(SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProfileField'
AND COLUMN_NAME = 'RelevanceValueId')
BEGIN
	ALTER TABLE [ProfileField]
	ADD RelevanceValueId uniqueidentifier null

	
	ALTER TABLE [dbo].[ProfileField]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileField_ReferenceValue] FOREIGN KEY([RelevanceValueId])
	REFERENCES [dbo].[ReferenceValue] ([Id])

	ALTER TABLE [dbo].[ProfileField] CHECK CONSTRAINT [FK_ProfileField_ReferenceValue]
END


DECLARE @ScotlandCommentsFieldId uniqueidentifier = 'BDF3B34A-44ED-4648-B4C8-C3D230B3EB7F' --newid()
DECLARE @WalesCommentsFieldId uniqueidentifier = '420C7071-C7C6-4FA8-8C18-4CE06C649BD3' --newid()
DECLARE @NorthernIrelandCommentsFieldId uniqueidentifier = '09C358A4-FA23-4D00-837F-C3504560D01B' --newid()

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @ScotlandCommentsFieldId)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@ScotlandCommentsFieldId
			   ,'How does it vary across Scotland?'
			   ,'Scotland Presence Indicator Comments'
			   ,@Question2_1_Id
			   ,3
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@QuestionFieldId
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'How does it vary across Scotland?'
			   ,[ShortName] = 'Scotland Presence Indicator Comments'
			   ,[ProfileQuestionId] = @Question2_1_Id
			   ,[FieldNumber] = 3
			   ,[DataFieldTypeId] = @LongTextDataType
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @QuestionFieldId
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @ScotlandCommentsFieldId
	END

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @WalesCommentsFieldId)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@WalesCommentsFieldId
			   ,'How does it vary across Wales?'
			   ,'Wales Presence Indicator Comments'
			   ,@Question2_1_Id
			   ,4
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@QuestionFieldId
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'How does it vary across Wales?'
			   ,[ShortName] = 'Wales Presence Indicator Comments'
			   ,[ProfileQuestionId] = @Question2_1_Id
			   ,[FieldNumber] = 4
			   ,[DataFieldTypeId] = @LongTextDataType
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @QuestionFieldId
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @WalesCommentsFieldId
	END


IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @NorthernIrelandCommentsFieldId)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@NorthernIrelandCommentsFieldId
			   ,'How does it vary across Northen Ireland?'
			   ,'Northen Ireland Presence Indicator Comments'
			   ,@Question2_1_Id
			   ,5
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@QuestionFieldId
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'How does it vary across Northen Ireland?'
			   ,[ShortName] = 'Northen Ireland Presence Indicator Comments'
			   ,[ProfileQuestionId] = @Question2_1_Id
			   ,[FieldNumber] = 5
			   ,[DataFieldTypeId] = @LongTextDataType
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @QuestionFieldId
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @NorthernIrelandCommentsFieldId
	END

/*
	New table to drive dynamic data copying (replicating) via the UI from
	a field to others.
--*/

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'ProfileFieldDataReplication'))
BEGIN

	CREATE TABLE [dbo].[ProfileFieldDataReplication](
		[Id] [uniqueidentifier] NOT NULL,
		[SourceFieldId] [uniqueidentifier] NOT NULL,
		[TargetFieldId] [uniqueidentifier] NOT NULL
	 CONSTRAINT [PK_ProfileFieldDataReplication] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[ProfileFieldDataReplication] ADD  CONSTRAINT [DF_ProfileFieldDataReplication_Id]  DEFAULT (newid()) FOR [Id]

	ALTER TABLE [dbo].[ProfileFieldDataReplication]  WITH CHECK ADD  CONSTRAINT [FK_ProfileFieldDataReplication_ProfileField_SourceFieldId] FOREIGN KEY([SourceFieldId])
	REFERENCES [dbo].[ProfileField] ([Id])

	ALTER TABLE [dbo].[ProfileFieldDataReplication] CHECK CONSTRAINT [FK_ProfileFieldDataReplication_ProfileField_SourceFieldId]
	
	ALTER TABLE [dbo].[ProfileFieldDataReplication]  WITH CHECK ADD  CONSTRAINT [FK_ProfileFieldDataReplication_ProfileField_TargetFieldId] FOREIGN KEY([TargetFieldId])
	REFERENCES [dbo].[ProfileField] ([Id])

	ALTER TABLE [dbo].[ProfileFieldDataReplication] CHECK CONSTRAINT [FK_ProfileFieldDataReplication_ProfileField_TargetFieldId]

END

/*
	Seed Profile Field Data Replication values
--*/

IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId 
				AND [TargetFieldId] = @ScotlandCommentsFieldId)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId, @ScotlandCommentsFieldId)
END

IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId 
				AND [TargetFieldId] = @WalesCommentsFieldId)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId, @WalesCommentsFieldId)
END

IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId 
				AND [TargetFieldId] = @NorthernIrelandCommentsFieldId)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId, @NorthernIrelandCommentsFieldId)
END


-- Section 12 - New Question 0  : User Story 4892
DECLARE @Section_12_Id uniqueidentifier = 'C90FBBAD-BE8D-4317-BF7C-7A56B45B2828'
DECLARE @NewQuestionID_12_0 uniqueidentifier = '1C276D6A-2704-4834-BC99-00F8E4C1A506' --newid()
DECLARE @NewFieldID_12_0_Field1 uniqueidentifier = '8A98E6F1-07C7-453B-80C6-055B39F4C555' --newid()
DECLARE @NewFieldID_12_0_Field2 uniqueidentifier = '1018094E-015E-4631-ACA9-28D3E055A7F3' --newid()
DECLARE @NewFieldID_12_0_Field3 uniqueidentifier = 'EB69DD9C-B63E-4234-8E9D-CA300A1FCEEA' --newid()
DECLARE @ReferenceTableId_12_0 uniqueidentifier = '0693DDD3-82AF-41C9-A5DB-6ABD852FFF9E' --newid()


-- Building a new checkbox value list for the question 12.0 Field 1:
--		What are the drivers and approach for undertaking surveillance for this issue?

IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [ID] = @ReferenceTableId_12_0)
BEGIN
		INSERT INTO [dbo].[ReferenceTable]
           ([Id]
           ,[Name]
           ,[IsMaintainable])
		VALUES
           (@ReferenceTableId_12_0
           ,'Drivers and approach for undertaking surveillance'
           ,0)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [ReferenceTableId] = @ReferenceTableId_12_0)
BEGIN
		INSERT INTO [dbo].[ReferenceValue]
           ([Id]
           ,[ReferenceTableId]
           ,[LookupValue]
           ,[SequenceNumber]
           ,[EffectiveDateFrom]
           ,[EffectiveDateTo])
		VALUES
           (newid(), @ReferenceTableId_12_0, '1. Structured population-based survey(s)', 1, null, null)
           ,(newid(), @ReferenceTableId_12_0, '2. Structured non-random surveillance', 2, null, null)
           ,(newid(), @ReferenceTableId_12_0, '3. Surveillance to demonstrate freedom from disease or infection', 3, null, null)
           ,(newid(), @ReferenceTableId_12_0, '4. Surveillance undertaken to fulfil a statutory obligation', 4, null, null)
           ,(newid(), @ReferenceTableId_12_0, '5. Surveillance for distribution and occurrence of infection', 5, null, null)
           ,(newid(), @ReferenceTableId_12_0, '6. No structured surveillance but positive cases may be identified via scanning surveillance', 6, null, null)
           ,(newid(), @ReferenceTableId_12_0, '7. No specific surveillance or unlikely Government veterinary services or labs would identify this issue if present in the UK', 7, null, null)
END


IF NOT EXISTS(SELECT * FROM [ProfileQuestion] WHERE [Id] = @NewQuestionID_12_0)
	BEGIN
			INSERT INTO [dbo].[ProfileQuestion]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileSectionId]
			   ,[QuestionNumber]
			   ,[IsPerSpecies]
			   ,[IsRepeating]
			   ,[UserGuidance]
			   ,[IrrelevanceFieldId]
			   ,[IrrelevanceValueId]
			   ,[IrrelevanceFlag]
			   ,[NonTechnicalName])
			VALUES
			   (@NewQuestionID_12_0
			   ,'What are the drivers and approach for undertaking surveillance for this issue?'
			   ,'Drivers and approach for surveillancing this issue'
			   ,@Section_12_Id
			   ,0  -- Question Number: 0
			   ,0
			   ,0
			   ,'This is to capture the drivers and approach for undertaking surveillance for this issue'
			   ,null
			   ,null
			   ,null
			   ,'What are the drivers and approach for undertaking surveillance for this issue?')
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileQuestion]
			SET 
			   [Name] = 'What are the drivers and approach for undertaking surveillance for this issue?'
			   ,[ShortName] = 'Drivers and approach for surveillancing this issue'
			   ,[ProfileSectionId] = @Section_12_Id
			   ,[QuestionNumber] = 0
			   ,[IsPerSpecies] = 0
			   ,[IsRepeating] = 0
			   ,[UserGuidance] = 'This is to capture the drivers and approach for undertaking surveillance for this issue'
			   ,[IrrelevanceFieldId] = null
			   ,[IrrelevanceValueId] = null
			   ,[IrrelevanceFlag] = null
			   ,[NonTechnicalName] = 'What are the drivers and approach for undertaking surveillance for this issue?'
			WHERE [Id] = @NewQuestionID_12_0
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID_12_0_Field1)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID_12_0_Field1
			   ,null
			   ,'Drivers and approach for surveillance list'
			   ,@NewQuestionID_12_0
			   ,1  -- Field No 1
			   ,'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89'  --Multi Value List
			   ,1
			   ,@ReferenceTableId_12_0
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = null
			   ,[ShortName] = 'Drivers and approach for surveillance list'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 1
			   ,[DataFieldTypeId] = '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89'  --Multi Value List
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = @ReferenceTableId_12_0
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [Id] = @NewFieldID_12_0_Field1
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID_12_0_Field2)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID_12_0_Field2
			   ,'Supporting Comments'
			   ,'Drivers and approach for surveillance Supporting Comments'
			   ,@NewQuestionID_12_0
			   ,2 -- Field No 2
			   ,@LongTextDataType  -- Long Text
			   ,1
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Supporting Comments'
			   ,[ShortName] = 'Drivers and approach for surveillance Supporting Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 2
			   ,[DataFieldTypeId] = @LongTextDataType  
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [Id] = @NewFieldID_12_0_Field2
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID_12_0_Field3)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID_12_0_Field3
			   ,'Does surveillance for this issue differ significantly in different parts of the UK?'
			   ,'UK Surveillance Indicator'
			   ,@NewQuestionID_12_0
			   ,3 -- Field No 3
			   ,@ListDataFieldType  
			   ,1
			   ,@ReferenceTableId
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Does surveillance for this issue differ significantly in different parts of the UK?'
			   ,[ShortName] = 'UK Surveillance Indicator'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 3
			   ,[DataFieldTypeId] = @ListDataFieldType  
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = @ReferenceTableId
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [Id] = @NewFieldID_12_0_Field3
	END

DECLARE @UKCommentsFieldId_12_0 uniqueidentifier = 'F0B23CD4-FF69-4D20-B6DB-356EE6B67E5D' --newid()
DECLARE @ScotlandCommentsFieldId_12_0 uniqueidentifier = '9B6D1145-F872-4E2A-9357-FDD4F70D4E63' --newid()
DECLARE @WalesCommentsFieldId_12_0 uniqueidentifier = '6BCBBBCB-3C59-44BE-AC77-F4CCA5D38D9D' --newid()
DECLARE @NorthernIrelandCommentsFieldId_12_0 uniqueidentifier = '649B8976-6AA9-4E6E-B4FA-A09DD3B4501D' --newid()

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @UKCommentsFieldId_12_0)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@UKCommentsFieldId_12_0
			   ,'Supporting Comments'
			   ,'UK Surveillance Indicator Comments'
			   ,@NewQuestionID_12_0
			   ,4 -- Field No 4
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Supporting Comments'
			   ,[ShortName] = 'UK Surveillance Indicator Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 4
			   ,[DataFieldTypeId] = @LongTextDataType  
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [Id] = @UKCommentsFieldId_12_0
	END

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @ScotlandCommentsFieldId_12_0)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@ScotlandCommentsFieldId_12_0
			   ,'Does surveillance for this issue differ significantly in different parts of Scotland?'
			   ,'Scotland Surveillance Indicator Comments'
			   ,@NewQuestionID_12_0
			   ,5 -- Field No 5
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@NewFieldID_12_0_Field3
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Does surveillance for this issue differ significantly in different parts of Scotland?'
			   ,[ShortName] = 'Scotland Surveillance Indicator Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 5
			   ,[DataFieldTypeId] = @LongTextDataType  
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @NewFieldID_12_0_Field3
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @ScotlandCommentsFieldId_12_0
	END

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @WalesCommentsFieldId_12_0)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@WalesCommentsFieldId_12_0
			   ,'Does surveillance for this issue differ significantly in different parts of Wales?'
			   ,'Wales Surveillance Indicator Comments'
			   ,@NewQuestionID_12_0
			   ,6 -- Field No 6
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@NewFieldID_12_0_Field3
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Does surveillance for this issue differ significantly in different parts of Wales?'
			   ,[ShortName] = 'Wales Surveillance Indicator Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 6
			   ,[DataFieldTypeId] = @LongTextDataType  
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @NewFieldID_12_0_Field3
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @WalesCommentsFieldId_12_0
	END

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ID] = @NorthernIrelandCommentsFieldId_12_0)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (@NorthernIrelandCommentsFieldId_12_0
			   ,'Does surveillance for this issue differ significantly in different parts of Northern Ireland?'
			   ,'Northen Ireland Surveillance Indicator Comments'
			   ,@NewQuestionID_12_0
			   ,7 -- Field No 7
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,@NewFieldID_12_0_Field3
			   ,@PartialYesFieldValue)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Does surveillance for this issue differ significantly in different parts of Northern Ireland?'
			   ,[ShortName] = 'Northen Ireland Surveillance Indicator Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 7
			   ,[DataFieldTypeId] = @LongTextDataType  
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = @NewFieldID_12_0_Field3
			   ,[RelevanceValueId] = @PartialYesFieldValue
			WHERE [Id] = @NorthernIrelandCommentsFieldId_12_0
	END

-- Building a new checkbox value list for the question 12.0 Field 8:
--		UK surveillance for this issue is;

DECLARE @ReferenceTableId_12_0_8 uniqueidentifier = 'F89E7171-521E-4AB6-B52C-F32E5B90B5E5' --newid()
DECLARE @NewFieldID_12_0_Field8 uniqueidentifier = '4E826251-E1BD-42CE-8A02-E3C5276C1DEF' --newid()


IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [ID] = @ReferenceTableId_12_0_8)
BEGIN
		INSERT INTO [dbo].[ReferenceTable]
           ([Id]
           ,[Name]
           ,[IsMaintainable])
		VALUES
           (@ReferenceTableId_12_0_8
           ,'UK surveillance for this issue is;'
           ,0)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [ReferenceTableId] = @ReferenceTableId_12_0_8)
BEGIN
		INSERT INTO [dbo].[ReferenceValue]
           ([Id]
           ,[ReferenceTableId]
           ,[LookupValue]
           ,[SequenceNumber]
           ,[EffectiveDateFrom]
           ,[EffectiveDateTo])
		VALUES
           (newid(), @ReferenceTableId_12_0_8, 'Fully coordinated', 1, null, null)
           ,(newid(), @ReferenceTableId_12_0_8, 'Partially coordinated', 2, null, null)
           ,(newid(), @ReferenceTableId_12_0_8, 'Undertaken independently by all UK administrations', 3, null, null)
           ,(newid(), @ReferenceTableId_12_0_8, 'Undertaken independently by some UK administrations', 4, null, null)
           ,(newid(), @ReferenceTableId_12_0_8, 'Not undertaken by any UK administration', 5, null, null)
END


IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID_12_0_Field8)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID_12_0_Field8
			   ,'UK surveillance for this issue is;'
			   ,'UK surveillance for this issue is'
			   ,@NewQuestionID_12_0
			   ,8  -- Field No 8
			   ,'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89'  --Multi Value List
			   ,1
			   ,@ReferenceTableId_12_0_8
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'UK surveillance for this issue is;'
			   ,[ShortName] = 'UK surveillance for this issue is'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 8
			   ,[DataFieldTypeId] = '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89'  --Multi Value List  
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = @ReferenceTableId_12_0_8
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [Id] = @NewFieldID_12_0_Field8
	END

IF NOT EXISTS(SELECT TOP 1 * FROM [ProfileField] WHERE [ShortName] = 'UK Surveillance Supporting Comments')
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType]
			   ,[RelevanceFieldId]
			   ,[RelevanceValueId])
			VALUES
			   (newid()
			   ,'Supporting Comments'
			   ,'UK Surveillance Supporting Comments'
			   ,@NewQuestionID_12_0
			   ,9 -- Field No 9
			   ,@LongTextDataType
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1
			   ,null
			   ,1
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Supporting Comments'
			   ,[ShortName] = 'UK Surveillance Supporting Comments'
			   ,[ProfileQuestionId] = @NewQuestionID_12_0
			   ,[FieldNumber] = 9
			   ,[DataFieldTypeId] = @LongTextDataType 
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ShortName] = 'UK Surveillance Supporting Comments'
	END


IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId_12_0 
				AND [TargetFieldId] = @ScotlandCommentsFieldId_12_0)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId_12_0, @ScotlandCommentsFieldId_12_0)
END

IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId_12_0
				AND [TargetFieldId] = @WalesCommentsFieldId_12_0)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId_12_0, @WalesCommentsFieldId_12_0)
END

IF NOT EXISTS (SELECT * FROM [ProfileFieldDataReplication] WHERE [SourceFieldId] = @UKCommentsFieldId_12_0 
				AND [TargetFieldId] = @NorthernIrelandCommentsFieldId_12_0)
BEGIN
		INSERT INTO [dbo].[ProfileFieldDataReplication]
           ([Id]
           ,[SourceFieldId]
           ,[TargetFieldId])
		VALUES
           (newid(), @UKCommentsFieldId_12_0, @NorthernIrelandCommentsFieldId_12_0)
END


-- Section 5 - New Question 11 : User Story 4985
DECLARE @Section_5 uniqueidentifier = '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49' 
DECLARE @NewQuestionID_5_11 uniqueidentifier = '96407C46-B821-4B2F-8081-80CE482D34FA' --newid()
DECLARE @NewFieldID_5_11 uniqueidentifier = '8B2A081F-1DA8-4CC2-8670-089489E73C4F' --newid()

IF NOT EXISTS(SELECT * FROM [ProfileQuestion] WHERE [Id] = @NewQuestionID_5_11)
	BEGIN
			INSERT INTO [dbo].[ProfileQuestion]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileSectionId]
			   ,[QuestionNumber]
			   ,[IsPerSpecies]
			   ,[IsRepeating]
			   ,[UserGuidance]
			   ,[IrrelevanceFieldId]
			   ,[IrrelevanceValueId]
			   ,[IrrelevanceFlag]
			   ,[NonTechnicalName])
			VALUES
			   (@NewQuestionID_5_11
			   ,'Placeholder Question?'
			   ,'Section five question eleven'
			   ,@Section_5
			   ,11
			   ,0
			   ,0
			   ,'As this question will only be activated after go live full guidance on how to complete it will be added subsequently.'
			   ,null
			   ,null
			   ,null
			   ,'Placeholder Question?')
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileQuestion]
			SET 
			   [Name] = 'Placeholder Question?'
			   ,[ShortName] = 'Section five question eleven'
			   ,[ProfileSectionId] = @Section_5
			   ,[QuestionNumber] = 11
			   ,[IsPerSpecies] = 0
			   ,[IsRepeating] = 0
			   ,[UserGuidance] = 'As this question will only be activated after go live full guidance on how to complete it will be added subsequently.'
			   ,[IrrelevanceFieldId] = null
			   ,[IrrelevanceValueId] = null
			   ,[IrrelevanceFlag] = null
			   ,[NonTechnicalName] = 'Placeholder Question?'
			WHERE [Id] = @NewQuestionID_5_11
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewFieldID_5_11)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewFieldID_5_11
			   ,null
			   ,'Description'
			   ,@NewQuestionID_5_11
			   ,1
			   ,@LongTextDataType -- Long Text
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,0     
			   ,null
			   ,1)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = null
			   ,[ShortName] = 'Description'
			   ,[ProfileQuestionId] = @NewQuestionID_5_11
			   ,[FieldNumber] = 1
			   ,[DataFieldTypeId] = @LongTextDataType 
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @NewFieldID_5_11
	END


-- Section 13 - Updated Question 3 : User Story 4982

DECLARE @QuestionId_13_3 uniqueidentifier = '0FEA51E7-D610-4C8F-B344-9A680EDD3B81'
DECLARE @QuestionId_13_3_Field_1 uniqueidentifier = 'A989643B-5622-4C36-B432-D2C3899B3BF4'
DECLARE @QuestionId_13_3_OG_Field_2 uniqueidentifier = 'A5C23820-4CD3-4F32-95FA-3864820EB0B0'
DECLARE @QuestionId_13_3_New_Field_2 uniqueidentifier = '4D38CCF9-429B-4666-85FE-C5E97A99AF55' -- newid()

UPDATE [ProfileQuestion]
	SET [Name] = 'International considerations in relation to UK’s ability to export?',
	[UserGuidance] = '1st sub-question: Is there an obligation to control this disease under EU law? <br /> - No =No statutory requirement under EU or domestic legislation. (Although commercial reasons may exist that would stop exports being sourced from a holding affected by the profiled infection or issue.) <br /> - To some extent =For some diseases EU legislation permits Member States to pursue control of specific diseases which can affect certain aspects of trade, e.g. disease freedom with respect to bovine viral diarrhoea or campylobacter can be required by certain recipient member states for bovine semen consignments, or pig meat may need to be tested for trichinella. <br /> - Yes =Statutory requirement under EU legislation to control in order to trade with all Member States. <br /><br />2nd sub-question: Is there a WOAH recommendation that this disease be controlled /absent from the UK to permit exports?  <br />- No =No WOAH recommendations in relation to international trade. (Although commercial reasons may exist that would stop exports being sourced from a holding affected by the profiled infection or issue.) <br />- To some extent =For some diseases, applicable disease-specific WOAH recommendations might be of significance to specific potential recipients of UK exports.  <br />- Yes = Achievement of applicable disease-specific WOAH recommendations likely to be expected by the vast majority of countries to which UK exports might otherwise be sent.'
	WHERE [ProfileQuestion].[Id] = @QuestionId_13_3


UPDATE [dbo].[ProfileField] 
	SET [Name] = 'Is there an obligation to control this disease under EU law?'
WHERE	[ID] = @QuestionId_13_3_Field_1

UPDATE [dbo].[ProfileField] 
	SET [FieldNumber] = 3
WHERE	[ID] = @QuestionId_13_3_OG_Field_2


IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @QuestionId_13_3_New_Field_2)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@QuestionId_13_3_New_Field_2
			   ,'Is there a WOAH recommendation that this disease be controlled /absent from the UK to permit exports?'
			   ,'WOAH recommendtation for UK to permit exports'
			   ,@QuestionId_13_3
			   ,2
			   ,@ListDataFieldType -- List
			   ,0
			   ,'A7AEFC6D-04EC-4147-8F6C-11238385F381'
			   ,0
			   ,0
			   ,null
			   ,0     
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Is there a WOAH recommendation that this disease be controlled /absent from the UK to permit exports?'
			   ,[ShortName] = 'WOAH recommendtation for UK to permit exports'
			   ,[ProfileQuestionId] = @QuestionId_13_3
			   ,[FieldNumber] = 2
			   ,[DataFieldTypeId] = @ListDataFieldType 
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = 'A7AEFC6D-04EC-4147-8F6C-11238385F381'
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 0
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @QuestionId_13_3_New_Field_2
	END



-- Section 13 - Updated Question 5 : User Story 4986

DECLARE @QuestionId_13_5 uniqueidentifier = 'DAAC3F4D-106E-4417-ACC7-92D8309C945F'
DECLARE @QuestionId_13_5_Field_1 uniqueidentifier = 'DDDD01DE-AD39-45F8-B691-1A0E02EEB97B'
DECLARE @QuestionId_13_5_OG_Field_2 uniqueidentifier = '5845EAA6-4DEC-4BEB-850D-2F9CF7B3F2DA'
DECLARE @QuestionId_13_5_New_Field_2 uniqueidentifier = '7C7FEF91-B364-40F9-9187-05DF4EAE702B' -- newid()


UPDATE [ProfileQuestion]
	SET [Name] = 'Resources and time to re-establish the UK’s export markets following an incursion of exotic disease?',
	[UserGuidance] = '1st sub-question: Resources and time required to re-establish the UK’s trading status with the EU  <br />
Please select the appropriate category depending on the anticipated resources and time required to overcome any effect on trade that the profiled disease or issue may have.  <br />
 <br />
- Low =< 6 months and / or straightforward with little resource. This will include all diseases and issues that have no effect on international trade consignments departing from the UK (whether to animals, germplasm or products) other than possibly restricting such trade from just the holding where the disease or issue has been identified. <br />
- Medium =6 months to 12 months and / or diversion of resource required <br />
- High => 12 months and / or significant extra resource required <br />
 <br />
2nd sub-question: Resources and time required to re-establish existing export markets following an exotic disease incursion as per WOAH recommendations <br />
Please select the appropriate category depending on the anticipated resources and time required to overcome any effect on trade that the profiled disease or issue may have. This is to restore the status quo following an exotic disease incursion, rather than the time and resource that might be required to negotiate a new country’s acceptance of UK animals or products of animal origin. <br />
 <br />
- Low =< 6 months and / or straightforward with little resource. This will include all diseases and issues that have no effect on international trade consignments departing from the UK (whether to animals, germplasm or products) other than possibly restricting such trade from just the holding where the disease or issue has been identified. <br />
- Medium =6 months to 12 months and / or diversion of resource required <br />
- High => 12 months and / or significant extra resource required <br />
 <br />
Where data shows correct categorical option is on the border between two categories, choose the option which increases the importance of the issue in the context of government intervention. '
	WHERE [ProfileQuestion].[Id] = @QuestionId_13_5


UPDATE [dbo].[ProfileField] 
	SET [Name] = 'Resources and time required to re-establish the UK’s trading status with the EU?'
WHERE	[ID] = @QuestionId_13_5_Field_1

UPDATE [dbo].[ProfileField] 
	SET [FieldNumber] = 3
WHERE	[ID] = @QuestionId_13_5_OG_Field_2


IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @QuestionId_13_5_New_Field_2)
BEGIN
		INSERT INTO [dbo].[ProfileField]
           ([Id]
           ,[Name]
           ,[ShortName]
           ,[ProfileQuestionId]
           ,[FieldNumber]
           ,[DataFieldTypeId]
           ,[IsMandatory]
           ,[ReferenceTableId]
           ,[IsReadOnlyCurrentSituation]
           ,[IsReadOnlyScenario]
           ,[DefaultValue]
           ,[IncludeInSummary]
           ,[ProfileFieldGroupId]
           ,[EditorFieldType])
		VALUES
           (@QuestionId_13_5_New_Field_2
           ,'Resources and time required to re-establish existing export markets following an exotic disease incursion as per WOAH recommendations?'
           ,'Resources and time requirements for UK to exports'
           ,@QuestionId_13_5
           ,2
           ,@ListDataFieldType -- List
           ,0
           ,'118E00A5-C8FD-4978-86CC-E35F471E9514'
           ,0
           ,0
           ,null
           ,0     
           ,null
           ,null)
END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Resources and time required to re-establish existing export markets following an exotic disease incursion as per WOAH recommendations?'
			   ,[ShortName] = 'Resources and time requirements for UK to exports'
			   ,[ProfileQuestionId] = @QuestionId_13_5
			   ,[FieldNumber] = 2
			   ,[DataFieldTypeId] = @ListDataFieldType 
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = '118E00A5-C8FD-4978-86CC-E35F471E9514'
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 0
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @QuestionId_13_5_New_Field_2
	END


-- Section 13 - Updated Question 2 : User Story 4986
/************************************************************************************************

					Pending client question 

************************************************************************************************/
DECLARE @QuestionId_13_2 uniqueidentifier = '354A1B85-99A6-48D6-ADA7-B2E9C2D7E728'
DECLARE @SpeciesQuestion_6_3 uniqueidentifier = 'ec2f6f45-a3f7-46d5-aeca-1993e40611d5'
DECLARE @QuestionId_13_2_OG_Field_1 uniqueidentifier = '34A3D221-92EE-4DD1-B59C-67D814CA7FE7'
DECLARE @QuestionId_13_2_OG_Field_2 uniqueidentifier = '25E9EC19-D3FC-4FC2-A9E0-F2301FF2222A'
DECLARE @QuestionId_13_2_New_Field_2 uniqueidentifier = '206AB43F-81F8-4820-9132-E70C08E267DF' -- newid()
DECLARE @QuestionId_13_2_OG_SpeciesField_1 uniqueidentifier = '2b3e6845-4d43-4f03-9ace-5ef35d4dfe1b' 
DECLARE @QuestionId_13_2_OG_SpeciesField_2 uniqueidentifier = '34119d63-c218-43e2-bebb-b2d91d57927d' 
DECLARE @QuestionId_13_2_New_SpeciesField_1 uniqueidentifier = '429ABE88-A832-4D72-A5EE-D18482B85F7E' -- newid()

-- Renumber the existing fields
	UPDATE [ProfileField]
	SET FieldNumber = 3 
	, [IncludeInSummary] = 0
	WHERE [Id] = @QuestionId_13_2_OG_Field_2

	UPDATE [ProfileField]
	SET FieldNumber = 1 
	,[Name] = 'Potential level of imports of animals/germplasm'
	WHERE [Id] = @QuestionId_13_2_OG_Field_1

	
-- Renumber the existing species fields
	UPDATE [SpeciesField]
	SET FieldNumber = 3 
	WHERE [Id] = @QuestionId_13_2_OG_SpeciesField_2

	UPDATE [SpeciesField]
	SET FieldNumber = 1 
		,[Name] = 'Potential level of imports of animals/germplasm'
	WHERE [Id] = @QuestionId_13_2_OG_SpeciesField_1

-- Update the question and guidance
UPDATE [ProfileQuestion]
	SET [Name] = 'Potential level of imports of animals/germplasm',
	[UserGuidance] = 'This question’s answers are pre-set on the basis of the species selected. This means the selected score cannot be amended.  <br />
 If ‘Not commercial’ is selected this is because of the selected option in question 13.1 for the profiled species or group. (An alternative score may be selected for a non-commercially traded species if a non-negligible number of arrivals occur annually, such as for dogs). This question does not contribute to the overall "International Trade" score.  <br />
 <br />
Imports of animals/ germplasm numbers are considered at an individual level as each arrival represents a potential opportunity for an exotic disease to arrive in the UK. <br />
 - Not commercial <br />
- Negligible = Up to 999 individual animals/ hatching eggs/ semen straws/ embryos imported p.a. <br />
- Some = >999 to 99,999 individual animals/ hatching eggs/ semen straws/ embryos imported p.a. <br />
- Significant = >99,999 individual animals/ hatching eggs/ semen straws/ embryos imported p.a. <br />
 <br />
Imports of products of animal origin are considered from an economic perspective. <br />
- Not applicable <br />
- Negligible = Up to £1 million of imported products (excluding germplasm) p.a. <br />
- Some = >£1 million to £500 million of imported products (excluding germplasm) p.a. <br />
- Significant = >£500 million of imported products (excluding germplasm) p.a. '
	WHERE [ProfileQuestion].[Id] = @QuestionId_13_2

-- Update the species question
UPDATE [dbo].[SpeciesQuestion]
	SET [Name] = 'Potential level of imports of animals/germplasm'
	WHERE [Id] = @SpeciesQuestion_6_3

-- New reference table and values	   
DECLARE @ReferenceTableId_13_2 uniqueidentifier = '13014364-D080-4099-A6E2-B72D0C99FE56' -- newid()
DECLARE @NAFieldValue uniqueidentifier = '0B8C793B-DA42-4187-8ED5-179AFA238C9C' -- newid()
DECLARE @NegligibleFieldValue uniqueidentifier = '61E495C7-533D-4F4A-8258-DD0B335F3464' -- newid()
DECLARE @SomeFieldValue uniqueidentifier = 'CF66900A-27C1-4370-BF44-A192A60EF168' -- newid()
DECLARE @SubstantialFieldValue uniqueidentifier = '564AE0C4-1557-4A8E-9988-58BBE8DFB851' -- newid()

IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [ID] = @ReferenceTableId_13_2)
BEGIN
		INSERT INTO [dbo].[ReferenceTable]
           ([Id]
           ,[Name]
           ,[IsMaintainable])
		VALUES
           (@ReferenceTableId_13_2
           ,'Potential level of imports'
           ,0)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [ID] = @NegligibleFieldValue)
BEGIN
		INSERT INTO [dbo].[ReferenceValue]
           ([Id]
           ,[ReferenceTableId]
           ,[LookupValue]
           ,[SequenceNumber]
           ,[EffectiveDateFrom]
           ,[EffectiveDateTo])
		VALUES
           (@NAFieldValue, @ReferenceTableId_13_2, 'Not applicable', 1, null, null)
           ,(@NegligibleFieldValue, @ReferenceTableId_13_2, 'Negligible', 2, null, null)
           ,(@SomeFieldValue, @ReferenceTableId_13_2, 'Some', 3, null, null)
           ,(@SubstantialFieldValue, @ReferenceTableId_13_2, 'Substantial', 4, null, null)
END

-- new field 2
IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @QuestionId_13_2_New_Field_2)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@QuestionId_13_2_New_Field_2
			   ,'Import level of products of animal origin'
			   ,'Import level of products of animal origin'
			   ,@QuestionId_13_2
			   ,2
			   ,@ListDataFieldType -- List
			   ,1
			   ,@ReferenceTableId_13_2
			   ,1
			   ,0
			   ,null
			   ,1     
			   ,null
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = 'Import level of products of animal origin'
			   ,[ShortName] = 'Import level of products of animal origin'
			   ,[ProfileQuestionId] = @QuestionId_13_2
			   ,[FieldNumber] = 2
			   ,[DataFieldTypeId] = @ListDataFieldType 
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = @ReferenceTableId_13_2
			   ,[IsReadOnlyCurrentSituation] = 1
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = null
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @QuestionId_13_2_New_Field_2
	END

-- As 13.2 is a per species question, we also need to inject a new field into the [SpeciesField] table

IF NOT EXISTS(SELECT * FROM [SpeciesField] WHERE [Id] = @QuestionId_13_2_New_SpeciesField_1)
	BEGIN
			INSERT INTO [dbo].[SpeciesField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[FieldNumber]
			   ,[ReferenceTableId]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ProfileFieldId]
			   ,[SpeciesQuestionId]
			   ,[EditorFieldType])
			VALUES
			   (@QuestionId_13_2_New_SpeciesField_1
			   ,'Import level of products of animal origin'
			   ,'Import level of products of animal origin'
			   ,2
			   ,@ReferenceTableId_13_2
			   ,@ListDataFieldType
			   ,1
			   ,@QuestionId_13_2_New_Field_2
			   ,@SpeciesQuestion_6_3
			   ,null)
	END
ELSE
	BEGIN
			UPDATE [dbo].[SpeciesField]
			SET
				[Name] = 'Import level of products of animal origin'
			   ,[ShortName] = 'Import level of products of animal origin'
			   ,[FieldNumber] = 2
			   ,[ReferenceTableId] = @ReferenceTableId_13_2
			   ,[DataFieldTypeId] = @ListDataFieldType
			   ,[IsMandatory] = 1
			   ,[ProfileFieldId] = @QuestionId_13_2_New_Field_2
			   ,[SpeciesQuestionId] = @SpeciesQuestion_6_3
			   ,[EditorFieldType] = null
			WHERE [Id] = @QuestionId_13_2_New_SpeciesField_1
	END

-- New Question 13.12 - part of User Story 4955
DECLARE @Section13Id uniqueidentifier = '2F451B2B-7D6D-4DFF-8D22-73F133848634'
DECLARE @NewQuestion_13_12_ID uniqueidentifier = '493F0A87-B7DE-4DAA-993D-36C1DB845B1C' -- newid()
DECLARE @NewField_13_12_Field1 uniqueidentifier = '5D32D598-4CDF-4227-8EC5-601A87B5369B' -- newid()

IF NOT EXISTS(SELECT * FROM [ProfileQuestion] WHERE [Id] = @NewQuestion_13_12_ID)
	BEGIN
			INSERT INTO [dbo].[ProfileQuestion]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileSectionId]
			   ,[QuestionNumber]
			   ,[IsPerSpecies]
			   ,[IsRepeating]
			   ,[UserGuidance]
			   ,[IrrelevanceFieldId]
			   ,[IrrelevanceValueId]
			   ,[IrrelevanceFlag]
			   ,[NonTechnicalName])
			VALUES
			   (@NewQuestion_13_12_ID
			   ,'Commentary on potential trade issues'
			   ,'Commentary on potential trade issues'
			   ,@Section13Id
			   ,12
			   ,0
			   ,0
			   ,'The text answer is mandatory to allow publishing. There may be potential trade issues associated with both the profiled disease or issue and/or with the animal species or groups considered in this disease profile (such as sheep must come from a scrapie-free premises or cattle must have a replacement ear tag fitted to travel to Northern Ireland). Those issues associated with the profiled species or group are set out below (as view only information). Please summarise this information (if any potential trade impediments linked with the profiled species) and any disease-specific issues that may present difficulty in exporting in the text box.'
			   ,@Field_1_5
			   ,null
			   ,null
			   ,'Commentary on potential trade issues')
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileQuestion]
			SET 
			   [Name] = 'Commentary on potential trade issues'
			   ,[ShortName] = 'Commentary on potential trade issues'
			   ,[ProfileSectionId] = @Section13Id
			   ,[QuestionNumber] = 12
			   ,[IsPerSpecies] = 0
			   ,[IsRepeating] = 0
			   ,[UserGuidance] = 'The text answer is mandatory to allow publishing. There may be potential trade issues associated with both the profiled disease or issue and/or with the animal species or groups considered in this disease profile (such as sheep must come from a scrapie-free premises or cattle must have a replacement ear tag fitted to travel to Northern Ireland). Those issues associated with the profiled species or group are set out below (as view only information). Please summarise this information (if any potential trade impediments linked with the profiled species) and any disease-specific issues that may present difficulty in exporting in the text box.'
			   ,[IrrelevanceFieldId] = @Field_1_5
			   ,[IrrelevanceValueId] = null
			   ,[IrrelevanceFlag] = null
			   ,[NonTechnicalName] = 'Commentary on potential trade issues'
			WHERE [Id] = @NewQuestion_13_12_ID
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewField_13_12_Field1)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewField_13_12_Field1
			   ,null
			   ,'Supporting comments'
			   ,@NewQuestion_13_12_ID
			   ,1
			   ,@LongTextDataType -- Long Text
			   ,1
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1     
			   ,null
			   ,1)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = null
			   ,[ShortName] = 'Supporting comments'
			   ,[ProfileQuestionId] = @NewQuestion_13_12_ID
			   ,[FieldNumber] = 1
			   ,[DataFieldTypeId] = @LongTextDataType 
			   ,[IsMandatory] = 1
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @NewField_13_12_Field1
	END


-- New Question 13.13 - part of User Story 4955

DECLARE @NewQuestion_13_13_ID uniqueidentifier = 'A947ECB6-93AA-4AFA-8C43-A6FC101A6D55' -- newid()
DECLARE @NewField_13_13_Field1 uniqueidentifier = '4EC3EF53-5E10-43BD-8BC7-4E7449233CB1' -- newid()

IF NOT EXISTS(SELECT * FROM [ProfileQuestion] WHERE [Id] = @NewQuestion_13_13_ID)
	BEGIN
			INSERT INTO [dbo].[ProfileQuestion]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileSectionId]
			   ,[QuestionNumber]
			   ,[IsPerSpecies]
			   ,[IsRepeating]
			   ,[UserGuidance]
			   ,[IrrelevanceFieldId]
			   ,[IrrelevanceValueId]
			   ,[IrrelevanceFlag]
			   ,[NonTechnicalName])
			VALUES
			   (@NewQuestion_13_13_ID
			   ,'How well does current UK surveillance for the profiled infection or issue meet the WOAH trade recommendations?'
			   ,'Surveillance for the profiled infection WOAH trade recommendations'
			   ,@Section13Id
			   ,13
			   ,0
			   ,0
			   ,'Please summarise how well the current UK approach to surveillance for the profiled infection or issue (set out in section 12 of the disease profile) fulfils the WOAH trade recommendations. If not well achieved also highlight any steps that may still mean exports can be achieved (such as pre-export testing) at a national level.'
			   ,@Field_1_5
			   ,null
			   ,null
			   ,'How well does current UK surveillance for the profiled infection or issue meet the WOAH trade recommendations?')
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileQuestion]
			SET 
			   [Name] = 'How well does current UK surveillance for the profiled infection or issue meet the WOAH trade recommendations?'
			   ,[ShortName] = 'Surveillance for the profiled infection WOAH trade recommendations'
			   ,[ProfileSectionId] = @Section13Id
			   ,[QuestionNumber] = 13
			   ,[IsPerSpecies] = 0
			   ,[IsRepeating] = 0
			   ,[UserGuidance] = 'Please summarise how well the current UK approach to surveillance for the profiled infection or issue (set out in section 12 of the disease profile) fulfils the WOAH trade recommendations. If not well achieved also highlight any steps that may still mean exports can be achieved (such as pre-export testing) at a national level.'
			   ,[IrrelevanceFieldId] = @Field_1_5
			   ,[IrrelevanceValueId] = null
			   ,[IrrelevanceFlag] = null
			   ,[NonTechnicalName] = 'How well does current UK surveillance for the profiled infection or issue meet the WOAH trade recommendations?'
			WHERE [Id] = @NewQuestion_13_13_ID
	END

IF NOT EXISTS(SELECT * FROM [ProfileField] WHERE [Id] = @NewField_13_13_Field1)
	BEGIN
			INSERT INTO [dbo].[ProfileField]
			   ([Id]
			   ,[Name]
			   ,[ShortName]
			   ,[ProfileQuestionId]
			   ,[FieldNumber]
			   ,[DataFieldTypeId]
			   ,[IsMandatory]
			   ,[ReferenceTableId]
			   ,[IsReadOnlyCurrentSituation]
			   ,[IsReadOnlyScenario]
			   ,[DefaultValue]
			   ,[IncludeInSummary]
			   ,[ProfileFieldGroupId]
			   ,[EditorFieldType])
			VALUES
			   (@NewField_13_13_Field1
			   ,null
			   ,'Supporting comments'
			   ,@NewQuestion_13_13_ID
			   ,1
			   ,@LongTextDataType -- Long Text
			   ,0
			   ,null
			   ,0
			   ,0
			   ,null
			   ,1     
			   ,null
			   ,1)
	END
ELSE
	BEGIN
			UPDATE [dbo].[ProfileField]
			SET [Name] = null
			   ,[ShortName] = 'Supporting comments'
			   ,[ProfileQuestionId] = @NewQuestion_13_13_ID
			   ,[FieldNumber] = 1
			   ,[DataFieldTypeId] = @LongTextDataType 
			   ,[IsMandatory] = 0
			   ,[ReferenceTableId] = null
			   ,[IsReadOnlyCurrentSituation] = 0
			   ,[IsReadOnlyScenario] = 0
			   ,[DefaultValue] = null
			   ,[IncludeInSummary] = 1
			   ,[ProfileFieldGroupId] = null
			   ,[EditorFieldType] = 1
			   ,[RelevanceFieldId] = null
			   ,[RelevanceValueId] = null
			WHERE [ID] = @NewField_13_13_Field1
	END

-- Update Question 12.1 - User Story 5044

-- Data field type changes from a single pick list to a multi-pick list

DECLARE @MultiValueList_FieldType uniqueidentifier = '1b2bbbc3-1a25-4d20-8f8b-a19167f21c89'
DECLARE @FieldID_12_1_Field_4 uniqueidentifier = 'F2AE3FB2-7275-4C4C-8D20-155FD8659A20'

UPDATE [ProfileField] SET [DataFieldTypeId] = @MultiValueList_FieldType
	WHERE [ID] = @FieldID_12_1_Field_4


GO

IF @@ERROR = 0 
BEGIN
		DECLARE @ScriptDate datetime
		DECLARE @ScriptVersion int = 35

		SELECT @ScriptDate = Getdate()


		INSERT INTO [dbo].[usd_AppliedDatabaseScript]
				   ([ScriptFile]
				   ,[DateApplied]
				   ,[Version]
				   ,[hash])
			 VALUES
				   ('0043-APHA_D2R2_v2_Questions_Update_Script.sql'
				   ,@ScriptDate
				   ,@ScriptVersion
				   ,'')

END