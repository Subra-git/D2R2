/* Work Item 3591 - change title of question 11.6 */
UPDATE
	[ProfileQuestion]
SET
	[Name] = 'Potential for restricting impact on exports to third countries by regionalisation/zoning or compartmentalisation'
WHERE
	[Name] = 'Potential for restricting impact by regionalisation/zoning or compartmentalisation' 

/* Work Item 3615 - Prioritisation criterion IT11 should not contain "Not commercial" option */

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for restricting impact on exports to third countries by regionalisation/zoning or compartmentalisation'
WHERE
	[Name] = 'Potential for restricting impact by regionalisation/ zoning or compartmentalisation' 

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = 'CA8E4B35-7D66-411D-ADD4-8AFE2D04A263' AND -- IT11/Low
	[SequenceNumber] = 2

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 2
WHERE
	[Id] = 'F46F6E58-D339-4C5B-9317-F9728820CCA4' AND -- IT11/Medium
	[SequenceNumber] = 3

UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = 'BA0DF663-B6BB-46C9-92D9-C48B83C0AD73' AND -- IT11/High
	[SequenceNumber] = 4
	
DELETE FROM
	[PrioritisationCriterionValue]
WHERE
	[Id] = '5DF88CD9-3C75-4912-819E-1FB43AA5B843' -- IT11/Not commercial

	



