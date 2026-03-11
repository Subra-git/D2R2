-- make sure the species sequence numbers are correct, after fixing bug 4150
DECLARE @ParentId uniqueidentifier
DECLARE @SpeciesId uniqueidentifier
DECLARE @NextSequenceNumber int
  
DECLARE ParentCursor CURSOR FOR 
SELECT ParentId
FROM [Species]
WHERE ParentId is not null

OPEN ParentCursor

FETCH NEXT FROM ParentCursor
INTO @ParentId

WHILE @@FETCH_STATUS = 0
BEGIN
    
	SET @NextSequenceNumber = 0
    DECLARE SpeciesCursor CURSOR FOR 
    SELECT [Id]
    FROM [Species]
    WHERE [ParentId] = @ParentId
	ORDER BY [SequenceNumber]    

    OPEN SpeciesCursor
    FETCH NEXT FROM SpeciesCursor INTO @SpeciesId

    WHILE @@FETCH_STATUS = 0
    BEGIN
    
		SET @NextSequenceNumber = @NextSequenceNumber + 1

		UPDATE [Species]
		SET
			[Species].[SequenceNumber] = @NextSequenceNumber
		WHERE
			[Species].[Id] = @SpeciesId
		  
        FETCH NEXT FROM SpeciesCursor INTO @SpeciesId
    
	END

    CLOSE SpeciesCursor
    DEALLOCATE SpeciesCursor
    
	-- Get the next parentId.
    FETCH NEXT FROM ParentCursor
    INTO @ParentId
END 

CLOSE ParentCursor
DEALLOCATE ParentCursor


--handle the case where the ParentId is null

SET @NextSequenceNumber = 0

DECLARE SpeciesCursor CURSOR FOR 
SELECT [Id]
FROM [Species]
WHERE [ParentId] is null
ORDER BY [SequenceNumber]    

OPEN SpeciesCursor
FETCH NEXT FROM SpeciesCursor INTO @SpeciesId

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @NextSequenceNumber = @NextSequenceNumber + 1   

	UPDATE 
		[Species]
	SET
		[Species].[SequenceNumber] = @NextSequenceNumber
	WHERE
		[Species].[Id] = @SpeciesId
		   
    FETCH NEXT FROM SpeciesCursor INTO @SpeciesId
END

CLOSE SpeciesCursor
DEALLOCATE SpeciesCursor

-- Task 4155: alterations to "Potential to reduce welfare implications in each species/group"

-- create a new reference table
INSERT INTO [ReferenceTable]
	(
	[Id],
	[Name],
	[IsMaintainable]
	)
VALUES
	(
	'B170451A-B1A0-4584-8001-C574A54316AF',
	'Welfare Implications Level',
	0
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'69118FFF-FA41-47B4-85F0-E6CB8A3006BF',
	'B170451A-B1A0-4584-8001-C574A54316AF',
	'Not applicable',
	1
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'71528818-0789-4048-9643-7DFDDBF4D75B',
	'B170451A-B1A0-4584-8001-C574A54316AF',
	'Low',
	2
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'CFC0837C-AF2B-45F0-9D21-D02AAA0A9A6E',
	'B170451A-B1A0-4584-8001-C574A54316AF',
	'Medium',
	3
	)

INSERT INTO [ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(
	'0FE71DE1-A32E-4C78-B76A-600C05B54CC7',
	'B170451A-B1A0-4584-8001-C574A54316AF',
	'High',
	4
	)
	
-- change question 5.7 to be 5.9
-- remove its relevance rule connection to 5.1
UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 9,
	[IrrelevanceFieldId] = NULL,
	[IrrelevanceFlag] = NULL
WHERE
	[Id] = '13B0550B-7F49-4998-98B0-AC4950DA6743'

-- change question 5.8 to be 5.7
UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 7
WHERE
	[Id] = '56A3F23B-B097-4203-8295-3DE62F1725ED'

-- change question 5.9 to be 5.8
UPDATE
	[ProfileQuestion]
SET
	[QuestionNumber] = 8
WHERE
	[Id] = 'D2174FEE-AA09-4CB9-B66C-266E7AC6F463'

-- change the first field in the question to point to the new reference table
UPDATE
	[ProfileField]
SET
	[ReferenceTableId] = 'B170451A-B1A0-4584-8001-C574A54316AF'
WHERE
	[Id] = '371A7645-068B-4195-8092-798ED57416EC'
	
-- change existing profile data for "Potential to reduce welfare implications in each species/group" to the new reference table
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = '71528818-0789-4048-9643-7DFDDBF4D75B'
WHERE
	[ProfileFieldId] = '371A7645-068B-4195-8092-798ED57416EC' AND
	[ListValue] = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D' -- "Low"

UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'CFC0837C-AF2B-45F0-9D21-D02AAA0A9A6E'
WHERE
	[ProfileFieldId] = '371A7645-068B-4195-8092-798ED57416EC' AND
	[ListValue] = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8' -- "Medium"

UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = '0FE71DE1-A32E-4C78-B76A-600C05B54CC7'
WHERE
	[ProfileFieldId] = '371A7645-068B-4195-8092-798ED57416EC' AND
	[ListValue] = '90751241-41DD-493C-BDA2-84D8EFCBC02C' -- "High"

-- Add the "not applicable" option to prioritisation criterion GO07
INSERT INTO [PrioritisationCriterionValue]
	(
	[Id],
	[PrioritisationCriterionId],
	[CriterionValue],
	[Score],
	[SequenceNumber]
	)
VALUES
	(
	'ADCC50F0-15E1-4CCE-8ED6-768901E673C6',
	'D30F036B-1873-4C25-BEDB-8A2088CC00B9',
	'Not applicable',
	0,
	1
	)
	
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 2
WHERE
	[PrioritisationCriterionId] ='D30F036B-1873-4C25-BEDB-8A2088CC00B9' AND
	[CriterionValue] = 'Low'
	
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 3
WHERE
	[PrioritisationCriterionId] ='D30F036B-1873-4C25-BEDB-8A2088CC00B9' AND
	[CriterionValue] = 'Medium'
	
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 4
WHERE
	[PrioritisationCriterionId] ='D30F036B-1873-4C25-BEDB-8A2088CC00B9' AND
	[CriterionValue] = 'High'
	