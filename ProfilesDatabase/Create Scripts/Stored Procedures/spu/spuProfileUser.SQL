 -------------------------------------------------------------------------------------------------
 --- spuProfileUser.SQL
 -------------------------------------------------------------------------------------------------
 
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileUser]
GO

CREATE PROCEDURE [dbo].[spuProfileUser]
	@UserId uniqueidentifier,
	@ProfileId uniqueidentifier,
	@RoleId uniqueidentifier,
	@LastUpdated timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF NOT EXISTS (	SELECT 
						[Id] 
					FROM 
						[User]
					WHERE
						[Id] = @UserId AND
						[LastUpdated] = @LastUpdated )
	BEGIN
		RAISERROR('The user has been edited by another user', 16, 1)
		RETURN
	END

	UPDATE 
		[ProfileUser]
	SET
		[ProfileUserRoleId] = @RoleId
	WHERE
		[ProfileId] = @ProfileId AND
		[UserId] = @UserId
	
END

GO
GRANT EXECUTE ON [dbo].[spuProfileUser] TO [VLAProfilesUser]
GO