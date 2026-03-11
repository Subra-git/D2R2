 UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '0-2% / Negligible'
WHERE
	[CriterionValue] = '0-2%' 
	
 UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '>2-10% / Very low'
WHERE
	[CriterionValue] = '>2-10%' 

 UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '>10-20% / Low'
WHERE
	[CriterionValue] = '>10-20%' 

 UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '>20-50% / Medium'
WHERE
	[CriterionValue] = '>20-50%' 

 UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = '>50% / High'
WHERE
	[CriterionValue] = '>50%' 
GO

ALTER TABLE [PrioritisationCategory]
ALTER COLUMN [Modifier] decimal(25,10) NOT NULL
GO
