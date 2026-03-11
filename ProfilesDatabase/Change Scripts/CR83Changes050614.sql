-- Changes for CR-083
--

-- Add field to 1.5 to ask the question

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = 'B93EE197-9E69-4e22-86BD-02B2C55223FB')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      'B93EE197-9E69-4e22-86BD-02B2C55223FB',
      'Include extra epidemiology questions for notifiable disease outbreaks',
      'Include extra epidemiology questions for notifiable disease outbreaks',
      'a8708502-9ae2-4dcd-9510-291b90658b19',
      2,
      'b1a35fab-d4cf-4797-8f81-474892da5251',
      1,
      NULL,
      0,
      0,
      0,
      1,
      NULL
      )            
End

-- Give all existing Profile Versions the answer NO to the new question above in 1.5 otherwise neither 11.2 nor 11.3 are displayed

BEGIN
INSERT INTO ProfileVersionFieldValue
	(
		Id,
		ProfileVersionId,
		ProfileFieldId,
		BooleanValue
	)
SELECT
	NEWID(),
	Id,
	'b93ee197-9e69-4e22-86bd-02b2c55223fb',
	'False'
FROM
	ProfileVersion
	

END



-- Add profile question 3.21
IF NOT EXISTS (SELECT * FROM [ProfileQuestion] WHERE [Id] = '7B1328F8-0125-4706-8E02-1972D28CE796')
BEGIN
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
      '7B1328F8-0125-4706-8E02-1972D28CE796',
      'Infectious period',
      'Infectious period',
      '03022a5f-37fe-4b5f-a93a-f1fc95555df1',
      21,
      0,
      0,
      '3.21 Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
      'B93EE197-9E69-4e22-86BD-02B2C55223FB',
      NULL,
      'False',
      'NonTechnicalName'
      )
End


-- Add field to question 3.21    
IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = 'A977E54C-F83F-43a8-9B8C-278BCB9B2E98')
BEGIN  
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      'A977E54C-F83F-43a8-9B8C-278BCB9B2E98',
      NULL,
      'Infectious period',
      '7B1328F8-0125-4706-8E02-1972D28CE796',
      1,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1,
      NULL,
      0,
      0,
      NULL,
      1,
      NULL
      )
End

-- Add question 3.22     
IF NOT EXISTS (SELECT * FROM [ProfileQuestion] WHERE [Id] = 'DC383A7F-491A-448a-97D0-E612F8135FE5')
BEGIN 
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
      'DC383A7F-491A-448a-97D0-E612F8135FE5',
      'Required tracing windows',
      'Required tracing windows',
      '03022a5f-37fe-4b5f-a93a-f1fc95555df1',
      22,
      0,
      0,
      '3.22 Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.',
      'B93EE197-9E69-4e22-86BD-02B2C55223FB',
      NULL,
      'False',
      'NonTechnicalName'
      )
End
      
-- Add field to question 3.22
IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '02826B96-0602-4383-9E64-0B68A35DA404')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '02826B96-0602-4383-9E64-0B68A35DA404',
      'EU tracing windows',
      'EU tracing windows',
      'DC383A7F-491A-448a-97D0-E612F8135FE5',
      1,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1,
      NULL,
      0,
      0,
      NULL,
      1,
      NULL
      )
End
     
-- Add field to question 3.22
IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '481F3B3C-CBB4-46df-B4DF-CA17A2A8499F')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '481F3B3C-CBB4-46df-B4DF-CA17A2A8499F',
      'OIE tracing window',
      'OIE tracing window',
      'DC383A7F-491A-448a-97D0-E612F8135FE5',
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
End

-- Add field to question 3.22
IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '1809FFA6-DBCA-41ec-910C-6DD00AE9229C')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '1809FFA6-DBCA-41ec-910C-6DD00AE9229C',
      'Other pertinent information',
      'Other pertinent information',
      'DC383A7F-491A-448a-97D0-E612F8135FE5',
      3,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      0,
      NULL,
      0,
      0,
      NULL,
      1,
      NULL
      )            
End


-- Change 11.3 to 11.4 to make room for the new 11.2x to be 11.3

BEGIN
UPDATE       ProfileQuestion
SET                QuestionNumber = 4
WHERE        (Id = 'f3e20c91-dd8b-4bd7-8e5f-d972f8ba60f7')
END

-- Update 11.2 to only show on answer No to 1.5

BEGIN
UPDATE       ProfileQuestion
SET                IrrelevanceFieldId = 'B93EE197-9E69-4e22-86BD-02B2C55223FB', IrrelevanceFlag = 'True'
WHERE        (Id = 'e4388163-bcd2-4024-8d8e-89922aede845')
END




-- Add new extended question 11.2 that appears when 1.5 is answered yes as 11.3

IF NOT EXISTS (SELECT * FROM [ProfileQuestion] WHERE [Id] = '5b0c2224-d0a3-4e34-babf-c6158451b224')
BEGIN
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
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      'Laboratory test details with extra questions for notifiable disease outbreaks',
      'Laboratory test details with extra questions for notifiable disease outbreaks',
      '7EB5FDDC-DF89-41A5-B486-374A656EDF5D',
      3,
      0,
      1,
      'Please answer this question twice, once for the main ''gold standard'' test and secondly for the most commonly used diagnostic test (it is appreciated that for some diseases these will be the same test and a single entry can reflect this fact. If there are several ''gold standard'' tests in frequent use and/or if two tests are both used equally frequently a brief description of such other tests can also be provided in the ''Comments'' section.    Under ''Test'' please enter the name or brief description of the test.    Under ''Use'' please state if a gold standard test and/or a commonly used test.    Under ''Turnaround Time'' please choose the correct option, where ''Rapid''= positive results within 3 working days; ''Medium''= positive results between 4 and 10 working days; and ''Slow''= positive results after more than 10 working days.     Use the ''Comments'' section to highlight any additional issues that you feel are pertinent.',
      'B93EE197-9E69-4e22-86BD-02B2C55223FB',
      NULL,
      'False',
      'Laboratory test details with extra questions for notifiable disease outbreaks'
      )
End


-- Add fields to question extended 11.2

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '9781DAF1-90A6-46c7-9BEA-6C1559D53E57')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '9781DAF1-90A6-46c7-9BEA-6C1559D53E57',
      'Test',
      'Laboratory Test Name',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      1,
      'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0',
      1,
      NULL,
      0,
      0,
      NULL,
      1,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = 'A518CD39-7C78-42ef-AD99-8C1A0388386A')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      'A518CD39-7C78-42ef-AD99-8C1A0388386A',
      'Sample type',
      'Laboratory Test Sample Type',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      2,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      '4050839D-DBAF-4418-ADBA-82AE11BFED31',
      0,
      0,
      NULL,
      1,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = 'AA11EE94-19F5-4691-B5B1-36DCD4AE0A78')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      'AA11EE94-19F5-4691-B5B1-36DCD4AE0A78',
      'Use',
      'Laboratory Test Use',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      3,
      'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0',
      1,
      NULL,
      0,
      0,
      NULL,
      1,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '9B17E196-538A-402c-8329-5BA730DA9BBB')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '9B17E196-538A-402c-8329-5BA730DA9BBB',
      'Turnaround time',
      'Laboratory Test Turnaround Time',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      4,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      '89034D02-A706-446F-B51A-03407B6B4645',
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '02BD818C-3A03-440c-AA01-1669FE69C767')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '02BD818C-3A03-440c-AA01-1669FE69C767',
      'Is this test prescribed by the OIE?',
      'Laboratory Test OIE Prescription',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      5,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      '091A3984-F5A7-4B22-8498-EB285F4F1DF2',
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '5F5C292F-DBBE-4976-9F83-2F29A97A2368')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '5F5C292F-DBBE-4976-9F83-2F29A97A2368',
      'Laboratories that can perform the test',
      'Laboratory Test Laboratories',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      6,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      '67CF4CCF-AB56-4167-9636-7EF21D4989A5',
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '4DDC1EE2-BD35-478f-BD33-2EDDA338CA5E')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '4DDC1EE2-BD35-478f-BD33-2EDDA338CA5E',
      'Supporting comments',
      'Laboratory Test Comments',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      7,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '05CC879C-40BF-495d-9CF6-0DF19211DDE0')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '05CC879C-40BF-495d-9CF6-0DF19211DDE0',
      'Shortest likely time period (hours/ days) after initial infection before this test will identify antigen/ antibody/ other indication of the presence of the infection /issue',
      'Shortest likely time period (hours/ days) after initial infection',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      8,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1,
      NULL,
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '3CDC2906-80CA-40df-AC0D-58C913557FE7')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '3CDC2906-80CA-40df-AC0D-58C913557FE7',
      'Time period (hours/days) anticipated before the level of infection peaks/the maximum level of immune response or other indication of the presence of infection is achieved (as measured by this test)',
      'The maximum level of immune response',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      9,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1,
      NULL,
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '2DF4820E-47D1-4f70-8A08-81CF301084B8')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '2DF4820E-47D1-4f70-8A08-81CF301084B8',
      'Likely time for which the presence of this infection will remain discernible with this test (hours/ days) ',
      'Time for which the presence of this infection will remain discernible',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      10,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1,
      NULL,
      0,
      0,
      NULL,
      0,
      NULL
      )            
End

IF NOT EXISTS (SELECT * FROM [ProfileField] WHERE [Id] = '08C3325D-2136-4c4a-9EDD-DD08A05E1BB4')
BEGIN     
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
      [IncludeInSummary],
      [ProfileFieldGroupId]
      )
      VALUES
      (
      '08C3325D-2136-4c4a-9EDD-DD08A05E1BB4',
      'Any other pertinent information',
      'Any other pertinent information',
      '5b0c2224-d0a3-4e34-babf-c6158451b224',
      11,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      0,
      NULL,
      0,
      0,
      NULL,
      0,
      NULL
      )            
End


