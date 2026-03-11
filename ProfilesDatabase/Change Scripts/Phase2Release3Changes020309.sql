--3998
UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='VLA',
	[SequenceNumber]=1
WHERE
	[Id]='52C7B2FF-2D50-4F9A-BBBA-6B01CCFE6270'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='SAC',
	[SequenceNumber]=2
WHERE
	[Id]='DB08DC04-600D-4AC8-8FA3-967F6561DD59'

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'94E5B52E-AE1F-4E27-9967-A67C3DC79869',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'DARD',
	3,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'53E1B307-7914-4EE1-A29A-D9EBD92B6F81',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'CSL',
	4,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'D64F3AC6-04D0-4DED-9DB0-55B7F813A940',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'CEFAS',
	5,
	getdate()
	)
INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'55BD2EE6-6832-471E-85FE-03B18F5BD1F3',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'HPA',
	6,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'86A8B568-DAEF-4CDB-8F69-48F3CDE10AB5',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'Private labs.',
	7,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'DD3A8F80-6E62-4064-BF43-FA98CC503287',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'AHT',
	8,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'CA75ED03-F6AA-4808-A4A1-CCB15F2B44E6',
	'67CF4CCF-AB56-4167-9636-7EF21D4989A5',
	'Classified information',
	9,
	getdate()
	)
	
UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='Blood',
	[SequenceNumber]=1
WHERE
	[Id]='18CF3879-4231-4DB8-A3D8-120760944002'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='Milk',
	[SequenceNumber]=2
WHERE
	[Id]='4B5AE21D-B7A4-4981-8238-768E2B0BA985'

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'5679E013-E116-405F-940A-3727D4623463',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Faeces',
	3,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'64F6A3AB-8C43-47FD-B424-FC72026A069B',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Semen',
	4,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'F6AB247B-9B26-4E78-B5DF-7660CBDD8466',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Urine',
	5,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'CB41E2F4-0091-4FDA-A307-23F2A3ADD22A',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Eggs',
	6,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'02B2147F-89C5-46E7-8A36-8DACC3A9F2A5',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Vector sampling',
	7,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'B878FED5-C58F-4A83-942D-AF5847644229',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Biopsy',
	8,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'D6796EB2-AB8C-4794-A831-CD3786430E5C',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'PME gross',
	9,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'79BF22A6-21A6-4AB2-8E51-88BBFD405D87',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'PME material',
	10,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'C74CF160-A746-4D86-B6DE-4E05153C2604',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Probang',
	11,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'BBDEBD2B-F2E9-4C2E-9D2C-6C808210ED57',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Skin scrape',
	12,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'17C3E61C-39B7-47E5-91C1-8590EFEA2E12',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Hair',
	13,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'99B19A9C-B19C-4A0E-AC10-1C1F97D863A9',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Parasite collection',
	14,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'9DE35D48-D023-464C-9A1D-C021C19EFE31',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Non vector',
	15,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'30F99AC5-7CA6-44EB-A0C4-546A460BE496',
	'4050839D-DBAF-4418-ADBA-82AE11BFED31',
	'Other',
	16,
	getdate()
	)
	
UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='Farmer/owner',
	[SequenceNumber]=1
WHERE
	[Id]='242A5E69-BF70-4B47-B62B-0636B3164F89'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='Private Veterinary Surgeon',
	[SequenceNumber]=2
WHERE
	[Id]='95381F46-17AA-4644-9E57-6F693EE3B022'

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'7BC2C13F-64E6-4577-B78E-FCB595BBDC54',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Government Veterinary Surgeon (to exclude LVIs/Ovs)',
	3,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'22B18CDF-45F5-4EAF-9870-B15178647EC9',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Government Laboratory',
	4,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'AC317584-0631-4D2B-A402-6EC9EF325FA1',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Private Laboratory',
	5,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'C5BC95F5-E0A1-4A29-8A4A-113235D7C15C',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Abattoir',
	6,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'E7208711-B328-4823-9F09-5FE446C715AD',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Human Surveillance Network',
	7,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'2CB7E33D-33FB-4E99-AA95-429C7AC0C7F2',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Fallen stock scheme',
	8,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'74EF60D7-3C46-4552-BBDE-A7D9EBBFDF99',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Food chain information forms',
	9,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'828F492C-3F53-4E90-AF22-5C0DEF27ADCA',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Sentinels',
	10,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'C267E99F-9998-442F-BA9D-0B8210F20EAB',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Environmental sampling (incls vectors)',
	11,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'E6223F36-FF12-4A0B-95AA-9E5CC3E309FF',
	'D9454EC0-B389-4B2F-8CAE-A02E70F3D6B3',
	'Other',
	12,
	getdate()
	)

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='VLA',
	[SequenceNumber]=1
WHERE
	[Id]='F4D88428-FACB-48C5-80D1-161E7300817F'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='SAC',
	[SequenceNumber]=2
WHERE
	[Id]='AC356F62-2675-4C34-B40C-FB580D9D5D1D'

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'5EBB01BA-A5D7-4ACB-B0A4-3E80E23FDE12',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'Private commercial laboratory',
	3,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'65A417B7-2BCE-4487-9510-7862026836E5',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'Veterinary practice lab',
	4,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'ACFCE842-0B0B-4766-8102-7603949C746E',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'AH/ EMI/ DHI',
	5,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'1435242D-E9E5-41C9-A4B6-053B32517747',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'CSL',
	6,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'556988F8-689C-421F-B35C-CAF9E42BF8F6',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'VMD/ LGC',
	7,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'55E2FC00-32C0-4A99-AA90-CC4CB6659A1D',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'DARD',
	8,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'B4FADA3E-57C5-4873-BA4D-8B4939DB915B',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'RSPB/ bird reserves',
	9,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'94206FB6-7976-4EBC-8845-545AA9DD61D7',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'FSA/ MHS',
	10,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'447121C6-B85C-4150-8DCB-0906215C5D95',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'CEFAS',
	11,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'7CCDC575-C716-42DF-B009-BB0B913BBFDD',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'Institute of Zoology',
	12,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'5291C071-311F-4006-BDFF-70502C1CB60E',
	'46A88759-A81C-44F2-9CBD-D1B45F8A7FDB',
	'Animal Health Trust',
	13,
	getdate()
	)

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='CVO Report (Annual)',
	[SequenceNumber]=1
WHERE
	[Id]='CCDCA091-320D-401A-A4E4-70FD1CF14EA2'

UPDATE
	[dbo].[ReferenceValue]
SET
	[LookupValue]='OIE (Annual)',
	[SequenceNumber]=2
WHERE
	[Id]='BFACA19A-9079-46FD-B6A9-E27D9E094A1C'

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'BB7789A5-94C7-48B4-86D4-B12C9888F490',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'UK zoonoses report (Annual)',
	3,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'A51D3B71-5FC7-47EE-B19D-DBE160D0136C',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Quarterly surveillance reports, e.g. VLA report',
	4,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'6C3739D6-A795-43DC-87D4-E3628E68CD55',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Monthly reports (Vet record etc)',
	5,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'BBF4FD55-4800-4BCB-873C-1A72F599EC20',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Scientific publications (Ad-hoc)',
	6,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'3096F985-FD57-446C-A765-9EF31AB948DD',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Defra web pages',
	7,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'DC95B0E5-7DD4-42E7-BB22-2CFBDCADF0D3',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Other web pages',
	8,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'BD06FA6E-1993-419C-8276-545B419290DA',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Farming Link -Defra''s magazine',
	9,
	getdate()
	)

INSERT INTO
	[dbo].[ReferenceValue]
	(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber],
	[EffectiveDateFrom]
	)
VALUES
	(
	'8C61D574-4A9D-48C0-8339-255BA4AC6062',
	'6FDF6590-D610-4200-B3EA-128A5BB838E2',
	'Other',
	10,
	getdate()
	)
	
--System test bug: 4102
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