--------------------------------------------------------------------------------------------------------
--- spuUser.SQL
-------------------------------------------------------------------------------------------------------- 
 
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuUser]
GO

CREATE PROCEDURE [dbo].[spuUser]
	@UserId uniqueidentifier,
	@FullName varchar(100),
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
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
		[User]
	SET
		[FullName] = @FullName
	WHERE
		[Id] = @UserId
	
	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId

END

GO
GRANT EXECUTE ON [dbo].[spuUser] TO [VLAProfilesUser]
GO


