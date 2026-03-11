DECLARE @ConstraintName NVARCHAR(1024)
DECLARE @DropConstraintSql NVARCHAR(2048)

SET @ConstraintName = (SELECT name FROM sys.default_constraints
	WHERE parent_object_id in 
	(
		SELECT object_id FROM sys.columns
		where name = 'ReviewEmail'
	))

SET @DropConstraintSql = 'ALTER TABLE dbo.[ProfileSectionUser] DROP CONSTRAINT ' + @ConstraintName

EXECUTE sp_executesql @DropConstraintSql

ALTER TABLE dbo.[ProfileSectionUser]
DROP COLUMN ReviewEmail

