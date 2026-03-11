ALTER TABLE [dbo].[ProfileQuestion] ALTER COLUMN [Name] VARCHAR(400) NULL
ALTER TABLE [dbo].[ProfileQuestion] ALTER COLUMN [NonTechnicalName] VARCHAR(400) NULL
ALTER TABLE [dbo].[PrioritisationCriterion] ALTER COLUMN [Name] VARCHAR(400) NOT NULL

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[spuPrioritisationCriterion] 
	@CriterionId uniqueidentifier, 
	@Weighting int,
	@Name varchar(400)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE
		[PrioritisationCriterion]
    SET      
        [Weighting] = @Weighting,
        [Name] = @Name
	WHERE
		[Id] = @CriterionId

END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[spuProfileQuestion]
	@Id uniqueidentifier,
	@UserGuidance text,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT,
	@Name varchar(400),
	@NonTechnicalName varchar(400)
AS
BEGIN
	SET NOCOUNT ON;

IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[ProfileQuestion]
		WHERE
			[Id] = @Id AND
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR('The user guidance has been edited by another user',16,1)
		RETURN
	END

    UPDATE
		[ProfileQuestion]
	SET
		[ProfileQuestion].[UserGuidance] = @UserGuidance,
		[ProfileQuestion].[Name]=@Name,
		[ProfileQuestion].[NonTechnicalName]=@NonTechnicalName
	WHERE
		[ProfileQuestion].[Id] = @Id

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ProfileQuestion]
	WHERE
		[ProfileQuestion].[Id] = @Id

END

GO