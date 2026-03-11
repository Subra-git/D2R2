---------------------------------------------------------------------------------------------
--- UATD74Changes010311.SQL
--------------------------------------------------------------------------------------------- 

-- Q9.5 requires a new reference table

IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [Id] = 'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58')
BEGIN
INSERT INTO 
	[ReferenceTable]
(
	[Id],
	[Name],
	[IsMaintainable]
)
VALUES
(
	'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58',
	'Potential to reduce species prevalance',
	0
)
END

-- Methods to control to be determined
IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id]='FDFF833E-7181-4040-B51B-2EBAEB957413')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'FDFF833E-7181-4040-B51B-2EBAEB957413',
	'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58',
	'Methods to control to be determined',
	1
)
END

-- Low or N/A
IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = '918B71E3-1503-4392-96DE-65E8E6828E3D')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'918B71E3-1503-4392-96DE-65E8E6828E3D',
	'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58',
	'Low or N/A',
	2
)
END

-- Medium
IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = '211EEE82-84BB-4EC5-84DD-CFE4257DF204')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'211EEE82-84BB-4EC5-84DD-CFE4257DF204',
	'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58',
	'Medium',
	3
)
END

-- High
IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = 'FBC3327E-4B12-4FCB-8CA1-61CA8DF1E253')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'FBC3327E-4B12-4FCB-8CA1-61CA8DF1E253',
	'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58',
	'High',
	4
)
END

-- update the profile field to look at the new reference table
UPDATE
	[ProfileField]
SET
	[ReferenceTableId] = 'B6F0FC4D-E1B2-44A3-B84C-5032A93F1A58'
WHERE
	[Id] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'
	
	
-- Methods to control to be determined
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'FDFF833E-7181-4040-B51B-2EBAEB957413'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = 'E280D02C-7434-45AA-96BA-5EBC92B159F0'

-- Low or N/A
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = '918B71E3-1503-4392-96DE-65E8E6828E3D'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = 'FA9974D3-EBF8-488E-BC2A-CEE06715E823'

-- Medium
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = '211EEE82-84BB-4EC5-84DD-CFE4257DF204'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = 'E98FDF79-D6AE-4454-A6D9-3A20DC10313D'

-- High
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'FBC3327E-4B12-4FCB-8CA1-61CA8DF1E253'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = 'B109EAD4-35F3-408D-B470-FB6177A244D0'
	
--update prioritisationCriterionValues with the new value
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = 'High'
WHERE
	[Id] = '1593C7B2-7902-41A5-AE49-539182CB22BB'
		
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = 'Low or N/A'
WHERE
	[Id] = 'A0E526C7-7E0F-4DB2-8D61-7FDA5CA984F1'