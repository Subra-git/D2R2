 IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[luProfileNoteType]') 
         AND name = 'IsReference'
)
BEGIN
    ALTER TABLE luProfileNoteType ADD IsReference BIT NOT NULL DEFAULT(0);
END
GO
UPDATE luProfileNoteType SET IsReference = 1 WHERE NAME IN ('Scientific paper reference', 'Legislative reference');

