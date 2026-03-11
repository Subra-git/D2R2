DECLARE @TypeName varchar(50)

SET @TypeName = 'smalldatetime'

SELECT
	OBJECT_NAME(col.OBJECT_ID) as [TableName],
	col.[name] as [ColumnName],
	typ.[name] AS [DataType]
FROM
	sys.all_columns col INNER JOIN sys.types typ ON col.user_type_id = typ.user_type_id 
	INNER JOIN sys.objects o ON col.object_id = o.object_id
WHERE
	typ.[name] = @TypeName AND
	o.type = 'U' 