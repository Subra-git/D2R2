IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'spgaDiseaseReviews')
BEGIN
	DROP PROCEDURE [dbo].[spgaDiseaseReviews]
END
GO

CREATE PROCEDURE [dbo].[spgaDiseaseReviews]

	@FromDate AS NVARCHAR(100),
	@ToDate AS NVARCHAR(100),
	@ProfileSelected AS INT

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @fromdatevalue DATETIME
	DECLARE @todatevalue DATETIME
	DECLARE @GetProfileSelectedFirst AS UNIQUEIDENTIFIER
	DECLARE @GetProfileSelectedSecond AS UNIQUEIDENTIFIER

	SET @fromdatevalue = CONVERT(DATETIME,@FromDate,105)
	SET @todatevalue = CONVERT(DATETIME,@ToDate,105)
	
	IF @ProfileSelected = 0

		BEGIN			

			SET @GetProfileSelectedFirst  = (SELECT ID FROM (SELECT ID, ROW_NUMBER() OVER(ORDER BY ID DESC) AS Row FROM (SELECT Id FROM luProfileVersionState) as t) as q Where q.Row = 2)
			SET @GetProfileSelectedSecond = (SELECT TOP 1 Id FROM luProfileVersionState ORDER BY 1 DESC) 

			SELECT ProfileVersionId, Name, CONVERT(VARCHAR, PolicayReviewDate, 106) as PolicayReviewDate, CONVERT(VARCHAR, NextAuthorReview, 106) as NextAuthorReview, CONVERT(VARCHAR, TechnicalReviewDate, 106) as TechnicalReviewDate, (Title + '  v' + CONVERT(nvarchar(20), VersionMajor) + '.' + CONVERT(nvarchar(20), VersionMinor)) as Title FROM (
			SELECT ProfileVersionId, SectionNumber, Name, NextPolicyReview AS PolicayReviewDate, NextAuthorReview AS NextAuthorReview, NextTechnicalReview AS TechnicalReviewDate	
			FROM ProfileVersionSection INNER JOIN ProfileSection on ProfileVersionSection.ProfileSectionId = ProfileSection.Id) as r, 
			(SELECT * from (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Id, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Id, Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedFirst OR ProfileVersionStateId = @GetProfileSelectedSecond) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS y Where y.RNmb IN (
					SELECT MAX(RNmb) AS RowNumber FROM (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedFirst OR ProfileVersionStateId = @GetProfileSelectedSecond) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS h GROUP BY Title, VersionMajor)) as h
			Where r.ProfileVersionId = h.Id
			AND (r.NextAuthorReview >= CONVERT(DATETIME,@fromdatevalue,105) 
			AND r.TechnicalReviewDate >= CONVERT(DATETIME,@fromdatevalue,105)
			AND r.PolicayReviewDate >= CONVERT(DATETIME,@fromdatevalue,105))
			AND (r.NextAuthorReview <= CONVERT(DATETIME,@todatevalue,105) 
			AND r.TechnicalReviewDate <= CONVERT(DATETIME,@todatevalue,105)
			AND r.PolicayReviewDate <= CONVERT(DATETIME,@todatevalue,105))
			ORDER BY h.Title, r.SectionNumber, Name DESC

		END

	IF @ProfileSelected = 1

		BEGIN					

			SET @GetProfileSelectedFirst  = (SELECT ID FROM (SELECT ID, ROW_NUMBER() OVER(ORDER BY ID DESC) AS Row FROM (SELECT Id FROM luProfileVersionState) as t) as q Where q.Row = 2)

			SELECT ProfileVersionId, Name, CONVERT(VARCHAR, PolicayReviewDate, 106) as PolicayReviewDate, CONVERT(VARCHAR, NextAuthorReview, 106) as NextAuthorReview, CONVERT(VARCHAR, TechnicalReviewDate, 106) as TechnicalReviewDate, (Title + '  v' + CONVERT(nvarchar(20), VersionMajor) + '.' + CONVERT(nvarchar(20), VersionMinor)) as Title FROM (
			SELECT ProfileVersionId, SectionNumber, Name, NextPolicyReview AS PolicayReviewDate, NextAuthorReview AS NextAuthorReview, NextTechnicalReview AS TechnicalReviewDate	
			FROM ProfileVersionSection INNER JOIN ProfileSection on ProfileVersionSection.ProfileSectionId = ProfileSection.Id) as r, 
			(SELECT * from (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Id, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Id, Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedFirst) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS y Where y.RNmb IN (
					SELECT MAX(RNmb) AS RowNumber FROM (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedFirst) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS h GROUP BY Title, VersionMajor)) as h
			Where r.ProfileVersionId = h.Id
			AND (r.NextAuthorReview >= CONVERT(DATETIME,@fromdatevalue,105) 
			AND r.TechnicalReviewDate >= CONVERT(DATETIME,@fromdatevalue,105)
			AND r.PolicayReviewDate >= CONVERT(DATETIME,@fromdatevalue,105))
			AND (r.NextAuthorReview <= CONVERT(DATETIME,@todatevalue,105) 
			AND r.TechnicalReviewDate <= CONVERT(DATETIME,@todatevalue,105)
			AND r.PolicayReviewDate <= CONVERT(DATETIME,@todatevalue,105))
			ORDER BY h.Title, r.SectionNumber, Name DESC

		END 


	IF @ProfileSelected = 2

		BEGIN					

			SET @GetProfileSelectedSecond = (SELECT TOP 1 Id FROM luProfileVersionState ORDER BY 1 DESC) 

			SELECT ProfileVersionId, Name, CONVERT(VARCHAR, PolicayReviewDate, 106) as PolicayReviewDate, CONVERT(VARCHAR, NextAuthorReview, 106) as NextAuthorReview, CONVERT(VARCHAR, TechnicalReviewDate, 106) as TechnicalReviewDate, (Title + '  v' + CONVERT(nvarchar(20), VersionMajor) + '.' + CONVERT(nvarchar(20), VersionMinor)) as Title FROM (
			SELECT ProfileVersionId, SectionNumber, Name, NextPolicyReview AS PolicayReviewDate, NextAuthorReview AS NextAuthorReview, NextTechnicalReview AS TechnicalReviewDate	
			FROM ProfileVersionSection INNER JOIN ProfileSection on ProfileVersionSection.ProfileSectionId = ProfileSection.Id) as r, 
			(SELECT * from (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Id, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Id, Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedSecond) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS y Where y.RNmb IN (
					SELECT MAX(RNmb) AS RowNumber FROM (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) AS RNmb, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = @GetProfileSelectedSecond) AS t,
					(SELECT Title, MAX(VersionMajor) AS VersionMj FROM ProfileVersion GROUP BY Title) AS y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) AS h GROUP BY Title, VersionMajor)) as h
			Where r.ProfileVersionId = h.Id 
			AND (r.NextAuthorReview >= CONVERT(DATETIME,@fromdatevalue,105) 
			AND r.TechnicalReviewDate >= CONVERT(DATETIME,@fromdatevalue,105)
			AND r.PolicayReviewDate >= CONVERT(DATETIME,@fromdatevalue,105))
			AND (r.NextAuthorReview <= CONVERT(DATETIME,@todatevalue,105) 
			AND r.TechnicalReviewDate <= CONVERT(DATETIME,@todatevalue,105)
			AND r.PolicayReviewDate <= CONVERT(DATETIME,@todatevalue,105))
			ORDER BY h.Title, r.SectionNumber, Name DESC

		END
	
END