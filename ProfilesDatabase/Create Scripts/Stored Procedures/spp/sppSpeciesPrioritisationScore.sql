-------------------------------------------------------------------------------------------------------
--- sppSpeciesPrioritisationScore.SQL
-------------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppSpeciesPrioritisationScore]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppSpeciesPrioritisationScore]
GO

CREATE PROCEDURE [dbo].[sppSpeciesPrioritisationScore]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE FROM [SpeciesPrioritisationScore]

	INSERT INTO [SpeciesPrioritisationScore] 
		(
		[SpeciesId], 
		[SpeciesPrioritisationCategoryId], 
		[Score]
		)
	SELECT
		[Species].[Id],
		[SpeciesPrioritisationCategory].[Id],
		ISNULL([Score], 0)
	FROM
		[Species] CROSS JOIN [SpeciesPrioritisationCategory] LEFT JOIN
		(
			SELECT
				[SpeciesFieldValue].[SpeciesId],
				[SpeciesPrioritisationCriterion].[SpeciesPrioritisationCategoryId],
				SUM([SpeciesPrioritisationCriterionValue].[Score]) AS [Score]
			FROM
				[SpeciesPrioritisationCriterion] INNER JOIN [SpeciesFieldValue] ON [SpeciesPrioritisationCriterion].[SpeciesFieldId] = [SpeciesFieldValue].[SpeciesFieldId]
				INNER JOIN [SpeciesPrioritisationCriterionValue] ON ([SpeciesPrioritisationCriterion].[Id] = [SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId] AND [SpeciesFieldValue].[ListValue] = [SpeciesPrioritisationCriterionValue].[ReferenceValueId])
			GROUP BY
				[SpeciesFieldValue].[SpeciesId],
				[SpeciesPrioritisationCriterion].[SpeciesPrioritisationCategoryId]
		) tmpScore ON [Species].[Id] = tmpScore.[SpeciesId] AND [SpeciesPrioritisationCategory].[Id] = tmpScore.[SpeciesPrioritisationCategoryId]

END

GO
GRANT EXECUTE ON [dbo].[sppSpeciesPrioritisationScore] TO [VLAProfilesUser] 
GO
