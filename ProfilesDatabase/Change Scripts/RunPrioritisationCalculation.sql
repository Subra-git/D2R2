-- rerun prioritisation calculation for current profile versions
DECLARE @ProfileVersionId uniqueidentifier
DECLARE csrCurrentPublishedProfileVersions CURSOR
FOR
	SELECT
		[ProfileVersion].[Id] 
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	WHERE 
		[ProfileVersion].[EffectiveDateTo] IS NULL
	OPEN csrCurrentPublishedProfileVersions

FETCH NEXT FROM csrCurrentPublishedProfileVersions
INTO @ProfileVersionId
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC sppPrioritisationCalculation @ProfileVersionId

	FETCH NEXT FROM csrCurrentPublishedProfileVersions
	INTO @ProfileVersionId

END
CLOSE csrCurrentPublishedProfileVersions
DEALLOCATE csrCurrentPublishedProfileVersions

EXEC sppPrioritisationScore 

EXEC sppSpeciesPrioritisationScore
