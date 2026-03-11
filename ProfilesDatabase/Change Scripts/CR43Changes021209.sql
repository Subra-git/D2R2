
--CR-043 
-->0-2%
UPDATE ReferenceValue
SET LookupValue = 'Negligible'
WHERE Id = '629F113D-1E78-4107-97A4-B1FF0F9E3BF1'

-->2-10%
UPDATE ReferenceValue
SET LookupValue = 'Very Low'
WHERE Id = '5686922C-10B6-4B3D-9923-7482B1C43ECE'

-->10-20%
UPDATE ReferenceValue
SET LookupValue = 'Low'
WHERE Id = '6E2DD137-4224-4FAB-BE6D-4D4DBC6568B0'

-->20-50%
UPDATE ReferenceValue
SET LookupValue = 'Medium'
WHERE Id = '83961ACE-E015-4B25-BE81-94A075C13F9E'

-->50%
UPDATE ReferenceValue
SET LookupValue = 'High'
WHERE Id = '97748F1B-9F7B-4C02-983E-C174300B323E'

--Updates the RE01
-->2-10% / Very low
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'Very low'
WHERE Id = '32cd2eda-a410-4aa3-a414-27d97f413416'

-->50% / High
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'High'
WHERE Id = '80b1562a-d736-4e3d-9d09-462075a40dc1'

-->20-50% / Medium
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'Medium'
WHERE Id = '05bce82c-1b97-436f-b3c2-d13d161d8503'

-->0-2% / Negligible
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'Negligible'
WHERE Id = '3751a821-c729-4dd5-9afe-e0cccaf94fe9'

-->10-20% / Low
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'Low'
WHERE Id = '4c419848-fe7d-4fdf-8321-ff805a898760'

--Question 7.2
-- Updated 'Very Low' to 'Some'
UPDATE ReferenceValue
SET LookupValue = 'Some'
WHERE Id = 'C8A862D6-FBC3-46CF-8665-C676BB1360FE'
 
UPDATE PrioritisationCriterionValue
SET CriterionValue = 'Some'
WHERE Id = 'a86c0c3e-8d78-4959-b622-298ef860500e'

--Correct to species question
--Inclusion of '/' in animals/commodities
UPDATE
	[SpeciesQuestion]
SET
	[Name] = 'Annual level of export consignments containing animals/commodities of this species/group sent into third country trade'
WHERE
	[Id] = '22dce389-3d60-4f35-a58b-186e0b8b32ba'