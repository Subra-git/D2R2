-- CR80:
-- Updates a PrioritisationCriterion item's name to update the text shown on the Summary Prioritisation Report

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Number of human cases in GB attributable to exposure to animals or animal products from GB'
WHERE
	[Id] = 'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD'
	
IF @@ROWCOUNT <> 1 
	RAISERROR('Could not update PrioritisationCriterion', 16, 1)