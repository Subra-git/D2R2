-- Changes for CR-086
--

-- Add field to Section Review Frequency
IF NOT EXISTS (SELECT * FROM [luSectionReviewFrequency] WHERE [Id] = '88ACD25D-2729-4737-83C9-421F3CA64167')
BEGIN     
	INSERT INTO [luSectionReviewFrequency]
	VALUES ('88ACD25D-2729-4737-83C9-421F3CA64167','Every 5 years','5')        
End

-- Remove a field from Section Review Frequency
IF EXISTS (SELECT * FROM [luSectionReviewFrequency] WHERE [Id] = '37481649-5986-47E8-B91D-BD73EBB479EB')
BEGIN     
	DELETE
	FROM [luSectionReviewFrequency]
	WHERE Id='37481649-5986-47E8-B91D-BD73EBB479EB'        
End

-- Update sequence numbers for Section Review Frequencies and change Annually to every 1 year
BEGIN     
	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[luSectionReviewFrequency]
	SET [SequenceNumber]= 1
	WHERE [Id]='EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB'

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[luSectionReviewFrequency]
	SET [SequenceNumber]= 2
	WHERE [Id]='06788E48-149B-4B04-8EB6-40104E174E12'

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[luSectionReviewFrequency]
	SET [SequenceNumber]= 3
	WHERE [Id]='90D4AC32-2598-49B5-A3A8-9F1A5F854ED7'

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[luSectionReviewFrequency]
	SET [SequenceNumber]= 4
	WHERE [Id]='88ACD25D-2729-4737-83C9-421F3CA64167'  

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[luSectionReviewFrequency]
	SET [LookupValue]= 'Every year'
	WHERE [Id]='06788E48-149B-4B04-8EB6-40104E174E12'	
End

-- Update field that have 3 months with 6 month frequencies
BEGIN     
	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[ProfileVersionSection]
	SET AuthorReviewFrequency='EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB'
	WHERE AuthorReviewFrequency='37481649-5986-47E8-B91D-BD73EBB479EB'

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[ProfileVersionSection]
	SET PolicyReviewFrequency='EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB'
	WHERE PolicyReviewFrequency='37481649-5986-47E8-B91D-BD73EBB479EB'

	UPDATE [VLA_SurveillanceProfilesSysTest].[dbo].[ProfileVersionSection]
	SET TechnicalReviewFrequency='EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB'
	WHERE TechnicalReviewFrequency='37481649-5986-47E8-B91D-BD73EBB479EB'      
End