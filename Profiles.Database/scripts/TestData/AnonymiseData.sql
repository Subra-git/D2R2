/*************************************************************************

	Anonymisation script
	DO NOT RUN ON UAT OR PRODUCTION

**************************************************************************/


UPDATE [dbo].[User]

SET [UserName] = 'domain\username',
	[FullName] = 'User Name',
	[Organisation] = 'Organisation',
	[EmailAddress] = 'user.name@organisation.co.uk'

WHERE [UserName] NOT LIKE 'APHA%'

GO

UPDATE [dbo].[ErrorLog]
SET [Username] = 'User Name (domain\username)'

GO