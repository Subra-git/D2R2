<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template match="root">

		<!-- main tables that are not per species-->
		<xsl:for-each select="Section[count(./Question[@IsPerSpecies = 0]) > 0]">

			<xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
				INSERT INTO [ProfileVersionFieldValue]
				(
					[Id],
					[ProfileVersionId],
					[ProfileFieldId],
					[SpeciesId],
					[ProfileVersionQuestionRowId],
					[<xsl:value-of select="@FieldValueColumn"/>]
				)
				SELECT
					NEWID(),
					[ProfileVersionId],
					'<xsl:value-of select="@Id"/>',
					NULL,
					NULL,
					[<xsl:value-of select="@Name"/>]
				FROM
					[<xsl:value-of select="../../@Name"/>]
				WHERE
					[<xsl:value-of select="@Name"/>] IS NOT NULL
			</xsl:for-each>

			<xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
				INSERT INTO [ProfileVersionFieldValue]
					(
					[Id],
					[ProfileVersionId],
					[ProfileFieldId],
					[SpeciesId],
					[ProfileVersionQuestionRowId],
					[ListValue]
					)
				SELECT
					NEWID(),
					[ProfileVersionId],
					'<xsl:value-of select="@Id"/>',
					NULL,
					NULL,
					[<xsl:value-of select="@ReferenceTable"/>Id]
				FROM
					[<xsl:value-of select="@Name"/>]
			</xsl:for-each>
			
		</xsl:for-each>

		<!-- main tables that are  per species-->
		<xsl:for-each select="Section[count(./Question[@IsPerSpecies = 1]) > 0]">

			<xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
				INSERT INTO [ProfileVersionFieldValue]
					(
					[Id],
					[ProfileVersionId],
					[ProfileFieldId],
					[SpeciesId],
					[ProfileVersionQuestionRowId],
					[<xsl:value-of select="@FieldValueColumn"/>]
					)
				SELECT
					NEWID(),
					[ProfileVersionId],
					'<xsl:value-of select="@Id"/>',
					[SpeciesId],
					NULL,
					[<xsl:value-of select="@Name"/>]
				FROM
					[<xsl:value-of select="../../@Name"/>Species]
				WHERE
					[<xsl:value-of select="@Name"/>] IS NOT NULL
			</xsl:for-each>

			<xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
				INSERT INTO [ProfileVersionFieldValue]
					(
					[Id],
					[ProfileVersionId],
					[ProfileFieldId],
					[SpeciesId],
					[ProfileVersionQuestionRowId],
					[ListValue]
					)
				SELECT
					NEWID(),
					[ProfileVersionId],
					'<xsl:value-of select="@Id"/>',
					[SpeciesId],
					NULL,
					[<xsl:value-of select="@ReferenceTable"/>Id]
				FROM
					[<xsl:value-of select="@Name"/>]
			</xsl:for-each>

			<xsl:for-each select="Question[@IsPerSpecies = 1 and @IsRepeating = 1]">
				
				INSERT INTO [ProfileVersionQuestionRow]
					(
					[Id],
					[ProfileVersionId],
					[ProfileQuestionId],
					[SequenceNumber]
					)
				SELECT
					[Id],
					[ProfileVersionId],
					'<xsl:value-of select="@Id"/>',
					ROW_NUMBER() OVER (PARTITION BY [ProfileVersionId] ORDER BY [SpeciesId], [<xsl:value-of select="Field/@Name"/>])
				FROM
					[<xsl:value-of select="@Name"/>Species]
				
				<xsl:for-each select="Field">
					
					INSERT INTO [ProfileVersionFieldValue]
						(
						[Id],
						[ProfileVersionId],
						[ProfileFieldId],
						[SpeciesId],
						[ProfileVersionQuestionRowId],
						[<xsl:value-of select="@FieldValueColumn"/>]
						)
					SELECT
						NEWID(),
						[ProfileVersionId],
						'<xsl:value-of select="@Id"/>',
						[SpeciesId],
						[Id],
						[<xsl:value-of select="@Name"/>]
					FROM
						[<xsl:value-of select="../@Name"/>Species]
					WHERE
						[<xsl:value-of select="@Name"/>] IS NOT NULL
				</xsl:for-each>
				
			</xsl:for-each>

		</xsl:for-each>

		CREATE NONCLUSTERED INDEX [IX_ProfileVersionFieldValue_ProfileVersionId] ON [ProfileVersionFieldValue]
		(
		[ProfileVersionId]
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		GO

		CREATE NONCLUSTERED INDEX [IX_ProfileVersionQuestionRow_ProfileVersionId] ON [ProfileVersionQuestionRow]
		(
		[ProfileVersionId]
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		GO

		CREATE NONCLUSTERED INDEX [IX_ReferenceValue_ReferenceTableId] ON [ReferenceValue]
		(
		[ReferenceTableId]
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		GO

	</xsl:template>
</xsl:stylesheet>
