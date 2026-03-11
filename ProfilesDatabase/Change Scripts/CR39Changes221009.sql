--CR39 Changes
ALTER TABLE [PrioritisationCategory] ADD [DisplayName] VARCHAR(100) NOT NULL DEFAULT ''
GO
ALTER TABLE [PrioritisationCategory] ADD [SequenceNumber] INT NOT NULL DEFAULT 1
GO
ALTER TABLE [PrioritisationCategory] ADD [IsVisibleOnSPR] BIT NOT NULL DEFAULT 1
GO

UPDATE [PrioritisationCategory] 
SET	
	[DisplayName] = 'Public health', 
	[SequenceNumber] = 1
WHERE [Name] = 'Public health'

UPDATE [PrioritisationCategory] 
SET	
	[DisplayName] = 'Welfare',
	[SequenceNumber] = 2 
WHERE [Name] = 'Welfare'

UPDATE [PrioritisationCategory] 
SET	
	[DisplayName] = 'Wider society',
	[SequenceNumber] = 3 
WHERE [Name] = 'Wider society'

UPDATE [PrioritisationCategory] 
SET	
	[DisplayName] = 'International trade',
	[SequenceNumber] = 4 
WHERE [Name] = 'International trade'

UPDATE [PrioritisationCategory] 
SET	
	[DisplayName] = 'Risk and mitigation',
	[SequenceNumber] = 5	
WHERE [Name] = 'Risk and epidemiology'

UPDATE [PrioritisationCategory] 
SET	[DisplayName] = 'Opportunity to enhance risk mitigation and/or understanding',
	[SequenceNumber] = 6,
	[IsVisibleOnSPR] = 0 	
WHERE [Name] = 'Potential to add value' 






