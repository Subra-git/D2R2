---------------------------------------------------------------------------------------------------------
--- spgaSpeciesPrioritisationVariables.SQL
---------------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesPrioritisationVariables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpeciesPrioritisationVariables]
GO

CREATE PROCEDURE [dbo].[spgaSpeciesPrioritisationVariables] 

AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[LastUpdated]
	FROM
		[dbo].[PrioritisationRankingRange]
	WHERE
		[PrioritisationType]='Species'

	--Get Prioritisation Categories
	SELECT
		[Id],
		[Name]
	FROM
		[dbo].[SpeciesPrioritisationCategory]
	ORDER BY
		[SequenceNumber]

	--Get Prioritisation Criteria
	SELECT
		[Id],
		[SpeciesPrioritisationCategoryId],
		[SpeciesFieldId],
		[Name]
		
	FROM
		[dbo].[SpeciesPrioritisationCriterion]
	ORDER BY
		[SpeciesPrioritisationCategoryid],
		[SequenceNumber]

	--Get Prioritisation Criteria Values
	SELECT
		[SpeciesPrioritisationCriterionValue].[Id],
		[SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId],
		[ReferenceValue].[LookupValue],	
		[SpeciesPrioritisationCriterionValue].[Score]
	FROM
		[dbo].[SpeciesPrioritisationCriterionValue]
	JOIN
		[dbo].[ReferenceValue]
	ON
		[SpeciesPrioritisationCriterionValue].[ReferenceValueId]=[ReferenceValue].[Id]
	ORDER BY
		[SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId],
		[ReferenceValue].[SequenceNumber]
		
END

GO
GRANT EXECUTE ON [dbo].[spgaSpeciesPrioritisationVariables] TO [VLAProfilesUser]
GO
 