ALTER PROCEDURE [dbo].[spiSsoUser]
	(
		@UserName varchar(50),
		@FullName varchar(100),
		@EmailAddress varchar(50),
		@Organisation varchar(100),
		@SubscribedToEmails bit,
		@SsoUserId uniqueidentifier
	)
AS
BEGIN
	IF Exists (SELECT * FROM [dbo].[User] WHERE SsoUserId = @SsoUserId)
	BEGIN
		UPDATE [dbo].[User]
		SET
			UserName=@UserName,
			FullName=@FullName,
			EmailAddress = @EmailAddress,
			Organisation=@Organisation,
			SubscribedToReviewEmails=@SubscribedToEmails	
		WHERE
			[SsoUserId] = @SsoUserId
	END
	ELSE
		INSERT INTO [dbo].[User]
			(
				[UserName],
				[FullName],
				[Organisation],
				[IsProfileEditor],
				[IsPolicyProfileUser],
				[SsoUserId],
				[IsUserManagementSystem],
				[EmailAddress],
				[SubscribedToReviewEmails]
			)
		 VALUES
			(
				@UserName,
				@FullName,
				@Organisation,
				0,
				0,
				@SsoUserId,
				0,
				@EmailAddress,
				@SubscribedToEmails
			)	
	END
GO


