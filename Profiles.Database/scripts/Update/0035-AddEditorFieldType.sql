 IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[ProfileField]') 
         AND name = 'EditorFieldType'
)
BEGIN
    ALTER TABLE [ProfileField]
    ADD EditorFieldType int null;
END


/* Introducing the concept of a field within a question driving visibility of 
	other fields of the same question
	These columns are needed by 0036 script to update the SP correctly.
--*/
IF NOT EXISTS(SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProfileField'
AND COLUMN_NAME = 'RelevanceFieldId')
BEGIN
	ALTER TABLE [ProfileField]
	ADD RelevanceFieldId uniqueidentifier null

	ALTER TABLE [dbo].[ProfileField]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileField_ProfileField_RelevanceFieldId] FOREIGN KEY([RelevanceFieldId])
	REFERENCES [dbo].[ProfileField] ([Id])

	ALTER TABLE [dbo].[ProfileField] CHECK CONSTRAINT [FK_ProfileField_ProfileField_RelevanceFieldId]
END

IF NOT EXISTS(SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProfileField'
AND COLUMN_NAME = 'RelevanceValueId')
BEGIN
	ALTER TABLE [ProfileField]
	ADD RelevanceValueId uniqueidentifier null

	
	ALTER TABLE [dbo].[ProfileField]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileField_ReferenceValue] FOREIGN KEY([RelevanceValueId])
	REFERENCES [dbo].[ReferenceValue] ([Id])

	ALTER TABLE [dbo].[ProfileField] CHECK CONSTRAINT [FK_ProfileField_ReferenceValue]
END
