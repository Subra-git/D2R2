SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


ALTER PROCEDURE [dbo].[spgaGlobalUser]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT
		[Id],
		[UserName],
		[FullName],
		[Organisation],
		[SubscribedToReviewEmails],
		[IsProfileEditor],
		[IsPolicyProfileUser],
		[LastUpdated]
	FROM
		[User]
	WHERE
		[IsProfileEditor] = 1 OR [IsPolicyProfileUser] = 1
	ORDER BY
		[FullName]
END


GO


