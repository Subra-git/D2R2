
IF NOT EXISTS(SELECT * 
FROM sys.indexes 
WHERE name='IX_ProfileVersionFieldValue_SpeciesId' AND object_id = OBJECT_ID('dbo.ProfileVersionFieldValue'))

BEGIN
	CREATE NONCLUSTERED INDEX [IX_ProfileVersionFieldValue_SpeciesId]
	ON [dbo].[ProfileVersionFieldValue] ([SpeciesId])
	INCLUDE ([ProfileFieldId],[BooleanValue],[ListValue])
END

GO

/****** Object:  StoredProcedure [dbo].[spgaFilterRankProfileData]    Script Date: 4/23/2024 1:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spgaFilterRankProfileData]

	@DiseaseName as nvarchar(500)

AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @YesFieldValue uniqueidentifier = '2C642201-C7E1-4947-8BCB-CE9F726F5EA0'
	DECLARE @PartialYesFieldValue uniqueidentifier = 'c26801ea-2a92-4e59-be3e-366bb8f3b38f'

	DECLARE @YesNoIsEndemic as int
	DECLARE @YesNoForZoonotic as int
	DECLARE @YesNoNotifiable as int
	DECLARE @YesNoInfectious as int
	DECLARE @First as nvarchar(500)
	DECLARE @Second as nvarchar(500)
	DECLARE @Third as nvarchar(500)
	DECLARE @Fourth as nvarchar(500)
	DECLARE @Fifth as nvarchar(500)
	DECLARE @X as xml
	--DECLARE @DiseaseName as NVARCHAR(500)='Disease3'
	
	SET @YesNoIsEndemic = (SELECT TOP 1 (case Disease1 When 'endemic diseases' THEN 1 ELSE case Disease1 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoForZoonotic = (SELECT TOP 1 (case Disease2 When 'zoonotic' THEN 1 ELSE case Disease2 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoNotifiable = (SELECT TOP 1 (case Disease3 When 'notifiable' THEN 1 ELSE case Disease3 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SET @YesNoInfectious = (SELECT TOP 1 (case Disease4 When 'infectious' THEN 1 ELSE case Disease4 When 'both' THEN 2 ELSE 0 END END) as DD FROM DiseaseFilters WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1)
	SELECT @X = CONVERT(xml,' <root> <s>' + REPLACE((SELECT Disease5 as s FROM [dbo].[DiseaseFilters] WHERE DiseaseName = @DiseaseName AND IsActive = 1 AND IsInUse = 1 GROUP BY FilterNumber, Disease5),',','</s> <s>') + '</s>   </root> ')
	SET @First = (SELECT Value FROM (SELECT ROW_NUMBER() OVER (ORDER BY [Value] ASC) AS rownumber, d.Value FROM (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c)) as d )  as temptablename WHERE rownumber = 1)	
	SET @Second = (SELECT Value FROM (SELECT ROW_NUMBER() OVER (ORDER BY [Value] ASC) AS rownumber, d.Value FROM (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c)) as d )  as temptablename WHERE rownumber = 2)
	SET @Third = (SELECT Value FROM (SELECT ROW_NUMBER() OVER (ORDER BY [Value] ASC) AS rownumber, d.Value FROM (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c)) as d )  as temptablename WHERE rownumber = 3)
	SET @Fourth = (SELECT Value FROM (SELECT ROW_NUMBER() OVER (ORDER BY [Value] ASC) AS rownumber, d.Value FROM (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c)) as d )  as temptablename WHERE rownumber = 4)
	SET @Fifth = (SELECT Value FROM (SELECT ROW_NUMBER() OVER (ORDER BY [Value] ASC) AS rownumber, d.Value FROM (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c)) as d )  as temptablename WHERE rownumber = 5)


	SELECT  t.ProfileId,
		t.SpeciesId,
		t.PrioritisationCategoryName,
		t.Rank,		
		t.IsEndemic,
		t.Title, 
		t.SpeciesName,
		t.ProfileVersionState,
		t.IsValidationComplete,
		t.Id ,
		t.VersionMinor,
		t.ProfileFieldId FROM (
SELECT 
		[Profile].[Id] AS ProfileId,
		[Species].[Id] AS SpeciesId,
		[PrioritisationCategory].[Name] as PrioritisationCategoryName, 		
		[PrioritisationScore].[Rank],		
		CAST((CASE [ProfileVersionFieldValue].[ListValue] WHEN @YesFieldValue THEN 1 WHEN @PartialYesFieldValue THEN 1 ELSE 0 END) AS bit) AS IsEndemic,
		[Profile].[Title], 
		[Species].[Name] as SpeciesName,
		[luProfileVersionState].[Name] AS ProfileVersionState, 
		[luProfileStatusType].[IsValidationComplete],
		[ProfileVersion].[Id] ,
		[ProfileVersion].[VersionMinor],
		[ProfileVersionFieldValue].[ProfileFieldId]
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
		[ProfileVersionFieldValue].[ProfileFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A' AND
		[PrioritisationScore].[Rank] <> 0		
		) as t	

		WHERE SpeciesId IN (

	SELECT SpeciesId FROM (SELECT 
		[ProfileVersionFieldValue].[SpeciesId],
		(SELECT CASE WHEN (SELECT LookupValue FROM ReferenceValue Where [ReferenceValue].ID = [ProfileVersionFieldValue].[ListValue]) = 'Not known' OR (SELECT LookupValue FROM ReferenceValue Where [ReferenceValue].ID = [ProfileVersionFieldValue].[ListValue]) = 'Yes' THEN 1 ELSE 0 END) as YesNoForZoonotic,
		Case when [ProfileVersionFieldValue].[BooleanValue] = 1 then 1 else 0 end as YesNoNotifiable,
		(SELECT CASE WHEN (SELECT LookupValue FROM ReferenceValue Where [ReferenceValue].ID = [ProfileVersionFieldValue].[ListValue]) = 'Currently not known' OR (SELECT LookupValue FROM ReferenceValue Where [ReferenceValue].ID = [ProfileVersionFieldValue].[ListValue]) = 'Yes' THEN 1 ELSE 0 END) as YesNoInfectious,
		(CASE WHEN [ProfileVersionFieldValue].[ListValue] is null THEN 0 ELSE dbo.[udf_GetYesNoInfectiousViruses](@First,@Second,@Third,@Fourth,@Fifth,[ProfileVersionFieldValue].[ListValue]) END) as YesNoInfectiousViruses
	FROM
		[ProfileVersionFieldValue] INNER JOIN
		[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN
		[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id] INNER JOIN 
		DiseaseFilters d ON d.SelectedSpecies = [ProfileVersionFieldValue].[SpeciesId]
	WHERE (QuestionNumber = 1 OR QuestionNumber = 3) AND SpeciesId Is Not Null AND d.DiseaseName = @DiseaseName AND d.IsActive = 1 AND d.IsInUse = 1)
	as y Where (CASE @YesNoForZoonotic WHEN 0 THEN YesNoForZoonotic END = 0
	    OR CASE @YesNoForZoonotic WHEN 1 THEN YesNoForZoonotic END = 1
		OR CASE @YesNoForZoonotic WHEN 2 THEN YesNoForZoonotic END IN (0, 1))
		
		AND

		(CASE @YesNoNotifiable WHEN 0 THEN YesNoNotifiable END = 0
	    OR CASE @YesNoNotifiable WHEN 1 THEN YesNoNotifiable END = 1
		OR CASE @YesNoNotifiable WHEN 2 THEN YesNoNotifiable END IN (0, 1))	
			
		AND

		(CASE @YesNoInfectious WHEN 0 THEN YesNoInfectious END = 0
	    OR CASE @YesNoInfectious WHEN 1 THEN YesNoInfectious END = 1
		OR CASE @YesNoInfectious WHEN 2 THEN YesNoInfectious END IN (0, 1))

		AND

		(CASE @YesNoInfectious WHEN 0 THEN YesNoInfectiousViruses END = 0
	    OR CASE @YesNoInfectious WHEN 1 THEN YesNoInfectiousViruses END = 1
		OR CASE @YesNoInfectious WHEN 2 THEN YesNoInfectiousViruses END IN (0, 1))
		
		AND

		(CASE @YesNoIsEndemic WHEN 0 THEN t.IsEndemic END = 0
	    OR CASE @YesNoIsEndemic WHEN 1 THEN t.IsEndemic END = 1
		OR CASE @YesNoIsEndemic WHEN 2 THEN t.IsEndemic END IN (0, 1)))
	
END
