/****** Object:  View [dbo].[vwReviewEmailProfileSections]    Script Date: 08/03/2016 12:02:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vwReviewEmailProfileSections]
AS
	SELECT 
		psu.UserId,
		[ProfileVersion].[Id] As ProfileVersionId,	
		[ProfileSection].[Id] AS ProfileSectionId,
		[ProfileSection].[ShortName],
		[ProfileSection].[SectionNumber],
		[techStatus].[Name] as TechnicalReviewStatus,
		[policyStatus].[Name] as PolicyReviewStatus,
		[authorStatus].[Name] as AuthorReviewStatus,
		[ProfileVersionSection].[NextTechnicalReview],
		[ProfileVersionSection].[NextPolicyReview],
		[ProfileVersionSection].[NextAuthorReview],
		[ProfileVersionSection].[TechnicalReviewCompleted],
		[ProfileVersionSection].[PolicyReviewCompleted],
		[ProfileVersionSection].[AuthorReviewCompleted],
		[ProfileVersion].[Title]
	FROM 
		[ProfileVersion] INNER JOIN
		[luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] INNER JOIN
		[ProfileVersionSection] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[ProfileSection] ON [ProfileVersionSection].[ProfileSectionId] = [ProfileSection].[Id] INNER JOIN
		[ProfileSectionUser] psu ON psu.[ProfileId] = [ProfileVersion].[ProfileId] AND
		psu.[ProfileSectionId] = [ProfileVersionSection].[ProfileSectionId] LEFT JOIN
		[luReviewStatus] techStatus ON techStatus.[Id] = [ProfileVersionSection].[TechnicalReviewStatusId] LEFT JOIN
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId] LEFT JOIN
		[luReviewStatus] authorStatus ON authorStatus.[Id] = [ProfileVersionSection].[AuthorReviewStatusId] INNER JOIN 
		[User] ON psu.[UserId] = [User].[Id] 
	WHERE 
		(
			[luProfileVersionState].[Name] = 'Draft' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			psu.[ReviewEmail] = 1 AND
			[User].[EmailAddress] IS NOT NULL
		)
	    AND	
	    (	
			(
				techStatus.[Name] <> 'Complete' AND 
				DATEADD(W,2,GETDATE()) > [ProfileVersionSection].[NextTechnicalReview]
			)				
			OR    
			(				
				policyStatus.[Name] <> 'Complete' AND 
				DATEADD(W,2,GETDATE()) > [ProfileVersionSection].[NextPolicyReview]
			)
			OR
			(
				authorStatus.[Name] <> 'Complete' AND
				DATEADD(W,2,GETDATE()) > [ProfileVersionSection].[NextAuthorReview]
			)		
		)		
GO


