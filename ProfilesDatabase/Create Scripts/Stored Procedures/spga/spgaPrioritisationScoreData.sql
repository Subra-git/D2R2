------------------------------------------------------------------------------------------------
--- spgaPrioritisationScoreData.SQL
------------------------------------------------------------------------------------------------ 

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaPrioritisationScoreData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaPrioritisationScoreData]
GO

CREATE PROCEDURE [dbo].[spgaPrioritisationScoreData] 

AS
BEGIN

-- Common Questions
--4.1  C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6
--4.2  FA2DF822-6B5B-4AE8-BB03-E486A8382455
--4.3  BAD98E54-8B70-45CE-B221-323744689928
--2.1  367EF28D-31A3-46D0-B2A4-BEB38272ED5A
--6.1  383289E8-44D0-464D-AD77-9F4C1BD7D658
--8.1  D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2
SELECT 	
	[ProfileQuestion].[Id] AS ProfileQuestionId,
	[ProfileSection].[SectionNumber],
	[ProfileQuestion].[QuestionNumber],
	[ProfileQuestion].[Name] AS QuestionName	
FROM 
	[ProfileField] INNER JOIN
	[ProfileQuestion] ON [ProfileQuestion].[Id] = [ProfileField].[ProfileQuestionId] INNER JOIN
	[ProfileSection] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]
WHERE 
	[ProfileField].[Id] IN 
	(
		'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6', 
		'FA2DF822-6B5B-4AE8-BB03-E486A8382455',
		'BAD98E54-8B70-45CE-B221-323744689928',
		'367EF28D-31A3-46D0-B2A4-BEB38272ED5A',
		'383289E8-44D0-464D-AD77-9F4C1BD7D658',
		'D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2'
	)
ORDER BY 
	[ProfileSection].[SectionNumber],
	[ProfileQuestion].[QuestionNumber]
	

-- Prioritisation Categories
SELECT 
	[PrioritisationCategory].[Id] AS PrioritisationCategoryId, 	
	[PrioritisationCategory].[DisplayName],
	[PrioritisationCategory].[Name]	
FROM 
	[PrioritisationCategory]
ORDER BY
	[PrioritisationCategory].[SequenceNumber]
	
	
-- Prioritisation Questions
SELECT 
	[ProfileQuestion].[Id] AS ProfileQuestionId,
	[PrioritisationCriterion].[PrioritisationCategoryId],	
	[ProfileSection].[SectionNumber],
	[ProfileQuestion].[QuestionNumber],
	[ProfileQuestion].[Name] AS QuestionName,
	[ProfileQuestion].[IsPerSpecies],
	[PrioritisationCriterion].[Code] AS CriterionCode,
	[PrioritisationCriterion].[Name] AS CriterionName
FROM 
	[PrioritisationCriterion] INNER JOIN
	[ProfileField] ON [PrioritisationCriterion].[TrueMapping] = [ProfileField].[Id] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]	
UNION 
SELECT 	
	[ProfileQuestion].[Id] AS ProfileQuestionId,	
	[PrioritisationCriterion].[PrioritisationCategoryId],	
	[ProfileSection].[SectionNumber],
	[ProfileQuestion].[QuestionNumber],
	[ProfileQuestion].[Name] AS QuestionName,
	[ProfileQuestion].[IsPerSpecies],
	[PrioritisationCriterion].[Code] AS CriterionCode,
	[PrioritisationCriterion].[Name] AS CriterionName
FROM 
	[PrioritisationCriterion] INNER JOIN
	[ProfileField] ON [PrioritisationCriterion].[FalseMapping] = [ProfileField].[Id] INNER JOIN
	[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN
	[ProfileSection] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]
WHERE 
	[PrioritisationCriterion].[MappingFlag] IS NOT NULL
ORDER BY
	[ProfileSection].[SectionNumber],
	[ProfileQuestion].[QuestionNumber]

-- Profile
SELECT 
	[Profile].[Id],
	[Profile].[Title]
FROM
	[Profile]
WHERE 
	[Profile].[ParentId] IS NULL
ORDER BY
	[Profile].[Title]


-- Profile Versions
SELECT
	[ProfileVersion].[Id] AS ProfileVersionId,
	CASE WHEN [Profile].[ParentId] IS NULL THEN [Profile].[Id] ELSE [Profile].[ParentId] END AS ProfileId,
	CASE WHEN [Profile].[ParentId] IS NULL THEN 'Current situation' ELSE [Profile].[ScenarioTitle] END AS ScenarioTitle,
	[ProfileVersion].[VersionMajor],
	[ProfileVersion].[VersionMinor],
	[luProfileVersionState].[Name] AS ProfileVersionState,	
	CAST(CASE WHEN ([Profile].[ParentId]) IS NULL THEN 0 ELSE 1 END AS BIT) AS IsProfileScenario
FROM
	[ProfileVersion] INNER JOIN
	[Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId] INNER JOIN
	[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId]				
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL
ORDER BY	
	[IsProfileScenario],
	[ScenarioTitle],
	[VersionMajor],
	[VersionMinor],
	[ProfileVersionState]


-- Profiled Species
SELECT 
	[Species].[Id] AS SpeciesId,
	[ProfileVersion].[Id] AS ProfileVersionId,	
	[Species].[Name] AS SpeciesName
FROM
	[ProfileVersion] INNER JOIN 
	[ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId] INNER JOIN 
	[Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id] INNER JOIN 
	[luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL AND
	[luAffectedSpeciesType].[Name] = 'Profiled'
ORDER BY
	[Species].[Name]


-- Common Answers
--4.1  C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6 (List)
--4.2  FA2DF822-6B5B-4AE8-BB03-E486A8382455 (List)
--4.3  BAD98E54-8B70-45CE-B221-323744689928 (List)
--2.1  367EF28D-31A3-46D0-B2A4-BEB38272ED5A (Boolean)
--6.1  383289E8-44D0-464D-AD77-9F4C1BD7D658 (List)
--8.1  D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2 (Boolean)
SELECT
	[ProfileField].[ProfileQuestionId],
	[ProfileVersion].[Id] AS ProfileVersionId ,	
	[ReferenceValue].[LookupValue] AS FieldValue
FROM
	[ProfileVersion] INNER JOIN
	[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
	[ProfileField] ON [ProfileField].[Id] = [ProfileVersionFieldValue].[ProfileFieldId] INNER JOIN	
	[ReferenceValue] ON [ReferenceValue].[Id] = [ProfileVersionFieldValue].[ListValue] INNER JOIN
	[luDataFieldType] ON [luDataFieldType].[Id] = [ProfileField].[DataFieldTypeId]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL AND
	[ProfileField].[Id] IN 
	(
		'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6', 
		'FA2DF822-6B5B-4AE8-BB03-E486A8382455',
		'BAD98E54-8B70-45CE-B221-323744689928',
		'383289E8-44D0-464D-AD77-9F4C1BD7D658'
	) AND 
	[luDataFieldType].[Name] = 'List'
UNION
SELECT
	[ProfileField].[ProfileQuestionId],
	[ProfileVersion].[Id] AS ProfileVersionId, 
	CASE WHEN [ProfileVersionFieldValue].[BooleanValue] IS NULL THEN '' 	
		 WHEN [ProfileVersionFieldValue].[BooleanValue] = 1 THEN 'Yes'
		 WHEN [ProfileVersionFieldValue].[BooleanValue] = 0 THEN 'No' END AS FieldValue
FROM
	[ProfileVersion] INNER JOIN
	[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
	[ProfileField] ON [ProfileField].[Id] = [ProfileVersionFieldValue].[ProfileFieldId]	INNER JOIN
	[luDataFieldType] ON [luDataFieldType].[Id] = [ProfileField].[DataFieldTypeId]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL AND
	[ProfileField].[Id] IN 
	(
		'367EF28D-31A3-46D0-B2A4-BEB38272ED5A',		
		'D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2'
	) AND 
	[luDataFieldType].[Name] = 'Boolean'


-- Prioritisation Answers
SELECT
	[ProfileField].[ProfileQuestionId],	
	[ProfileVersion].[Id] AS ProfileVersionId,
	[Species].[Id] AS SpeciesId,		
	[ReferenceValue].[LookupValue] AS FieldValue,
	[PrioritisationCriterionValue].[Score],
	[PrioritisationCriterion].[Weighting] 
FROM
	[ProfileVersion]  INNER JOIN
	[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
	[ProfileField] ON [ProfileField].[Id] = [ProfileVersionFieldValue].[ProfileFieldId] INNER JOIN
	[PrioritisationCriterion] ON [PrioritisationCriterion].[TrueMapping] = [ProfileField].[Id] INNER JOIN
	[ReferenceValue] ON [ReferenceValue].[Id] = [ProfileVersionFieldValue].[ListValue] LEFT JOIN
	[Species] ON [Species].[Id] = [ProfileVersionFieldValue].[SpeciesId] INNER JOIN
	[PrioritisationCriterionValue] ON ([PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id] AND
	[PrioritisationCriterionValue].[CriterionValue] = [ReferenceValue].[LookupValue]) 
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL
UNION
SELECT	
	[ProfileField].[ProfileQuestionId],
	[ProfileVersion].[Id] AS ProfileVersionId,
	[Species].[Id] AS SpeciesId,	
	[ReferenceValue].[LookupValue] AS FieldValue,
	[PrioritisationCriterionValue].[Score], 
	[PrioritisationCriterion].[Weighting] 
FROM
	[ProfileVersion] INNER JOIN
	[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
	[ProfileField] ON [ProfileField].[Id] = [ProfileVersionFieldValue].[ProfileFieldId] INNER JOIN
	[PrioritisationCriterion] ON [PrioritisationCriterion].[FalseMapping] = [ProfileField].[Id] INNER JOIN
	[ReferenceValue] ON [ReferenceValue].[Id] = [ProfileVersionFieldValue].[ListValue] LEFT JOIN
	[Species] ON [Species].[Id] = [ProfileVersionFieldValue].[SpeciesId] INNER JOIN
	[PrioritisationCriterionValue] ON ([PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id] AND
	[PrioritisationCriterionValue].[CriterionValue] = [ReferenceValue].[LookupValue]) 
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL AND
	[PrioritisationCriterion].[MappingFlag] IS NOT NULL


-- Prioritisation Scores
SELECT
	[PrioritisationScore].[ProfileVersionId],
	[PrioritisationScore].[SpeciesId],
	[PrioritisationScore].[PrioritisationCategoryId],
	[PrioritisationScore].[Score],
	[PrioritisationScore].[Rank]
FROM
	[PrioritisationScore] INNER JOIN
	[ProfileVersion] ON [PrioritisationScore].[ProfileVersionId] = [ProfileVersion].[Id]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL AND
	[PrioritisationScore].[Score] IS NOT NULL AND
	[PrioritisationScore].[Rank] IS NOT NULL


END

GO
GRANT EXECUTE ON [dbo].[spgaPrioritisationScoreData] TO [VLAProfilesUser]
GO
