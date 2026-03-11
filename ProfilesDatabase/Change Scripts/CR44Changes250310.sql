--CR-044 
--Update the profile field reference values for Question 7.3
UPDATE ReferenceValue SET LookupValue = 'Low' WHERE Id = 'C8583C83-8963-46AA-BDB1-69BAC5C93BB5'
UPDATE ReferenceValue SET LookupValue = 'Medium' WHERE Id = 'D792C4B9-0600-44D1-9B90-B6719D766386'
UPDATE ReferenceValue SET LookupValue = 'High' WHERE Id = '48B95319-292E-4069-9591-1691214FA31E'

--Update the prioritisation criterion values. WS22 maps to the field Question 7.3
UPDATE PrioritisationCriterionValue SET CriterionValue = 'Low' WHERE Id = '0DBBA5A4-825F-4C32-B787-225A4923AEAF'
UPDATE PrioritisationCriterionValue SET CriterionValue = 'Medium' WHERE Id = 'A53707D6-9C6A-4115-875B-225B3A048189'
UPDATE PrioritisationCriterionValue SET CriterionValue = 'High' WHERE Id = '4047855B-7B0B-4CE8-9B02-EF18FD0F8D9B'

--Create a new reference table and values for Question 7.4
INSERT [ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Impact?',
0
)

-- Negligible option
INSERT [ReferenceValue]
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
'79F38057-3506-45AA-B8EA-28F380E3B93C',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Negligible',
1,
null,
null
)

-- Low option
INSERT [ReferenceValue]
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
'A26C90A8-7D17-4BC7-92DC-24E8AC8EBA2B',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Low',
2,
null,
null
)

-- Medium option
INSERT [ReferenceValue]
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
'E7359232-2F8F-4574-824D-1A98EAA89676',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Medium',
3,
null,
null
)

-- High option
INSERT [ReferenceValue]
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
'E51E525A-F92E-48A3-AC86-E61F47973932',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'High',
4,
null,
null
)

-- Very high option
INSERT [ReferenceValue]
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
'CA5CC3BB-AC4D-4556-BDD1-4824FDE03419',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Very high',
5,
null,
null
)

-- Update the answer to the field on question 7.4 to look at the new reference table.
-- Very Low --> Negligible
UPDATE ProfileVersionFieldValue
SET
	ListValue = '79F38057-3506-45AA-B8EA-28F380E3B93C'
WHERE
	ListValue = 'DF0A980E-93A1-40A0-9DAB-DA062CA12518' AND
	ProfileFieldId = '13955418-8899-44D9-A48B-D6D3DBB838D4'

UPDATE ProfileVersionFieldValue
SET
	ListValue = 'A26C90A8-7D17-4BC7-92DC-24E8AC8EBA2B'
WHERE
	ListValue = '653BDC06-16FD-4C1D-8A3A-19CA465A95CB' AND
	ProfileFieldId = '13955418-8899-44D9-A48B-D6D3DBB838D4'

UPDATE ProfileVersionFieldValue
SET
	ListValue = 'E7359232-2F8F-4574-824D-1A98EAA89676'
WHERE
	ListValue = '72BCFA83-3AB0-448A-834A-310492FBF790' AND
	ProfileFieldId = '13955418-8899-44D9-A48B-D6D3DBB838D4'

UPDATE ProfileVersionFieldValue
SET
	ListValue = 'E51E525A-F92E-48A3-AC86-E61F47973932'
WHERE
	ListValue = '02E6950B-B083-477E-8DD6-8ECFC8AB822C' AND
	ProfileFieldId = '13955418-8899-44D9-A48B-D6D3DBB838D4'

UPDATE ProfileVersionFieldValue
SET
	ListValue = 'CA5CC3BB-AC4D-4556-BDD1-4824FDE03419'
WHERE
	ListValue = 'A363E67B-0F6C-4CEE-9CE8-D3EB363DBD4F' AND
	ProfileFieldId = '13955418-8899-44D9-A48B-D6D3DBB838D4'

-- Update the profile field to look at the new reference table
UPDATE ProfileField SET ReferenceTableId = '0822FD49-7D73-480B-AE19-D70F7C3CC016' WHERE Id = '13955418-8899-44D9-A48B-D6D3DBB838D4'

--Update the prioritisation criterion values. WS23 maps to the field in Question 7.4
UPDATE PrioritisationCriterionValue SET CriterionValue = 'Negligible' WHERE Id = '09D02F5A-08BA-4185-BD3C-55602DF0AC44'
 

