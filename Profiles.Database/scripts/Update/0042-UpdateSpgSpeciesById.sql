/****** Object:  StoredProcedure [dbo].[spgSpeciesById]    Script Date: 1/29/2024 4:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[spgSpeciesById]
	@SpeciesId uniqueidentifier
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @ChildCount int, @ActiveChildCount int

    DECLARE @CurrentDate smalldatetime
    SET @CurrentDate = GetDate()

	-- Get child count
	SELECT
		@ChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId

	-- Get active child count
	SELECT
		@ActiveChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies INNER JOIN [Species] ON tmpChildSpecies.[Id] = [Species].[Id]
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId AND
		([Species].[EffectiveDateTo] IS NULL OR @CurrentDate BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo])

	SELECT     
		[Species].[Name], 
		[Species].[ParentId],
		CAST(CASE WHEN Species.[EffectiveDateTo] IS NULL THEN 1 WHEN @CurrentDate BETWEEN Species.[EffectiveDateFrom] AND Species.[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive],
		CAST(CASE WHEN [tmpProfileVersionSpecies].[SpeciesId]IS NULL AND [tmpPrioritisationScore].[SpeciesId] IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
		@ChildCount AS ChildCount,
		@ActiveChildCount AS ActiveChildCount,
		[Species].[LastUpdated],
		p.Name as ParentName
	FROM [dbo].[Species] LEFT JOIN 
		(	SELECT [SpeciesId] 
			FROM [ProfileVersionSpecies] 
			GROUP BY [SpeciesId]
		) AS tmpProfileVersionSpecies ON [tmpProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		LEFT JOIN
		(	SELECT [SpeciesId] 
			FROM [PrioritisationScore] 
			GROUP BY [SpeciesId]
		) AS tmpPrioritisationScore ON [tmpPrioritisationScore].[SpeciesId] = [Species].[Id]
		LEFT JOIN Species p
		ON Species.ParentId = p.Id

	WHERE     
		[Species].[Id] = @SpeciesId
		
END

