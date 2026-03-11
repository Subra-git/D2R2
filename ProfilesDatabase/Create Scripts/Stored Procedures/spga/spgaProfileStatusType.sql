----------------------------------------------------------------------------------------
--- spgaProfileStatusType.SQL
---------------------------------------------------------------------------------------- 

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileStatusType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileStatusType]
GO

CREATE PROCEDURE [dbo].[spgaProfileStatusType]
AS
BEGIN

	SET NOCOUNT ON;

    SELECT
		[Id],
		[Name],
		[IsValidationComplete]
    FROM
    	[luProfileStatusType]
    ORDER BY
		[SequenceNumber]
               
END

GO
GRANT EXECUTE ON [dbo].[spgaProfileStatusType] TO [VLAProfilesUser]
GO
