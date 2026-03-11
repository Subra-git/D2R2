------------------------------------------------------------------------------------------------
--- spgaPrioritisationGuidanceData.sql
------------------------------------------------------------------------------------------------ 

CREATE PROCEDURE [dbo].[spgaPrioritisationGuidanceData] 

AS
BEGIN 

-- Prioritisation Categories
SELECT 
	[PrioritisationCategory].[Id] AS PrioritisationCategoryId, 	
	[PrioritisationCategory].[DisplayName],
	[PrioritisationCategory].[Name]	
FROM 
	[PrioritisationCategory]
WHERE
	[PrioritisationCategory].[IsVisibleOnSPR] = 1
ORDER BY
	[PrioritisationCategory].[SequenceNumber]

-- Criterion name and question ID (for obtaining the guidance)
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
	[PrioritisationCriterion].[Code]


END

GO
GRANT EXECUTE ON [dbo].[spgaPrioritisationGuidanceData] TO [VLAProfilesUser]
GO