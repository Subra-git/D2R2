 
 /* Add Note to ProfileSection so it can be displayed in the Full profile report*/
 ALTER TABLE
  [ProfileSection]
  ADD [Note] text NULL
  GO
  
UPDATE
	[ProfileSection]
SET
	[Note] = 'Note: the type (if any, which is dependent on the profiled disease or issue) and efficiency of disease surveillance varies between countries, so a lack of reports of the presence of a disease or issue in a country or region may not mean the disease is absent. Furthermore, in some species infections may not cause disease, and so infection may be present but not apparent. Detecting infection in these circumstances, particularly in wildlife species may be difficult.'
WHERE
	[ShortName] = 'Geographic Distribution'

UPDATE
	[ProfileSection]
SET
	[Note] = 'Some infections or issues being profiled have no effect on welfare. Therefore there may only be an entry for the first and last questions in this section.'
WHERE
	[ShortName] = 'Animal Welfare'
	
UPDATE
	[ProfileSection]
SET
	[Note] = 'Some infections or issues being profiled have no effect on human health. Therefore there may only be an entry for the first and last questions in this section'
WHERE
	[ShortName] = 'Human Health'
GO