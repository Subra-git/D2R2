--Spreadsheet must have the following columns
	SELECT
		'Title' as Title,
		'VersionMajor' as VersionMajor,
		'VersionMinor' as VersionMinor,
		'DraftOrPublished' as DraftOrPublished,
		'ReferenceType' as ReferenceType,
		'SectionName' as SectionName,
		'NoteText' as NoteText,
		'QuestionReference' as QuestionReference,
		'Id' as Id,
		'QuestionNumber' as QuestionNumber
	
-- Export
	SELECT 
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name] As [DraftOrPublished],			
		'Scientific Paper Reference' As [ReferenceType],
		[ProfileSection].[ShortName] As [SectionName],
		[ScientificPaperReference].[NoteText],
		[ScientificPaperReference].[QuestionReference],
		[ScientificPaperReference].[Id]
	FROM 
		[ScientificPaperReference] INNER JOIN
		[ProfileVersion] ON [ScientificPaperReference].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[ProfileSection] ON [ProfileSection].[Id] = [ScientificPaperReference].[ProfileSectionId]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL
	UNION ALL

	SELECT 
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name] As [DraftOrPublished],				
		'Legislative Reference' As [ReferenceType],
		[ProfileSection].[ShortName] As [SectionName],
		[LegislativeReference].[NoteText],
		[LegislativeReference].[QuestionReference],
		[LegislativeReference].[Id]
	FROM 
		[LegislativeReference] INNER JOIN
		[ProfileVersion] ON [LegislativeReference].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[ProfileSection] ON [ProfileSection].[Id] = [LegislativeReference].[ProfileSectionId]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL

	UNION ALL

	SELECT 
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name] As [DraftOrPublished],	
		'Source Of Further Information' As [ReferenceType],
		[ProfileSection].[ShortName] As [SectionName],		
		[SourceOfFurtherInformation].[NoteText],
		[SourceOfFurtherInformation].[QuestionReference],
		[SourceOfFurtherInformation].[Id]
	FROM 
		[SourceOfFurtherInformation] INNER JOIN
		[ProfileVersion] ON [SourceOfFurtherInformation].[ProfileVersionId] = [ProfileVersion].[Id] INNER JOIN
		[luProfileVersionState] ON [luProfileVersionState].[Id] = [ProfileVersion].[ProfileVersionStateId] INNER JOIN
		[ProfileSection] ON [ProfileSection].[Id] = [SourceOfFurtherInformation].[ProfileSectionId]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL


  