/****** Object:  View [dbo].[vwReviewEmailUsers]    Script Date: 22/08/2016 13:09:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vwReviewEmailUsers]
AS
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
		[luReviewStatus] policyStatus ON policyStatus.[Id] = [ProfileVersionSection].[PolicyReviewStatusId] LEFT JOIN
		[luReviewStatus] authorStatus ON authorStatus.[Id] = [ProfileVersionSection].[AuthorReviewStatusId]
	WHERE 
		(
			[luProfileVersionState].[Name] = 'Draft' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[User].[EmailAddress] IS NOT NULL AND
			[User].[SubscribedToReviewEmails] = 1
		)
	    AND	
	    (	
			(
				techStatus.[Name] <> 'Complete' AND 
				DATEADD(WEEK,2,GETDATE()) > [ProfileVersionSection].[NextTechnicalReview]
			)				
			OR    
			(				
				policyStatus.[Name] <> 'Complete' AND 
				DATEADD(WEEK,2,GETDATE()) > [ProfileVersionSection].[NextPolicyReview]
			)
			OR
			(
				authorStatus.[Name] <> 'Complete' AND
				DATEADD(WEEK,2,GETDATE()) > [ProfileVersionSection].[NextAuthorReview]
			)		
		)				
GO


