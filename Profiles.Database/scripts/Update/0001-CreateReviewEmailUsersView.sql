IF EXISTS (SELECT * FROM sys.views WHERE name = 'vwReviewEmailUsers')
BEGIN
	DROP VIEW [dbo].[vwReviewEmailUsers]
END
GO

CREATE VIEW [dbo].[vwReviewEmailUsers]
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
			[ProfileSectionUser].[ReviewEmail] = 1 AND
			[User].[EmailAddress] IS NOT NULL
		)
	    AND	
	    (	
			(
				techStatus.[Name] <> 'Complete' AND 
				[ProfileVersionSection].[NextTechnicalReview] <= DATEADD(M,6,GETDATE())
			)				
			OR    
			(				
				policyStatus.[Name] <> 'Complete' AND 
				[ProfileVersionSection].[NextPolicyReview] <= DATEADD(M,6,GETDATE())
			)
			OR
			(
				authorStatus.[Name] <> 'Complete' AND
				[ProfileVersionSection].[NextAuthorReview] <= DATEADD(M,6,GETDATE())
			)		
		)			


