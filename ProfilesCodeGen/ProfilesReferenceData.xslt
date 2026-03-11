<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>

  <xsl:template name="globalReplace">
    <xsl:param name="outputString"/>
    <xsl:param name="target"/>
    <xsl:param name="replacement"/>
    <xsl:choose>
      <xsl:when test="contains($outputString,$target)">

        <xsl:value-of select=
        "concat(substring-before($outputString,$target),
               $replacement)"/>
        <xsl:call-template name="globalReplace">
          <xsl:with-param name="outputString"
               select="substring-after($outputString,$target)"/>
          <xsl:with-param name="target" select="$target"/>
          <xsl:with-param name="replacement"
               select="$replacement"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$outputString"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="root">

    <xsl:variable name="apos">'</xsl:variable>
    <xsl:variable name="dapos">''</xsl:variable>
    
    <xsl:for-each select="luDataFieldType">
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@Name"/>',
      '<xsl:value-of select="@SqlType"/>'
      )
    </xsl:for-each>

    <xsl:for-each select="luProfileUserRole">
      INSERT INTO [luProfileUserRole]
      (
      [Id],
      [Name],
      [IsContributor]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@Name"/>',
      <xsl:value-of select="@IsContributor"/>
      )
    </xsl:for-each>

    <xsl:for-each select="luProfileVersionState">
      INSERT INTO [luProfileVersionState]
      (
        [Id],
        [Name]
      )
      VALUES
      (
        '<xsl:value-of select="@Id"/>',
        '<xsl:value-of select="@Name"/>'
      )
    </xsl:for-each>

    <xsl:for-each select="luSectionReviewFrequency">
      INSERT INTO [luSectionReviewFrequency]
      (
      [Id],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
        '<xsl:value-of select="@Id"/>',
        '<xsl:value-of select="@LookupValue"/>',
        <xsl:value-of select="@SequenceNumber"/>
      )
    </xsl:for-each>

    <xsl:for-each select="ProfileSection">
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      <xsl:choose>
        <xsl:when test="@Name">
          '<xsl:value-of select="@Name"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@ShortName"/>',
      <xsl:value-of select="@SectionNumber"/>
      )
    </xsl:for-each>

    <xsl:for-each select="ProfileQuestion">
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      <xsl:choose>
        <xsl:when test="@Name">
          '<xsl:call-template name="globalReplace">
          <xsl:with-param name="outputString" select="@Name"/>
          <xsl:with-param name="target" select="$apos"/>
          <xsl:with-param name="replacement" select="$dapos"/>
        </xsl:call-template>'

      </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@ShortName"/>',
      '<xsl:value-of select="@ProfileSectionId"/>',
      <xsl:value-of select="@QuestionNumber"/>,
      <xsl:value-of select="@IsPerSpecies"/>,
      <xsl:value-of select="@IsRepeating"/>,
      '<xsl:value-of select="@UserGuidance"/>'
      )
    </xsl:for-each>

    <xsl:for-each select="ReferenceTable">
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@Name"/>',
      <xsl:value-of select="@IsMaintainable"/>
      )
    </xsl:for-each>

    <xsl:for-each select="ReferenceValue">
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@ReferenceTableId"/>',
      '<xsl:value-of select="@LookupValue"/>',
      <xsl:value-of select="@SequenceNumber"/>
      )
    </xsl:for-each>

    <xsl:for-each select="PrioritisationRankingRange">
      INSERT INTO [PrioritisationRankingRange]
      (
      [Id],
      [LowerBound],
      [UpperBound]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      <xsl:value-of select="@LowerBound"/>,
      <xsl:value-of select="@UpperBound"/>
      )
    </xsl:for-each>

    <xsl:for-each select="ProfileField">
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      <xsl:choose>
        <xsl:when test="@Name">
          '<xsl:value-of select="@Name"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@ShortName"/>',
      '<xsl:value-of select="@ProfileQuestionId"/>',
      <xsl:value-of select="@FieldNumber"/>,
      '<xsl:value-of select="@DataFieldTypeId"/>',
      <xsl:value-of select="@IsMandatory"/>,
      <xsl:choose>
        <xsl:when test="@ReferenceTableId">
          '<xsl:value-of select="@ReferenceTableId"/>',
        </xsl:when>
        <xsl:otherwise>NULL,</xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="@IsReadOnly"/>
      )
    </xsl:for-each>

    <xsl:for-each select="ProfileQuestion">
      <xsl:if test="@IrrelevanceFieldId">
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '<xsl:value-of select="@IrrelevanceFieldId"/>'
        <xsl:if test="@IrrelevanceValueId">
          , [IrrelevanceValueId] = '<xsl:value-of select="@IrrelevanceValueId"/>'
        </xsl:if>
        <xsl:if test="@IrrelevanceFlag">
          , [IrrelevanceFlag] = <xsl:value-of select="@IrrelevanceFlag"/>
        </xsl:if>
        WHERE
        [Id] = '<xsl:value-of select="@Id"/>'
      </xsl:if>
  </xsl:for-each>
    
    <xsl:for-each select="SpeciesField">
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
	  [DataFieldTypeId],
	  [IsMandatory]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      <xsl:choose>
        <xsl:when test="@Name">
          '<xsl:value-of select="@Name"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@ShortName"/>',
      <xsl:value-of select="@FieldNumber"/>,
      <xsl:choose>
        <xsl:when test="@ReferenceTableId">
          '<xsl:value-of select="@ReferenceTableId"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
		'<xsl:value-of select="@DataFieldTypeId"/>',
		'<xsl:value-of select="@IsMandatory"/>'
		)
	</xsl:for-each>

    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_Species_Species]

    <xsl:for-each select="Species">
		INSERT INTO [Species]
		(
		[Id],
		[ParentId],
		[Name],
		[CommercialTrade],
		[ImportanceOfExportTrade],
		[ImpactOnLevelOfImports],
		[ImpactOnIntraCommunityFlows],
		[ImpactOnThirdCountryFlows],
		[ExportMarketValue],
		[SequenceNumber],
		[CommercialTradeComments],
		[ImportanceOfExportTradeComments],
		[ImpactOnLevelOfImportsComments],
		[ImpactOnIntraCommunityFlowsComments],
		[ImpactOnThirdCountryFlowsComments],
		[ExportMarketValueComments]
		)
		VALUES
		(
		'<xsl:value-of select="@Id"/>',
      <xsl:choose>
        <xsl:when test="@ParentId">
          '<xsl:value-of select="@ParentId"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@Name"/>',
      '<xsl:value-of select="@CommercialTrade"/>',
      '<xsl:value-of select="@ImportanceOfExportTrade"/>',
      '<xsl:value-of select="@ImpactOnLevelOfImports"/>',
      '<xsl:value-of select="@ImpactOnIntraCommunityFlows"/>',
      '<xsl:value-of select="@ImpactOnThirdCountryFlows"/>',
      '<xsl:value-of select="@ExportMarketValue"/>',
      <xsl:choose>
        <xsl:when test="@SequenceNumber">
          '<xsl:value-of select="@SequenceNumber"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
		<xsl:choose>
			<xsl:when test="@CommercialTradeComments">
				'<xsl:value-of select="@CommercialTradeComments"/>'
			</xsl:when>
			<xsl:otherwise>NULL</xsl:otherwise>
		</xsl:choose>,
		<xsl:choose>
        <xsl:when test="@ImportanceOfExportTradeComments">
          '<xsl:value-of select="@ImportanceOfExportTradeComments"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
		<xsl:choose>
			<xsl:when test="@ImpactOnLevelOfImportsComments">
				'<xsl:value-of select="@ImpactOnLevelOfImportsComments"/>'
			</xsl:when>
			<xsl:otherwise>NULL</xsl:otherwise>
		</xsl:choose>,
		<xsl:choose>
			<xsl:when test="@ImpactOnIntraCommunityFlowsComments">
				'<xsl:value-of select="@ImpactOnIntraCommunityFlowsComments"/>'
			</xsl:when>
			<xsl:otherwise>NULL</xsl:otherwise>
		</xsl:choose>,
		<xsl:choose>
			<xsl:when test="@ImpactOnThirdCountryFlowsComments">
				'<xsl:value-of select="@ImpactOnThirdCountryFlowsComments"/>'
			</xsl:when>
			<xsl:otherwise>NULL</xsl:otherwise>
		</xsl:choose>,
		<xsl:choose>
			<xsl:when test="@ExportMarketValueComments">
				'<xsl:value-of select="@ExportMarketValueComments"/>'
			</xsl:when>
			<xsl:otherwise>NULL</xsl:otherwise>
		</xsl:choose>
		)
	</xsl:for-each>

    ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species_Species] FOREIGN KEY([ParentId])
    REFERENCES [dbo].[Species] ([Id])

    <xsl:for-each select="PrioritisationCategory">
	  INSERT INTO [PrioritisationCategory]
	  (
	  [Id],
	  [Name],
	  [IrrelevanceFieldId],
	  [IrrelevanceValueId],
	  [IrrelevanceFlag]
	  )
	  VALUES
	  (
	  '<xsl:value-of select="@Id"/>',
	  '<xsl:value-of select="@Name"/>',
	  <xsl:choose>
		  <xsl:when test="@IrrelevanceFieldId">
			  '<xsl:value-of select="@IrrelevanceFieldId"/>'
		  </xsl:when>
		  <xsl:otherwise>NULL</xsl:otherwise>
	  </xsl:choose>,
	  <xsl:choose>
		  <xsl:when test="@IrrelevanceValueId">
			  '<xsl:value-of select="@IrrelevanceValueId"/>'
		  </xsl:when>
		  <xsl:otherwise>NULL</xsl:otherwise>
	  </xsl:choose>,
	  <xsl:choose>
		  <xsl:when test="@IrrelevanceFlag">
			  <xsl:value-of select="@IrrelevanceFlag"/>
		  </xsl:when>
		  <xsl:otherwise>NULL</xsl:otherwise>
	  </xsl:choose>
	  )
  </xsl:for-each>
	  
    <xsl:for-each select="PrioritisationCriterion">
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@PrioritisationCategoryId"/>',
      '<xsl:value-of select="@Code"/>',
      '<xsl:value-of select="@Name"/>',
      <xsl:value-of select="@Weighting"/>,
      <xsl:choose>
        <xsl:when test="@MappingFlag">
          '<xsl:value-of select="@MappingFlag"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>,
      '<xsl:value-of select="@TrueMapping"/>',
      <xsl:choose>
        <xsl:when test="@FalseMapping">
          '<xsl:value-of select="@FalseMapping"/>'
        </xsl:when>
        <xsl:otherwise>NULL</xsl:otherwise>
      </xsl:choose>
      )
    </xsl:for-each>

    <xsl:for-each select="PrioritisationCriterionValue">
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '<xsl:value-of select="@Id"/>',
      '<xsl:value-of select="@PrioritisationCriterionId"/>',
      '<xsl:value-of select="@CriterionValue"/>',
      <xsl:value-of select="@Score"/>,
      <xsl:value-of select="@SequenceNumber"/>
      )
    </xsl:for-each>
    
  </xsl:template>
</xsl:stylesheet>
