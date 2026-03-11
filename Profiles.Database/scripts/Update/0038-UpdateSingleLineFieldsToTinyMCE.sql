DECLARE @LongFieldID VARCHAR (255) = (SELECT TOP(1) [Id] FROM [luDataFieldType] WHERE [Name]='Long Text')

UPDATE [ProfileField] 

SET [ProfileField].DataFieldTypeId=@LongFieldID

FROM [ProfileField]

INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]

--Profile Question ID is hardcoded therefore if there are any updates. This may not be 100% accurate.
WHERE ([ProfileQuestionId] = 'DC383A7F-491A-448A-97D0-E612F8135FE5' 
OR [ProfileQuestionId] = '7B1328F8-0125-4706-8E02-1972D28CE796'
OR ([ProfileQuestionId] = '5B0C2224-D0A3-4E34-BABF-C6158451B224' AND [FieldNumber]='11')) --11.3 Any other pertinent information
