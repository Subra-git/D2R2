----------------------------------------------------------------------------------------
--- CR60Changes130111.SQL
---------------------------------------------------------------------------------------- 

-- Update Potential to add value PrioritisationCriterionValueIds with those 
-- used on Development environment.

-- Drop foreign key in ProfileVersionSpeciesPrioritisation
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileVersionSpeciesPrioritisation]'))
ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] DROP CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]
GO

-- Drop primary key on PrioritisationCriterionValue
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PrioritisationCriterionValue]') AND name = N'PK_PrioritisationCriterionValue')
ALTER TABLE [dbo].[PrioritisationCriterionValue] DROP CONSTRAINT [PK_PrioritisationCriterionValue]
GO

DECLARE @OldId uniqueidentifier
DECLARE @NewId uniqueidentifier

-- 1. GO01, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO01' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = 'A0E526C7-7E0F-4DB2-8D61-7FDA5CA984F1'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 2. GO01, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO01' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = '0678FDC0-AD43-4666-8582-321D610DD80D'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 3. GO01, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO01' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = '1593C7B2-7902-41A5-AE49-539182CB22BB'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 4. GO02, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO02' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = '5A21E61F-0A60-4098-AD70-5A7DEC1599EC'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 5. GO02, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO02' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = 'AD613DB8-CF9B-4D84-A905-A8FFC0069DFF'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 6. GO02, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO02' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = '662807AE-8170-4BC1-BB29-072B7571E4B3'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 7. GO03, Not applicable
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO03' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Not applicable'
		
SET @NewId = '1D118663-6798-41EC-B08A-821DC5412E3A'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 8. GO03, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO03' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = 'E71D16E4-6772-4AAD-A480-56ADC740FA34'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- 9. GO03, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO03' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = '28F2FFC3-598E-4B07-9922-76E2607AD73E'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--10. GO03, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO03' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = '990E5DF4-DB0D-49C3-8194-2F9A47910C30'

IF @NewId <> @OldId AND @OldId <> '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--11. GO04, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO04' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = 'A0D4A068-0432-434C-B89B-AEA06565CC18'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--12. GO04, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO04' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = '48501B1D-2A68-4D7D-A8EF-D32D05AAC993'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--13. GO04, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO04' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = 'ADBE1394-54F5-4BEA-908A-74D5D6B1C3F8'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--14. GO05, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO05' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = 'AB86DD6F-F766-4BC7-916B-378F7A39F83B'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--15. GO05, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO05' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'

		
SET @NewId = '71D4DE74-EED6-40EA-B14B-D843FC732F42'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--16. GO05, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO05' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = 'B84F05DE-64A4-47E0-B902-CC128BCA67E3'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--17. GO06, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO06' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = '9F25D827-4E88-4FFE-8F54-5CA23D514359'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--18. GO06, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO06' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = '9C618D8B-7557-42E5-8ACC-3C5160456DF7'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--19. GO06, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO06' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = 'E5D446C6-2EEA-46B5-B99D-010F9D5C12FE'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--20. GO07, Low
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO07' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Low'
		
SET @NewId = '96331C80-1A35-4171-BE2F-9893F0381192'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--21. GO07, Medium
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO07' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'Medium'
		
SET @NewId = 'B1DFFF13-CDC9-40A6-9FD1-8739FF5DAB5A'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

--22. GO07, High
SET @OldId = '00000000-0000-0000-0000-000000000000'

SELECT 	@OldId = [PrioritisationCriterionValue].[Id] 
FROM 
[PrioritisationCriterionValue] INNER JOIN
[PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE 
[PrioritisationCriterion].[Code] = 'GO07' AND 
[PrioritisationCriterionValue].[CriterionValue] = 'High'
		
SET @NewId = '447F3EF0-C23C-4058-94EA-1705BBE26AE9'

IF @NewId <> @OldId AND @OldId <>  '00000000-0000-0000-0000-000000000000'
BEGIN
	UPDATE [PrioritisationCriterionValue] 
	SET [Id] = @NewId
	WHERE [Id] = @OldId

	UPDATE [ProfileVersionSpeciesPrioritisation]
	SET	[PrioritisationCriterionValueId] = @NewId
	WHERE [PrioritisationCriterionValueId] = @OldId
END

-- Add primary key to PrioritisationCriterionValue
GO
ALTER TABLE [dbo].[PrioritisationCriterionValue] ADD  CONSTRAINT [PK_PrioritisationCriterionValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- Add foreign key to ProfileVersionSpeciesPrioritisation
GO
ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation]  WITH CHECK ADD  CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue] FOREIGN KEY([PrioritisationCriterionValueId])
REFERENCES [dbo].[PrioritisationCriterionValue] ([Id])
GO

GO
ALTER TABLE [dbo].[ProfileVersionSpeciesPrioritisation] CHECK CONSTRAINT [FK_ProfileVersionSpeciesPrioritisation_PrioritisationCriterionValue]
GO

--Q5.10 is used by GO07 (Potential to add value)

-- Update the reference value to 'Low (or zero without culling)'
UPDATE
	[ReferenceValue]
SET
	[ReferenceValue].[LookupValue] = 'Low (or zero without culling)'
WHERE
	[ReferenceValue].[Id] = '71528818-0789-4048-9643-7DFDDBF4D75B'

-- Update the criterion value to 'Low (or zero without culling)'
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = 'Low (or zero without culling)'
WHERE
	[Id] = '96331C80-1A35-4171-BE2F-9893F0381192'  
	
	
--Q9.3 is used by RM11 (Risk and mitigation)
IF NOT EXISTS (SELECT * FROM [ReferenceTable] WHERE [Id] = '6028E231-032C-48D5-B549-E915EA35A91B')
BEGIN
INSERT INTO 
	[ReferenceTable]
(
	[Id],
	[Name],
	[IsMaintainable]
)
VALUES
(
	'6028E231-032C-48D5-B549-E915EA35A91B',
	'Uptake at holding level',
	0
)
END
-- Methods to control to be determined
-- Low
-- Medium
-- High or N/A

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id]='E280D02C-7434-45AA-96BA-5EBC92B159F0')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'E280D02C-7434-45AA-96BA-5EBC92B159F0',
	'6028E231-032C-48D5-B549-E915EA35A91B',
	'Methods to control to be determined',
	1
)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = 'FA9974D3-EBF8-488E-BC2A-CEE06715E823')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'FA9974D3-EBF8-488E-BC2A-CEE06715E823',
	'6028E231-032C-48D5-B549-E915EA35A91B',
	'Low',
	2
)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = 'E98FDF79-D6AE-4454-A6D9-3A20DC10313D')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'E98FDF79-D6AE-4454-A6D9-3A20DC10313D',
	'6028E231-032C-48D5-B549-E915EA35A91B',
	'Medium',
	3
)
END

IF NOT EXISTS (SELECT * FROM [ReferenceValue] WHERE [Id] = 'B109EAD4-35F3-408D-B470-FB6177A244D0')
BEGIN
INSERT INTO
	[ReferenceValue]
(
	[Id],
	[ReferenceTableId],
	[LookupValue],
	[SequenceNumber]
)
VALUES
(
	'B109EAD4-35F3-408D-B470-FB6177A244D0',
	'6028E231-032C-48D5-B549-E915EA35A91B',
	'High or N/A',
	4
)
END

-- Update profile field - to look at the new reference table
UPDATE
	[ProfileField]
SET
	[ReferenceTableId] = '6028E231-032C-48D5-B549-E915EA35A91B'
WHERE
	[Id] = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C'


-- Update all the profile version field values to look at the new reference values
-- Methods to control to be determined
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'E280D02C-7434-45AA-96BA-5EBC92B159F0'
WHERE
	[ProfileFieldId] = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C' AND
	[ListValue] = '7D557195-4DBA-407A-8992-E6D2C9492389'

-- Low
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'FA9974D3-EBF8-488E-BC2A-CEE06715E823'
WHERE
	[ProfileFieldId] = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C' AND
	[ListValue] = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'

-- Medium
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'E98FDF79-D6AE-4454-A6D9-3A20DC10313D'
WHERE
	[ProfileFieldId] = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C' AND
	[ListValue] = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'

-- High
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'B109EAD4-35F3-408D-B470-FB6177A244D0'
WHERE
	[ProfileFieldId] = 'E9FBFAC3-0A69-44BB-A077-EDF86E29946C' AND
	[ListValue] = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'


-- Update the prioritisationCriterionValue with the new value
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = 'High or N/A'
WHERE
	[Id] = '51EE3CEC-441E-40C3-BC1A-E50E263A1BC0'


--Q9.5 is used by GO01 (Potential to add value)

--update profile field to use new reference table
UPDATE
	[ProfileField]
SET
	[ReferenceTableId] = '6028E231-032C-48D5-B549-E915EA35A91B'
WHERE
	[Id] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9'

--update all the profile version field values to look at the new reference values
-- Methods to control to be determined
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'E280D02C-7434-45AA-96BA-5EBC92B159F0'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = '7D557195-4DBA-407A-8992-E6D2C9492389'

-- Low
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'FA9974D3-EBF8-488E-BC2A-CEE06715E823'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = '2421B920-5045-41AB-B2CA-23ABBCDDEFB0'

-- Medium
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'E98FDF79-D6AE-4454-A6D9-3A20DC10313D'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = '47C0702F-B8E8-4BD8-A3BA-2D29FD7386D3'

-- High
UPDATE
	[ProfileVersionFieldValue]
SET
	[ListValue] = 'B109EAD4-35F3-408D-B470-FB6177A244D0'
WHERE
	[ProfileFieldId] = '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9' AND
	[ListValue] = 'C968F747-D161-497C-8F0C-1C4D4E7C54BF'

--update prioritisationCriterionValue with the new value
UPDATE
	[PrioritisationCriterionValue]
SET
	[CriterionValue] = 'High or N/A'
WHERE
	[Id] = '1593C7B2-7902-41A5-AE49-539182CB22BB'
		
-- GO01, Update Sequence numbers
-- Methods to control to be determined, 1
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 1
WHERE
	[Id] = 'B9FCA036-9A96-4952-9A3A-69BB5BCE3840'

--Low, 2
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 2
WHERE
	[Id] = 'A0E526C7-7E0F-4DB2-8D61-7FDA5CA984F1'

--Medium, 3
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 3
WHERE
	[Id] = '0678FDC0-AD43-4666-8582-321D610DD80D'

--High, 4
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 4
WHERE
	[Id] = '1593C7B2-7902-41A5-AE49-539182CB22BB'

-- Wider Society, Update Sequence number
-- Very  High, 6
UPDATE
	[PrioritisationCriterionValue]
SET
	[SequenceNumber] = 6
WHERE
	[Id] = '9496AD78-C1EE-4A2D-93D5-B8283BF393A7'