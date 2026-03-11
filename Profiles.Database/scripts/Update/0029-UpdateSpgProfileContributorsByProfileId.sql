/****** Object:  StoredProcedure [dbo].[spgProfileContributorsByProfileId]    Script Date: 22/08/2016 13:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


ALTER PROCEDURE [dbo].[spgProfileContributorsByProfileId] 
	@ProfileId uniqueidentifier
AS
BEGIN

SET NOCOUNT ON;

SELECT     
		[User].[Id], 
		[User].[UserName], 
		[User].[FullName], 
		[User].[Organisation], 
		[ProfileUser].[ProfileUserRoleId], 
		[luProfileUserRole].[Name], 
		[luProfileUserRole].[IsContributor],
		[User].[SsoUserId],
		[User].[LastUpdated]
FROM    
		[ProfileUser] INNER JOIN [User] ON [ProfileUser].[UserId] = [User].[Id] 
		INNER JOIN [luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id]
WHERE   
		[ProfileUser].[ProfileId] = @ProfileId


SELECT 
		[UserId],
		[ProfileSectionId]
FROM
		[ProfileSectionUser]
WHERE
		(
			[ProfileId] = @ProfileId
		)


END


GO


