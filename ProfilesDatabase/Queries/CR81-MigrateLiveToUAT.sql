-- CR81
-- This script should be used to move 'disease data' from the live database to the UAT one.
-- This script assumes that a backup has been taken of the live database and has been restored 
-- to the UAT environment and is sitting alongside the UAT database.
-- IMPORTANT: The database user may need to be fixed using "EXEC sp_change_users_login 'Auto_Fix', '[user name goes here]'"
-- IMPORTANT: The versions of the application and database on live and UAT must be equal.

-- Steps:

-- 0. Make sure you have backed up UAT (just in case)

-- 1. Make sure this script is set to run against the copy of the LIVE database

-- 2. Set the script to run in SQLCMD mode

-- 3. Ensure that the database name of the UAT database (or the database to copy users from) is 
--    specified correctly below
:setvar SecondaryDatabase "Profiles"

-- 4. Run the script against the COPY OF THE LIVE database on the UAT environment

-- 5. Assuming the script ran correctly, change the final ROLLBACK to COMMIT and run the script again

-- 6. Finally, delete the old UAT database and rename the now updated one to match that of the old
--    UAT database

:on error exit
BEGIN TRAN

SET NOCOUNT ON

-- Step A: Create a temporary table and gather user details from the UAT database
DECLARE @Users AS TABLE
(
	[Id]						[uniqueidentifier]	NOT NULL,
	[UserName]					[varchar](50)		NOT NULL,
	[FullName]					[varchar](100)		NOT NULL,
	[Organisation]				[varchar](100)		NOT NULL,
	[IsProfileEditor]			[bit]				NOT NULL,
	[IsPolicyProfileUser]		[bit]				NOT NULL,
	[SsoUserId]					[uniqueidentifier]	NULL,
	[IsUserManagementSystem]	[bit]				NOT NULL,
	[EmailAddress]				[varchar](50)		NULL
)

INSERT INTO 
	@Users
SELECT
	[Id],
	[UserName],
	[FullName],
	[Organisation],
	[IsProfileEditor],
	[IsPolicyProfileUser],
	[SsoUserId],
	[IsUserManagementSystem],
	[EmailAddress]
FROM
	$(SecondaryDatabase).[dbo].[User]

PRINT 'Found ' + CAST(@@ROWCOUNT AS NVARCHAR(MAX)) + ' existing user(s) in UAT database' + CHAR(10)

-- Step B: Update the existing details in the User table to be anonymised
UPDATE 
	[User]
SET
	UserName = 'unknown',
	FullName = 'unknown',
	Organisation = 'unknown',
	SsoUserID = CASE 
		WHEN SsoUserID IS NULL THEN NULL
		ELSE '00000000-0000-0000-0000-000000000000'
	END,
	EmailAddress = 'unknown@sfwltd.co.uk'

PRINT 'Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(MAX)) + ' existing user(s) in current database' + CHAR(10)

-- Step C: Insert the users from the temporary table, ensuring duplicate IDs are not added
INSERT INTO [User]
(
	[Id],
	[UserName],
	[FullName],
	[Organisation],
	[IsProfileEditor],
	[IsPolicyProfileUser],
	[SsoUserId],
	[IsUserManagementSystem],
	[EmailAddress]
)
SELECT 
	[Id],
	[UserName],
	[FullName],
	[Organisation],
	[IsProfileEditor],
	[IsPolicyProfileUser],
	[SsoUserId],
	[IsUserManagementSystem],
	[EmailAddress]
FROM
	@Users
WHERE
	[ID] NOT IN (SELECT [Id] FROM [User])

PRINT 'Inserted ' + CAST(@@ROWCOUNT AS NVARCHAR(MAX)) + ' user(s) from UAT database to the current database'
PRINT 'A difference between numbers here indicates that users existed in both databases'

-- Step D: Select out the new users
SELECT * FROM [User]

ROLLBACK