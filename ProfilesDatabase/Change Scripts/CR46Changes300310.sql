--CR-046 Amendments to allow new or emerging diseases to be prioritised 

--Question numbers 3.5
-- Insert a new reference table
INSERT [ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'A962E486-546F-448A-AE88-22E3F9C9E172',
'Impact Level Extended',
0
)

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
'C4101E69-E393-4C93-8256-96363128AAB7',
'A962E486-546F-448A-AE88-22E3F9C9E172',
'Currently not known',
1,
null,
null
)

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
'E5A0239C-41B0-48BA-BA8E-667F3CAD5B0B',
'A962E486-546F-448A-AE88-22E3F9C9E172',
'Low',
2,
null,
null
)

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
'80DA3272-F6DB-48DF-99D0-41DF0F874AE8',
'A962E486-546F-448A-AE88-22E3F9C9E172',
'Medium',
3,
null,
null
)

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
'9CE032F4-ACBB-4B30-A624-458553CA9EDA',
'A962E486-546F-448A-AE88-22E3F9C9E172',
'High',
4,
null,
null
)

-- Question 3.5 - Update the field to look at the new reference table
UPDATE ProfileField SET ReferenceTableID = 'A962E486-546F-448A-AE88-22E3F9C9E172' 
WHERE Id = '95874F6E-CFA3-4DAE-932D-FA908CFAD58C'

-- Update the existing field values to look at the new reference values
--Low
UPDATE ProfileVersionFieldValue
SET
	ListValue = 'E5A0239C-41B0-48BA-BA8E-667F3CAD5B0B'
WHERE
	ListValue = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D'
	AND ProfileFieldId = '95874F6E-CFA3-4DAE-932D-FA908CFAD58C'

--Medium
UPDATE ProfileVersionFieldValue
SET
	ListValue = '80DA3272-F6DB-48DF-99D0-41DF0F874AE8'
WHERE
	ListValue = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8'
	AND ProfileFieldId = '95874F6E-CFA3-4DAE-932D-FA908CFAD58C'

--High
UPDATE ProfileVersionFieldValue
SET
	ListValue = '9CE032F4-ACBB-4B30-A624-458553CA9EDA'
WHERE
	ListValue = '90751241-41DD-493C-BDA2-84D8EFCBC02C'
	AND ProfileFieldId = '95874F6E-CFA3-4DAE-932D-FA908CFAD58C'

-- Question numbers 9.3, 9.5, 9.6, 9.10
-- Insert a new reference table
INSERT [ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'D907F5F1-9EF1-40CB-813D-77FB62880FA4',
'Impact',
0
)

-- Methods to control to be determined
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
'7D557195-4DBA-407A-8992-E6D2C9492389',
'D907F5F1-9EF1-40CB-813D-77FB62880FA4',
'Methods to control to be determined',
1,
null,
null
)

--Low
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
'2421B920-5045-41AB-B2CA-23ABBCDDEFB0',
'D907F5F1-9EF1-40CB-813D-77FB62880FA4',
'Low',
2,
null,
null
)

--Medium
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
'47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3',
'D907F5F1-9EF1-40CB-813D-77FB62880FA4',
'Medium',
3,
null,
null
)

--High
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
'C968F747-D161-497C-8F0C-1C4D4E7C54BF',
'D907F5F1-9EF1-40CB-813D-77FB62880FA4',
'High',
4,
null,
null
)

-- Question 9.3 - Update the field to look at the new reference table
UPDATE ProfileField SET ReferenceTableID = 'D907F5F1-9EF1-40CB-813D-77FB62880FA4' 
WHERE Id = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C'

--Update existing field values to look at the new reference values
--Low
UPDATE ProfileVersionFieldValue
SET
	ListValue = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'
WHERE
	ListValue = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D'
	AND ProfileFieldId = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C'

--Medium 
UPDATE ProfileVersionFieldValue
SET
	ListValue = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'
WHERE
	ListValue = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8'
	AND ProfileFieldId = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C'

--High
UPDATE ProfileVersionFieldValue
SET
	ListValue = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'
WHERE
	ListValue = '90751241-41DD-493C-BDA2-84D8EFCBC02C'
	AND ProfileFieldId = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C'

-- Question 9.5 - Update the field to look at the new reference table
UPDATE ProfileField SET ReferenceTableID = 'D907F5F1-9EF1-40CB-813D-77FB62880FA4' 
WHERE Id = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'

--Low
UPDATE ProfileVersionFieldValue
SET
	ListValue = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'
WHERE
	ListValue = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D'
	AND ProfileFieldId = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'

--Medium 
UPDATE ProfileVersionFieldValue
SET
	ListValue = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'
WHERE
	ListValue = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8'
	AND ProfileFieldId = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'

--High
UPDATE ProfileVersionFieldValue
SET
	ListValue = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'
WHERE
	ListValue = '90751241-41DD-493C-BDA2-84D8EFCBC02C'
	AND ProfileFieldId = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'


-- Question 9.9 - Update the field to look at the new reference table
UPDATE ProfileField SET ReferenceTableID = 'D907F5F1-9EF1-40CB-813D-77FB62880FA4' 
WHERE Id = '114C5FD3-10FF-41C8-9B09-13377D45DFF6'

--Low
UPDATE ProfileVersionFieldValue
SET
	ListValue = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'
WHERE
	ListValue = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D'
	AND ProfileFieldId = '114C5FD3-10FF-41C8-9B09-13377D45DFF6'

--Medium 
UPDATE ProfileVersionFieldValue
SET
	ListValue = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'
WHERE
	ListValue = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8'
	AND ProfileFieldId = '114C5FD3-10FF-41C8-9B09-13377D45DFF6'

--High
UPDATE ProfileVersionFieldValue
SET
	ListValue = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'
WHERE
	ListValue = '90751241-41DD-493C-BDA2-84D8EFCBC02C'
	AND ProfileFieldId = '114C5FD3-10FF-41C8-9B09-13377D45DFF6'

-- Question 9.10 - Update the field to look at the new reference table
UPDATE ProfileField SET ReferenceTableID = 'D907F5F1-9EF1-40CB-813D-77FB62880FA4' 
WHERE Id = '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A'

--Low
UPDATE ProfileVersionFieldValue
SET
	ListValue = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'
WHERE
	ListValue = '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D'
	AND ProfileFieldId = '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A'

--Medium 
UPDATE ProfileVersionFieldValue
SET
	ListValue = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'
WHERE
	ListValue = '99A6D8B5-EE90-4B7F-944C-3A005439EBC8'
	AND ProfileFieldId = '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A'

--High
UPDATE ProfileVersionFieldValue
SET
	ListValue = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'
WHERE
	ListValue = '90751241-41DD-493C-BDA2-84D8EFCBC02C'
	AND ProfileFieldId = '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A'

-- Question 9.6
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'F3064025-DFB1-45A8-A95A-C7800EBAE238'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'BD575F0E-C80E-43D1-B2D3-2C0E41AD84A3'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'E042D47F-39D9-4F68-96DC-99D10E1726A8'

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
'F5E12D2D-BD41-4251-8FC5-41B2BAF9AC7A',
'9C93AF64-7EF2-478D-8950-E9AAD2E71063',
'Methods to control to be determined',
1,
null,
null
)

-- Question 3.9 & 7.5
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'DF0A980E-93A1-40A0-9DAB-DA062CA12518'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '653BDC06-16FD-4C1D-8A3A-19CA465A95CB'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '72BCFA83-3AB0-448A-834A-310492FBF790'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '02E6950B-B083-477E-8DD6-8ECFC8AB822C'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = 'A363E67B-0F6C-4CEE-9CE8-D3EB363DBD4F'

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
'3A66A3C6-9BD3-4BEC-90C9-8EDD6B161CE1',
'2EA88BA1-A288-417E-A842-312824A6A544',
'Currently not known',
1,
null,
null
)

-- Question 3.14
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '1FFF026A-55A3-4605-94C2-F0DA0934E195'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'C66501CF-04FF-473A-B68D-3DCEFA02CD93'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'C1824D58-5133-4175-9E15-987D669A12E9'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '88F7EFE7-0729-4739-A9B7-7414FCDA0B7A'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = 'D6EDC88C-8E4D-48D3-8F86-3A09A2B6BC0B'

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
'7C017763-BF1A-4E17-8879-976BC8404030',
'B226B76C-2EE2-4E75-ACF1-398200246C1B',
'Currently not known',
1,
null,
null
)

-- Question 3.16
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'CDE9CFCE-858B-4A2E-A7D3-0DC60F7F5561'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '0E23EA69-BB46-4FD1-A08C-80C6CC5FE361'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'EDC719FE-7779-423B-AE67-5BFBA6001385'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '7EF7C332-55E9-4259-8F61-D6DEC9B28EA0'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = 'D21996E3-1C0C-4F53-9E84-15C082823768'

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
'214DD45C-9BF5-4A7E-9334-E9EE00F1B001',
'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
'Currently not known',
1,
null,
null
)

-- Question 6.4
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '0212EE8A-47FE-4BDC-96E9-73F678F82421'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '1F131F9F-5661-4B2F-8BA8-57A493D5107C'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '2A20BF1A-40C5-42D1-8F17-A420DBCC095E'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = 'A2D4889F-A7A3-4CEE-BC02-A942F46BC265'

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
'24831C33-54AD-4D7A-BBC2-8DCE96CE0D30',
'A9419166-D275-4315-ACBB-BC9B5423B179',
'Currently not known',
1,
null,
null
)

-- Question 6.6
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'B55776E4-E26E-4C68-8CDC-CD7C10F37EE9'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'D64E8B93-0E00-426C-9445-CEC04E6A9ED0'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'CAB7B8A2-14C4-411D-8C2C-B4FA7AE7564F'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '7D6CA5E2-3A20-4B8B-9271-F56379C75C6F'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = '2899BF4E-20D8-481B-84AD-0121F2479365'

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
'DDB4E7EE-2372-417A-A564-88930FA1A8BC',
'2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
'Currently not known',
1,
null,
null
)

--Question 6.7
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'EF1FB030-FB8F-401A-ACC0-3C422BCF99F8'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'EF3B2C4B-2CDA-4439-B727-D9F7201C5D38'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '53B882AD-67E8-474E-BF8C-250BB10D2B88'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '9994258C-1094-4D83-8FD9-65DB43B4D306'

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
'2A7C403E-314C-4AE3-A0DC-CCAD9A62FD35',
'439705E1-E95D-49BA-A858-76CF2CEDE3EE',
'Currently not known',
1,
null,
null
)

-- Question 6.8
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'DC28020B-33AA-4F50-9005-F9195A9D3181'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '081A172C-59C3-4ED5-9B90-243D99087D61'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '8FEBAB57-886A-4B87-A282-D4FF5CD5C34B'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '03E22E35-1572-452F-9440-DDA0ABDCE62E'

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
'6F739018-B9CE-493A-A0AD-78AC9D3D3992',
'A60612AB-6358-47B8-9700-794F91BB3198',
'Currently not known',
1,
null,
null
)

-- Question 6.10
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'A04C0746-DB86-4E59-841B-CE4967C300D2'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '35F7ADFB-D539-4E72-BB69-F30AA1304764'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '2445F71D-E1CF-4A16-9EC9-83F14786E18D'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = 'BFC48953-4F28-408B-B985-D358831CEA46'

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
'9B270386-3DBB-425E-82CB-DA1F2173384A',
'3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
'Currently not known',
1,
null,
null
)

-- Question 6.11 and 6.12
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '415344B3-AEF3-442C-86A4-95F75ADBAAFD'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '8E228F0A-A8EC-4814-AD9D-3A7A204BEC58'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '13EDF126-03B0-4DE3-84C8-5C13654AEDB9'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '8FB26ACF-6C66-4D1A-9F54-1B8632F1E01E'

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
'23739E56-687A-4872-84F9-2B5F434A01FD',
'1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
'Currently not known',
1,
null,
null
)

-- Question 7.1
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '87D51717-9102-4703-B1C7-A6DBAC191E49'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '1EFC101E-4DB6-4D74-B424-FD443815C81F'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'F10B4506-76AF-45CE-BBF3-093F30305C0E'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '98370339-ACD2-475A-B424-BFB18CC19CF5'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = 'B46CEA75-EC76-4093-A67E-90C5655ADA1B'

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
'D974A37B-40A3-4EDB-92F9-26A194BDDF9B',
'8187878C-68BF-4144-A3F6-B7B6DF8F7956',
'Currently not known',
1,
null,
null
)

-- Question 7.2
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '9E1E2348-5C73-4C63-B0B9-0182F9F4A99F'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'C8A862D6-FBC3-46CF-8665-C676BB1360FE'

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
'EBDC0D26-AF65-4CF5-B22E-7A5F72C49D30',
'D88C3775-DBF6-44C4-8965-961A1A616021',
'Currently not known',
1,
null,
null
)

-- Question 7.3
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'DA057A99-B389-48F0-8B2E-9638EA7289E1'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'C8583C83-8963-46AA-BDB1-69BAC5C93BB5'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'D792C4B9-0600-44D1-9B90-B6719D766386'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = '48B95319-292E-4069-9591-1691214FA31E'

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
'45171D3A-A787-4411-ABE6-37594F228386',
'37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
'Currently not known',
1,
null,
null
)

-- Question 7.4
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = '79F38057-3506-45AA-B8EA-28F380E3B93C'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = 'A26C90A8-7D17-4BC7-92DC-24E8AC8EBA2B'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = 'E7359232-2F8F-4574-824D-1A98EAA89676'
UPDATE ReferenceValue SET SequenceNumber = 5 WHERE Id = 'E51E525A-F92E-48A3-AC86-E61F47973932'
UPDATE ReferenceValue SET SequenceNumber = 6 WHERE Id = 'CA5CC3BB-AC4D-4556-BDD1-4824FDE03419'

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
'8EEBBBA6-C0B7-4CC0-8AB1-2FF4E31EF17C',
'0822FD49-7D73-480B-AE19-D70F7C3CC016',
'Currently not known',
1,
null,
null
)

-- Question 10.4
UPDATE ReferenceValue SET SequenceNumber = 2 WHERE Id = 'B84A92BD-74CF-4738-8227-3EDDD73974DB'
UPDATE ReferenceValue SET SequenceNumber = 3 WHERE Id = '554C5C8C-3831-4192-9B7F-9F04D4C1F9E5'
UPDATE ReferenceValue SET SequenceNumber = 4 WHERE Id = '5916D97C-CBE1-45FC-9ABC-C5266989B6DC'

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
'63EE752D-FA38-4598-A503-8A5C76795B0E',
'4472C9E5-9983-4E3D-9C92-00CB856991E3',
'Currently not known',
1,
null,
null
)


-- Update Prioritisation Values
-- RM08 maps to Q3.5

UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '81721769-28D7-4CC6-833B-0A13EE6419E8'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '110F8D51-AA98-44EC-ACE3-76E50A6484AD'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '9666527B-8FCC-40D3-B55B-98D0767D42ED'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'B54E600C-F565-4113-B4E7-4743F330B4EF',
'4CE1B0C9-F26B-4C92-B6B1-7C380A509966',
'Currently not known',
0,
1
)

-- RM02 maps to Q3.14
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'F837B749-ADB6-4406-ABBE-A625E03CFD4D'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '3D2519ED-129B-4177-86BE-30BD43670CD5'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '52678BB8-F12B-4C20-BBB7-F22C2CA60843'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'F8A1DCF2-8280-4E18-9DC9-5157835E34DD'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 6 WHERE Id = '602ADE34-4441-42CE-B62F-511FD6D36E93'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'9F3D486F-DC09-4048-B26C-FD698CE6B5A7',
'93FE637F-B831-4132-8A6B-1F71B803748A',
'Currently not known',
0,
1
)

-- PH08 maps to Q6.4
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '87F2DE81-A8C2-46A8-98D4-BAB53F2AFFF5'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '48F4B88E-3B76-4458-8998-FF9B8DA26113'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'E04CEB69-8E7A-4EA2-86DE-CF90FD422B79'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'F87B0EC2-2A9E-48AD-A230-D44AE1B87228'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'B9905567-6B4B-4BE8-B59F-3EDD09C7206D',
'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
'Currently not known',
0,
1
)

-- PH03 maps to Q6.6
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'F5197732-EC80-4263-AD61-6EFA7E2418D5'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = 'DE3513EC-1E11-44CA-9C8B-69166E94629E'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'C75CBB2C-F6B5-4EB6-A392-BD19A95522E2'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'EF41F8A0-B749-4706-B582-7A851D0A9C70'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 6 WHERE Id = '67822EAF-AC8F-4232-BFFC-B9D85A4A9269'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'49C5AD28-3C10-4F35-AEEF-95161FB6A76E',
'FBDBB16A-94CF-43B2-A664-678B628BBB52',
'Currently not known',
0,
1
)

-- PH02 maps to Q6.7
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '15A05868-368D-465F-A2DF-AB72A50E05DE'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '1BCE965F-924A-4C6D-A727-BADFF94991F9'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '10814717-0087-4F28-A5AE-60AF8A39A044'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '8547663B-5412-432B-8A1C-2874D9964720'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'DD5649E9-D399-44D5-8D64-FB47D3FC5612',
'36D7A0BD-FD41-4046-9531-B935EEC6A16D',
'Currently not known',
0,
1
)

-- PH10 maps to Q6.8
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'EE0CB900-B64F-401D-B623-4A25F90ECB8C'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = 'B3E5BCF1-51D3-4647-A684-E727C29174F6'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'EB4EBA14-D549-41C9-98B0-2C40AD31014F'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '4384071D-938A-4BBB-9330-C31B5BD049B1'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'46A881AA-5211-4F6A-B064-8D5338CC2543',
'198722DD-F904-4DA7-9CA2-0620B5EA82C2',
'Currently not known',
0,
1
)

-- PH01 maps to Q6.10
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '6044350A-650B-4A52-B636-CCAFAF797CEE'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '3A87D62C-522D-4211-9EDF-6D46CF98BB2C'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'DD43CF29-FE27-4393-A1C0-8F9C449016FA'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '21572EC1-37E2-4BCA-A820-D9B6909318EE'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'15A20A8F-BF58-4D46-BA35-81BC6D191783',
'4E481036-517F-4F31-9C45-CFCB1DF23BC3',
'Currently not known',
0,
1
)

-- PH06 maps to Q6.11
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '642875A8-C743-4257-9564-59E344AF5F63'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '41BC8459-DB8D-4607-B28C-282F481CE34F'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'CC631658-7780-4776-B9A4-AD64E5158478'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '0C78A9ED-3E90-47B2-ACE6-25C7E0C3F3C2'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'EFABC83F-2C0C-43D2-99D3-4B6DA6F7FEBF',
'39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
'Currently not known',
0,
1
)

-- PH07 maps to Q6.11
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '95C5ED9D-1701-4BC5-A647-A19CD27A4621'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '7E0CD769-64EA-444F-BBB8-96D51C82CE35'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'CDE47094-0B9C-4D1C-9937-D8E8395070E8'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'B16B855E-3FF4-4863-9386-517B8FAA55AC'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'48A8F6C6-DF5B-4A69-9F0A-823C0AB5A27C',
'6E223561-31D8-466A-8714-D990CFE63A1A',
'Currently not known',
0,
1
)

-- WS08 maps to Q7.1
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'F0088B67-EB07-43BC-A151-B8058CB30A9A'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '592E55F1-CB11-45B5-90F4-34C6337FE49D'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '69FB53C5-D420-4495-92B9-21C257BCEB78'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'DB2A0630-E96E-4964-A7B8-687736258CDB'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 6 WHERE Id = '8EB1A506-414F-4180-B4F4-A1EEAFFAB3CB'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'C15DA57B-C329-4758-A605-77C86FB97666',
'35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
'Currently not known',
0,
1
)

-- WS21 maps to Q7.2
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'B854BCE7-B226-4FA3-87D0-09A1AAA57DDB'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = 'A86C0C3E-8D78-4959-B622-298EF860500E'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'8DAA5509-A4E6-4375-9793-23AF91E7D948',
'11DECCAF-0945-4F7B-BD49-725854B3F1AF',
'Currently not known',
0,
1
)

-- WS22 maps to Q7.3
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'E395EFBA-1935-48CB-A506-CAA30196C692'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '0DBBA5A4-825F-4C32-B787-225A4923AEAF'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'A53707D6-9C6A-4115-875B-225B3A048189'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '4047855B-7B0B-4CE8-9B02-EF18FD0F8D9B'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'3DCF8EE5-CF6A-4BC8-9078-AAF8D9977A09',
'4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
'Currently not known',
0,
1
)

-- WS23 maps to Q7.4
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '09D02F5A-08BA-4185-BD3C-55602DF0AC44'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = 'E7CDBEC2-956C-4B5E-84E0-3D78C1632D5F'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'BD6DB44C-8EA3-4829-8F1F-1BE3478FCF6A'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'E9CCB6AD-AA4D-48EA-8850-B84CE40E02FF'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = '9496AD78-C1EE-4A2D-93D5-B8283BF393A7'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'00112179-F802-42D3-80B5-6DCA2F0A9668',
'E892598B-F369-4EC0-9C53-FBEB87F3745F',
'Currently not known',
0,
1
)

-- WS24 maps to Q7.5
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '3261CD19-195D-40E3-8E0C-742201E6032E'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '08195E05-4E72-4296-893C-85C095BDA188'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'E7D25100-CAC4-4FF6-BDB2-37329EFADB01'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 5 WHERE Id = 'B919B54E-B775-4DCE-B669-21CFB267746D'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 6 WHERE Id = '3FE2510C-F1AA-458E-8649-F27DE2B4C456'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'0257F6F1-D4AE-4BEC-9046-887C9A170A57',
'649082D2-788F-4F41-A623-3C2A4E1B39AB',
'Currently not known',
0,
1
)

-- RM11 maps to Q9.3
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'FAF52C5A-F1BA-4E4C-9570-3E2894A07A86'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '8FFB3704-11CE-4C17-A284-6AA354E3D391'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '51EE3CEC-441E-40C3-BC1A-E50E263A1BC0'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'3849B9A0-4279-4BC0-8335-977AF7A2CE3B',
'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B',
'Methods to control to be determined',
0,
1
)

-- GO01 maps to Q9.5
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = 'A0E526C7-7E0F-4DB2-8D61-7FDA5CA984F1'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '0678FDC0-AD43-4666-8582-321D610DD80D'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '1593C7B2-7902-41A5-AE49-539182CB22BB'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'B9FCA036-9A96-4952-9A3A-69BB5BCE3840',
'32C8D025-DA02-4B5B-8EB3-FF12825C24EE',
'Methods to control to be determined',
0,
1
)

-- GO02 maps to Q9.6
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '5A21E61F-0A60-4098-AD70-5A7DEC1599EC'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = 'AD613DB8-CF9B-4D84-A905-A8FFC0069DFF'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = '662807AE-8170-4BC1-BB29-072B7571E4B3'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'482AE572-4F2E-41AD-B251-586E76BCB0F7',
'D4C5DDCE-0ED3-45C8-9A26-CF01B8D7A853',
'Methods to control to be determined',
0,
1
)

-- RM03 maps to Q9.9
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '8700AC07-460A-4BD7-8D85-7218E72515A1'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '83B485E8-A4F8-46FD-998A-6790D9C9DA9C'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'F50492E2-F619-4B0E-A7D6-3230F6A75B51'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'6951D16D-101D-4C81-BF96-C4E441DBAEF0',
'5F1196DB-7CC8-45DB-93AB-AFD355DF841C',
'Methods to control to be determined',
0,
1
)

-- RM04 maps to Q9.10
UPDATE PrioritisationCriterionValue SET SequenceNumber = 2 WHERE Id = '410941F2-03FB-4680-9681-AAA7A4A1976B'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 3 WHERE Id = '70B4130C-A593-4D8D-82C7-0D0E433D489D'
UPDATE PrioritisationCriterionValue SET SequenceNumber = 4 WHERE Id = 'F121B021-6155-48B6-86A5-597683B6B198'

INSERT PrioritisationCriterionValue
(
[Id],
[PrioritisationCriterionId],
[CriterionValue],
[Score],
[SequenceNumber]
)
VALUES
(
'92D3ABD0-5A42-4D57-BCC4-819B58EAE821',
'D5E06EA0-8917-427C-81D1-DA362A557433',
'Methods to control to be determined',
0,
1
)

--Question 4.1
INSERT [ReferenceTable]
(
[Id],
[Name],
[IsMaintainable]
)
VALUES
(
'5CC27777-30D8-476E-AF52-61DB783348EF',
'Infectious',
0
)

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
'914D7724-6C52-4EB0-81BE-D0AC855692D3',
'5CC27777-30D8-476E-AF52-61DB783348EF',
'Currently not known',
1,
null,
null
)

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
'1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F',
'5CC27777-30D8-476E-AF52-61DB783348EF',
'Yes',
2,
null,
null
)

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
'0EA78369-2E20-4946-A4C2-8170771AA0EE',
'5CC27777-30D8-476E-AF52-61DB783348EF',
'No',
3,
null,
null
)

-- Update the field for question 4.1
UPDATE ProfileField
SET 
DataFieldTypeId = 'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
ReferenceTableId = '5CC27777-30D8-476E-AF52-61DB783348EF'
WHERE 
Id = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'

--Update existing field values 
--Maps the boolean = 1 to YES
UPDATE ProfileVersionFieldValue
SET
ListValue = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE
ProfileFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'
AND BooleanValue = 1

--Maps the boolean = 1 to NO
UPDATE ProfileVersionFieldValue
SET
ListValue = '0EA78369-2E20-4946-A4C2-8170771AA0EE'
WHERE
ProfileFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'
AND BooleanValue = 0

--Sets all the boolean flags to 0
UPDATE ProfileVersionFieldValue
SET
BooleanValue = 0
WHERE
ProfileFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'

-- Update the irrelevance rules on the questions 4.2, 4.3, 4.4, 4.5, 4.6, 4.7 
UPDATE ProfileQuestion
SET	
	IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE
	IrrelevanceFlag = 1 AND
	IrrelevanceFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'

UPDATE ProfileQuestion
SET
	IrrelevanceValueId = '0EA78369-2E20-4946-A4C2-8170771AA0EE'
WHERE
	IrrelevanceFlag = 0 AND
	IrrelevanceFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'

UPDATE ProfileQuestion
SET
	IrrelevanceFlag = NULL
WHERE 
	IrrelevanceFieldId = 'C2D1CB84-B085-4A7F-9F2E-4702F8D81EA6'
	
-- Update the irrelevance rules on the profile questions in section 4 to ensure that when the 
-- "Currently not known" option is selected only question 4.1 and question 4.7
UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '0EA78369-2E20-4946-A4C2-8170771AA0EE'
WHERE Id = '071CE906-B107-4A4B-AE7E-F51BA347877D'

UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE Id = 'E504EAB2-4401-4DA7-B619-C45F564DD547'

UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE Id = '21D1F795-DD4A-4F41-8C41-CDB28F668568'

UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE Id = 'F4976393-AC74-4B6E-92C7-BC71E4028CA8'

UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE Id = 'D1F5C0C2-693C-48EC-874E-728A05F4FD70'

UPDATE [ProfileQuestion]
SET
IrrelevanceFlag = 1,
IrrelevanceValueId = '1EEA38E6-FAE2-4D30-9313-BD3F4F6DEE2F'
WHERE Id = '7C1FF790-3117-40F5-B71C-A2DD7433BDFB'


