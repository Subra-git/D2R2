 -------------------------------------------------------------------------------------------------
 --- spiProfileUser.SQL
 -------------------------------------------------------------------------------------------------
 
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileUser]
GO

CREATE PROCEDURE [dbo].[spiProfileUser]
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
	
	INSERT INTO [ProfileUser]
	(
		[ProfileUser].[UserId],
		[ProfileUser].[ProfileId],
		[ProfileUser].[ProfileUserRoleId]
	)
	VALUES
	(
		@UserId,
		@ProfileId,
		@RoleId
	)

END

GO
GRANT EXECUTE ON [dbo].[spiProfileUser] TO [VLAProfilesUser]
GO