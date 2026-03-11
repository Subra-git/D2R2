/****** Object:  StoredProcedure [dbo].[spgaDiseaseReviews]    Script Date: 22/08/2016 14:34:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spgaDiseaseReviews]

	@FromDate AS DATE,
	@ToDate AS DATE,
	@UserId AS UNIQUEIDENTIFIER

AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		[ProfileVersion].[Id] As ProfileVersionId,
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[ProfileSection].[SectionNumber],
		[ProfileVersionSection].[NextPolicyReview],
		[ProfileVersionSection].[NextAuthorReview],
		[ProfileVersionSection].[NextTechnicalReview],
		[ProfileSection].[Name] AS 'SectionName'
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
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[User].[EmailAddress] IS NOT NULL AND
		[User].[SubscribedToReviewEmails] = 1 
		AND [User].Id = @UserId
	    AND	
	    (	
			(
				techStatus.[Name] <> 'Complete' AND 
				NextTechnicalReview BETWEEN @FromDate AND @ToDate
			)				
			OR    
			(				
				policyStatus.[Name] <> 'Complete' AND 
				NextPolicyReview BETWEEN @FromDate AND @ToDate
			)
			OR
			(
				authorStatus.[Name] <> 'Complete' AND
				NextAuthorReview BETWEEN @FromDate AND @ToDate
			)		
		)	
	ORDER BY ProfileVersion.ProfileId, ProfileSection.SectionNumber

END
GO


