IF EXISTS (SELECT 1 FROM sys.types WHERE name = 'SectionSelectionType' AND schema_id = SCHEMA_ID('dbo') AND is_table_type = 1)
BEGIN
    DROP TYPE [dbo].SectionSelectionType;
END

