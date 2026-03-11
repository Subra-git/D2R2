
ALTER PROCEDURE [dbo].[spgProfileVersionInfoById]
	@Id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 
    
	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempVersion.VersionMinor THEN 1 ELSE 0 END AS bit) AS IsLatestVersion,
		[ProfileVersion].[ScenarioTitle],
		[Profile].[ParentId],
		[ProfileVersion].[IsPublic],
		[Profile].[ProfileStatusId],
		[luProfileStatusType].[Name]
	FROM
		[ProfileVersion] INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [EffectiveDateTo] IS NULL GROUP BY [ProfileId]
		) tempVersion ON [ProfileVersion].[ProfileId] = tempVersion.ProfileId
		INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
		LEFT JOIN [luProfileStatusType] ON [luProfileStatusType].[Id] = [Profile].[ProfileStatusId]	
	WHERE
		[ProfileVersion].[Id] = @Id

	SELECT
		[Species].[Id],
		[Species].[Name],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersionSpecies] INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersionSpecies].[ProfileVersionId] = @Id
	ORDER BY
		dbo.udf_StripHTMLTags([Species].[Name])
END

