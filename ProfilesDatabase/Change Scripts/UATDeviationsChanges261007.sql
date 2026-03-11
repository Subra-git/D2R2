-- UATD04 Additional control mechanisms
INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '37A64447-44CC-4704-B029-3C8D8441313C',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Routine testing to identify cases',
      12
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
      'C56A67BD-5B59-4D26-97F5-83E2F2A363A3',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Genetic methods',
      13
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
      '338E32D5-202C-46D6-B8A2-20E5D56D04D7',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Other unlisted control types',
      14
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
      '3B2E8D44-81BD-4F06-AC9F-50DA38B717CA',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'No practical control method available',
      15
      )

INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '37A64447-44CC-4704-B029-3C8D8441313C',
        'Routine testing to identify cases',
        
        '1 January 2007'
      
        )
        
INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'C56A67BD-5B59-4D26-97F5-83E2F2A363A3',
        'Genetic methods',
        
        '1 January 2007'
      
        )
       
       INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '338E32D5-202C-46D6-B8A2-20E5D56D04D7',
        'Other unlisted control types',
        
        '1 January 2007'
      
        )
        
       INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '3B2E8D44-81BD-4F06-AC9F-50DA38B717CA',
        'No practical control method available',
        
        '1 January 2007'
      
        )
         

-- UATD06 Change reference value 0-2% to read >0-2%
UPDATE
	[ReferenceValue]
SET
	[LookupValue] = '>0-2%'
WHERE
	[LookupValue] = '0-2%'
	
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '>0-2% / Negligible'
WHERE
	[CriterionValue] = '0-2% / Negligible'

UPDATE
	[luPrevalenceLevel]
SET
	[LookupValue] = '>0-2%'
WHERE
	[LookupValue] = '0-2%'
	
-- UATD11 Change question 2.3 Date of most recent occurrence in GB to be non-mandatory
UPDATE
	[ProfileField]
SET
	[IsMandatory] = 0
WHERE
	[ShortName] = 'Date Of Most Recent Occurrence In GB' 

-- UATD10 Changes to species trade data
UPDATE
	[Species]
SET
	[ImportanceOfExportTrade] = '59ef471a-ca72-479e-8717-93ff37f85f7c', -- High
	[ExportMarketValue] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4' -- Medium
WHERE
	[Name] = 'Chickens'
	
UPDATE
	[Species]
SET
	[ImportanceOfExportTrade] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4', -- Medium
	[ExportMarketValue] = 'ef0b0c60-529f-4970-b19b-9afa0178c4e5' -- Low
WHERE
	[Name] = 'Domestic cattle'
	
UPDATE
	[Species]
SET
	[ImportanceOfExportTrade] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4', -- Medium
	[ExportMarketValue] = '59ef471a-ca72-479e-8717-93ff37f85f7c' -- High
WHERE
	[Name] = 'Domestic horses'
	
UPDATE
	[Species]
SET
	[ImportanceOfExportTrade] = '59ef471a-ca72-479e-8717-93ff37f85f7c', -- High
	[ExportMarketValue] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4' -- Medium
WHERE
	[Name] = 'Domestic pigs'

UPDATE
	[Species]
SET
	[ImpactOnIntraCommunityFlows] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4', -- Medium
	[ImpactOnThirdCountryFlows] = 'ef0b0c60-529f-4970-b19b-9afa0178c4e5' -- Low
WHERE
	[Name] = 'Domestic sheep'
	
UPDATE
	[Species]
SET
	[ImportanceOfExportTrade] = '15374cc2-8f09-44eb-bc64-99b74b9e0ee4', -- Medium
	[ExportMarketValue] = 'ef0b0c60-529f-4970-b19b-9afa0178c4e5' -- Low
WHERE
	[Name] = 'Pheasants'
	