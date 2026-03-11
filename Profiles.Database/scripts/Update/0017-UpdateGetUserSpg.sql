/****** Object:  StoredProcedure [dbo].[spgUser]    Script Date: 16/06/2016 12:33:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


ALTER PROCEDURE [dbo].[spgUser]
	@UserId uniqueidentifier
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
		[SsoUserId],
		[LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId
END


GO


