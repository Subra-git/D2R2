 --3856
ALTER TABLE [dbo].[User]
	ADD [IsUserManagementSystem] bit
GO

UPDATE [dbo].[User] SET [IsUserManagementSystem]=0 WHERE 1=1
GO

ALTER TABLE [dbo].[User]
	ALTER COLUMN [IsUserManagementSystem] bit NOT NULL
GO

ALTER TABLE [dbo].[User] ADD DEFAULT 0 FOR [IsUserManagementSystem]
GO

ALTER TABLE [dbo].[User]  
	WITH CHECK ADD CONSTRAINT [CK_User_Management] 
	CHECK  
		(
		[IsUserManagementSystem]=(0) OR 
		([SsoUserId] IS NULL AND 
		[IsProfileEditor]=(0) AND 
		[IsPolicyProfileUser]=(0)))
GO

INSERT INTO [dbo].[User]
			(
			[UserName],
			[FullName],
			[Organisation],
			[IsProfileEditor],
			[IsPolicyProfileUser],
			[SsoUserId],
			[IsUserManagementSystem]
			)
     VALUES
           (
			'SsoService',
			'SSO Windows Service',
			'Defra',
			0,
			0,
			null,
			1
			)
GO

--3949
UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Current Surveillance Mechanism'
WHERE
	[Id] = '955136C5-70EB-417D-8938-05D454EC2CD1'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Purpose And Detail Comments'
WHERE
	[Id] = 'E6F6A44B-FE78-4C28-B37B-2E9094A58E59'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Contractor Supporting Comments'
WHERE
	[Id] = '69DFF2E9-FDC7-487E-9983-321E22B35939'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Cost Of Improvement Comments'
WHERE
	[Id] = 'CAC5500E-1BEE-4806-8000-C5B0D6084403'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Event Cost Comments'
WHERE
	[Id] = '1813484A-6659-4A9A-AB68-C452D4D72D4C'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Sensitivity Comments'
WHERE
	[Id] = '7DCDF1A5-86AC-4054-8C80-942A6C4E65D6'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Specificity Comments'
WHERE
	[Id] = '6143E8AC-523A-4BEF-851B-1E9D4C8993F9'

UPDATE
	[dbo].[ProfileField]
SET
	[ShortName]='Time To Be Brought To Attention Comments'
WHERE
	[Id] = 'EBA52A78-FFE0-40AF-9397-928FAA7CBE9D'

--3986
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='43BFFEF6-0BE7-4C5E-908A-D81D0CFC8466'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=5
WHERE
	[Id]='7FFD837E-7E01-43C6-9B3A-CB8E72D6699A'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=15
WHERE
	[Id]='2E9BAE66-AA58-4B6E-A2B1-D349C499410E'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=30
WHERE
	[Id]='C5C53FE4-09CA-4D88-AFCE-D3B9A6CEF562'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=45
WHERE
	[Id]='334904BB-758C-4AEF-8E8C-66FEF8DA1763'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=75
WHERE
	[Id]='DA45A1E0-4411-4891-82DF-60BB75AB5EC0'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=95
WHERE
	[Id]='B87D6FE8-6031-4B03-A763-13C80BCC117E'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=100
WHERE
	[Id]='69F57147-149C-4F7E-8841-AF61B6D3171A'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='9332C010-117C-42F9-91C2-8CC6A837C34B'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=10
WHERE
	[Id]='E97B64FD-AAB1-48B4-BBF5-99826B5D9EA9'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=30
WHERE
	[Id]='CCF031DA-630B-46FE-89AD-6826627F0A17'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=45
WHERE
	[Id]='AE63210A-8AA6-4C2D-8168-5620FB44A6F6'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=70
WHERE
	[Id]='6E1B40C5-8DE9-48D5-BB3A-4A1697780559'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=95
WHERE
	[Id]='CD9FF046-7535-4F1A-A750-CD2D05782A45'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=100
WHERE
	[Id]='1771AE1C-0033-4B9C-ACD4-18EC1D800DA2'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=5
WHERE
	[Id]='55F81B25-5229-4600-B614-9C8FE41B2669'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=21
WHERE
	[Id]='CD26F90F-0B59-4999-8B95-6929C08867C6'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=42
WHERE
	[Id]='4B6C25D3-7FB5-4EE9-A7D3-F39C8366AB59'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=54
WHERE
	[Id]='219197A1-8569-40E1-96FC-27E4C91C8A89'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=1
WHERE
	[Id]='4199EAA5-484D-4803-800C-CBE01C6733DF'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=6
WHERE
	[Id]='9015130A-ED26-4EFC-B2B4-F439F0EA9ED7'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=36
WHERE
	[Id]='5E5E043C-B1F7-46C2-A02F-D5EA1006856A'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=40
WHERE
	[Id]='3F9C1779-D361-4954-9F8D-0B7D8DE798D0'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='63F569AA-05D3-4FA8-9F54-CF4831C06202'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=3
WHERE
	[Id]='6FC6D0CD-A27D-4379-9146-ED910B9F9F7E'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=6
WHERE
	[Id]='0EADE30D-EEBB-4DF8-8224-0A0D3D341A28'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=20
WHERE
	[Id]='88AD7510-9D77-474A-B3C5-5FC32B98F380'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=14
WHERE
	[Id]='1AA0FA83-85F5-40AD-9063-DB509C474FBC'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=8
WHERE
	[Id]='7CE33D07-215C-409E-97F8-0D887A102035'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=4
WHERE
	[Id]='1863F784-13CA-4776-BBB2-18C6FB37A356'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='657DE796-84EA-462A-BBE0-5793B15BC3D0'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=20
WHERE
	[Id]='4AEA7953-2AA2-4B49-8163-7F08DF659158'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=10
WHERE
	[Id]='1126EE7B-DCC0-451E-B737-0A98D5228380'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='55CE9EC8-6216-4E79-B530-AD85255F272F'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=10
WHERE
	[Id]='FE917497-6973-4A85-9864-F144B3CF604D'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=5
WHERE
	[Id]='8FBB4F15-0A78-49D1-9758-681300149F10'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='41C85CC9-693F-40E1-8136-133C57FBA9C9'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=12
WHERE
	[Id]='CA4D1FD9-28E5-46F2-A61E-8F7FB1BE528B'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=4
WHERE
	[Id]='EC0FCFC0-9C37-4B85-B3D1-9952323202BD'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='01489A5C-8832-495E-999E-55DD41FB7D50'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=12
WHERE
	[Id]='A3A9BB98-33A6-4941-B950-6D6E6891FE2A'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=6
WHERE
	[Id]='036FC533-DFDE-46E8-8DB2-0D0BAA185B5D'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='9E2CB5E6-9D08-4D8B-ABC1-2F060F678F9F'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=10
WHERE
	[Id]='C3119628-A34D-4AA7-BC3C-34ACFBBD7277'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=9
WHERE
	[Id]='1254C1EC-F09E-4910-B8FE-8CE97630E63B'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=8
WHERE
	[Id]='7B7CAA3D-76A8-4859-97C8-5BAA3B7FF561'
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=5
WHERE
	[Id]='37E9AE5E-CD3A-4778-9676-3C1ABC2847DE'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='EEB6110A-EC25-444B-A485-F454BBC80849'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=10
WHERE
	[Id]='334F777F-C85B-4777-B4DC-2DB192CA7453'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=4
WHERE
	[Id]='BF543DAA-1E3A-4373-938B-6BBEE238C0C2'
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=8
WHERE
	[Id]='EB02462E-DA86-4E38-BBF6-87AB1640917B'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='6DE79C7E-90CE-4CBB-A2AF-A6AFD960E0C9'
	
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=6
WHERE
	[Id]='EE8C079D-99B1-4A6B-B627-92ADCE59BA82'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='3F7C69F7-86B2-404B-8385-BF808AF5D32E'
UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='B3AC4488-FD5A-4C01-B7CD-FBBCF0FC00FF'

UPDATE
	[dbo].[SpeciesPrioritisationCriterionValue]
SET
	[Score]=0
WHERE
	[Id]='052057D4-9CF3-46D2-921B-8AFAF367A9F2'
	
--3762
UPDATE 
	[dbo].[ReferenceValue]
SET
	[LookupValue]='£0 - £99k'
WHERE
	[Id]='F7783E73-4304-4ED7-944F-29C50F3E29F3'
		

UPDATE 
	[dbo].[ReferenceValue]
SET
	[LookupValue]='£100k - £999k'
WHERE
	[Id]='4C05C981-D3B2-43E6-BFD3-12E6B1FAA253'

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'FA765481-DEF1-40E0-858B-6C231EB7AD2B',
	'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
	'£1m - £5m',
	3
	)

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'D52BF15D-8AB7-4F03-AE17-02D4739D2F31',
	'A975CDF0-CAE1-4E14-B524-F94A8405A4E7',
	'> £5m',
	4
	)


UPDATE 
	[dbo].[ReferenceValue]
SET
	[LookupValue]='£0 - £9.99'
WHERE
	[Id]='B101D4D4-D6E7-49A3-8EC5-373A4639C6C8'
		

UPDATE 
	[dbo].[ReferenceValue]
SET
	[LookupValue]='£10 - £19.99'
WHERE
	[Id]='0E13C6E6-F068-4E1A-AE68-43B3566BC139'

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'264B816F-1E73-43C3-ADDC-34FB72506EFE',
	'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
	'£20 - £49.99',
	3
	)

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'192D84FA-ECC2-4E30-99AB-59F0A1E3371A',
	'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
	'£50 - £99.99',
	4
	)

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'B745A8B0-3ADA-4D5F-9922-1C1BB2FB2B66',
	'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
	'£100 - £200',
	5
	)

INSERT INTO
	[dbo].[ReferenceValue] 
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
	)
VALUES
	(	
	'41389D87-8B55-4F36-9706-97287545F759',
	'C7CFC85C-8E77-4A28-9FBD-3B3C63630E55',
	'> £200',
	6
	)
	
UPDATE
	[dbo].[ReferenceTable]
SET
	[Name]='Data Source'
WHERE
	[Id]='D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3'

UPDATE
	[dbo].[ReferenceTable]
SET
	[Name]='Sample Type'
WHERE
	[Id]='4050839D-DBAF-4418-ADBA-82AE11BFED31'

UPDATE
	[dbo].[ReferenceTable]
SET
	[Name]='Surveillance Outcome'
WHERE
	[Id]='6FDF6590-D610-4200-B3EA-128A5BB838E2'