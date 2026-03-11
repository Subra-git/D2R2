 ------------------------------------------------------------------------------------------------------
 --- spgaSsoUserMaintenance.SQL
 ------------------------------------------------------------------------------------------------------
 
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSsoUserMaintenance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSsoUserMaintenance]
GO

CREATE PROCEDURE [dbo].[spgaSsoUserMaintenance]
AS
BEGIN
	SET NOCOUNT ON;

	-- Sso Users
	SELECT
		[User].[Id],
		[User].[UserName],
		[User].[FullName],
		[User].[Organisation],
		[User].[LastUpdated]
	FROM 
		[User] 
	WHERE 
		[User].[SsoUserId] IS NOT NULL
	ORDER BY
		[User].[UserName]

	-- Profile Infos
	SELECT
		[Profile].[Id],
		CASE WHEN [Profile].[ParentId] IS NULL THEN [Profile].[Title] ELSE parentProfile.[Title] + ' (' + [Profile].[ScenarioTitle] + ')' END As Title
	FROM
		[Profile] LEFT JOIN
		[Profile] parentProfile ON [Profile].[ParentId] = parentProfile.[Id]
	ORDER BY
		[Title]
	
	-- Sso User Profiles
	SELECT 
		[ProfileUser].[UserId],
		[Profile].[Id] as ProfileId,
		CASE WHEN [Profile].[ParentId] IS NULL THEN [Profile].[Title] ELSE parentProfile.[Title] + ' (' + [Profile].[ScenarioTitle] + ')' END As Title,
		[luProfileUserRole].[Id] AS RoleId,	
		[luProfileUserRole].[Name] AS RoleName,
		[luProfileUserRole].[IsContributor]
	FROM
		[ProfileUser] INNER JOIN
		[User] ON [ProfileUser].[UserId] = [User].[Id] INNER JOIN
		[luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id] INNER JOIN
		[Profile] ON [Profile].[Id] = [ProfileUser].[ProfileId] LEFT JOIN
		[Profile] parentProfile ON [Profile].[ParentId] = parentProfile.[Id]
	WHERE
		[User].[SsoUserId] IS NOT NULL
	
	-- Section Permissions
	SELECT 
		[ProfileSectionUser].[UserId],
		[ProfileSectionUser].[ProfileId],
		[ProfileSectionUser].[ProfileSectionId],
		[ProfileSectionUser].[ReviewEmail]
	FROM
		[ProfileSectionUser] INNER JOIN
		[User] ON [ProfileSectionUser].[UserId] = [User].[Id]
	WHERE
		[User].[SsoUserId] IS NOT NULL


END

GO
GRANT EXECUTE ON [dbo].[spgaSsoUserMaintenance] TO [VLAProfilesUser]
GO

 