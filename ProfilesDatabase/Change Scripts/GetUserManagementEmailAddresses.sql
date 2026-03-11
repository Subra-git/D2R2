--------------------------------------------------------------------------------------------
--- GetUserManagementEmailAddresses.SQL
--------------------------------------------------------------------------------------------

UPDATE 
	[VLA_SurveillanceProfilesP2R3].[dbo].[User] 
SET 
	[VLA_SurveillanceProfilesP2R3].[dbo].[User].[EmailAddress] = [VLAUserManagement_Dev].[dbo].[tblUser].[fldEmail]
FROM 
	[VLA_SurveillanceProfilesP2R3].[dbo].[User] INNER JOIN 
	[VLAUserManagement_Dev].[dbo].[tblUser] ON 
	[VLA_SurveillanceProfilesP2R3].[dbo].[User].[SsoUserId] = [VLAUserManagement_Dev].[dbo].[tblUser].[fldUserId]
 