INSERT INTO dbo.[User]
(
	Id,
	UserName,
	FullName,
	Organisation,
	IsProfileEditor,
	IsPolicyProfileUser,
	IsUserManagementSystem
)
VALUES
(
	NEWID(),
	'SYSTEM\SsoSubscriptionUser',
	'SSO Subscription Service User',
	'SYSTEM',
	0,
	0,
	1
)


