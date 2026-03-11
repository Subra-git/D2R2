------------------------------------------------------------------------------------------------------
--- spuProfileStatus.SQL
------------------------------------------------------------------------------------------------------ 

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileStatus]
GO

CREATE PROCEDURE [dbo].[spuProfileStatus]
	@ProfileId uniqueidentifier,
	@ProfileStatusId uniqueidentifier	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[Profile]
	SET
		[ProfileStatusId] = @ProfileStatusId
	WHERE
		[Id] = @ProfileId	
	
END

GO
GRANT EXECUTE ON [dbo].[spuProfileStatus] TO [VLAProfilesUser]
GO
