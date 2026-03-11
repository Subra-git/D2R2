/****** Object:  StoredProcedure [dbo].[spgaProfileSectionMetadata]    Script Date: 3/8/2024 10:44:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[spgaProfileSectionMetadata] 	
AS
BEGIN

	SET NOCOUNT ON;

	--ProfileSection
    SELECT
		[ProfileSection].[Id],
		[ProfileSection].[Name],
		[ProfileSection].[ShortName],
		[ProfileSection].[SectionNumber],
		[ProfileSection].[Note]
	FROM
		[ProfileSection]
	ORDER BY 
		[ProfileSection].[SectionNumber] 
	
	--ProfileQuestion
	SELECT
		[ProfileQuestion].[ProfileSectionId],
		[ProfileQuestion].[Id],
		[ProfileQuestion].[ShortName],
		[ProfileQuestion].[QuestionNumber],
		[ProfileQuestion].[IsPerSpecies],
		[ProfileQuestion].[IsRepeating],		
		[ProfileQuestion].[IrrelevanceFieldId],
		[ProfileQuestion].[IrrelevanceValueId],
		[ProfileQuestion].[IrrelevanceFlag]
	FROM
		[ProfileQuestion] 
		INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]	
	ORDER BY
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber]

	--ProfileField
	SELECT
		[ProfileQuestion].[ProfileSectionId],
		[ProfileQuestion].[Id],
		[ProfileField].[Id],
		[ProfileField].[ShortName],
		[ProfileField].[FieldNumber],
		[ProfileField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[ProfileField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable],
		CAST(CASE WHEN tmpIrrelevance.[IrrelevanceFieldId] IS NULL THEN 0 ELSE 1 END AS bit) AS [AffectsRelevancy],
		[ProfileField].[Name],
		[ProfileField].[IsReadOnlyCurrentSituation] AS [IsReadOnlyCurrentSituation],		
		[ProfileField].[IsReadOnlyScenario] AS [IsReadOnlyScenario],		
		[ProfileQuestion].[IsPerSpecies],
		[ProfileQuestion].[IsRepeating],
		[ProfileField].[IncludeInSummary],
		[ProfileField].[EditorFieldType],
		[ProfileField].[RelevanceFieldId],
		[ProfileField].[RelevanceValueId],
		CAST(CASE WHEN tmpVisivility.[RelevanceFieldId] IS NULL THEN 0 ELSE 1 END AS bit) AS [AffectsVisibility],
		CAST(CASE WHEN tmpReplication.[SourceFieldId] IS NULL THEN 0 ELSE 1 END AS bit) AS [SourceOfDataReplication]
	FROM
		[ProfileField] INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]
		INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
		INNER JOIN [ProfileSection] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]
		LEFT JOIN [ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
		LEFT JOIN
			(
			SELECT
				[IrrelevanceFieldId]
			FROM
				[ProfileQuestion]
			GROUP BY
				[IrrelevanceFieldId]
			) tmpIrrelevance ON [ProfileField].[Id] = tmpIrrelevance.[IrrelevanceFieldId]
		LEFT JOIN
			(
			SELECT
				[RelevanceFieldId]
			FROM
				[ProfileField]
			GROUP BY
				[RelevanceFieldId]
			) tmpVisivility ON [ProfileField].[Id] = tmpVisivility.[RelevanceFieldId]
		LEFT JOIN
			(
			SELECT
				[SourceFieldId]
			FROM
				[ProfileFieldDataReplication]
			GROUP BY
				[SourceFieldId]
			) tmpReplication ON [ProfileField].[Id] = tmpReplication.[SourceFieldId]
	ORDER BY
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber],
		[ProfileField].[FieldNumber]

	--Profile Field Metadata of the field group fields
	SELECT 
		tmpFieldGroups.[ProfileSectionId],
		tmpFieldGroups.[ProfileQuestionId],
		[ProfileField].[Id],
		[ProfileField].[ShortName],
		[ProfileField].[FieldNumber],
		[ProfileField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[ProfileField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable],
		CAST(0 AS bit) AS [AffectsRelevancy],
		[ProfileField].[Name],
		[ProfileField].[IsReadOnlyCurrentSituation] AS [IsReadOnlyCurrentSituation],		
		[ProfileField].[IsReadOnlyScenario] AS [IsReadOnlyScenario],		
		tmpFieldGroups.[IsPerSpecies],
		tmpFieldGroups.[IsRepeating],
		[ProfileField].[IncludeInSummary],
		tmpFieldGroups.[Id] As [ProfileFieldGroupId],
		[ProfileField].[RelevanceFieldId],
		[ProfileField].[RelevanceValueId],
		CAST(0 AS bit) AS [AffectsVisibility],
		CAST(0 AS bit) AS [SourceOfDataReplication]
	FROM
		[ProfileField] INNER JOIN
		(		
		SELECT  -- returns all the field groups
			[ProfileField].[Id],
			[ProfileField].[ProfileQuestionId],
			[ProfileQuestion].[QuestionNumber],
			[ProfileQuestion].[IsPerSpecies],
			[ProfileQuestion].[IsRepeating],
			[ProfileQuestion].[ProfileSectionId]
		FROM 
			[ProfileField] INNER JOIN
			[luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id] INNER JOIN
			[ProfileQuestion] ON [ProfileQuestion].[Id] = [ProfileField].[ProfileQuestionId]
		WHERE	
			[luDataFieldType].[Name] = 'Field Group'
		) tmpFieldGroups ON [ProfileField].[ProfileFieldGroupId] = tmpFieldGroups.[Id] INNER JOIN 
		[luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id] LEFT JOIN 
		[ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
	ORDER BY
		tmpFieldGroups.[QuestionNumber],
		[ProfileField].[FieldNumber]
	
	--Question numbers made irrelevant by profile field change
	SELECT
		[ProfileField].[Id],
		CAST([ProfileSection].[SectionNumber] AS VARCHAR)+'.'+CAST([ProfileQuestion].[QuestionNumber] AS VARCHAR)
	FROM
		[ProfileField]
		INNER JOIN [ProfileQuestion] ON [ProfileQuestion].[IrrelevanceFieldId]=[ProfileField].[Id]
		INNER JOIN [ProfileSection] ON [ProfileSection].[Id]=[ProfileQuestion].[ProfileSectionId]
	ORDER BY
		[ProfileField].[Id],
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber]
	
	-- FIELDS set to auto replicate their contents to other fields
	SELECT	DISTINCT
			[SourceFieldId],
			[TargetFieldId]
	FROM [dbo].[ProfileFieldDataReplication]

END