--------------------------------------------------------------------------------------------------------
--- spuProfileVersionPublicFlag.SQL
--------------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionPublicFlag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionPublicFlag]
GO

CREATE PROCEDURE [dbo].[spuProfileVersionPublicFlag] 
	@ProfileVersionId uniqueidentifier
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @IsAlreadyPublic bit

	SELECT
		@IsAlreadyPublic = [IsPublic]
	FROM
		[dbo].[ProfileVersion]
	WHERE
		[Id]=@ProfileVersionId

	IF @IsAlreadyPublic=1
	BEGIN
		RAISERROR('This profile version is already public',16,1)
		RETURN
	END
	
	IF NOT EXISTS
	(
		SELECT 
			*
		FROM 
			[dbo].[ProfileVersion] INNER JOIN [dbo].[luProfileVersionState] 
				ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] 
		WHERE 
			[ProfileVersion].[Id] = @ProfileVersionId AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[luProfileVersionState].[Name] = 'Published'
	)
	BEGIN
		RAISERROR('You can only modify the public status of current, published profiles.',16,1)
		RETURN
	END

	UPDATE
		[dbo].[ProfileVersion]
	SET
		[IsPublic]=1
	WHERE
		[Id]=@ProfileVersionId

END

GO
GRANT EXECUTE ON [dbo].[spuProfileVersionPublicFlag] TO [VLAProfilesUser]
GO
