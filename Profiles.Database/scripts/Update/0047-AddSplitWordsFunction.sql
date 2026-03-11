IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[fn_splitWords]') AND type IN ('FN', 'IF', 'TF', 'FS', 'FT'))
BEGIN
    DROP FUNCTION [dbo].[fn_splitWords];
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_splitWords](
    @Words NVARCHAR(4000)
)
RETURNS @WordsTable TABLE
(
    Word NVARCHAR(255)
)
AS
BEGIN

DECLARE @xml XML;

SET @xml = N'<t>' + REPLACE(@Words,' ','</t><t>') + '</t>'

INSERT INTO @WordsTable(Word)
SELECT  
	r.value('.','varchar(MAX)') AS item
FROM
	@xml.nodes('/t') AS records(r)
RETURN
END

GO