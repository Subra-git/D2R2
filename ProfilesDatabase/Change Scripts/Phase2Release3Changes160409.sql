-- UATD46 spelling mistake in field name
UPDATE
	[ProfileField]
SET
	[Name] = 'Intrinsic mitigating factors'
WHERE
	[Id] = '27398A95-B630-46D1-B7E3-33BEA49623C7'

-- UATD50 modifications to profile metadata

-- (1) Rename 4.7 from "Laboratories licensed to handle organism" to "Laboratories that offer diagnostic test for this organism/issue"
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Laboratories that offer diagnostic test for this organism/issue',
	[NonTechnicalName] = 'Laboratories that offer diagnostic test for this organism/issue'
WHERE
	[Id] = '7C1FF790-3117-40F5-B71C-A2DD7433BDFB' -- question 4.7
	
-- (2) Question 4.7 should no longer be dependent on the answer given to 4.1. The tick boxes and supporting comments should be mandatory
UPDATE
	[ProfileQuestion]
SET
	[IrrelevanceFieldId] = NULL,
	[IrrelevanceFlag] = NULL
WHERE
	[Id] = '7C1FF790-3117-40F5-B71C-A2DD7433BDFB' -- question 4.7

-- (3) Question 11.1 the field title "References" should be renamed to "Status"
UPDATE
	[ProfileField]
SET
	[Name] = 'Status'
WHERE
	[Id] = '74D2BFBE-CFFD-4235-A6DA-232D85817056' -- question 11.1, field 1

-- (4) The option "Other diagnostic" to be renamed to "Routine diagnosis" in field "Status", in question 11.1.
UPDATE
	[ReferenceValue]
SET
	[LookupValue] ='Routine diagnosis'
WHERE
	[Id] = 'E7B223C9-303C-42EB-9020-20EDF886F6CD'

-- (5) The fields to be included in the summary table, for 11.1 to be changed from Laboratory, Status, Supporting comments to Laboratory, Status, What is the level of expertise maintained at this laboratory for this disease
UPDATE
	[ProfileField]
SET
	[IncludeInSummary] = 0
WHERE
	[Id] = '3623654F-8CA2-4C43-8CAB-A3B59DFD369F' -- remove "Supporting comments" from the summary table

UPDATE
	[ProfileField]
SET
	[IncludeInSummary] = 1
WHERE
	[Id] = '9A994660-2ED3-49DD-B946-0DE632532906' -- add "What is the level of expertise maintained at this laboratory for this disease" to the summary table

-- (6) Question 11.1, options for field "What is the level of expertise…"  to be changed to just two options: "Diagnostic lab only" and "Diagnostic & Research"
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Diagnostic lab only'
WHERE
	[Id] = '8B3BAFDB-E4ED-4BD6-9FDF-C20D9BC692F1' -- change the "Local" option to "Diagnostic lab only"

UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Diagnostic & research'
WHERE
	[Id] = '0F566327-ED1F-4FF5-B979-D9A7F08D55B6' -- change the "National" option to "Diagnostic & research"

UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = '0F566327-ED1F-4FF5-B979-D9A7F08D55B6' 
WHERE
	[ListValue] = '89B71307-412F-4452-9E5A-7B6A3CECC9CA' -- change existing data that links to "International"

DELETE
	[ReferenceValue]
WHERE
	[Id] = '89B71307-412F-4452-9E5A-7B6A3CECC9CA' -- remove the "International" option

-- (7) Change entries in laboratory reference table: Add "IAH", change "CSL" to "FERA (CSL)", "Classified information" to "Other (specify)"
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'FERA (CSL)'
WHERE
	[Id] = '53E1B307-7914-4EE1-A29A-D9EBD92B6F81' -- change "CSL" to "FERA (CSL)"

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
	'4D71DB60-F723-43EA-AAD8-47E925BFB39E',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5', -- Laboratory
	'IAH',
	9,
	GETDATE()
	)	-- Add "IAH"

UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Other (specify)',
	[SequenceNumber] = 10
WHERE
	[Id] = 'CA75ED03-F6AA-4808-A4A1-CCB15F2B44E6' -- change "Classified information" to "Other (specify)"

-- (8) Add supporting comments field to question 11.3	
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
	'8645B7C7-6533-46CB-9AB3-AF13350B246D',
	'Supporting comments',
	'Laboratory Test Potential Improvement Comments',
	'F3E20C91-DD8B-4BD7-8E5F-D972F8BA60F7',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	NULL,
	0,
	0,
	NULL,
	1,
	NULL
	)

-- (9) 10.3 Change option "SAPO legislation" to "Other legislation (e.g. SAPO)"
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Other legislation (e.g. SAPO)'
WHERE
	[Id] = '7CB57611-953D-4A4F-A432-A8B40BA3A984'  -- SAPO legislation

-- (10) Add supporting comments to question 2.5
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
	'2D7D9131-3AF9-4F54-825E-93407025243B',
	'Supporting comments',
	'Potential To Improve Distribution Understanding Comments',
	'EA914FD3-C5BF-42F2-9732-34C698B3B711',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	NULL,
	0,
	0,
	NULL,
	1,
	NULL
	)

-- UATD51 Add supporting comments to question 9.6
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
	'4DCD3F6D-95A3-4AA6-9B5D-A2C9A6523775',
	'Supporting comments',
	'Potential To Limit Disease Spread Or Severity Comments',
	'17589563-1313-4A63-967B-DD559CCFBAC8',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	NULL,
	0,
	0,
	NULL,
	1,
	NULL
	)

-- UATD52 Add new option to Species Question 2.2

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'F8E107A0-A776-429C-BCC3-0A28E8387953',
	'31A35980-0682-4604-9DDB-485A0120E6FD', -- Holding records
	'Zoo records',
	9
	)	
	
-- CR35 Change Epidemiology question 3.18 so it is not per-species

UPDATE
	[ProfileQuestion]
SET
	[IsPerSpecies] = 0
WHERE
	[Id] = '9F8B60E7-C1DF-486D-97F4-7B34D228DDE2';

-- fix the existing data in the ProfileVersionFieldValue table
WITH [CountedAnswers]
	(
	[RowNumber],
	[Id],
	[ProfileVersionId],
	[SpeciesId]
	) AS 
	(
	SELECT
		ROW_NUMBER() OVER (PARTITION BY [ProfileVersionId] ORDER BY [ProfileVersionId]) AS [RowNumber], 
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[ProfileVersionId],
		[ProfileVersionFieldValue].[SpeciesId]
	FROM
		[ProfileVersionFieldValue]
	WHERE
		[ProfileFieldId] = '652D2259-FA6F-45A2-BB35-C7745E5056D4'
	)
UPDATE
	[ProfileVersionFieldValue]
SET
	[SpeciesId] = NULL
FROM
	[ProfileVersionFieldValue] INNER JOIN [CountedAnswers] ON [ProfileVersionFieldValue].[Id] = [CountedAnswers].[Id]
WHERE
	[CountedAnswers].[RowNumber] = 1

DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = '652D2259-FA6F-45A2-BB35-C7745E5056D4' AND
	[SpeciesId] IS NOT NULL;

WITH [CountedAnswers]
	(
	[RowNumber],
	[Id],
	[ProfileVersionId],
	[SpeciesId]
	) AS 
	(
	SELECT
		ROW_NUMBER() OVER (PARTITION BY [ProfileVersionId] ORDER BY [ProfileVersionId]) AS [RowNumber], 
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[ProfileVersionId],
		[ProfileVersionFieldValue].[SpeciesId]
	FROM
		[ProfileVersionFieldValue]
	WHERE
		[ProfileFieldId] = 'E09D143B-4BC6-4C21-8E71-676BDF46F584'
	)
UPDATE
	[ProfileVersionFieldValue]
SET
	[SpeciesId] = NULL
FROM
	[ProfileVersionFieldValue] INNER JOIN [CountedAnswers] ON [ProfileVersionFieldValue].[Id] = [CountedAnswers].[Id]
WHERE
	[CountedAnswers].[RowNumber] = 1

DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = 'E09D143B-4BC6-4C21-8E71-676BDF46F584' AND
	[SpeciesId] IS NOT NULL

-- UATD58 Rename sections, move question 2.6

	-- rename section 2
	UPDATE
		[ProfileSection]
	SET
		[Name] = 'Geographic distribution and levels of disease'
	WHERE
		[Id] = '99f0ee93-3e56-455c-8666-b0c9eb581589'
	
	-- move q2.6 -> 5.8
	UPDATE
		[ProfileQuestion]
	SET
		[ProfileSectionId] = '404dd5d4-4447-4cad-a0ab-c8f0da284b49',
		[QuestionNumber] = 8
	WHERE
		[Id] = '3756BE7D-AB87-46ED-841A-AF6FF3CDB325'
		
	-- (which causes q2.7 to move -> 2.6)
	UPDATE
		[ProfileQuestion]
	SET
		[QuestionNumber] = 6
	WHERE
		[Id] = '5790EEAA-1496-4357-A4ED-98B2B991D090'

	-- (which causes q2.8 to move -> 2.7)
	UPDATE
		[ProfileQuestion]
	SET
		[QuestionNumber] = 7
	WHERE
		[Id] = '15371B7D-9630-44B1-BCFC-31B7850FCDB6'
	
	-- (which causes q5.8 to move -> 5.9)
	UPDATE
		[ProfileQuestion]
	SET
		[QuestionNumber] = 9
	WHERE
		[Id] = 'D2174FEE-AA09-4CB9-B66C-266E7AC6F463'

	-- (which causes q5.9 to move -> 5.10)
	UPDATE
		[ProfileQuestion]
	SET
		[QuestionNumber] = 10
	WHERE
		[Id] = '13B0550B-7F49-4998-98B0-AC4950DA6743'

	-- rename section 10
	UPDATE
		[ProfileSection]
	SET
		[Name] = 'Risk assessment',
		[ShortName] = 'Risk Assessment'
	WHERE
		[Id] = '158f8d0c-15a7-4f31-98fc-0c06196045d5'

-- UATD47 Changes to profile questions in the Risk section

	-- rename q10.1
	UPDATE
		[ProfileQuestion]
	SET
		[Name] = 'What are the key risk factors that could increase the level of infection/disease, or increase the risk of introducing this infection/disease in G.B.'
	WHERE
		[Id] = '0F37FF70-3BCB-49B7-B0A1-087771987D0F'
	
	-- split the first field of q10.1 into three
	DELETE
		[ProfileVersionFieldValue]
	WHERE
		[ProfileFieldId] = '2BF45A2A-54D6-480F-9894-0AC47CE54F95' -- get rid of any existing data for the "Key risk factors" field
	
	UPDATE
		[ReferenceTable]
	SET
		[Name] = 'Intrinsic Risk Factors'
	WHERE
		[Id] = '2B2C4BD9-0122-48AD-9546-008DB3AA275D'
		
	INSERT INTO [ReferenceTable]
		(
		[Id],
		[Name],
		[IsMaintainable]
		)
	VALUES
		(
		'14743F54-4F51-422B-B18E-A3760A07F619',
		'Extrinsic Risk Factors',
		0
		)
	
	INSERT INTO [ReferenceTable]
		(
		[Id],
		[Name],
		[IsMaintainable]
		)
	VALUES
		(
		'1B17FB44-8E7B-43AE-8F96-C0445EED3A6A',
		'Unclassified Risk Factors',
		0
		)

	UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 4
	WHERE
		[Id] = '7FEDCCA9-D5D7-496A-850C-05916B10B517'

UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 9
	WHERE
		[Id] = '0462F9C5-9019-4E11-804D-116D07D0D74C'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 2
	WHERE
		[Id] = '2DCFBC71-C793-4992-8004-1CA6B99AAEFF'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 3
	WHERE
		[Id] = '1E0F7270-C357-4569-A828-20BA65D693F9'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 13
	WHERE
		[Id] = 'BC74A696-F9D7-4E34-BDA3-2745A6054939'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 1
	WHERE
		[Id] = '37DC5B0A-22E0-4A4C-A15D-2757DB8D6737'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 8
	WHERE
		[Id] = '1382B626-926B-4E18-B629-2CCF76CDD505'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 5
	WHERE
		[Id] = 'B99FAE1B-00CA-478C-9853-2F69B656CA31'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 11
	WHERE
		[Id] = 'F3C4C643-5CEC-4452-AFC9-35D7DDD14B68'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 12
	WHERE
		[Id] = '6A3BBC3A-1C8C-4543-A140-3EF989579FB4'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 2,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = 'AE5E9D03-F0A8-4C2D-829C-52B849C989F9'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 7
	WHERE
		[Id] = '11732457-D8B0-446C-9E45-587DDB4B91CC'
		
UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = 'Genetic shift / drift',
		[SequenceNumber] = 6
	WHERE
		[Id] = 'A2CDC6B4-2AE5-4CE2-B9B3-5DD2D8C4A6B8'
		
	DELETE
		[ReferenceValue]
	WHERE
		[Id] = '8CC6AAD1-7BFA-4468-99F5-5EE585326424'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 3,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = '7D1763A0-000E-487A-9398-5FB6C0B2C211'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 10
	WHERE
		[Id] = 'EFDE70E7-1B3B-4EFE-9FC1-60515C10900C'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 14
	WHERE
		[Id] = '9D5AD7A1-11E7-406C-BECB-6A036B7F2DE3'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 1,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = 'DE703063-9280-49DC-AD02-6DE8A9D48034'
		
UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = 'Lack of effective treatment',
		[SequenceNumber] = 4,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = '0401B324-4791-44CE-A637-84DC5FB4338C'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 5,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '18828382-C967-42EF-804A-8943929E5895'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 6,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '7EEC3738-4174-44FF-ADBB-A229C1BE88B9'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 3,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = 'D0CDF8F1-AA86-4984-9C9E-A9BD8C0321B0'
		
UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = 'Reduced surveillance undertaken',
		[SequenceNumber] = 9,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '2B844539-DD85-4924-B539-BD4C88D9348D'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 4,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '488D9211-8FF0-4C73-91B2-CFB3D599AE4C'
		
UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = 'Low vaccine uptake',
		[SequenceNumber] = 2,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = 'E48BE31D-09DF-4952-8005-DB2DD05E5F62'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 6,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = '22B1D697-FFCE-4091-BD10-DB4280AB9359'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 1,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '11D8EBE8-961D-4019-8370-DF596CC5B953'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 5,
		[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
	WHERE
		[Id] = '28D832F3-9B8B-47E9-8AF8-EDD8B3DC2B1E'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 7,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '9197D03C-1D22-4A41-838D-F6F2895CFA0A'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 8,
		[ReferenceTableId] = '14743F54-4F51-422B-B18E-A3760A07F619'
	WHERE
		[Id] = '20BAB49F-3678-478B-BE89-F7E73162FD44'
		
UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = 15
	WHERE
		[Id] = '9BF504B2-EF15-4F95-8778-F8B72DD60990'

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'144FEB53-3D2E-4FA7-A496-36B250C52C19',
	'14743F54-4F51-422B-B18E-A3760A07F619',
	'Other (Please specify below)',
	10
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
	'A339C16F-2366-4250-A7FE-F0D38FE65D4E',
	'1B17FB44-8E7B-43AE-8F96-C0445EED3A6A',
	'Other (Please specify below)',
	7
	)

UPDATE
	[ProfileField]
SET
	[Name] = 'Intrinsic risk factors',
	[ShortName] = 'Intrinsic Risk Factors',
	[IsMandatory] = 0
WHERE
	[Id] = '2BF45A2A-54D6-480F-9894-0AC47CE54F95'
	
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
    '86A8355C-EA5C-4615-864A-E6F482E3B6BA',
	'Extrinsic risk factors',
	'Extrinsic Risk Factors',
	'0F37FF70-3BCB-49B7-B0A1-087771987D0F',
	2,
	'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
	0,
	'14743F54-4F51-422B-B18E-A3760A07F619',
	0,
	0,
	NULL,
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
	[ReferenceTableId],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue],
	[IncludeInSummary],
	[ProfileFieldGroupId]
	)
VALUES
    (
    '265FC024-2B17-46AC-9799-1182936F6751',
	'Unclassified risk factors',
	'Unclassified Risk Factors',
	'0F37FF70-3BCB-49B7-B0A1-087771987D0F',
	3,
	'1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
	0,
	'14743F54-4F51-422B-B18E-A3760A07F619',
	0,
	0,
	NULL,
	1,
	NULL
	)

UPDATE
	[ProfileField]
SET
	[FieldNumber] = 4
WHERE
	[Id] = 'EE9CB071-DE98-4E29-A9F6-131AB455DB6C'

UPDATE
	[ProfileField]
SET
	[ReferenceTableId] = '1B17FB44-8E7B-43AE-8F96-C0445EED3A6A'
WHERE
	[Id] = '265FC024-2B17-46AC-9799-1182936F6751'
	
-- rename q10.2
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'What are the key mitigating factors that currently control or prevent infection/disease occurrence in G.B.'
WHERE
	[Id] = '94991AF7-EB9B-4F3F-9463-2479EEE2FFE9'

-- rename field 2 of q10.2
UPDATE
	[ProfileField]
SET
	[Name] = 'Applied and/or extrinsic mitigating factors'
WHERE
	[Id] = '022F5F79-0773-476B-A73A-391D7A68E4AA'

DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = '022F5F79-0773-476B-A73A-391D7A68E4AA'
	
-- reorder options for field 1 of q10.2
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = '9FFB20F3-3A9C-43D9-AB52-07F41732310D'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Seasonal activity / distribution of vectors',
	[SequenceNumber] = 10
WHERE
	[Id] = '73347098-8726-4DE6-859E-0EA57FCDE31F'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 7
WHERE
	[Id] = 'C2F60D24-4D11-4690-922A-1543C81FAF9F'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 6
WHERE
	[Id] = '23CDE52E-A87C-42E9-B63A-1741A05B0E1D'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = '97E3137C-C383-47B7-AC66-18C4BA719214'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 8
WHERE
	[Id] = 'D944A581-5AC5-4F62-87DE-25DF32734721'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 2
WHERE
	[Id] = '818DB0CD-A11C-4E85-92E3-28602CD3A47A'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 9
WHERE
	[Id] = 'A47BC0A8-5C35-4A60-B386-2AB059690CCA'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 4
WHERE
	[Id] = '66FEFD58-698E-44F4-9D88-2BF0CD304099'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 5
WHERE
	[Id] = '48680051-0C49-440B-9642-2BFC31C9C322'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 11
WHERE
	[Id] = '8DCD609D-9DF9-4DF5-9DE7-48964AE58E7C'

-- reorder options for field 2 of q10.2
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 10
WHERE
	[Id] = '8CA29D41-D3B1-4EDB-A83C-060329214C44'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 14
WHERE
	[Id] = '4F6706BD-FDA8-4D49-A44E-08E4F21CCA10'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 8
WHERE
	[Id] = 'FAB50081-0C0A-4B41-B363-0DE86F25CC5A'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 15
WHERE
	[Id] = 'F19B85A7-C4C4-49BC-88F0-0F22534ED8AE'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Vaccine use',
	[SequenceNumber] = 16
WHERE
	[Id] = 'F1EF1379-E5B3-41AE-8B8D-1A918E77CD91'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 11
WHERE
	[Id] = 'BE9777D4-D297-4610-868E-20FB41AD3C3C'
	
DELETE
	[ReferenceValue]
WHERE
	[Id] = 'EDB6EE7C-2F56-4308-AFFE-22FD699CD4A3'
	
DELETE
	[ReferenceValue]
WHERE
	[Id] = '30C2AB7B-305E-45FA-A145-23238A9C8E85'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Import controls / border inspection posts',
	[SequenceNumber] = 6
WHERE
	[Id] = '84C90E82-553B-430C-8B13-47E5613675C8'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Processing methods',
	[SequenceNumber] = 12
WHERE
	[Id] = '6A8B13D3-CC59-49CF-9063-4B542B647F30'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = '3AA41FEC-1A1D-403E-BBDC-52EB6513E82E'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = 'E78FB32A-3812-4217-9616-57180507F1C9'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Legislation',
	[SequenceNumber] = 7
WHERE
	[Id] = '8A351511-7863-4CE9-93B6-6757DF949ED4'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 2
WHERE
	[Id] = 'DBB9FB95-5D07-4F08-BA51-6AA7419274AE'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 9
WHERE
	[Id] = 'B2E6C5BD-9736-4A9D-A8BE-6EE72E650477'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 4
WHERE
	[Id] = 'F42597B9-8601-443B-AB92-7C86B71140AF'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 5
WHERE
	[Id] = '0190D0E1-8433-4815-8E6F-848D4DE2C379'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 13
WHERE
	[Id] = 'AD11F938-5134-4001-94C0-97504E60699B'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 17
WHERE
	[Id] = '2EFA6967-21F9-449C-82F6-AAA81D90EFA5'

-- rename q10.3
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'What are the key additional mitigating factors that could be applied to control or prevent infection/disease occurrence in G.B.'
WHERE
	[Id] = '3ED56B05-6510-4F7D-9460-4ECF02D34BF5'

DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = '93E6F128-2154-49A4-9842-55AF4E55EA5B'
	
-- reorder options for field 1 of q10.3
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 11
WHERE
	[Id] = 'F81C8CC0-B08C-4C56-AD50-041397C4771E'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 14
WHERE
	[Id] = '99842CE6-E0BD-417D-BBAE-06C0B2948018'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 9
WHERE
	[Id] = 'B2FD71C4-F50F-4BB9-8869-26BCE63136FB'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 15
WHERE
	[Id] = 'A97D235C-7DE4-4224-A858-36A8F9393C40'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Vaccine use',
	[SequenceNumber] = 16
WHERE
	[Id] = 'EF02C4C2-B019-4A24-8F34-3DC3C1AD8198'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 12
WHERE
	[Id] = 'DEC3119F-F67E-4407-A009-7E3E41BA0390'
	
DELETE
	[ReferenceValue]
WHERE
	[Id] = '5EDC51A9-0249-4B32-B146-8A6E47B57D28'
	
DELETE
	[ReferenceValue]
WHERE
	[Id] = '34E8C243-EFB0-473D-92E3-8F427D7FB954'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Import controls / border inspection posts',
	[SequenceNumber] = 6
WHERE
	[Id] = 'FB606BEF-4753-4273-839E-8FEFA56EFA63'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Processing methods',
	[SequenceNumber] = 13
WHERE
	[Id] = '4A7E46EB-0BA5-41F5-88D0-958FB555ED82'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = 'BAFE3BFC-7E37-4C60-B298-A857F38067F1'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = 'A64178A1-722F-4B98-A1B5-A89F532B243D'
	
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Legislation',
	[SequenceNumber] = 8
WHERE
	[Id] = '7CB57611-953D-4A4F-A432-A8B40BA3A984'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 2
WHERE
	[Id] = '010D8BEB-E9C5-4235-B301-BB218B81B94F'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 10
WHERE
	[Id] = '9D582C3A-FCAD-4B06-A5A1-C25790124F75'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 4
WHERE
	[Id] = 'A4977626-1522-4194-848B-C5286631682D'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 5
WHERE
	[Id] = '8E8FFE4E-2B53-4675-A638-E885BB7A0418'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 7
WHERE
	[Id] = 'E724855A-BC95-428E-BAF4-F5F7E03E4F1A'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 17
WHERE
	[Id] = '911BEB9A-270F-4639-A4D6-FE0013971951'

-- rename q10.4
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Level of inherent biological variability'
WHERE
	[Id] = '4371D7B2-21E2-41E6-A571-64B6A5E23D0F'

-- rename q10.5
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Level of uncertainty in the available evidence base'
WHERE
	[Id] = '8F603A38-BB4E-4065-9363-8A22D44BB45B'

-- delete q10.6
DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = 'DA16CA94-EC3E-43B7-BB88-05122C90DAFF'

DELETE
	[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId] = 'B74481A7-D232-4F51-81B3-0CB0005A4CCD'

DELETE
	[ProfileField]
WHERE
	[Id] = 'DA16CA94-EC3E-43B7-BB88-05122C90DAFF'

DELETE
	[ProfileField]
WHERE
	[Id] = 'B74481A7-D232-4F51-81B3-0CB0005A4CCD'

DELETE
	[ProfileVersionNoteQuestion]
WHERE
	[ProfileQuestionId] = '8BC27978-625E-4559-8567-9ECB811EF9A8'
	
DELETE
	[ProfileQuestion]
WHERE
	[Id] = '8BC27978-625E-4559-8567-9ECB811EF9A8'

UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 6
WHERE
	[Id] = 'DCF4C29F-C1A9-4FA1-834B-13B165F7AA8C'
	
UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 7
WHERE
	[Id] = '5F75AD01-F282-478F-BB37-2E7B1188657C'
	
-- reorder options for field 1 of q10.8 (now q10.7)

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 5
WHERE
	[Id] = '7CA04332-0E1F-43CA-9303-091DC6A89820'
	
UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 6
WHERE
	[Id] = '83A9635C-A5A7-4C59-B236-13955B0A8C44'

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 4
WHERE
	[Id] = '2AE86187-1894-4755-AF8F-27A016544999'

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = '3472C369-847F-4DBD-8B41-38D49A6F3BE9'

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 7
WHERE
	[Id] = '4D2336FE-7272-4412-8A30-85F3D860C01C'

UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Grey literature',
	[SequenceNumber] = 2
WHERE
	[Id] = '27E2F07D-10F4-4D0B-B3DB-87A1A9B9A9F0'

UPDATE
	[ReferenceValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = 'A5521425-48D8-4805-B458-A110F37F42A2'

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'FC190FA9-B581-4A34-A559-4D58F33D6C8B',
	'8C6B2614-5E70-4D99-AF28-D6BFB19D8F56',
	'Other (please specify)',
	8
	)

	-- set option fields in q10.2 and q10.3 to be optional
	UPDATE
		[ProfileField]
	SET
		[IsMandatory] = 0
	WHERE
		[Id] = '27398A95-B630-46D1-B7E3-33BEA49623C7'

	UPDATE
		[ProfileField]
	SET
		[IsMandatory] = 0
	WHERE
		[Id] = '022F5F79-0773-476B-A73A-391D7A68E4AA'

	UPDATE
		[ProfileField]
	SET
		[IsMandatory] = 0
	WHERE
		[Id] = '93E6F128-2154-49A4-9842-55AF4E55EA5B'

-- UATD57: Changes to profile questions in the Surveillance section

	-- changes to Surveillance Mechanism options
	UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = 'Notification and investigation'
	WHERE
		[Id] = '691D354F-9BDB-4870-A785-D8B350293833'
	
	DELETE
		[ProfileVersionFieldValue]
	WHERE
		[ListValue] = 'C878CD62-7CD7-4F6F-AC59-0900D8F58141' -- Outbreak investigation
		
	DELETE
		[ReferenceValue]
	WHERE
		[Id] = 'C878CD62-7CD7-4F6F-AC59-0900D8F58141' -- Outbreak investigation
	
	UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = [SequenceNumber] - 1
	WHERE
		[ReferenceTableId] = 'D41B31E1-D0C0-464D-B640-3D26DD21546E' AND
		[SequenceNumber] > 2
	
	DELETE
		[ProfileVersionFieldValue]
	WHERE
		[ListValue] = '0DEB0107-FF61-426F-9A24-8051D41187C1' -- Census
		
	DELETE
		[ReferenceValue]
	WHERE
		[Id] = '0DEB0107-FF61-426F-9A24-8051D41187C1' -- Census
	
	UPDATE
		[ReferenceValue]
	SET
		[SequenceNumber] = [SequenceNumber] - 1
	WHERE
		[ReferenceTableId] = 'D41B31E1-D0C0-464D-B640-3D26DD21546E' AND
		[SequenceNumber] > 5

	-- make changes to fields in question 12.1
	
		-- remove "Data sources" field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '325A29CD-131A-4BEE-AE13-B9F099F31004'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '325A29CD-131A-4BEE-AE13-B9F099F31004'
			
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3'
		
		-- changes to "Contractor" field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = 'F2AE3FB2-7275-4C4C-8D20-155FD8659A20'
		
		UPDATE
			[ProfileField]
		SET
			[Name] = 'Lead contractor',
			[ShortName] = 'Lead Contractor',
			[FieldNumber] = 4
		WHERE
			[Id] = 'F2AE3FB2-7275-4C4C-8D20-155FD8659A20'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = '46A88759-A81C-44F2-9CBD-D1B45F8A7FDB'
		
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
			'D1A1C6D2-3EFA-47C8-A60A-05A341542B8D',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'AH',
			1,
			GETDATE()
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
			'83B13106-2FB5-4516-8696-CE7759EC9F11',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'AHT',
			2,
			GETDATE()
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
			'77A85713-BE5D-463C-9EDF-812C83F5A7DD',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'CEFAS',
			3,
			GETDATE()
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
			'05799E1C-0CC4-4F1E-818A-17E18F27B1DB',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'Fera (prev. CSL)',
			4,
			GETDATE()
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
			'DA8FB087-053F-4C10-95FB-36095014A8B9',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'FSA/MHS',
			5,
			GETDATE()
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
			'E1A17BC9-D5F9-40F6-830A-9B0A7041F7E6',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'SAC',
			6,
			GETDATE()
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
			'7C43DCDE-AC15-443C-95E3-8CE807ADE9FC',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'VLA',
			7,
			GETDATE()
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
			'7AFE7375-A497-4344-B58C-CA96F437FAA9',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'VMD',
			8,
			GETDATE()
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
			'1CEC9B76-279B-456A-A9D0-A490D3E86B7D',
			'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
			'Other (please specify)',
			9,
			GETDATE()
			)
		
		-- shift Contractor supporting comments up
		UPDATE
			[ProfileField]
		SET
			[ShortName] = 'Contractor Supporting Comments',
			[FieldNumber] = 5
		WHERE
			[Id] = 'CAC5500E-1BEE-4806-8000-C5B0D6084403'
		
		-- delete Annual Cost field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '1F53D53C-4BB8-42AB-84DE-BC5C464DE165'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '1F53D53C-4BB8-42AB-84DE-BC5C464DE165'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'A975CDF0-CAE1-4E14-B524-F94A8405A4E7'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'A975CDF0-CAE1-4E14-B524-F94A8405A4E7'
		
		-- delete Event Cost field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '115011D4-3A2C-461D-8D64-8AE457F9DF73'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '115011D4-3A2C-461D-8D64-8AE457F9DF73'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55'
		
		-- delete Event Cost Comments field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '1813484A-6659-4A9A-AB68-C452D4D72D4C'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '1813484A-6659-4A9A-AB68-C452D4D72D4C'

		-- delete Sensitivity field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = 'E1909890-8360-4D3A-A330-064A52160965'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = 'E1909890-8360-4D3A-A330-064A52160965'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = '45499FF7-675A-4506-A75D-8FFAB37FCE1A'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = '45499FF7-675A-4506-A75D-8FFAB37FCE1A'
		
		-- delete Sensitivity Comments field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '7DCDF1A5-86AC-4054-8C80-942A6C4E65D6'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '7DCDF1A5-86AC-4054-8C80-942A6C4E65D6'
		
		-- delete Specificity field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = 'FA815268-4D5B-4C44-800D-0DC474FB8C08'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = 'FA815268-4D5B-4C44-800D-0DC474FB8C08'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'E8605552-5BA1-4852-B803-589FB51DD775'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'E8605552-5BA1-4852-B803-589FB51DD775'
		
		-- delete Specificity Comments field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '6143E8AC-523A-4BEF-851B-1E9D4C8993F9'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '6143E8AC-523A-4BEF-851B-1E9D4C8993F9'
		
		-- delete Commercially Sensitive field
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '0E47E332-FE51-4386-9321-AA5F84DB0D0C'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '0E47E332-FE51-4386-9321-AA5F84DB0D0C'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'CA609893-9981-4E34-AE3B-9F3C0CF3AEFF'
		
		-- rename "Where are the outcomes..." field and reorder the options
		UPDATE
			[ProfileField]
		SET
			[Name] = 'Where are the results of this surveillance published',
			[FieldNumber] = 6
		WHERE
			[Id] = 'BEB05082-D4E8-47A1-A885-4C6B77568A4A'

		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 8
		WHERE
			[Id] = 'BBF4FD55-4800-4BCB-873C-1A72F599EC20'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 10
		WHERE
			[Id] = '8C61D574-4A9D-48C0-8339-255BA4AC6062'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 6
		WHERE
			[Id] = 'DC95B0E5-7DD4-42E7-BB22-2CFBDCADF0D3'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 3
		WHERE
			[Id] = 'BD06FA6E-1993-419C-8276-545B419290DA'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 1
		WHERE
			[Id] = 'CCDCA091-320D-401A-A4E4-70FD1CF14EA2'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 2
		WHERE
			[Id] = '3096F985-FD57-446C-A765-9EF31AB948DD'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 9
		WHERE
			[Id] = 'BB7789A5-94C7-48B4-86D4-B12C9888F490'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 7
		WHERE
			[Id] = 'A51D3B71-5FC7-47EE-B19D-DBE160D0136C'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 5
		WHERE
			[Id] = 'BFACA19A-9079-46FD-B6A9-E27D9E094A1C'
			
		UPDATE
			[ReferenceValue]
		SET
			[SequenceNumber] = 4
		WHERE
			[Id] = '6C3739D6-A795-43DC-87D4-E3628E68CD55'

		-- delete "Who is influenced by these reports..."
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '4210CA74-D671-4ABD-AD3A-BD1320CB3431'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '4210CA74-D671-4ABD-AD3A-BD1320CB3431'
		
		-- make changes to "How rapidly..."
		UPDATE
			[ProfileField]
		SET
			[Name] = 'What is the standard frequency of reports to Defra from this surveillance project',
			[FieldNumber] = 7
		WHERE
			[Id] = 'C33ECCE9-45EA-4F8E-8D9B-31E730B588B6'
		
		UPDATE
			[ReferenceValue]
		SET
			[LookupValue] = 'Weekly'
		WHERE
			[Id] = 'EF7F39CA-52E0-4931-B58D-501210FF188E'
		
		UPDATE
			[ReferenceValue]
		SET
			[LookupValue] = 'Annually'
		WHERE
			[Id] = '8B14B54C-62FE-4369-A4DF-B7AB9C220572'
		
		INSERT INTO [ReferenceValue]
			(
			[Id],
			[ReferenceTableId],
			[LookupValue],
			[SequenceNumber]
			)
		VALUES
			(
			'2D8AF180-9FE6-468F-848C-F883C9A78950',
			'05EA7631-39A7-4DA9-BB96-8CE259D88D01',
			'Other (please specify)',
			5
			)
		
		-- shift "How rapidly..." comments
		UPDATE
			[ProfileField]
		SET
			[FieldNumber] = 8
		WHERE
			[Id] = 'EBA52A78-FFE0-40AF-9397-928FAA7CBE9D'
		
		-- delete the field group
		
			-- delete "Inclusion criteria"
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = '2126F304-F99F-4B75-AC1B-718DA6A3A76A'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = '2126F304-F99F-4B75-AC1B-718DA6A3A76A'
			
			-- delete "Samples collected"
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = 'D6FF43FF-3A59-40D2-A02A-C99C77E75A7C'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = 'D6FF43FF-3A59-40D2-A02A-C99C77E75A7C'
			
			-- delete "Samples collected comments"
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = 'E6F6A44B-FE78-4C28-B37B-2E9094A58E59'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = 'E6F6A44B-FE78-4C28-B37B-2E9094A58E59'
			
			-- delete "Is there scope to improve..."	
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = '49E184B7-024B-44FB-82B4-1D41A3C4F772'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = '49E184B7-024B-44FB-82B4-1D41A3C4F772'
			
			DELETE
				[ReferenceValue]
			WHERE
				[ReferenceTableId] = '75B46A00-229F-4DEC-B214-DE620B293DC8'
			
			DELETE
				[ReferenceTable]
			WHERE
				[Id] = '75B46A00-229F-4DEC-B214-DE620B293DC8'
		
			-- delete "Is there scope" comments
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = '69DFF2E9-FDC7-487E-9983-321E22B35939'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = '69DFF2E9-FDC7-487E-9983-321E22B35939'
			
			-- delete "Cost to implement..."
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = '35A30BEC-AAD7-4F93-9784-A29DA5277254'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = '35A30BEC-AAD7-4F93-9784-A29DA5277254'
			
			DELETE
				[ReferenceValue]
			WHERE
				[ReferenceTableId] = '2034B05B-126E-416B-9D26-1D08CDECF516'
			
			DELETE
				[ReferenceTable]
			WHERE
				[Id] = '2034B05B-126E-416B-9D26-1D08CDECF516'
			
			-- delete "Likely benefits..."
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = '9D0F3810-F4B6-4C23-AD50-4FCE8236EC4A'
			
			DELETE
				[ProfileField]
			WHERE
				[Id] = '9D0F3810-F4B6-4C23-AD50-4FCE8236EC4A'
			
			DELETE
				[ReferenceValue]
			WHERE
				[ReferenceTableId] = 'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3'
			
			DELETE
				[ReferenceTable]
			WHERE
				[Id] = 'AA1E3910-FEEA-4264-8ED5-3E0D9594F6D3'
			
			-- delete the "field group" field
			DELETE
				[ProfileVersionFieldValue]
			WHERE
				[ProfileFieldId] = 'D8DB1506-550D-4BAC-925B-12AD7952149D'
				
			DELETE
				[ProfileField]
			WHERE
				[Id] = 'D8DB1506-550D-4BAC-925B-12AD7952149D'
	
	-- rename q12.3
	UPDATE
		[ProfileQuestion]
	SET
		[Name] = 'Identify any additional surveillance activities that would usefully enhance our understanding of the disease/issue profiled'
	WHERE
		[Id] = 'AF442375-7684-400B-8157-1B3BEE00F63D'

-- UATD56: Changes to profile questions in Laboratories section

	-- add two options to q11.1 "Status" field
	INSERT INTO [ReferenceValue]
		(
		[Id],
		[ReferenceTableId],
		[LookupValue],
		[SequenceNumber]
		)
	VALUES
		(
		'C6BAEC28-5601-4A4A-A82A-5B263CB7CF53',
		'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
		'Human disease reference lab',
		5
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
		'0D4D850A-CF53-4A16-8C73-8F2C10C6E277',
		'94A5FDC7-4EA1-4851-AE6D-2B8B135EB3D0',
		'Samples sent to foreign labs for diagnosis',
		6
		)
	
	-- remove fields from q11.2
	
		-- delete "Unit cost"
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '1F96850F-5A6A-475D-8EA5-1499B334E22C'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '1F96850F-5A6A-475D-8EA5-1499B334E22C'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = '82AA067B-35B9-4E04-9906-A795FEB73BE4'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = '82AA067B-35B9-4E04-9906-A795FEB73BE4'
	
		-- shift up "Turnaround Time"
		UPDATE
			[ProfileField]
		SET
			[FieldNumber] = 4
		WHERE
			[Id] = '68C346C5-847A-4290-B117-6888D12B9FB5'
		
		-- delete "Sensitivity Range"
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '1C7187D6-EF15-412C-B95E-B61DD1AEE9E9'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '1C7187D6-EF15-412C-B95E-B61DD1AEE9E9'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = '6A38BE43-9264-45E9-8C10-0A7E769F64DA'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = '6A38BE43-9264-45E9-8C10-0A7E769F64DA'
		
		-- delete "Specificity Range"
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = 'EEC08657-A27E-4991-8BCB-78755FF23525'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = 'EEC08657-A27E-4991-8BCB-78755FF23525'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'DE28BEDF-CA47-4AE5-8B72-39257597697B'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'DE28BEDF-CA47-4AE5-8B72-39257597697B'
		
		-- shift up "Is this test prescribed..."
		UPDATE
			[ProfileField]
		SET
			[FieldNumber] = 5
		WHERE
			[Id] = 'BC4E1B80-9592-43AE-AD57-ECCE10AF40F5'
		
		-- shift up "Laboratories that can..."
		UPDATE
			[ProfileField]
		SET
			[FieldNumber] = 6
		WHERE
			[Id] = 'FDFBF94B-B5BE-4D55-AE38-42BF7634DA24'
		
		-- delete "What use is made..."
		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileFieldId] = '7B12E7A9-55D4-4E86-8D5E-BB6C1698547A'
		
		DELETE
			[ProfileField]
		WHERE
			[Id] = '7B12E7A9-55D4-4E86-8D5E-BB6C1698547A'
		
		DELETE
			[ReferenceValue]
		WHERE
			[ReferenceTableId] = 'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C'
		
		DELETE
			[ReferenceTable]
		WHERE
			[Id] = 'ADF496FF-DB97-4753-A7DC-F1D7CBF8C35C'

		-- shift up "Supporting comments"
		UPDATE
			[ProfileField]
		SET
			[FieldNumber] = 7
		WHERE
			[Id] = '53A3CBFB-0069-401A-9B24-A0BBFB944FC8'
	
	-- rename q11.3
	UPDATE
		[ProfileQuestion]
	SET
		[Name] = 'Potential to improve diagnostic capability for the profiled disease or issue'
	WHERE
		[Id] = 'F3E20C91-DD8B-4BD7-8E5F-D972F8BA60F7'

-- 4239 Text changes to Laboratories section
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Official reference diagnostic laboratories'
WHERE
	[Id] = 'D77A70EB-B43D-4A5E-8E41-2A623CA4ECDB'

UPDATE
	[ReferenceValue]
SET
	[LookupValue] = 'Non-government labs.'
WHERE
	[Id] = '86A8B568-DAEF-4CDB-8F69-48F3CDE10AB5'
	
-- change to UATD58
UPDATE
	[ProfileSection]
SET
	[ShortName] = 'Geographic Distribution And Levels Of Disease'
WHERE
	[Id] = '99f0ee93-3e56-455c-8666-b0c9eb581589'