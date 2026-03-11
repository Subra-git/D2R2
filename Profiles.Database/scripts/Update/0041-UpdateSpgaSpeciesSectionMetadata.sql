
ALTER PROCEDURE [dbo].[spgaSpeciesSectionMetadata] 
AS
BEGIN

	--SpeciesSection
    SELECT
		[SpeciesSection].[Id],
		[SpeciesSection].[Name],
		[SpeciesSection].[ShortName],
		[SpeciesSection].[SectionNumber]
	FROM
		[SpeciesSection] 
	ORDER BY
		[SpeciesSection].[SectionNumber]
	
	--SpeciesQuestion
	SELECT
		[SpeciesQuestion].[SpeciesSectionId],
		[SpeciesQuestion].[Id],
		[SpeciesQuestion].[Name],
		[SpeciesQuestion].[QuestionNumber],
		[SpeciesQuestion].[ShortName]
	FROM
		[SpeciesQuestion] INNER JOIN 
		[SpeciesSection] ON [SpeciesQuestion].[SpeciesSectionId] = [SpeciesSection].[Id]
	ORDER BY
		[SpeciesSection].[SectionNumber], [SpeciesQuestion].[QuestionNumber]

	--SpeciesField
	SELECT
		[SpeciesQuestion].[SpeciesSectionId],
		[SpeciesQuestion].[Id],
		[SpeciesField].[Id],
		[SpeciesField].[Name], 
		[SpeciesField].[ShortName],
		[SpeciesField].[FieldNumber],
		[SpeciesField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[SpeciesField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable],
		[SpeciesField].[EditorFieldType]
	FROM
		[SpeciesField] INNER JOIN [luDataFieldType] ON [SpeciesField].[DataFieldTypeId] = [luDataFieldType].[Id]
		INNER JOIN [SpeciesQuestion] ON [SpeciesField].[SpeciesQuestionId] = [SpeciesQuestion].[Id]
		LEFT JOIN [ReferenceTable] ON [SpeciesField].[ReferenceTableId] = [ReferenceTable].[Id] 
		INNER JOIN [SpeciesSection] ON [SpeciesSection].[Id] = [SpeciesQuestion].[SpeciesSectionId]
	ORDER BY
		[SpeciesSection].[SectionNumber],
		[SpeciesQuestion].[QuestionNumber],
		[SpeciesField].[FieldNumber]

END
