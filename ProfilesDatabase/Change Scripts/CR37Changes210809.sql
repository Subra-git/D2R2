
-- CR-037 
-- 1.)
UPDATE
	[ProfileField]
SET
	[Name] = 'What is the contracted frequency of reports from this surveillance project'
WHERE
	[Id] = 'C33ECCE9-45EA-4F8E-8D9B-31E730B588B6'

-- 2.)
INSERT INTO [ProfileField]
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
[IncludeInSummary],
[ProfileFieldGroupId]
)
VALUES
(
'68082F18-1B4C-45EA-A452-C8512D3297A8',
'Supporting comments',
'Noninfectious Cause Comments',
'071CE906-B107-4A4B-AE7E-F51BA347877D',
2,
'D297F63B-638A-4574-B042-97C248338A26',
1,
NULL,
0,
0,
NULL,
0,
NULL
)

--3.)
UPDATE [ReferenceValue] SET [SequenceNumber] = 3 WHERE [Id] = 'dbb9fb95-5d07-4f08-ba51-6aa7419274ae'
UPDATE [ReferenceValue] SET [SequenceNumber] = 4 WHERE [Id] = 'e78fb32a-3812-4217-9616-57180507f1c9'
UPDATE [ReferenceValue] SET [SequenceNumber] = 5 WHERE [Id] = 'f42597b9-8601-443b-ab92-7c86b71140af'
UPDATE [ReferenceValue] SET [SequenceNumber] = 6 WHERE [Id] = '0190d0e1-8433-4815-8e6f-848d4de2c379'
UPDATE [ReferenceValue] SET [SequenceNumber] = 7 WHERE [Id] = '84c90e82-553b-430c-8b13-47e5613675c8'
UPDATE [ReferenceValue] SET [SequenceNumber] = 8 WHERE [Id] = '8a351511-7863-4ce9-93b6-6757df949ed4'
UPDATE [ReferenceValue] SET [SequenceNumber] = 9 WHERE [Id] = 'fab50081-0c0a-4b41-b363-0de86f25cc5a'
UPDATE [ReferenceValue] SET [SequenceNumber] = 10 WHERE [Id] = 'b2e6c5bd-9736-4a9d-a8be-6ee72e650477'
UPDATE [ReferenceValue] SET [SequenceNumber] = 11 WHERE [Id] = '8ca29d41-d3b1-4edb-a83c-060329214c44'
UPDATE [ReferenceValue] SET [SequenceNumber] = 12 WHERE [Id] = 'be9777d4-d297-4610-868e-20fb41ad3c3c'
UPDATE [ReferenceValue] SET [SequenceNumber] = 13 WHERE [Id] = '6a8b13d3-cc59-49cf-9063-4b542b647f30'
UPDATE [ReferenceValue] SET [SequenceNumber] = 14 WHERE [Id] = 'ad11f938-5134-4001-94c0-97504e60699b'
UPDATE [ReferenceValue] SET [SequenceNumber] = 15 WHERE [Id] = '4f6706bd-fda8-4d49-a44e-08e4f21cca10'
UPDATE [ReferenceValue] SET [SequenceNumber] = 16 WHERE [Id] = 'f19b85a7-c4c4-49bc-88f0-0f22534ed8ae'
UPDATE [ReferenceValue] SET [SequenceNumber] = 17 WHERE [Id] = 'f1ef1379-e5b3-41ae-8b8d-1a918e77cd91'
UPDATE [ReferenceValue] SET [SequenceNumber] = 18 WHERE [Id] = '2efa6967-21f9-449c-82f6-aaa81d90efa5'

INSERT INTO [ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom],
[EffectiveDateTo]
)
VALUES
(
'EEA7CD22-33D6-45B8-8F66-A00E39516C64',
'abd96ffa-219f-4b9f-ac09-476a75d98708',
'Control of infection in trading partners',
2,
NULL,
NULL
)

UPDATE [ReferenceValue] SET [SequenceNumber] = 3 WHERE [Id] = '010D8BEB-E9C5-4235-B301-BB218B81B94F'
UPDATE [ReferenceValue] SET [SequenceNumber] = 4 WHERE [Id] = 'A64178A1-722F-4B98-A1B5-A89F532B243D'
UPDATE [ReferenceValue] SET [SequenceNumber] = 5 WHERE [Id] = 'A4977626-1522-4194-848B-C5286631682D'
UPDATE [ReferenceValue] SET [SequenceNumber] = 6 WHERE [Id] = '8E8FFE4E-2B53-4675-A638-E885BB7A0418'
UPDATE [ReferenceValue] SET [SequenceNumber] = 7 WHERE [Id] = 'FB606BEF-4753-4273-839E-8FEFA56EFA63'
UPDATE [ReferenceValue] SET [SequenceNumber] = 8 WHERE [Id] = 'E724855A-BC95-428E-BAF4-F5F7E03E4F1A'
UPDATE [ReferenceValue] SET [SequenceNumber] = 9 WHERE [Id] = '7CB57611-953D-4A4F-A432-A8B40BA3A984'
UPDATE [ReferenceValue] SET [SequenceNumber] = 10 WHERE [Id] = 'B2FD71C4-F50F-4BB9-8869-26BCE63136FB'
UPDATE [ReferenceValue] SET [SequenceNumber] = 11 WHERE [Id] = '9D582C3A-FCAD-4B06-A5A1-C25790124F75'
UPDATE [ReferenceValue] SET [SequenceNumber] = 12 WHERE [Id] = 'F81C8CC0-B08C-4C56-AD50-041397C4771E'
UPDATE [ReferenceValue] SET [SequenceNumber] = 13 WHERE [Id] = 'DEC3119F-F67E-4407-A009-7E3E41BA0390'
UPDATE [ReferenceValue] SET [SequenceNumber] = 14 WHERE [Id] = '4A7E46EB-0BA5-41F5-88D0-958FB555ED82'
UPDATE [ReferenceValue] SET [SequenceNumber] = 15 WHERE [Id] = '99842CE6-E0BD-417D-BBAE-06C0B2948018'
UPDATE [ReferenceValue] SET [SequenceNumber] = 16 WHERE [Id] = 'A97D235C-7DE4-4224-A858-36A8F9393C40'
UPDATE [ReferenceValue] SET [SequenceNumber] = 17 WHERE [Id] = 'EF02C4C2-B019-4A24-8F34-3DC3C1AD8198'
UPDATE [ReferenceValue] SET [SequenceNumber] = 18 WHERE [Id] = '911BEB9A-270F-4639-A4D6-FE0013971951'

INSERT INTO [ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom],
[EffectiveDateTo]
)
VALUES
(
'A6F029CF-582D-4133-8F18-1430DED2D483',
'E7C5D077-F472-464B-BAC6-12B7E9504584',
'Control of infection in trading partners',
2,
NULL,
NULL
)

--4.)
INSERT INTO	[ReferenceValue]
(
[Id],
[ReferenceTableId],
[LookupValue],
[SequenceNumber],
[EffectiveDateFrom],
[EffectiveDateTo]
)
VALUES
(
'D21996E3-1C0C-4F53-9E84-15C082823768',
'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
'Years',
5,
null,
null
)

--Bug: Problem with short text field Q4.4 
-- Solution: change short text field to a long text field.
UPDATE
	[ProfileField]
SET
	[DataFieldTypeId] = 'd297f63b-638a-4574-b042-97c248338a26'
WHERE
	[Id] = '27E30D35-EA6B-42A8-BC1C-D00AEBF3C02C'

--Bug found in system test of CR37/38
--Irrevelance rule on question 4.7 required
UPDATE
	[ProfileQuestion]
SET
	[IrrelevanceFieldID] = 'c2d1cb84-b085-4a7f-9f2e-4702f8d81ea6',
	[IrrelevanceFlag] = 0
WHERE
	[Id]= '7c1ff790-3117-40f5-b71c-a2dd7433bdfb'
