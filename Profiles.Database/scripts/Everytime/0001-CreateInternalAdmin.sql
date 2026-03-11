IF EXISTS (SELECT * FROM [dbo].[User] WHERE UserName = 'internal\admin')
BEGIN
	DELETE FROM [dbo].[ProfileUser]
	WHERE UserId = (SELECT Id FROM [dbo].[User] WHERE [UserName] = 'internal\admin')

	DELETE FROM [dbo].[User]
	WHERE UserName = 'internal\admin'
END

INSERT INTO [dbo].[User] (
	  [Id]
      ,[UserName]
      ,[FullName]
      ,[Organisation]
      ,[IsProfileEditor]
      ,[IsPolicyProfileUser]
      ,[SsoUserId]
      ,[IsUserManagementSystem]
      ,[EmailAddress])
VALUES (
	NEWID(),
	'internal\admin',
	'Internal admin',
	'N/A',
	1,
	1,
	null,
	0,
	'internaladmin@nodomain.com')

GO

DECLARE @UserId UNIQUEIDENTIFIER
DECLARE @ProfileUserRoleId UNIQUEIDENTIFIER

SET @UserId = (SELECT Id FROM [dbo].[User] WHERE [UserName] = 'internal\admin')
SET @ProfileUserRoleId = (SELECT Id FROM [dbo].[luProfileUserRole] WHERE Name = 'Technical author')

INSERT INTO [dbo].[ProfileUser] (UserId, ProfileId, ProfileUserRoleId)
SELECT @UserId, P.Id, @ProfileUserRoleId
FROM [dbo].[Profile] P


