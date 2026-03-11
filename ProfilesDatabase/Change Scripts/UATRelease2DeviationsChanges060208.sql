--UATD23 Species ordering

/****** Object:  StoredProcedure [dbo].[spuSpecies]    Script Date: 02/06/2008 10:41:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpecies]
GO
/****** Object:  StoredProcedure [dbo].[spuSpecies]    Script Date: 02/06/2008 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 25 July 2007
-- Description:	Updates a species and audits the change
-- =============================================
-- RJN 22/11/07: Added Supporting Comments fields
-- RJN 06/02/08: Removed the update of the EffectiveDateFrom field (UATD23)
CREATE PROCEDURE [dbo].[spuSpecies]
	-- Add the parameters for the stored procedure here
	@SpeciesId uniqueidentifier,
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@ParentId uniqueidentifier,
	@Description varchar(50),
	@CommercialTrade uniqueidentifier,
	@CommercialTradeComments text,
	@ImportanceOfExportTrade uniqueidentifier,
	@ImportanceOfExportTradeComments text,
	@ImpactOnLevelOfImports	uniqueidentifier,
	@ImpactOnLevelOfImportsComments text,
	@ImpactOnIntraCommunityFlows uniqueidentifier,
	@ImpactOnIntraCommunityFlowsComments text,
	@ImpactOnThirdCountryFlows uniqueidentifier,
	@ImpactOnThirdCountryFlowsComments text,
	@ExportMarketValue uniqueidentifier,
	@ExportMarketValueComments text,
	@LastUpdated timestamp,
	@SpeciesTableAuditLogId uniqueidentifier OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EffectiveDate smalldatetime
	SET @EffectiveDate = GETDATE()
	
	IF EXISTS
	(
	SELECT
		[Id]
	FROM
		[Species]
	WHERE
		[Name] = @Description 
		AND [Id] <> @SpeciesId
	) BEGIN
		RAISERROR(''Save failed: there is already a species with this name'', 16, 1)
		RETURN
	END

	-- Check timestamp is valid
	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[Species]
		WHERE
			[Id] = @SpeciesId 
			AND [LastUpdated] = @LastUpdated
		) 
			BEGIN
				RAISERROR(''The species cannot be updated because it has been edited by another user'',16,1)
				RETURN
			END



	-- Update Species
    UPDATE 
		[Species]
	SET
		[ParentId] = @ParentId,
		[Name] = @Description,
		[CommercialTrade] = @CommercialTrade,
		[CommercialTradeComments] = @CommercialTradeComments,
		[ImportanceOfExportTrade] = @ImportanceOfExportTrade,
		[ImportanceOfExportTradeComments] = @ImportanceOfExportTradeComments,
		[ImpactOnLevelOfImports] = @ImpactOnLevelOfImports,
		[ImpactOnLevelOfImportsComments] = @ImpactOnLevelOfImportsComments,
		[ImpactOnIntraCommunityFlows] = @ImpactOnIntraCommunityFlows,
		[ImpactOnIntraCommunityFlowsComments] = @ImpactOnIntraCommunityFlowsComments,
		[ImpactOnThirdCountryFlows] = @ImpactOnThirdCountryFlows,
		[ImpactOnThirdCountryFlowsComments] = @ImpactOnThirdCountryFlowsComments,
		[ExportMarketValue] = @ExportMarketValue,
		[ExportMarketValueComments] = @ExportMarketValueComments
	WHERE
		[Id] = @SpeciesId




	-- Get a new AuditLogId
	SET @SpeciesTableAuditLogId =  NEWID()


	--Insert Audit (parent)
    INSERT INTO [SpeciesTableAuditLog]
		(
		[Id],
		[SpeciesName],
		[UserId],
		[EffectiveDate],
		[LogDate],
		[Reason]
		)
	VALUES
		(
		@SpeciesTableAuditLogId,
		@Description,
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		) 

END







' 
END
GO
GRANT EXECUTE ON [dbo].[spuSpecies] TO [VLAProfilesUser]
GO


-- UATD27 Additional legislation type
INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9057B373-1D8B-4A42-863A-B62009508278',
      '9acb37c7-3cb3-4789-b13e-84a4e9042df5',
      'None',
      6
      )
GO

INSERT INTO luLegislationType
	(
	[Id],
	[LookupValue],
	[SequenceNumber]  
	)
VALUES
	(
    '9057B373-1D8B-4A42-863A-B62009508278',
    'None',
    6
    ) 
GO 

-- UATD26 International Trade data - species data mismatch fix

UPDATE
	[InternationalTradeSpecies]
SET
	[ImpactOnThirdCountryFlowsComments] = [Species].[ImpactOnThirdCountryFlowsComments],
	[ImportanceOfExportTrade] = [Species].[ImportanceOfExportTrade],
	[ExportMarketValue] = [Species].[ExportMarketValue],
	[ImpactOnIntraCommunityFlows] = [Species].[ImpactOnIntraCommunityFlows],
	[ImpactOnLevelOfImports] = [Species].[ImpactOnLevelOfImports],
	[CommercialTradeComments] = [Species].[CommercialTradeComments],
	[CommercialTrade] = [Species].[CommercialTrade],
	[ExportMarketValueComments] = [Species].[ExportMarketValueComments],
	[ImpactOnThirdCountryFlows] = [Species].[ImpactOnThirdCountryFlows],
	[ImpactOnLevelOfImportsComments] = [Species].[ImpactOnLevelOfImportsComments],
	[ImportanceOfExportTradeComments] = [Species].[ImportanceOfExportTradeComments],
	[ImpactOnIntraCommunityFlowsComments] = [Species].[ImpactOnIntraCommunityFlowsComments]
FROM
	[InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
	INNER JOIN [ProfileVersion] ON [InternationalTradeSpecies].[ProfileVersionId] = [ProfileVersion].[Id]
WHERE
	[ProfileVersion].[EffectiveDateTo] IS NULL
GO

-- UATD32 Changes to static reporting

CREATE TABLE [dbo].[StaticReport](
	Id uniqueidentifier NOT NULL
 CONSTRAINT [PK_StaticReport] PRIMARY KEY CLUSTERED 
(
	Id
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StaticReportVersion](
	Id uniqueidentifier NOT NULL,
	StaticReportId uniqueidentifier NOT NULL,
	Title varchar(255) NOT NULL,
	VersionMajor tinyint NOT NULL,
	EffectiveDateFrom smalldatetime NOT NULL,
	EffectiveDateTo smalldatetime NULL,
	PdfData image NOT NULL
 CONSTRAINT [PK_StaticReportVersion] PRIMARY KEY CLUSTERED 
(
	Id
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE dbo.StaticReportVersion ADD CONSTRAINT
	FK_StaticReportVersion_StaticReport FOREIGN KEY
	(
	StaticReportId
	) REFERENCES dbo.StaticReport
	(
	Id
	) 	
GO

/****** Object:  StoredProcedure [dbo].[spgaCurrentStaticReport]    Script Date: 02/11/2008 11:44:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentStaticReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaCurrentStaticReport]
GO
/****** Object:  StoredProcedure [dbo].[spgaCurrentStaticReport]    Script Date: 02/11/2008 11:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentStaticReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11th February 2008
-- Description:	gets a list of all the current static reports
-- =============================================
CREATE PROCEDURE spgaCurrentStaticReport
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[StaticReportVersion].[Id],
		[StaticReportVersion].[StaticReportId],
		[StaticReportVersion].[Title],
		[StaticReportVersion].[VersionMajor],
		[StaticReportVersion].[EffectiveDateFrom],
		[StaticReportVersion].[EffectiveDateTo]
	FROM
		[StaticReportVersion]
	WHERE
		[StaticReportVersion].[EffectiveDateTo] IS NULL
	ORDER BY
		[StaticReportVersion].[Title]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaCurrentStaticReport] TO [VLAProfilesUser]
GO

/****** Object:  StoredProcedure [dbo].[spgStaticReportHistory]    Script Date: 02/11/2008 13:25:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgStaticReportHistory]
GO
/****** Object:  StoredProcedure [dbo].[spgStaticReportHistory]    Script Date: 02/11/2008 13:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	lists the static report versions for a
--				given static report ID
-- =============================================
CREATE PROCEDURE spgStaticReportHistory
	@StaticReportId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[StaticReportVersion].[Id],
		[StaticReportVersion].[StaticReportId],
		[StaticReportVersion].[Title],
		[StaticReportVersion].[VersionMajor],
		[StaticReportVersion].[EffectiveDateFrom],
		[StaticReportVersion].[EffectiveDateTo]
	FROM
		[StaticReportVersion]
	WHERE
		[StaticReportVersion].[StaticReportId] = @StaticReportId
	ORDER BY
		[StaticReportVersion].[VersionMajor] DESC
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgStaticReportHistory] TO [VLAProfilesUser]
GO

/****** Object:  StoredProcedure [dbo].[spiStaticReport]    Script Date: 02/11/2008 15:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiStaticReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiStaticReport]
GO
/****** Object:  StoredProcedure [dbo].[spiStaticReport]    Script Date: 02/11/2008 15:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiStaticReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	adds a new static report to the database, determining
--				based on the title whether it is a new report or a new
--				version of an existing report
-- =============================================
CREATE PROCEDURE spiStaticReport
	@Title varchar(255),
	@PdfData image
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @StaticReportId uniqueidentifier
	DECLARE @VersionMajor tinyint
	DECLARE @EffectiveDate smalldatetime

	SET @StaticReportId = NULL
	SET @VersionMajor = 1
	SET @EffectiveDate = GETDATE()

	SELECT
		@StaticReportId = [StaticReportId],
		@VersionMajor = [VersionMajor] + 1
	FROM
		[StaticReportVersion]
	WHERE
		[Title] = @Title AND
		[EffectiveDateTo] IS NULL

	IF @StaticReportId IS NULL BEGIN
		SET @StaticReportId = NEWID()

		INSERT INTO [StaticReport]
			(
			[Id]
			)
		VALUES
			(
			@StaticReportId
			)

	END ELSE BEGIN

		UPDATE
			[StaticReportVersion]
		SET
			[EffectiveDateTo] = @EffectiveDate
		WHERE
			[StaticReportId] = @StaticReportId AND
			[EffectiveDateTo] IS NULL

	END

	INSERT INTO [StaticReportVersion]
		(
		[Id],
		[StaticReportId],
		[Title],
		[VersionMajor],
		[EffectiveDateFrom],
		[PdfData]
		)
	VALUES
		(
		NEWID(),
		@StaticReportId,
		@Title,
		@VersionMajor,
		@EffectiveDate,
		@PdfData
		)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiStaticReport] TO [VLAProfilesUser]
GO

/****** Object:  StoredProcedure [dbo].[spgStaticReportVersionData]    Script Date: 02/11/2008 15:49:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportVersionData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgStaticReportVersionData]
GO
/****** Object:  StoredProcedure [dbo].[spgStaticReportVersionData]    Script Date: 02/11/2008 15:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportVersionData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	Gets the PDF data for a particular
--				static report version
-- =============================================
CREATE PROCEDURE spgStaticReportVersionData
	@StaticReportVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[PdfData]
	FROM
		[StaticReportVersion]
	WHERE
		[Id] = @StaticReportVersionId 
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgStaticReportVersionData] TO [VLAProfilesUser]
GO

/****** Object:  StoredProcedure [dbo].[spdStaticReportVersion]    Script Date: 02/11/2008 17:05:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdStaticReportVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdStaticReportVersion]
GO
/****** Object:  StoredProcedure [dbo].[spdStaticReportVersion]    Script Date: 02/11/2008 17:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdStaticReportVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	deletes a version of a static report
-- =============================================
CREATE PROCEDURE [dbo].[spdStaticReportVersion]
	@StaticReportVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @StaticReportId uniqueidentifier
	DECLARE @EffectiveDateTo smalldatetime
	DECLARE @NextLatestStaticReportVersionId uniqueidentifier

    SELECT
		@StaticReportId = [StaticReportId],
		@EffectiveDateTo = [EffectiveDateTo]
	FROM
		[StaticReportVersion]
	WHERE
		[Id] = @StaticReportVersionId

	IF @EffectiveDateTo IS NOT NULL BEGIN
		RAISERROR(''You cannot delete this static report version because it is not current'', 16, 1)
		RETURN
    END

	SELECT
		@NextLatestStaticReportVersionId = [Id]
    FROM
		[StaticReportVersion]
    WHERE
		[StaticReportId] = @StaticReportId AND
		[EffectiveDateTo] = (
			SELECT
				MAX([EffectiveDateTo])
			FROM
				[StaticReportVersion]    
			WHERE
				[StaticReportId] = @StaticReportId
			)

	-- remove the selected static report version
    DELETE FROM
		[StaticReportVersion]
    WHERE
		[Id] = @StaticReportVersionId


	-- set the previous static report version to be current
    IF @NextLatestStaticReportVersionId IS NOT NULL BEGIN
		UPDATE
			[StaticReportVersion]
		SET
			[EffectiveDateTo] = NULL
		WHERE
			[Id] = @NextLatestStaticReportVersionId
    END

	-- if there are no versions left for this static report,
	-- remove the entry from the StaticReport table
    IF NOT EXISTS (SELECT * FROM [StaticReportVersion] WHERE [StaticReportId] = @StaticReportId) BEGIN
    
		DELETE FROM
			[StaticReport]
		WHERE
			[Id] = @StaticReportId
	END
    
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdStaticReportVersion] TO [VLAProfilesUser]
GO

-- UATD33 species deletion issue
/****** Object:  StoredProcedure [dbo].[spgSpeciesById]    Script Date: 02/19/2008 11:43:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesById]
GO
/****** Object:  StoredProcedure [dbo].[spgSpeciesById]    Script Date: 02/19/2008 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath		
-- Create date: 11 July 2007
-- Description:	Gets a species by speciesId
-- =============================================
CREATE PROCEDURE [dbo].[spgSpeciesById]
	@SpeciesId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @ChildCount int, @ActiveChildCount int

    DECLARE @CurrentDate smalldatetime
    SET @CurrentDate = GetDate()
    SET @CurrentDate = dateAdd(mi, 1, @CurrentDate)

	-- Whether the Species exists or not get the species fields
	SELECT
		[SpeciesField].[Id],
		[SpeciesField].[Name],
		[SpeciesField].[ShortName],
		[ReferenceTable].[Name] AS [ReferenceTableName],
		[luDataFieldType].[Name] AS [DataTypeName],
		[SpeciesField].[IsMandatory]
	FROM
		[SpeciesField] INNER JOIN [luDataFieldType] ON [SpeciesField].[DataFieldTypeId] = [luDataFieldType].[Id]
		LEFT JOIN [ReferenceTable] ON [SpeciesField].[ReferenceTableId] = [ReferenceTable].[Id]
	ORDER BY
		[FieldNumber]


	-- Get information about the species (timestamp, isinuse etc)

	-- Get child count
	SELECT
		@ChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId

	-- Get active child count
	SELECT
		@ActiveChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies INNER JOIN [Species] ON tmpChildSpecies.[Id] = [Species].[Id]
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId AND
		([Species].[EffectiveDateTo] IS NULL OR @CurrentDate BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo])

	SELECT
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @CurrentDate BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive],
		CAST(CASE WHEN [tmpProfileVersionSpecies].[SpeciesId]IS NULL AND [tmpPrioritisationScore].[SpeciesId] IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
		@ChildCount AS ChildCount,
		@ActiveChildCount AS ActiveChildCount,
		[Species].[LastUpdated]
	FROM
		[Species] LEFT JOIN 
		(	SELECT [SpeciesId] 
			FROM [ProfileVersionSpecies] 
			GROUP BY [SpeciesId]
		) AS tmpProfileVersionSpecies ON [tmpProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		LEFT JOIN
		(	SELECT [SpeciesId] 
			FROM [PrioritisationScore] 
			GROUP BY [SpeciesId]
		) AS tmpPrioritisationScore ON [tmpPrioritisationScore].[SpeciesId] = [Species].[Id]
	WHERE
		[Species].[Id] = @SpeciesId



	-- If the Species exists get the current values
	SELECT     
		[Species].[Name], 
		[Species].[ParentId],
		[Species].[CommercialTrade],
		[Species].[CommercialTradeComments],
		[Species].[ImportanceOfExportTrade], 
		[Species].[ImportanceOfExportTradeComments], 
		[Species].[ImpactOnLevelOfImports], 
		[Species].[ImpactOnLevelOfImportsComments], 
		[Species].[ImpactOnIntraCommunityFlows], 
		[Species].[ImpactOnIntraCommunityFlowsComments], 
		[Species].[ImpactOnThirdCountryFlows], 
		[Species].[ImpactOnThirdCountryFlowsComments],
        [Species].[ExportMarketValue],
		[Species].[ExportMarketValueComments]
	FROM         [Species]

	WHERE     
		[Species].[Id] = @SpeciesId


		
END






' 
END
GO
GRANT EXECUTE ON [dbo].[spgSpeciesById] TO [VLAProfilesUser]
GO
