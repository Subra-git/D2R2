
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE OR ALTER FUNCTION [dbo].[udf_StripHTMLTags]
(
	@InputString varchar(max)
)
RETURNS varchar(max)
AS
BEGIN

	SELECT @InputString = REPLACE(REPLACE(@InputString,'<em>',''),'</em>','')
	SELECT @InputString = REPLACE(REPLACE(@InputString,'<i>',''),'</i>','')
	SELECT @InputString = REPLACE(REPLACE(@InputString,'<p>',''),'</p>','')
	SELECT @InputString = REPLACE(REPLACE(@InputString,'<ul>',''),'</ul>','')
	SELECT @InputString = REPLACE(REPLACE(@InputString,'<li>',''),'</li>','')
	SELECT @InputString = REPLACE(REPLACE(REPLACE(@InputString,'<br>',''),'<br/>',''),'<br />','')

	RETURN @InputString

END

GO


/****** Object:  StoredProcedure [dbo].[spgaProfile]    Script Date: 2/13/2024 11:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spgaProfile]
	@UserId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 

      SELECT
		[Profile].[Id],
		[Profile].[Title]
	FROM
		[Profile]
	WHERE
		[Profile].[ParentId] IS NULL
	ORDER BY
		dbo.udf_StripHTMLTags([Profile].[Title])

	SELECT
		[Profile].[Id] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		ISNULL([Profile].[ScenarioTitle], 'Current situation') AS [ScenarioTitle],		
		[luProfileUserRole].[Name] AS [UserRole],
		[luProfileStatusType].[Name] AS [ProfileStatus]
	FROM
		[Profile] LEFT JOIN [ProfileUser] ON ([Profile].[Id] = [ProfileUser].[ProfileId] AND [ProfileUser].[UserId] = @UserId)
		LEFT JOIN [luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id] 
		LEFT JOIN [luProfileStatusType] ON [Profile].[ProfileStatusId] = [luProfileStatusType].[Id]
	ORDER BY
		dbo.udf_StripHTMLTags([Profile].[ScenarioTitle])		

	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		[ProfileVersion].[IsPublic]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
	ORDER BY
		[ProfileVersion].[VersionMajor] DESC,
		[ProfileVersion].[VersionMinor] DESC

	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[Species].[Name],
		[Species].[Id],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [Species].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersion] INNER JOIN [ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId]
		INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
	ORDER BY
		dbo.udf_StripHTMLTags([Species].[Name])
	
	-- Technical Review	
	SELECT 
		[ProfileVersionId],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[Title],
		MIN([NextTechnicalReview])		
	FROM 
		[ProfileVersionSection] INNER JOIN 	
		[ProfileVersion] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id] LEFT JOIN
		[luReviewStatus] tS ON tS.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId]		
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = 'Draft' AND	
		((tS.Name <> 'Complete')
		OR (tS.Name IS NULL))	
	GROUP BY
		[ProfileVersionId], 
		[ProfileVersion].[ProfileId], 
		ISNULL([Profile].[ParentId], [Profile].[Id]),
		[ProfileVersion].[Title]
	HAVING
		MIN([NextTechnicalReview]) IS NOT NULL
		
	-- Policy Review
	SELECT 
		[ProfileVersionId],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[Title],
		MIN([NextPolicyReview])		
	FROM 
		[ProfileVersionSection] INNER JOIN 	
		[ProfileVersion] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId]						
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = 'Draft' AND
		((policyStatus.Name <> 'Complete') OR
		(policyStatus.Name IS NULL))
	GROUP BY
		[ProfileVersionId], 
		[ProfileVersion].[ProfileId], 
		ISNULL([Profile].[ParentId], [Profile].[Id]),
		[ProfileVersion].[Title]
	HAVING
		MIN([NextPolicyReview]) IS NOT NULL
	
	SELECT 
		[ProfileVersionId],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[Title]
	FROM 
		[ProfileVersionSection] INNER JOIN 	
		[ProfileVersion] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id] LEFT JOIN
		[luReviewStatus] techStatus ON techStatus.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId]		
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = 'Draft' AND
		((
		techStatus.Name <> 'Complete'		
		)
		OR
		(
		techStatus.Name IS NULL
		))
		AND
		(
		[ProfileVersionSection].[NextTechnicalReview] is null AND
		[ProfileVersionSection].[NextPolicyReview] is null
		)	
	
	SELECT 
		[ProfileVersionId],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[Title]
	FROM 
		[ProfileVersionSection] INNER JOIN 	
		[ProfileVersion] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId]		
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = 'Draft' AND
		((
		policyStatus.Name <> 'Complete'		
		)
		OR
		(
		policyStatus.Name IS NULL
		))
		AND
		(
		[ProfileVersionSection].[NextPolicyReview] is null AND
		[ProfileVersionSection].[NextTechnicalReview] is null
		)		
	END

GO