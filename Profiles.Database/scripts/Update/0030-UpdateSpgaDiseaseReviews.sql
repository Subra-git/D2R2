/****** Object:  StoredProcedure [dbo].[spgaDiseaseReviews]    Script Date: 22/08/2016 13:52:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spgaDiseaseReviews]

	@FromDate AS DATE,
	@ToDate AS DATE,
	@ProfileSelected AS INT,
	@UserId AS UNIQUEIDENTIFIER

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @ProfileVersionStateIdDraft AS UNIQUEIDENTIFIER
	DECLARE @ProfileVersionStateIdPublished AS UNIQUEIDENTIFIER

	DECLARE @ProfileSelectedAll AS INT
	DECLARE @ProfileSelectedPublished AS INT
	DECLARE @ProfileSelectedDraft AS INT

	SET @ProfileVersionStateIdDraft = 'FBDAF26D-F94F-467D-B524-E2D4B64F2AA0'
	SET @ProfileVersionStateIdPublished = '87E8CF8E-5769-4953-8F4F-01291AC6607C'

	SET @ProfileSelectedAll = 0
	SET @ProfileSelectedPublished = 1
	SET @ProfileSelectedDraft = 2

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
		AND (@ProfileSelected = @ProfileSelectedPublished AND ProfileVersion.ProfileVersionStateId = @ProfileVersionStateIdPublished 
			OR @ProfileSelected = @ProfileSelectedDraft AND ProfileVersion.ProfileVersionStateId = @ProfileVersionStateIdDraft
			OR @ProfileSelected = @ProfileSelectedAll) 
	ORDER BY ProfileVersion.ProfileId, ProfileSection.SectionNumber

END
GO


