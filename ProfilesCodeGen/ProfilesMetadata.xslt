<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="root">
    
  <!-- delete main tables that are not per species -->
  <xsl:for-each select="Section[count(./Question[@IsPerSpecies = 0]) > 0]">

    -- DROP TABLE <xsl:value-of select="@Name"/>

    <xsl:for-each select="Question[@IsPerSpecies = 0 and @IsRepeating = 1]">

      --DROP TABLE <xsl:value-of select="@Name"/>
      
      -- Drop any FK constraints from Ids within table <xsl:value-of select="@Name"/> to lookup tables
      <xsl:for-each select="Field[@IsMultiValue = 0]">
        <xsl:if test="@ReferenceTable">
          IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="../@Name"/>_<xsl:value-of select="@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="../@Name"/>]'))
          ALTER TABLE [dbo].[<xsl:value-of select="../@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="../@Name"/>_<xsl:value-of select="@Name"/>]
          GO
        </xsl:if>
      </xsl:for-each>

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to <xsl:value-of select="@Name"/>
      <xsl:for-each select="Field[@IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]
        GO
      </xsl:for-each>

      <xsl:choose>
        <xsl:when test="count(../Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
      -- Drop FK constraint from <xsl:value-of select="@Name"/> back to the <xsl:value-of select="../@Name"/> table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
      ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>]
      GO
        </xsl:when>
        <xsl:otherwise>
          -- Drop FK constraint from <xsl:value-of select="@Name"/> back to the ProfileVersion table
          IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
          ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersion]
          GO
        </xsl:otherwise>
      </xsl:choose>
      
        -- Drop any link tables that are linked to <xsl:value-of select="@Name"/>
      <xsl:for-each select="Field[@IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
        DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
        GO
      </xsl:for-each>

      -- Drop table <xsl:value-of select="@Name"/>
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
      DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
      GO

    </xsl:for-each>
    
      -- Drop any FK constraints from Ids within table <xsl:value-of select="@Name"/> to lookup tables
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
      <xsl:if test="@ReferenceTable">
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="../../@Name"/>_<xsl:value-of select="@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="../../@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="../../@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="../../@Name"/>_<xsl:value-of select="@Name"/>]
        GO
      </xsl:if>
    </xsl:for-each>

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to <xsl:value-of select="@Name"/>
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]
        GO
    </xsl:for-each>
    
      -- Drop FK constraint from <xsl:value-of select="@Name"/> back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
      ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersion]
    GO

      -- Drop any link tables that are linked to <xsl:value-of select="@Name"/>
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
        DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
        GO
    </xsl:for-each>

      -- Drop table <xsl:value-of select="@Name"/>
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
      DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
      GO
  </xsl:for-each>

  <!-- drop per species main tables -->
  <xsl:for-each select="Section[count(./Question[@IsPerSpecies = 1]) > 0]">

    -- DROP TABLE <xsl:value-of select="@Name"/>Species

      <xsl:for-each select="Question[@IsPerSpecies = 1 and @IsRepeating = 1]">

      --DROP TABLE <xsl:value-of select="@Name"/>Species

      -- Drop any FK constraints from Ids within table <xsl:value-of select="@Name"/>Species to lookup tables
      <xsl:for-each select="Field[@IsMultiValue = 0]">
        <xsl:if test="@ReferenceTable">
          IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="../@Name"/>Species_<xsl:value-of select="@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="../@Name"/>Species]'))
          ALTER TABLE [dbo].[<xsl:value-of select="../@Name"/>Species] DROP CONSTRAINT [FK_<xsl:value-of select="../@Name"/>Species_<xsl:value-of select="@Name"/>]
          GO
        </xsl:if>
      </xsl:for-each>

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to <xsl:value-of select="@Name"/>
      <xsl:for-each select="Field[@IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>Species]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]
        GO
      </xsl:for-each>

        <xsl:choose>
          <xsl:when test="count(../Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
            -- Drop FK constraint from <xsl:value-of select="@Name"/>Species back to the <xsl:value-of select="../@Name"/>Species table
            IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>Species_<xsl:value-of select="../@Name"/>Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>Species]'))
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_<xsl:value-of select="../@Name"/>Species]
            GO
          </xsl:when>
          <xsl:otherwise>
            -- Drop FK constraint from <xsl:value-of select="@Name"/>Species back to the ProfileVersionSpecies table
            IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>Species]'))
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies]
            GO
          </xsl:otherwise>
        </xsl:choose>

        -- Drop any link tables that are linked to <xsl:value-of select="@Name"/>Species
      <xsl:for-each select="Field[@IsMultiValue = 1]">
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
        DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
        GO
      </xsl:for-each>

      -- Drop table <xsl:value-of select="@Name"/>Species
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>Species]') AND type in (N'U'))
      DROP TABLE [dbo].[<xsl:value-of select="@Name"/>Species]
      GO

    </xsl:for-each>
    
    -- Drop any FK constraints from Ids within table <xsl:value-of select="@Name"/>Species to lookup tables
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
      <xsl:if test="@ReferenceTable">
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="../../@Name"/>Species_<xsl:value-of select="@Name"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="../../@Name"/>Species]'))
        ALTER TABLE [dbo].[<xsl:value-of select="../../@Name"/>Species] DROP CONSTRAINT [FK_<xsl:value-of select="../../@Name"/>Species_<xsl:value-of select="@Name"/>]
        GO
      </xsl:if>
    </xsl:for-each>

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to <xsl:value-of select="@Name"/>Species
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>Species]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
      ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>Species]
      GO

      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]'))
      ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>]
      GO
    </xsl:for-each>

    -- Drop FK constraint from <xsl:value-of select="@Name"/>Species back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>Species]'))
    ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species] DROP CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to <xsl:value-of select="@Name"/>Species
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>]') AND type in (N'U'))
      DROP TABLE [dbo].[<xsl:value-of select="@Name"/>]
      GO
    </xsl:for-each>

    -- Drop table <xsl:value-of select="@Name"/>Species
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[<xsl:value-of select="@Name"/>Species]') AND type in (N'U'))
    DROP TABLE [dbo].[<xsl:value-of select="@Name"/>Species]
    GO

  </xsl:for-each>

  <!-- drop reference tables -->
    -- DROP REFERENCE TABLES

   <xsl:for-each select="SpeciesField[@ReferenceTable]">
     -- Drop FK constraint from Species back to the lu<xsl:value-of select="@ReferenceTable"/> table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Species<xsl:value-of select="@Name"/>_lu<xsl:value-of select="@ReferenceTable"/>]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_Species<xsl:value-of select="@Name"/>_lu<xsl:value-of select="@ReferenceTable"/>]
    GO
   </xsl:for-each>
    
    <xsl:for-each select="ReferenceTable">

    -- Drop reference table lu<xsl:value-of select="@Name"/>
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lu<xsl:value-of select="@Name"/>]') AND type in (N'U'))
    DROP TABLE [dbo].[lu<xsl:value-of select="@Name"/>]
    GO
  </xsl:for-each>

  <!-- create reference tables -->
    -- CREATE REFERENCE TABLES
  <xsl:for-each select="ReferenceTable">
    -- Create reference table lu<xsl:value-of select="@Name"/>
    CREATE TABLE [dbo].[lu<xsl:value-of select="@Name"/>](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    <xsl:choose>
      <xsl:when test="@IsMaintainable = '1' ">
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      </xsl:when>
      <xsl:otherwise>
        [SequenceNumber] [tinyint] NOT NULL,
      </xsl:otherwise>
    </xsl:choose>
    CONSTRAINT [PK_lu<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  </xsl:for-each>
   
    <!-- create main tables that are not per species-->
    <xsl:for-each select="Section[count(./Question[@IsPerSpecies = 0]) > 0]">

    -- CREATE TABLE <xsl:value-of select="@Name"/>
      <xsl:if test="count(Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
          [<xsl:value-of select="@Name"/>] <xsl:value-of select="@Type"/> NULL,
        </xsl:for-each>
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from <xsl:value-of select="@Name"/> to ProfileVersion table
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      </xsl:if>
      
      -- Create link tables for multi-value fields that need to be attached to <xsl:value-of select="@Name"/> table
      <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [<xsl:value-of select="@ReferenceTable"/>Id] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        <xsl:choose>
          <xsl:when test="count(../../Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[<xsl:value-of select="../../@Name"/>] ([ProfileVersionId])
            GO
          </xsl:when>
          <xsl:otherwise>
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersion] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[ProfileVersion] ([Id])
            GO
          </xsl:otherwise>
        </xsl:choose>
        
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>] FOREIGN KEY([<xsl:value-of select="@ReferenceTable"/>Id])
        REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
        GO
      </xsl:for-each>
      
      -- Create FK constraints from foreign key ids of <xsl:value-of select="@Name"/> table to lookup tables
    <xsl:for-each select="Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
        <xsl:if test="@ReferenceTable">
          ALTER TABLE [dbo].[<xsl:value-of select="../../@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="../../@Name"/>_<xsl:value-of select="@Name"/>] FOREIGN KEY([<xsl:value-of select="@Name"/>])
          REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
          GO
        </xsl:if>
      </xsl:for-each>

    <!-- repeating questions -->
      -- Create link tables for repeating questions that need to be attached to <xsl:value-of select="@Name"/> table
      <xsl:for-each select="Question[@IsPerSpecies = 0 and @IsRepeating = 1]">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        <xsl:for-each select="Field[@IsMultiValue = 0]">
          [<xsl:value-of select="@Name"/>] <xsl:value-of select="@Type"/> NULL,
        </xsl:for-each>
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        <xsl:choose>
          <xsl:when test="count(../Question/Field[../@IsPerSpecies = 0 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[<xsl:value-of select="../@Name"/>] ([ProfileVersionId])
            GO
          </xsl:when>
          <xsl:otherwise>
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersion] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[ProfileVersion] ([Id])
            GO
          </xsl:otherwise>
        </xsl:choose>  

        -- Create link tables for multi-value fields that need to be attached to <xsl:value-of select="@Name"/> table
        <xsl:for-each select="Field[@IsMultiValue = 1]">
          CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
          [Id] [uniqueidentifier] NOT NULL,
          [<xsl:value-of select="../@Name"/>Id] uniqueidentifier NOT NULL,
          [<xsl:value-of select="@ReferenceTable"/>Id] uniqueidentifier NOT NULL,
          CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
          (
          [Id] ASC
          )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
          ) ON [PRIMARY]
          GO

          ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>] FOREIGN KEY([<xsl:value-of select="../@Name"/>Id])
          REFERENCES [dbo].[<xsl:value-of select="../@Name"/>] ([Id])
          GO

          ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>] FOREIGN KEY([<xsl:value-of select="@ReferenceTable"/>Id])
          REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
          GO
        </xsl:for-each>

        -- Create FK constraints from foreign key ids of <xsl:value-of select="@Name"/> table to lookup tables
        <xsl:for-each select="Field[@IsMultiValue = 0]">
          <xsl:if test="@ReferenceTable">
            ALTER TABLE [dbo].[<xsl:value-of select="../@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="../@Name"/>_<xsl:value-of select="@Name"/>] FOREIGN KEY([<xsl:value-of select="@Name"/>])
            REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
            GO
          </xsl:if>
        </xsl:for-each>

      </xsl:for-each>
      
      
    </xsl:for-each>

    <!-- create per species main tables -->
    <xsl:for-each select="Section[count(./Question[@IsPerSpecies = 1]) > 0]">

      -- CREATE TABLE <xsl:value-of select="@Name"/>Species
      <xsl:if test="count(Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>Species](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
          [<xsl:value-of select="@Name"/>] <xsl:value-of select="@Type"/> NULL,
        </xsl:for-each>
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>Species] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from <xsl:value-of select="@Name"/>Species to ProfileVersionSpecies table
        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    </xsl:if>
      
      -- Create link tables for multi-value fields that need to be attached to <xsl:value-of select="@Name"/>Species table
      <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 1]">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] uniqueidentifier NOT NULL,
        [<xsl:value-of select="@ReferenceTable"/>Id] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        <xsl:choose>
          <xsl:when test="count(../../Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../../@Name"/>Species] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[<xsl:value-of select="../../@Name"/>Species] ([ProfileVersionId], [SpeciesId])
            GO
          </xsl:when>
          <xsl:otherwise>
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
            GO
          </xsl:otherwise>
        </xsl:choose>

        ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>] FOREIGN KEY([<xsl:value-of select="@ReferenceTable"/>Id])
        REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
        GO
      </xsl:for-each>

      -- Create FK constraints from foreign key ids of <xsl:value-of select="@Name"/>Species table to lookup tables
      <xsl:for-each select="Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]">
        <xsl:if test="@ReferenceTable">
          ALTER TABLE [dbo].[<xsl:value-of select="../../@Name"/>Species]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="../../@Name"/>Species_<xsl:value-of select="@Name"/>] FOREIGN KEY([<xsl:value-of select="@Name"/>])
          REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
          GO
        </xsl:if>
      </xsl:for-each>

      <!-- repeating questions -->
      -- Create link tables for repeating questions that need to be attached to <xsl:value-of select="@Name"/>Species table
      <xsl:for-each select="Question[@IsPerSpecies = 1 and @IsRepeating = 1]">
        CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>Species](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        <xsl:for-each select="Field[@IsMultiValue = 0]">
          [<xsl:value-of select="@Name"/>] <xsl:value-of select="@Type"/> NULL,
        </xsl:for-each>
        CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        <xsl:choose>
          <xsl:when test="count(../Question/Field[../@IsPerSpecies = 1 and ../@IsRepeating = 0 and @IsMultiValue = 0]) > 0">
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_<xsl:value-of select="../@Name"/>Species] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[<xsl:value-of select="../@Name"/>Species] ([ProfileVersionId], [SpeciesId])
            GO
          </xsl:when>
          <xsl:otherwise>
            ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>Species]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>Species_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
            GO
          </xsl:otherwise>
        </xsl:choose>
        
        -- Create link tables for multi-value fields that need to be attached to <xsl:value-of select="@Name"/>Species table
        <xsl:for-each select="Field[@IsMultiValue = 1]">
          CREATE TABLE [dbo].[<xsl:value-of select="@Name"/>](
          [Id] [uniqueidentifier] NOT NULL,
          [<xsl:value-of select="../@Name"/>SpeciesId] uniqueidentifier NOT NULL,
          [<xsl:value-of select="@ReferenceTable"/>Id] uniqueidentifier NOT NULL,
          CONSTRAINT [PK_<xsl:value-of select="@Name"/>] PRIMARY KEY CLUSTERED
          (
          [Id] ASC
          )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
          ) ON [PRIMARY]
          GO

          ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="../@Name"/>Species] FOREIGN KEY([<xsl:value-of select="../@Name"/>SpeciesId])
          REFERENCES [dbo].[<xsl:value-of select="../@Name"/>Species] ([Id])
          GO

          ALTER TABLE [dbo].[<xsl:value-of select="@Name"/>]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="@Name"/>_<xsl:value-of select="@ReferenceTable"/>] FOREIGN KEY([<xsl:value-of select="@ReferenceTable"/>Id])
          REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
          GO
        </xsl:for-each>

        -- Create FK constraints from foreign key ids of <xsl:value-of select="@Name"/>Species table to lookup tables
        <xsl:for-each select="Field[@IsMultiValue = 0]">
          <xsl:if test="@ReferenceTable">
            ALTER TABLE [dbo].[<xsl:value-of select="../@Name"/>Species]  WITH CHECK ADD  CONSTRAINT [FK_<xsl:value-of select="../@Name"/>Species_<xsl:value-of select="@Name"/>] FOREIGN KEY([<xsl:value-of select="@Name"/>])
            REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
            GO
          </xsl:if>
        </xsl:for-each>

      </xsl:for-each>
      
    </xsl:for-each>

    <!-- populate reference tables -->
    
    -- POPULATE REFERENCE TABLES
    <xsl:for-each select="ReferenceValue">

      INSERT INTO lu<xsl:value-of select="@TableName"/>
      (
      [Id],
      [LookupValue],
      <xsl:choose>
        <xsl:when test="@IsMaintainable = '1' ">
          [EffectiveDateFrom]
        </xsl:when>
        <xsl:otherwise>
          [SequenceNumber]
        </xsl:otherwise>
      </xsl:choose>
        )
      VALUES
        (
        '<xsl:value-of select="@Id"/>',
        '<xsl:value-of select="@LookupValue"/>',
        <xsl:choose>
      <xsl:when test="@IsMaintainable = '1' ">
        '1 January 2007'
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@SequenceNumber"/>
      </xsl:otherwise>
    </xsl:choose>
        )
      GO

  </xsl:for-each>

    <xsl:for-each select="SpeciesField[@ReferenceTable]">
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species<xsl:value-of select="@Name"/>_lu<xsl:value-of select="@ReferenceTable"/>] FOREIGN KEY([<xsl:value-of select="@Name"/>])
      REFERENCES [dbo].[lu<xsl:value-of select="@ReferenceTable"/>] ([Id])
      GO
    </xsl:for-each>
    
    

    
  </xsl:template>
</xsl:stylesheet>
