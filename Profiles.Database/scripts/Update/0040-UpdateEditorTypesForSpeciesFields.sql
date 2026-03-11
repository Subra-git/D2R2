--3 Animal locations and number
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Holdings in GB Comments' --3.1
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Animals In GB Comments' --3.2
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Holdings That Keep Mixed Species Comments' --3.3

--4 Bio-security
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Assurance Schemes Apply To Livestock Of Species Comments' --4.8

--5 Surveillance
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Level Of Carcase Submissions Commments' --5.1
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Government Testing Comments' --5.2
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Samples Collected Routinely For National Govt Schemes Comments' --5.3 (1)
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Samples Collected Routinely For Local Govt Schemes Comments' --5.3 (2)

--6 International trade
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Commercial Trade Comments' --6.1
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Importance Of Export Trade Comments' --6.2
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Impact On Level Of Imports Comments' --6.3
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Impact On Intra Community Flows Comments' --6.4
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Impact On Third Country Flows Comments' --6.5
update [SpeciesField] set EditorFieldType = 1 where ShortName = 'Export Market Value Comments' --6.6
