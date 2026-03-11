-- Changes for CR-070
--

--Added Function for the Infectious Diseases
/****** Object:  UserDefinedFunction [dbo].[udf_Infetious]    Script Date: 07-04-2015 18:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_Infetious]
(	 
	@ProfileFieldId uniqueidentifier
)
RETURNS int
AS
BEGIN
	
	DECLARE @rtrnValues as INT=0
	--SET @rtrnValues = (SELECT COUNT(*) FROM ProfileVersionFieldValue 
	--where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('914D7724-6C52-4EB0-81BE-D0AC855692D3','1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
	--,'0EA78369-2E20-4946-A4C2-8170771AA0EE'))


	SET @rtrnValues = (case when (SELECT COUNT(*) FROM ProfileVersionFieldValue 
	where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('914D7724-6C52-4EB0-81BE-D0AC855692D3','1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F')) > 0 then 1 
	when (SELECT COUNT(*) FROM ProfileVersionFieldValue where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('0EA78369-2E20-4946-A4C2-8170771AA0EE'))> 0 then 0 ELSE 2 end)
	RETURN @rtrnValues
END
------------

--Added Function for the Virus Diseases
/****** Object:  UserDefinedFunction [dbo].[udf_Virus]    Script Date: 07-04-2015 18:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_Virus]
(	 
	@ProfileFieldId uniqueidentifier  
)
RETURNS int
AS
BEGIN
	
	DECLARE @rtrnValues as INT=0
	SET @rtrnValues = (SELECT COUNT(*) FROM ProfileVersionFieldValue where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('51D2E5A6-E54D-4E22-AA82-B5395C04FFBE','D4346998-F3AF-4CCA-90C1-6A2D3E892410','7D603278-C8F3-4A34-9EC7-D3CF4A9C50D9','99B19A9C-B19C-4A0E-AC10-1C1F97D863A9','9855A1A5-9643-4CCB-AB20-E26BCDBDA1E4'))
	RETURN @rtrnValues
END
------------

--Added Function for the YesNoForZoonotic Diseases
/****** Object:  UserDefinedFunction [dbo].[udf_YesNoForZoonotic]    Script Date: 07-04-2015 18:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[udf_YesNoForZoonotic]
(	 
	@ProfileFieldId uniqueidentifier  
)
RETURNS int
AS
BEGIN
	
	DECLARE @rtrnValues as INT=0
	--SET @rtrnValues = (SELECT COUNT(*) FROM ProfileVersionFieldValue where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('7EF9BDE5-323B-428C-9D19-E3753A9FCD33','C5390074-3597-458C-AAF4-F42099F416E8','CBB4614A-4964-4CD1-8859-829D08CA3DFB'))
	SET @rtrnValues = (case when (SELECT COUNT(*) FROM ProfileVersionFieldValue 
	where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('7EF9BDE5-323B-428C-9D19-E3753A9FCD33','C5390074-3597-458C-AAF4-F42099F416E8')) > 0 then 1 
	when (SELECT COUNT(*) FROM ProfileVersionFieldValue where ProfileVersionId  = @ProfileFieldId AND ListValue IN ('CBB4614A-4964-4CD1-8859-829D08CA3DFB'))> 0 then 0 ELSE 2 end)

	RETURN @rtrnValues
END
------------

--Added Script for the Filter Diseases

/****** Object:  StoredProcedure [dbo].[spgaFilterRankProfileData]    Script Date: 07-04-2015 18:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spgaFilterRankProfileData]

	@DiseaseName as nvarchar(500)

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @YesNoIsEndemic as int
	DECLARE @YesNoForZoonotic as int
	DECLARE @YesNoNotifiable as int
	DECLARE @YesNoInfectious as int	
	--DECLARE @DiseaseName as NVARCHAR(500)='Disease3'
	
	SET @YesNoIsEndemic = (SELECT TOP 1 (case Disease1 When 'endemic diseases' THEN 1 ELSE case Disease1 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoForZoonotic = (SELECT TOP 1 (case Disease2 When 'zoonotic' THEN 1 ELSE case Disease2 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoNotifiable = (SELECT TOP 1 (case Disease3 When 'notifiable' THEN 1 ELSE case Disease3 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoInfectious = (SELECT TOP 1 (case Disease4 When 'infectious' THEN 1 ELSE case Disease4 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)	

	
SELECT  DISTINCT
		[Profile].[Id] AS ProfileId,
		[Species].[Id] AS SpeciesId,
		[PrioritisationCategory].[Name] as PriorityName, 		
		[PrioritisationScore].[Rank],		
		[ProfileVersionFieldValue].[BooleanValue] AS IsEndemic,
		[Profile].[Title],
		[Species].[Name],
		[luProfileVersionState].[Name] AS ProfileVersionState, 
		[luProfileStatusType].[IsValidationComplete],
		[ProfileVersion].[Id]
	FROM 
		[PrioritisationScore] INNER JOIN 
		[ProfileVersion] ON [PrioritisationScore].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId] INNER JOIN
		[Species] ON [Species].[Id] = [PrioritisationScore].[SpeciesId] INNER JOIN
		[PrioritisationCategory] ON [PrioritisationCategory].[Id] = [PrioritisationScore].[PrioritisationCategoryId] INNER JOIN
		[ProfileVersionFieldValue] ON [ProfileVersionFieldValue].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN 
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] LEFT JOIN
		[luProfileStatusType] ON [Profile].[ProfileStatusId] = [luProfileStatusType].[Id]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[Species].[EffectiveDateTo] IS NULL AND
		[Profile].[ParentId] IS NULL AND
		--[ProfileVersionFieldValue].[ProfileFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A' AND
		[PrioritisationScore].[Rank] <> 0
		AND [ProfileVersion].[Id] IN (
		

		SELECT Id FROM (SELECT 
		[dbo].[udf_YesNoForZoonotic](Id) as YesNoForZoonotic,
		[dbo].[udf_Infetious](Id) as YesNoForInfectious,
		[dbo].[udf_Virus](Id) as Virus, Id,
		BooleanValue
		 FROM (SELECT DISTINCT ID, BooleanValue FROM (Select Id from (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) as RNmb, t.Id, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Id, Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = 'FBDAF26D-F94F-467D-B524-E2D4B64F2AA0') as t,
		(SELECT Title, MAX(VersionMajor) as VersionMj FROM ProfileVersion GROUP BY Title) as y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) as y Where y.RNmb IN (
		SELECT MAX(RNmb) as RowNumber FROM (SELECT ROW_NUMBER() OVER (order by t.VersionMinor) as RNmb, t.Title, t.VersionMajor, t.VersionMinor FROM (SELECT Title, VersionMajor, VersionMinor FROM ProfileVersion Where ProfileVersionStateId = 'FBDAF26D-F94F-467D-B524-E2D4B64F2AA0') as t,
		(SELECT Title, MAX(VersionMajor) as VersionMj FROM ProfileVersion GROUP BY Title) as y Where t.VersionMajor = y.VersionMj AND t.Title = y.Title) as h GROUP BY Title, VersionMajor)) as e,
		(SELECT ProfileVersionFieldValue.ProfileVersionId, ProfileVersionFieldValue.BooleanValue
		FROM ProfileVersionFieldValue INNER JOIN 
		ProfileField ON ProfileVersionFieldValue.ProfileFieldId = ProfileField.Id INNER JOIN
		ProfileQuestion ON ProfileField.ProfileQuestionId = ProfileQuestion.Id INNER JOIN 
		[ProfileSection] ON [ProfileSection].Id = ProfileQuestion.ProfileSectionId
		WHERE ProfileQuestionId = '47F994AA-F7F3-4F06-A24E-CE6473062C90'
		) as g
		Where e.Id = g.ProfileVersionId AND g.BooleanValue is not null) as f) as w
		
		Where (CASE @YesNoForZoonotic WHEN 0 THEN YesNoForZoonotic END = 0
		        	      OR CASE @YesNoForZoonotic WHEN 1 THEN YesNoForZoonotic END = 1
		        	  	OR CASE @YesNoForZoonotic WHEN 2 THEN YesNoForZoonotic END IN (0, 1))
		        	  	
		        	  	AND
		            
		        	  	(CASE @YesNoNotifiable WHEN 0 THEN BooleanValue END = 0
		        	      OR CASE @YesNoNotifiable WHEN 1 THEN BooleanValue END = 1
		        	  	OR CASE @YesNoNotifiable WHEN 2 THEN BooleanValue END IN (0, 1))

						AND
		            
		        	  	(CASE @YesNoInfectious WHEN 0 THEN Virus END = 0
		        	      OR CASE @YesNoInfectious WHEN 1 THEN Virus END = 1
		        	  	OR CASE @YesNoInfectious WHEN 2 THEN Virus END IN (0, 1))


		)

AND
		   (CASE @YesNoIsEndemic WHEN 0 THEN [ProfileVersionFieldValue].[BooleanValue] END = 0
		     OR CASE @YesNoIsEndemic WHEN 1 THEN [ProfileVersionFieldValue].[BooleanValue] END = 1
		   OR CASE @YesNoIsEndemic WHEN 2 THEN [ProfileVersionFieldValue].[BooleanValue] END IN (0, 1))

------------