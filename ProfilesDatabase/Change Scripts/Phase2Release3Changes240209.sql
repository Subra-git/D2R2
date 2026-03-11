--4024

DELETE FROM 
	[dbo].[ProfileVersionFieldValue]
WHERE 
	[ProfileFieldId] IN 
	(
	SELECT
		[Id]
	FROM
		[ProfileField] 
	WHERE [ProfileQuestionId]='af442375-7684-400b-8157-1b3bee00f63d'
	)

UPDATE
	[dbo].[ProfileQuestion]
SET
	[IsRepeating]=1
WHERE
	[Id]='af442375-7684-400b-8157-1b3bee00f63d'
	
UPDATE
	[dbo].[ProfileField]
SET
	[IncludeInSummary]=1
WHERE
	[Id] IN (
			'98191A70-DA10-41BF-9B73-523AD111E625',
			'59344725-4C01-4898-951A-7B091B84AAE4',
			'12B0135B-710A-4F31-A81F-53208C04C5D6')
			
--4037
DELETE FROM
	[dbo].[ProfileVersionFieldValue]
WHERE
	[ProfileFieldId]='87049F64-2B32-427F-B074-E03B66A4B21F'

DELETE FROM
	[dbo].[ProfileField]
WHERE
	[Id]='87049F64-2B32-427F-B074-E03B66A4B21F'

INSERT INTO
	[dbo].[ProfileField]
	(
	[Id],
	[Name],
	[ShortName],
	[ProfileQuestionId],
	[FieldNumber],
	[DataFieldTypeId],
	[IsMandatory],
	[ReferenceTableId],
	[IsReadOnlyCurrentSituation],
	[IsReadOnlyScenario],
	[DefaultValue],
	[IncludeInSummary]
	)
VALUES
	(
	'87049F64-2B32-427F-B074-E03B66A4B21F',
	'Supporting comments',
	'Licensed labs comments',
	'7C1FF790-3117-40F5-B71C-A2DD7433BDFB',
	2,
	'D297F63B-638A-4574-B042-97C248338A26',
	1,
	null,
	0,
	0,
	null,
	1
	)