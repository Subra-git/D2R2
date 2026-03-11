------------------------------------------------------------------------------------------------------
--- spuSpeciesAnswerData.SQL
------------------------------------------------------------------------------------------------------

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesAnswerData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesAnswerData]
GO

CREATE PROCEDURE [dbo].[spuSpeciesAnswerData]
	@SpeciesId uniqueidentifier,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	-- check that the timestamp is OK
	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[dbo].[Species]
		WHERE
			[Id] = @SpeciesId AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR('The species has been edited by another user',16,1)
		RETURN
	END

	UPDATE
		[dbo].[Species]
	SET
		[Id]=[Id]
	WHERE
		[Id]=@SpeciesId
	

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId

END

GO
GRANT EXECUTE ON [dbo].[spuSpeciesAnswerData] TO [VLAProfilesUser]
GO

