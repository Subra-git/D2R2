
/* Phase2Release2Changes */
/*2.2.10 Automatic capture of author information */
/*1.1.1 Remove the old, usused "contribution date" feature  */

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]') AND name = N'PK_ProfileVersionUser')
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [PK_ProfileVersionUser]

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionUser_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]'))
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [FK_ProfileVersionUser_ProfileVersion]

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionUser_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionUser]'))
ALTER TABLE [dbo].[ProfileVersionUser] DROP CONSTRAINT [FK_ProfileVersionUser_User]

GO
DROP TABLE [dbo].[ProfileVersionUser] 


/* 1.1.2 Capture author information */
GO
IF OBJECT_ID ( N'[dbo].[ProfileVersionSectionUser]' ) IS NOT NULL
	DROP TABLE [dbo].[ProfileVersionSectionUser];
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileVersionSectionUser]
	(
	ProfileVersionId uniqueidentifier NOT NULL,
	ProfileSectionId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	LastContributionDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfileVersionSectionUser] ADD CONSTRAINT
	PK_ProfileVersionSectionUser PRIMARY KEY CLUSTERED 
	(
	ProfileVersionId,
	ProfileSectionId,
	UserId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_ProfileVersion FOREIGN KEY
	(
	ProfileVersionId
	) REFERENCES dbo.ProfileVersion
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_ProfileSection FOREIGN KEY
	(
	ProfileSectionId
	) REFERENCES dbo.ProfileSection
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO
ALTER TABLE dbo.ProfileVersionSectionUser ADD CONSTRAINT
	FK_ProfileVersionSectionUser_User FOREIGN KEY
	(
	UserId
	) REFERENCES dbo.[User]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO

/* 2.2.1 Profile scenarios */
ALTER TABLE
	[Profile]
ADD
	[ParentId] uniqueidentifier NULL,
	[Title] varchar(255) NULL,
	[ScenarioTitle] varchar(255) NULL,
	[LastUpdated] timestamp NOT NULL
GO

ALTER TABLE [Profile] ADD CONSTRAINT
	FK_Profile_Profile FOREIGN KEY
	(
	[ParentId]
	) REFERENCES [Profile]
	(
	[Id]
	)
GO

-- set the title in the Profile table to the latest profile version title in each case
UPDATE
	[Profile]
SET
	[Title] = b.[Title]
FROM
	(
	SELECT
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title]
	FROM
		(
		SELECT
			[ProfileId],
			MAX(([VersionMajor] * 256) + [VersionMinor]) AS [VersionSortValue]
		FROM
			[ProfileVersion]
		GROUP BY
			[ProfileId] 
		) a INNER JOIN [ProfileVersion] ON a.[ProfileId] = [ProfileVersion].[ProfileId] AND a.[VersionSortValue] = ([ProfileVersion].[VersionMajor] * 256) + [ProfileVersion].[VersionMinor]
	) b
WHERE
	b.[ProfileId] = [Profile].[Id]
GO

ALTER TABLE [Profile] ADD CONSTRAINT
	CHK_ProfileTitle CHECK
	(
		([Profile].[ParentId] IS NULL AND [Title] IS NOT NULL) OR
		([Profile].[ParentId] IS NOT NULL AND [Title] IS NULL)
	);
GO

ALTER TABLE [Profile] ADD CONSTRAINT
	CHK_ProfileScenarioTitle CHECK
	(
		([Profile].[ParentId] IS NULL AND [ScenarioTitle] IS NULL) OR
		([Profile].[ParentId] IS NOT NULL AND [ScenarioTitle] IS NOT NULL)
	);
GO



/* 2.3.5 Access control at section level: Enforcing permissions at section level */
GO
CREATE TABLE dbo.ProfileSectionUser
	(
	UserId uniqueidentifier NOT NULL,
	ProfileId uniqueidentifier NOT NULL,
	ProfileSectionId uniqueidentifier NOT NULL
	)  ON [PRIMARY]
GO

ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	PK_ProfileSectionUser PRIMARY KEY CLUSTERED 
	(
	UserId,
	ProfileId,
	ProfileSectionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	FK_ProfileSectionUser_ProfileUser FOREIGN KEY
	(
	UserId,
	ProfileId
	) REFERENCES dbo.ProfileUser
	(
	UserId,
	ProfileId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProfileSectionUser ADD CONSTRAINT
	FK_ProfileSectionUser_ProfileSection FOREIGN KEY
	(
	ProfileSectionId
	) REFERENCES dbo.ProfileSection
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

INSERT INTO ProfileSectionUser
(
UserId,
ProfileId,
ProfileSectionId
)
SELECT ProfileUser.UserId, ProfileUser.ProfileId, ProfileSection.Id FROM ProfileUser
INNER JOIN luProfileUserRole ON ProfileUser.ProfileUserRoleId = luProfileUserRole.Id
CROSS JOIN ProfileSection
WHERE luProfileUserRole.IsContributor = 1

/* 2.3.5 Access control at section level: Granting User Access   */
GO
