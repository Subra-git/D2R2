---------------------------------------------------------------------------------------------
--- CR62Changes010311.SQL
--------------------------------------------------------------------------------------------- 

-- new row in profile section (x 1)

IF NOT EXISTS (SELECT * FROM [ProfileSection] WHERE [Id] = 'D85BF083-763D-45C6-B52F-AFFEF7728C67')
BEGIN
INSERT INTO [ProfileSection]
(
[Id],
[Name],
[ShortName],
[SectionNumber],
[Note]
)
VALUES
(
'D85BF083-763D-45C6-B52F-AFFEF7728C67',
'Farming significance',
'Farming significance',
17,
NULL
)
END

-- new questions (x 9)
IF NOT EXISTS (SELECT * FROM [ProfileQuestion] WHERE [Id] = '9BEC10CA-B8CD-442A-B8AA-02C13437A5B9')
BEGIN
INSERT INTO [ProfileQuestion]
(
[Id],
[Name],
[ShortName],
[ProfileSectionId],
[QuestionNumber],
[IsPerSpecies],
[IsRepeating],
[UserGuidance],
[IrrelevanceFieldId],
[IrrelevanceValueId],
[IrrelevanceFlag],
[NonTechnicalName]
)
VALUES
(
'9BEC10CA-B8CD-442A-B8AA-02C13437A5B9',
'17.1Name',
'17.1Name',
'D85BF083-763D-45C6-B52F-AFFEF7728C67',
1,
0,
0,
'17.1UserGuidance',
NULL,
NULL,
NULL,
'17.1NonTechnicalName'
)
END

-- new Fields (x 17)

