----------------------------------------------------------------------------------------------------
--- spgaReviewEmail.SQL
----------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaReviewEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaReviewEmail]
GO

CREATE PROCEDURE [dbo].[spgaReviewEmail]

AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT DISTINCT 
		[User].[Id],
		[User].[UserName],
		[User].[EmailAddress],
		[User].[FullName]		
	FROM 
		[User] INNER JOIN 
		[ProfileSectionUser] ON [ProfileSectionUser].[UserId] = [User].[Id] INNER JOIN 
		[Profile] ON [ProfileSectionUser].[ProfileId] = [Profile].[Id] INNER JOIN 
		[ProfileVersion] ON [Profile].[Id] = [ProfileVersion].[ProfileId] INNER JOIN
		[luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] INNER JOIN
		[ProfileVersionSection] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] LEFT JOIN		
		[luReviewStatus] techStatus ON techStatus.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId] 
	WHERE 
		(
			[luProfileVersionState].[Name] = 'Draft' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[ProfileSectionUser].[ReviewEmail] = 1
		)
	    AND	
	    (	
		(
			techStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextTechnicalReview] <= DATEADD(WK,2,GETDATE())
		)				
		OR    
		(				
			policyStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextPolicyReview] <= DATEADD(WK,2,GETDATE())
		)		
		OR
		(
			 techStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[TechnicalReviewCompleted] >= DATEADD(WK,-2,GETDATE())
		)
		OR
		(
			 policyStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[PolicyReviewCompleted] >= DATEADD(WK, -2, GETDATE())
		)
		)			

				
	--ProfileInfos
	SELECT DISTINCT
		psu.UserId,
		[ProfileVersion].[Id] As ProfileVersionId,
		[ProfileVersion].[Title] AS ProfileTitle,
		[ProfileVersion].[ScenarioTitle],
		[ProfileVersion].[VersionMinor],
		[ProfileVersion].[VersionMajor]		
	FROM 
		[ProfileVersion] INNER JOIN
		[luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] INNER JOIN
		[ProfileVersionSection] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[ProfileSectionUser] psu ON psu.[ProfileId] = [ProfileVersion].[ProfileId] AND
		psu.[ProfileSectionId] = [ProfileVersionSection].[ProfileSectionId] LEFT JOIN
		[luReviewStatus] techStatus ON techStatus.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId]		
	WHERE 
		(
			[luProfileVersionState].[Name] = 'Draft' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			psu.[ReviewEmail] = 1
		)
	    AND	
	    (	
		(
			techStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextTechnicalReview] <= DATEADD(WK,2,GETDATE())
		)				
		OR    
		(				
			policyStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextPolicyReview] <= DATEADD(WK,2,GETDATE())
		)		
		OR
		(
			 techStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[TechnicalReviewCompleted] >= DATEADD(WK,-2,GETDATE())
		)
		OR
		(
			 policyStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[PolicyReviewCompleted] >= DATEADD(WK, -2, GETDATE())
		)
		)			
		
		
	--ProfileSectionInfos
	SELECT 
		psu.UserId,
		[ProfileVersion].[Id] As ProfileVersionId,	
		[ProfileSection].[Id] AS ProfileSectionId,
		[ProfileSection].[ShortName],
		[ProfileSection].[SectionNumber],
		[techStatus].[Name] as TechnicalReviewStatus,
		[PolicyStatus].[Name] as PolicyReviewStatus,
		[ProfileVersionSection].[NextTechnicalReview],
		[ProfileVersionSection].[NextPolicyReview],
		[ProfileVersionSection].[TechnicalReviewCompleted],
		[ProfileVersionSection].[PolicyReviewCompleted]
	FROM 
		[ProfileVersion] INNER JOIN
		[luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] INNER JOIN
		[ProfileVersionSection] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[ProfileSection] ON [ProfileVersionSection].[ProfileSectionId] = [ProfileSection].[Id] INNER JOIN
		[ProfileSectionUser] psu ON psu.[ProfileId] = [ProfileVersion].[ProfileId] AND
		psu.[ProfileSectionId] = [ProfileVersionSection].[ProfileSectionId] LEFT JOIN
		[luReviewStatus] techStatus ON techStatus.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId] 
	WHERE 
		(
			[luProfileVersionState].[Name] = 'Draft' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			psu.[ReviewEmail] = 1
		)
	    AND	
	    (	
		(
			techStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextTechnicalReview] <= DATEADD(WK,2,GETDATE())
		)				
		OR    
		(				
			policyStatus.[Name] <> 'Complete' AND 
			[ProfileVersionSection].[NextPolicyReview] <= DATEADD(WK,2,GETDATE())
		)		
		OR
		(
			 techStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[TechnicalReviewCompleted] >= DATEADD(WK,-2,GETDATE())
		)
		OR
		(
			 policyStatus.[Name] = 'Complete' AND
			 [ProfileVersionSection].[PolicyReviewCompleted] >= DATEADD(WK, -2, GETDATE())
		)
		)				
		ORDER BY ProfileVersionId, SectionNumber
		
		
END

GO
GRANT EXECUTE ON [dbo].[spgaReviewEmail] TO [VLAProfilesUser]
GO
