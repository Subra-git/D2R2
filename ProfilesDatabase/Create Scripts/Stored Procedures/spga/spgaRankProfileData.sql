-----------------------------------------------------------------------------------------
--- spgaRankProfileData.SQL
----------------------------------------------------------------------------------------- 

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaRankProfileData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaRankProfileData]
GO

CREATE PROCEDURE [dbo].[spgaRankProfileData]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		[Profile].[Id] AS ProfileId,
		[Species].[Id] AS SpeciesId,
		[PrioritisationCategory].[Name], 		
		[PrioritisationScore].[Rank],		
		[ProfileVersionFieldValue].[BooleanValue] AS IsEndemic,
		[Profile].[Title], 
		[Species].[Name],
		[luProfileVersionState].[Name] AS ProfileVersionState, 
		[luProfileStatusType].[IsValidationComplete] 
	FROM 
		[PrioritisationScore] INNER JOIN 
		[ProfileVersion] ON [PrioritisationScore].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId] INNER JOIN
		[Species] ON [Species].[Id] = [PrioritisationScore].[SpeciesId] INNER JOIN
		[PrioritisationCategory] ON [PrioritisationCategory].[Id] = [PrioritisationScore].[PrioritisationCategoryId] INNER JOIN
		[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN 
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] LEFT JOIN
		[luProfileStatusType] ON [Profile].[ProfileStatusId] = [luProfileStatusType].[Id]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		
		[Profile].[ParentId] IS NULL AND
		[ProfileVersionFieldValue].[ProfileFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A' AND
		[PrioritisationScore].[Rank] <> 0	
	ORDER BY 
		[Profile].[Id],
		[ProfileVersion].[VersionMinor]	
	
END

GO
GRANT EXECUTE ON [dbo].[spgaRankProfileData] TO [VLAProfilesUser] 
GO
