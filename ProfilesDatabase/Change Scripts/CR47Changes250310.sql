--CR-047 Changes 

-- Update the Prioritisation Category (Change from Risk and epidemiology to Risk and mitigation)
UPDATE PrioritisationCategory SET [Name] = 'Risk and mitigation' WHERE [Id] = 'cc99bfdf-6621-4390-84d6-91218a40df1d'

-- Update the criterions - change the codes from RE to RM
UPDATE PrioritisationCriterion SET Code = 'RM01' WHERE Id = '09322102-9D62-4663-924D-5E70CDC1A8DD'
UPDATE PrioritisationCriterion SET Code = 'RM02' WHERE Id = '93FE637F-B831-4132-8A6B-1F71B803748A'
UPDATE PrioritisationCriterion SET Code = 'RM03' WHERE Id = '5F1196DB-7CC8-45DB-93AB-AFD355DF841C'
UPDATE PrioritisationCriterion SET Code = 'RM04' WHERE Id = 'D5E06EA0-8917-427C-81D1-DA362A557433'
UPDATE PrioritisationCriterion SET Code = 'RM06' WHERE Id = 'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1'
UPDATE PrioritisationCriterion SET Code = 'RM08' WHERE Id = '4CE1B0C9-F26B-4C92-B6B1-7C380A509966'
UPDATE PrioritisationCriterion SET Code = 'RM10' WHERE Id = 'BA7F975A-684A-4148-8B2D-3A76DEDA3524'
UPDATE PrioritisationCriterion SET Code = 'RM11' WHERE Id = 'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B'
UPDATE PrioritisationCriterion SET Code = 'RM12' WHERE Id = 'A3D947FA-2935-4AEE-96B0-A0AE6461C213'
