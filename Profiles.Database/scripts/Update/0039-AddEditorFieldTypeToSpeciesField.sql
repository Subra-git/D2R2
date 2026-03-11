 IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[SpeciesField]') 
         AND name = 'EditorFieldType'
)
BEGIN
    ALTER TABLE [SpeciesField]
    ADD EditorFieldType int null;
END