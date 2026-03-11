--------------------------------------------------------------------------------------------------------
--- spuSpeciesPrioritisationCriterionValue.SQL
--------------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesPrioritisationCriterionValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesPrioritisationCriterionValue]
GO

CREATE PROCEDURE [dbo].[spuSpeciesPrioritisationCriterionValue]
	@Id uniqueidentifier,
	@Score int
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE 
		[dbo].[SpeciesPrioritisationCriterionValue]
	SET 
		[SpeciesPrioritisationCriterionValue].[Score]=@Score
	WHERE 
		[SpeciesPrioritisationCriterionValue].[Id]=@Id


END

GO
GRANT EXEC ON spuSpeciesPrioritisationCriterionValue TO [VLAProfilesUser]
GO


