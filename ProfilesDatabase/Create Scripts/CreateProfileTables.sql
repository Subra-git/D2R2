

    -- DROP TABLE AnimalWelfare
    
      -- Drop any FK constraints from Ids within table AnimalWelfare to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to AnimalWelfare
    
      -- Drop FK constraint from AnimalWelfare back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfare_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfare]'))
      ALTER TABLE [dbo].[AnimalWelfare] DROP CONSTRAINT [FK_AnimalWelfare_ProfileVersion]
    GO

      -- Drop any link tables that are linked to AnimalWelfare

      -- Drop table AnimalWelfare
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnimalWelfare]') AND type in (N'U'))
      DROP TABLE [dbo].[AnimalWelfare]
      GO
  

    -- DROP TABLE ApproachToControl
    
      -- Drop any FK constraints from Ids within table ApproachToControl to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControl_ControlsAboveTheHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControl]'))
        ALTER TABLE [dbo].[ApproachToControl] DROP CONSTRAINT [FK_ApproachToControl_ControlsAboveTheHoldingLevel]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to ApproachToControl
    
      -- Drop FK constraint from ApproachToControl back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControl_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControl]'))
      ALTER TABLE [dbo].[ApproachToControl] DROP CONSTRAINT [FK_ApproachToControl_ProfileVersion]
    GO

      -- Drop any link tables that are linked to ApproachToControl

      -- Drop table ApproachToControl
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApproachToControl]') AND type in (N'U'))
      DROP TABLE [dbo].[ApproachToControl]
      GO
  

    -- DROP TABLE AreasOfUncertainty
    
      -- Drop any FK constraints from Ids within table AreasOfUncertainty to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to AreasOfUncertainty
    
      -- Drop FK constraint from AreasOfUncertainty back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasOfUncertainty_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasOfUncertainty]'))
      ALTER TABLE [dbo].[AreasOfUncertainty] DROP CONSTRAINT [FK_AreasOfUncertainty_ProfileVersion]
    GO

      -- Drop any link tables that are linked to AreasOfUncertainty

      -- Drop table AreasOfUncertainty
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AreasOfUncertainty]') AND type in (N'U'))
      DROP TABLE [dbo].[AreasOfUncertainty]
      GO
  

    -- DROP TABLE Epidemiology
    
      -- Drop any FK constraints from Ids within table Epidemiology to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Epidemiology_PersistenceInEnvironmentIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[Epidemiology]'))
        ALTER TABLE [dbo].[Epidemiology] DROP CONSTRAINT [FK_Epidemiology_PersistenceInEnvironmentIndicator]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to Epidemiology
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfirmationOfDiagnosis_Epidemiology]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]'))
        ALTER TABLE [dbo].[ConfirmationOfDiagnosis] DROP CONSTRAINT [FK_ConfirmationOfDiagnosis_Epidemiology]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ConfirmationOfDiagnosis_DiagnosisAndDetectionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]'))
        ALTER TABLE [dbo].[ConfirmationOfDiagnosis] DROP CONSTRAINT [FK_ConfirmationOfDiagnosis_DiagnosisAndDetectionMechanism]
        GO
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpreadMechanism_Epidemiology]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]'))
        ALTER TABLE [dbo].[SpreadMechanism] DROP CONSTRAINT [FK_SpreadMechanism_Epidemiology]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpreadMechanism_SpreadMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]'))
        ALTER TABLE [dbo].[SpreadMechanism] DROP CONSTRAINT [FK_SpreadMechanism_SpreadMechanism]
        GO
    
    
      -- Drop FK constraint from Epidemiology back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Epidemiology_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Epidemiology]'))
      ALTER TABLE [dbo].[Epidemiology] DROP CONSTRAINT [FK_Epidemiology_ProfileVersion]
    GO

      -- Drop any link tables that are linked to Epidemiology
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfirmationOfDiagnosis]') AND type in (N'U'))
        DROP TABLE [dbo].[ConfirmationOfDiagnosis]
        GO
    
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpreadMechanism]') AND type in (N'U'))
        DROP TABLE [dbo].[SpreadMechanism]
        GO
    

      -- Drop table Epidemiology
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Epidemiology]') AND type in (N'U'))
      DROP TABLE [dbo].[Epidemiology]
      GO
  

    -- DROP TABLE GeographicDistribution
    
      -- Drop any FK constraints from Ids within table GeographicDistribution to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_CurrentPrevalenceInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
        ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_CurrentPrevalenceInGB]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_RiskOfIntroductionToGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
        ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_RiskOfIntroductionToGB]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to GeographicDistribution
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GlobalGeographicDistribution_GeographicDistribution]') AND parent_object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]'))
        ALTER TABLE [dbo].[GlobalGeographicDistribution] DROP CONSTRAINT [FK_GlobalGeographicDistribution_GeographicDistribution]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GlobalGeographicDistribution_GeographicArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]'))
        ALTER TABLE [dbo].[GlobalGeographicDistribution] DROP CONSTRAINT [FK_GlobalGeographicDistribution_GeographicArea]
        GO
    
    
      -- Drop FK constraint from GeographicDistribution back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistribution_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]'))
      ALTER TABLE [dbo].[GeographicDistribution] DROP CONSTRAINT [FK_GeographicDistribution_ProfileVersion]
    GO

      -- Drop any link tables that are linked to GeographicDistribution
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GlobalGeographicDistribution]') AND type in (N'U'))
        DROP TABLE [dbo].[GlobalGeographicDistribution]
        GO
    

      -- Drop table GeographicDistribution
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistribution]') AND type in (N'U'))
      DROP TABLE [dbo].[GeographicDistribution]
      GO
  

    -- DROP TABLE HumanHealth
    
      -- Drop any FK constraints from Ids within table HumanHealth to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ZoonoticIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ZoonoticIndicator]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_TransmissibilityIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_TransmissibilityIndicator]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ModalSeverityOfHumanDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ModalSeverityOfHumanDisease]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_MaximumSeverityOfHumanDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_MaximumSeverityOfHumanDisease]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_AnnualNumberOfHumanCasesInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_AnnualNumberOfHumanCasesInGB]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_AverageCostPerCase]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_AverageCostPerCase]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_IndirectEconomicCostOfHumanIllness]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_IndirectEconomicCostOfHumanIllness]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_Uncertainty]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
        ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_Uncertainty]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to HumanHealth
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanTransmissionMechanism_HumanHealth]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]'))
        ALTER TABLE [dbo].[HumanTransmissionMechanism] DROP CONSTRAINT [FK_HumanTransmissionMechanism_HumanHealth]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanTransmissionMechanism_TransmissionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]'))
        ALTER TABLE [dbo].[HumanTransmissionMechanism] DROP CONSTRAINT [FK_HumanTransmissionMechanism_TransmissionMechanism]
        GO
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionOfHumanDisease_HumanHealth]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]'))
        ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease] DROP CONSTRAINT [FK_GeographicDistributionOfHumanDisease_HumanHealth]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionOfHumanDisease_GeographicArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]'))
        ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease] DROP CONSTRAINT [FK_GeographicDistributionOfHumanDisease_GeographicArea]
        GO
    
    
      -- Drop FK constraint from HumanHealth back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealth_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealth]'))
      ALTER TABLE [dbo].[HumanHealth] DROP CONSTRAINT [FK_HumanHealth_ProfileVersion]
    GO

      -- Drop any link tables that are linked to HumanHealth
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanTransmissionMechanism]') AND type in (N'U'))
        DROP TABLE [dbo].[HumanTransmissionMechanism]
        GO
    
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistributionOfHumanDisease]') AND type in (N'U'))
        DROP TABLE [dbo].[GeographicDistributionOfHumanDisease]
        GO
    

      -- Drop table HumanHealth
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanHealth]') AND type in (N'U'))
      DROP TABLE [dbo].[HumanHealth]
      GO
  

    -- DROP TABLE InternationalTrade
    
      -- Drop any FK constraints from Ids within table InternationalTrade to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_StatutoryObligationToControl]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
        ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_StatutoryObligationToControl]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_ReestablishmentOfTradingStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
        ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_ReestablishmentOfTradingStatus]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_PotentialForRegionalisation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
        ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_PotentialForRegionalisation]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_RangeOfCommoditiesCompromised]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
        ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_RangeOfCommoditiesCompromised]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to InternationalTrade
    
      -- Drop FK constraint from InternationalTrade back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTrade_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTrade]'))
      ALTER TABLE [dbo].[InternationalTrade] DROP CONSTRAINT [FK_InternationalTrade_ProfileVersion]
    GO

      -- Drop any link tables that are linked to InternationalTrade

      -- Drop table InternationalTrade
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternationalTrade]') AND type in (N'U'))
      DROP TABLE [dbo].[InternationalTrade]
      GO
  

    -- DROP TABLE LegislationAndMandates
    
      -- Drop any FK constraints from Ids within table LegislationAndMandates to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to LegislationAndMandates
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApplicableLegislationAndMandates_LegislationAndMandates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]'))
        ALTER TABLE [dbo].[ApplicableLegislationAndMandates] DROP CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationAndMandates]
        GO

        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApplicableLegislationAndMandates_LegislationType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]'))
        ALTER TABLE [dbo].[ApplicableLegislationAndMandates] DROP CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationType]
        GO
    
    
      -- Drop FK constraint from LegislationAndMandates back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LegislationAndMandates_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[LegislationAndMandates]'))
      ALTER TABLE [dbo].[LegislationAndMandates] DROP CONSTRAINT [FK_LegislationAndMandates_ProfileVersion]
    GO

      -- Drop any link tables that are linked to LegislationAndMandates
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicableLegislationAndMandates]') AND type in (N'U'))
        DROP TABLE [dbo].[ApplicableLegislationAndMandates]
        GO
    

      -- Drop table LegislationAndMandates
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LegislationAndMandates]') AND type in (N'U'))
      DROP TABLE [dbo].[LegislationAndMandates]
      GO
  

    -- DROP TABLE OpportunityToAddValue
    
      -- Drop any FK constraints from Ids within table OpportunityToAddValue to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to OpportunityToAddValue
    
      -- Drop FK constraint from OpportunityToAddValue back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpportunityToAddValue_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpportunityToAddValue]'))
      ALTER TABLE [dbo].[OpportunityToAddValue] DROP CONSTRAINT [FK_OpportunityToAddValue_ProfileVersion]
    GO

      -- Drop any link tables that are linked to OpportunityToAddValue

      -- Drop table OpportunityToAddValue
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpportunityToAddValue]') AND type in (N'U'))
      DROP TABLE [dbo].[OpportunityToAddValue]
      GO
  

    -- DROP TABLE PublicAndStakeholderPerception
    
      -- Drop any FK constraints from Ids within table PublicAndStakeholderPerception to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to PublicAndStakeholderPerception
    
      -- Drop FK constraint from PublicAndStakeholderPerception back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PublicAndStakeholderPerception_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PublicAndStakeholderPerception]'))
      ALTER TABLE [dbo].[PublicAndStakeholderPerception] DROP CONSTRAINT [FK_PublicAndStakeholderPerception_ProfileVersion]
    GO

      -- Drop any link tables that are linked to PublicAndStakeholderPerception

      -- Drop table PublicAndStakeholderPerception
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicAndStakeholderPerception]') AND type in (N'U'))
      DROP TABLE [dbo].[PublicAndStakeholderPerception]
      GO
  

    -- DROP TABLE Summary
    
      -- Drop any FK constraints from Ids within table Summary to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to Summary
    
      -- Drop FK constraint from Summary back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Summary_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Summary]'))
      ALTER TABLE [dbo].[Summary] DROP CONSTRAINT [FK_Summary_ProfileVersion]
    GO

      -- Drop any link tables that are linked to Summary

      -- Drop table Summary
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Summary]') AND type in (N'U'))
      DROP TABLE [dbo].[Summary]
      GO
  

    -- DROP TABLE Surveillance
    
      -- Drop any FK constraints from Ids within table Surveillance to lookup tables
    

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to Surveillance
    
      -- Drop FK constraint from Surveillance back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Surveillance_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Surveillance]'))
      ALTER TABLE [dbo].[Surveillance] DROP CONSTRAINT [FK_Surveillance_ProfileVersion]
    GO

      -- Drop any link tables that are linked to Surveillance

      -- Drop table Surveillance
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Surveillance]') AND type in (N'U'))
      DROP TABLE [dbo].[Surveillance]
      GO
  

    -- DROP TABLE WiderSociety
    
      -- Drop any FK constraints from Ids within table WiderSociety to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_PotentialUnplannedCostToExchequer]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
        ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_PotentialUnplannedCostToExchequer]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_GlobalEnvironment]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
        ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_GlobalEnvironment]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_LocalEnvironment]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
        ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_LocalEnvironment]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_WiderRuralCommunity]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
        ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_WiderRuralCommunity]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_TotalSurveillanceCosts]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
        ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_TotalSurveillanceCosts]
        GO
      

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to WiderSociety
    
      -- Drop FK constraint from WiderSociety back to the ProfileVersion table
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSociety_ProfileVersion]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSociety]'))
      ALTER TABLE [dbo].[WiderSociety] DROP CONSTRAINT [FK_WiderSociety_ProfileVersion]
    GO

      -- Drop any link tables that are linked to WiderSociety

      -- Drop table WiderSociety
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WiderSociety]') AND type in (N'U'))
      DROP TABLE [dbo].[WiderSociety]
      GO
  

    -- DROP TABLE AnimalWelfareSpecies

      
    
    -- Drop any FK constraints from Ids within table AnimalWelfareSpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromHungerAndThirst]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromHungerAndThirst]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromDiscomfort]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromDiscomfort]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromPainOrInjury]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromPainOrInjury]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomToExpressNormalBehaviour]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomToExpressNormalBehaviour]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_FreedomFromFearAndDistress]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromFearAndDistress]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_PotentialToReduceWelfareImplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_PotentialToReduceWelfareImplications]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnimalWelfareSpecies_ProportionOfAnimalsAffectedSufferingSeverely]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
        ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_ProportionOfAnimalsAffectedSufferingSeverely]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to AnimalWelfareSpecies
    

    -- Drop FK constraint from AnimalWelfareSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"AnimalWelfareSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]'))
    ALTER TABLE [dbo].[AnimalWelfareSpecies] DROP CONSTRAINT [FK_AnimalWelfareSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to AnimalWelfareSpecies
    

    -- Drop table AnimalWelfareSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnimalWelfareSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[AnimalWelfareSpecies]
    GO

  

    -- DROP TABLE ApproachToControlSpecies

      
    
    -- Drop any FK constraints from Ids within table ApproachToControlSpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_UptakeAtHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_UptakeAtHoldingLevel]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_WelfareEffect]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_WelfareEffect]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_PotentialToReduceRisk]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceRisk]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_PotentialToReduceHumanExposure]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceHumanExposure]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_ControlsAtTheHoldingLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_ControlsAtTheHoldingLevel]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApproachToControlSpecies_LevelOfNationalPreparedness]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
        ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_LevelOfNationalPreparedness]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to ApproachToControlSpecies
    
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentControlMechanisms_ApproachToControlSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]'))
      ALTER TABLE [dbo].[CurrentControlMechanisms] DROP CONSTRAINT [FK_CurrentControlMechanisms_ApproachToControlSpecies]
      GO

      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentControlMechanisms_ControlMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]'))
      ALTER TABLE [dbo].[CurrentControlMechanisms] DROP CONSTRAINT [FK_CurrentControlMechanisms_ControlMechanism]
      GO
    
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtherControlMechanisms_ApproachToControlSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]'))
      ALTER TABLE [dbo].[OtherControlMechanisms] DROP CONSTRAINT [FK_OtherControlMechanisms_ApproachToControlSpecies]
      GO

      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OtherControlMechanisms_ControlMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]'))
      ALTER TABLE [dbo].[OtherControlMechanisms] DROP CONSTRAINT [FK_OtherControlMechanisms_ControlMechanism]
      GO
    

    -- Drop FK constraint from ApproachToControlSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"ApproachToControlSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]'))
    ALTER TABLE [dbo].[ApproachToControlSpecies] DROP CONSTRAINT [FK_ApproachToControlSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to ApproachToControlSpecies
    
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentControlMechanisms]') AND type in (N'U'))
      DROP TABLE [dbo].[CurrentControlMechanisms]
      GO
    
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OtherControlMechanisms]') AND type in (N'U'))
      DROP TABLE [dbo].[OtherControlMechanisms]
      GO
    

    -- Drop table ApproachToControlSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApproachToControlSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[ApproachToControlSpecies]
    GO

  

    -- DROP TABLE EpidemiologySpecies

      
    
    -- Drop any FK constraints from Ids within table EpidemiologySpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_PotentialForSilentSpread]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_PotentialForSilentSpread]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_MortalityIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_MortalityIndicator]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_DurationOfDisease]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_DurationOfDisease]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_PrimaryDetectionMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_PrimaryDetectionMethods]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_RateOfSpreadOnPremises]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_RateOfSpreadOnPremises]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_WildlifeReservoirIndicator]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_WildlifeReservoirIndicator]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EpidemiologySpecies_IncreaseUnderstandingPotential]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
        ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_IncreaseUnderstandingPotential]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to EpidemiologySpecies
    
      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransmissionMechanism_EpidemiologySpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]'))
      ALTER TABLE [dbo].[TransmissionMechanism] DROP CONSTRAINT [FK_TransmissionMechanism_EpidemiologySpecies]
      GO

      IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransmissionMechanism_TransmissionMechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]'))
      ALTER TABLE [dbo].[TransmissionMechanism] DROP CONSTRAINT [FK_TransmissionMechanism_TransmissionMechanism]
      GO
    

    -- Drop FK constraint from EpidemiologySpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"EpidemiologySpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]'))
    ALTER TABLE [dbo].[EpidemiologySpecies] DROP CONSTRAINT [FK_EpidemiologySpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to EpidemiologySpecies
    
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransmissionMechanism]') AND type in (N'U'))
      DROP TABLE [dbo].[TransmissionMechanism]
      GO
    

    -- Drop table EpidemiologySpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EpidemiologySpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[EpidemiologySpecies]
    GO

  

    -- DROP TABLE GeographicDistributionSpecies

      
    
    -- Drop any FK constraints from Ids within table GeographicDistributionSpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionSpecies_NumberOfCasesPerYearInGB]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
        ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_NumberOfCasesPerYearInGB]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GeographicDistributionSpecies_PotentialForRiskChange]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
        ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_PotentialForRiskChange]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to GeographicDistributionSpecies
    

    -- Drop FK constraint from GeographicDistributionSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"GeographicDistributionSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]'))
    ALTER TABLE [dbo].[GeographicDistributionSpecies] DROP CONSTRAINT [FK_GeographicDistributionSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to GeographicDistributionSpecies
    

    -- Drop table GeographicDistributionSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeographicDistributionSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[GeographicDistributionSpecies]
    GO

  

    -- DROP TABLE HumanHealthSpecies

      
    
    -- Drop any FK constraints from Ids within table HumanHealthSpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealthSpecies_LevelOfHumanExposureToAnimalOrProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
        ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_LevelOfHumanExposureToAnimalOrProducts]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HumanHealthSpecies_AttributableFraction]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
        ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_AttributableFraction]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to HumanHealthSpecies
    

    -- Drop FK constraint from HumanHealthSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"HumanHealthSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]'))
    ALTER TABLE [dbo].[HumanHealthSpecies] DROP CONSTRAINT [FK_HumanHealthSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to HumanHealthSpecies
    

    -- Drop table HumanHealthSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HumanHealthSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[HumanHealthSpecies]
    GO

  

    -- DROP TABLE InternationalTradeSpecies

      
    
    -- Drop any FK constraints from Ids within table InternationalTradeSpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_CommercialTrade]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_CommercialTrade]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnLevelOfImports]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnLevelOfImports]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImportanceOfExportTrade]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImportanceOfExportTrade]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnIntraCommunityFlows]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnIntraCommunityFlows]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ImpactOnThirdCountryFlows]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnThirdCountryFlows]
        GO
      
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InternationalTradeSpecies_ExportMarketValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
        ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ExportMarketValue]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to InternationalTradeSpecies
    

    -- Drop FK constraint from InternationalTradeSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"InternationalTradeSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]'))
    ALTER TABLE [dbo].[InternationalTradeSpecies] DROP CONSTRAINT [FK_InternationalTradeSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to InternationalTradeSpecies
    

    -- Drop table InternationalTradeSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternationalTradeSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[InternationalTradeSpecies]
    GO

  

    -- DROP TABLE RiskSpecies

      
    
    -- Drop any FK constraints from Ids within table RiskSpecies to lookup tables
    

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to RiskSpecies
    

    -- Drop FK constraint from RiskSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"RiskSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[RiskSpecies]'))
    ALTER TABLE [dbo].[RiskSpecies] DROP CONSTRAINT [FK_RiskSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to RiskSpecies
    

    -- Drop table RiskSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RiskSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[RiskSpecies]
    GO

  

    -- DROP TABLE SurveillanceSpecies

      

      --DROP TABLE CurrentSurveillanceActivitiesSpecies

      -- Drop any FK constraints from Ids within table CurrentSurveillanceActivitiesSpecies to lookup tables
      
          IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentSurveillanceActivitiesSpecies_Mechanism]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]'))
          ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies] DROP CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_Mechanism]
          GO
        

      -- Drop any FK constraints from link tables to lookup tables and from link tables back to CurrentSurveillanceActivities
            -- Drop FK constraint from CurrentSurveillanceActivitiesSpecies back to the ProfileVersionSpecies table
            IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentSurveillanceActivitiesSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]'))
            ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies] DROP CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_ProfileVersionSpecies]
            GO
          

        -- Drop any link tables that are linked to CurrentSurveillanceActivitiesSpecies
      

      -- Drop table CurrentSurveillanceActivitiesSpecies
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentSurveillanceActivitiesSpecies]') AND type in (N'U'))
      DROP TABLE [dbo].[CurrentSurveillanceActivitiesSpecies]
      GO

    
    
    -- Drop any FK constraints from Ids within table SurveillanceSpecies to lookup tables
    

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to SurveillanceSpecies
    

    -- Drop FK constraint from SurveillanceSpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"SurveillanceSpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurveillanceSpecies]'))
    ALTER TABLE [dbo].[SurveillanceSpecies] DROP CONSTRAINT [FK_SurveillanceSpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to SurveillanceSpecies
    

    -- Drop table SurveillanceSpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurveillanceSpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[SurveillanceSpecies]
    GO

  

    -- DROP TABLE WiderSocietySpecies

      
    
    -- Drop any FK constraints from Ids within table WiderSocietySpecies to lookup tables
    
        IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WiderSocietySpecies_LocalAgriculturalEconomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]'))
        ALTER TABLE [dbo].[WiderSocietySpecies] DROP CONSTRAINT [FK_WiderSocietySpecies_LocalAgriculturalEconomy]
        GO
      

    -- Drop any FK constraints from link tables to lookup tables and from link tables back to WiderSocietySpecies
    

    -- Drop FK constraint from WiderSocietySpecies back to the ProfileVersionSpecies table
    IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_"WiderSocietySpecies_ProfileVersionSpecies]') AND parent_object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]'))
    ALTER TABLE [dbo].[WiderSocietySpecies] DROP CONSTRAINT [FK_WiderSocietySpecies_ProfileVersionSpecies]
    GO

    -- Drop any link tables that are linked to WiderSocietySpecies
    

    -- Drop table WiderSocietySpecies
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WiderSocietySpecies]') AND type in (N'U'))
    DROP TABLE [dbo].[WiderSocietySpecies]
    GO

  
    -- DROP REFERENCE TABLES

   
     -- Drop FK constraint from Species back to the luTradeImpactLevel table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImportanceOfExportTrade_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImportanceOfExportTrade_luTradeImpactLevel]
    GO
   
     -- Drop FK constraint from Species back to the luTradeImpactLevel table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesExportMarketValue_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesExportMarketValue_luTradeImpactLevel]
    GO
   
     -- Drop FK constraint from Species back to the luTradeImpactLevel table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnIntraCommunityFlows_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnIntraCommunityFlows_luTradeImpactLevel]
    GO
   
     -- Drop FK constraint from Species back to the luImportImpactLevel table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnLevelOfImports_luImportImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnLevelOfImports_luImportImpactLevel]
    GO
   
     -- Drop FK constraint from Species back to the luBooleanFlag table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesCommercialTrade_luBooleanFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesCommercialTrade_luBooleanFlag]
    GO
   
     -- Drop FK constraint from Species back to the luTradeImpactLevel table
     IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SpeciesImpactOnThirdCountryFlows_luTradeImpactLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Species]'))
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_SpeciesImpactOnThirdCountryFlows_luTradeImpactLevel]
    GO
   

    -- Drop reference table luExposureLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luExposureLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luExposureLevel]
    GO
  

    -- Drop reference table luTotalSurveillanceCosts
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTotalSurveillanceCosts]') AND type in (N'U'))
    DROP TABLE [dbo].[luTotalSurveillanceCosts]
    GO
  

    -- Drop reference table luIncubationPeriod
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIncubationPeriod]') AND type in (N'U'))
    DROP TABLE [dbo].[luIncubationPeriod]
    GO
  

    -- Drop reference table luDiseaseDuration
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luDiseaseDuration]') AND type in (N'U'))
    DROP TABLE [dbo].[luDiseaseDuration]
    GO
  

    -- Drop reference table luStatutoryObligationLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luStatutoryObligationLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luStatutoryObligationLevel]
    GO
  

    -- Drop reference table luImportImpactLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luImportImpactLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luImportImpactLevel]
    GO
  

    -- Drop reference table luProportionLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luProportionLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luProportionLevel]
    GO
  

    -- Drop reference table luSpreadMechanism
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSpreadMechanism]') AND type in (N'U'))
    DROP TABLE [dbo].[luSpreadMechanism]
    GO
  

    -- Drop reference table luUncertaintyLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luUncertaintyLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luUncertaintyLevel]
    GO
  

    -- Drop reference table luTransmissionMechanism
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTransmissionMechanism]') AND type in (N'U'))
    DROP TABLE [dbo].[luTransmissionMechanism]
    GO
  

    -- Drop reference table luTransmissibilityIndicator
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTransmissibilityIndicator]') AND type in (N'U'))
    DROP TABLE [dbo].[luTransmissibilityIndicator]
    GO
  

    -- Drop reference table luMortalityLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luMortalityLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luMortalityLevel]
    GO
  

    -- Drop reference table luSpreadRateLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSpreadRateLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luSpreadRateLevel]
    GO
  

    -- Drop reference table luSurveillanceMechanism
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luSurveillanceMechanism]') AND type in (N'U'))
    DROP TABLE [dbo].[luSurveillanceMechanism]
    GO
  

    -- Drop reference table luCasesPerYear
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCasesPerYear]') AND type in (N'U'))
    DROP TABLE [dbo].[luCasesPerYear]
    GO
  

    -- Drop reference table luCommoditiesCompromisedLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCommoditiesCompromisedLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luCommoditiesCompromisedLevel]
    GO
  

    -- Drop reference table luIssueExtent
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIssueExtent]') AND type in (N'U'))
    DROP TABLE [dbo].[luIssueExtent]
    GO
  

    -- Drop reference table luHumanExposureReductionLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luHumanExposureReductionLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luHumanExposureReductionLevel]
    GO
  

    -- Drop reference table luHumanCasesLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luHumanCasesLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luHumanCasesLevel]
    GO
  

    -- Drop reference table luModalSeverityLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luModalSeverityLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luModalSeverityLevel]
    GO
  

    -- Drop reference table luTradeImpactLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTradeImpactLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luTradeImpactLevel]
    GO
  

    -- Drop reference table luGeographicArea
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luGeographicArea]') AND type in (N'U'))
    DROP TABLE [dbo].[luGeographicArea]
    GO
  

    -- Drop reference table luMaximumSeverityLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luMaximumSeverityLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luMaximumSeverityLevel]
    GO
  

    -- Drop reference table luCostLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luCostLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luCostLevel]
    GO
  

    -- Drop reference table luLocalEnvironmentImpactLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luLocalEnvironmentImpactLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luLocalEnvironmentImpactLevel]
    GO
  

    -- Drop reference table luRegionalisationLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRegionalisationLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luRegionalisationLevel]
    GO
  

    -- Drop reference table luLegislationType
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luLegislationType]') AND type in (N'U'))
    DROP TABLE [dbo].[luLegislationType]
    GO
  

    -- Drop reference table luWildlifeReservoirIndicator
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luWildlifeReservoirIndicator]') AND type in (N'U'))
    DROP TABLE [dbo].[luWildlifeReservoirIndicator]
    GO
  

    -- Drop reference table luGlobalEnvironmentImpactLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luGlobalEnvironmentImpactLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luGlobalEnvironmentImpactLevel]
    GO
  

    -- Drop reference table luDiagnosisAndDetectionMechanism
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luDiagnosisAndDetectionMechanism]') AND type in (N'U'))
    DROP TABLE [dbo].[luDiagnosisAndDetectionMechanism]
    GO
  

    -- Drop reference table luUnplannedCostLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luUnplannedCostLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luUnplannedCostLevel]
    GO
  

    -- Drop reference table luBooleanFlag
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luBooleanFlag]') AND type in (N'U'))
    DROP TABLE [dbo].[luBooleanFlag]
    GO
  

    -- Drop reference table luAttributableFraction
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luAttributableFraction]') AND type in (N'U'))
    DROP TABLE [dbo].[luAttributableFraction]
    GO
  

    -- Drop reference table luRiskChange
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRiskChange]') AND type in (N'U'))
    DROP TABLE [dbo].[luRiskChange]
    GO
  

    -- Drop reference table luControlMechanism
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luControlMechanism]') AND type in (N'U'))
    DROP TABLE [dbo].[luControlMechanism]
    GO
  

    -- Drop reference table luIndicatorFlag
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luIndicatorFlag]') AND type in (N'U'))
    DROP TABLE [dbo].[luIndicatorFlag]
    GO
  

    -- Drop reference table luTimePeriod
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luTimePeriod]') AND type in (N'U'))
    DROP TABLE [dbo].[luTimePeriod]
    GO
  

    -- Drop reference table luRiskLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luRiskLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luRiskLevel]
    GO
  

    -- Drop reference table luImpactLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luImpactLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luImpactLevel]
    GO
  

    -- Drop reference table luPrevalenceLevel
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[luPrevalenceLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[luPrevalenceLevel]
    GO
  
    -- CREATE REFERENCE TABLES
  
    -- Create reference table luExposureLevel
    CREATE TABLE [dbo].[luExposureLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luExposureLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luTotalSurveillanceCosts
    CREATE TABLE [dbo].[luTotalSurveillanceCosts](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luTotalSurveillanceCosts] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luIncubationPeriod
    CREATE TABLE [dbo].[luIncubationPeriod](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luIncubationPeriod] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luDiseaseDuration
    CREATE TABLE [dbo].[luDiseaseDuration](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luDiseaseDuration] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luStatutoryObligationLevel
    CREATE TABLE [dbo].[luStatutoryObligationLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luStatutoryObligationLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luImportImpactLevel
    CREATE TABLE [dbo].[luImportImpactLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luImportImpactLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luProportionLevel
    CREATE TABLE [dbo].[luProportionLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luProportionLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luSpreadMechanism
    CREATE TABLE [dbo].[luSpreadMechanism](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luSpreadMechanism] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luUncertaintyLevel
    CREATE TABLE [dbo].[luUncertaintyLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luUncertaintyLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luTransmissionMechanism
    CREATE TABLE [dbo].[luTransmissionMechanism](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luTransmissionMechanism] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luTransmissibilityIndicator
    CREATE TABLE [dbo].[luTransmissibilityIndicator](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luTransmissibilityIndicator] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luMortalityLevel
    CREATE TABLE [dbo].[luMortalityLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luMortalityLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luSpreadRateLevel
    CREATE TABLE [dbo].[luSpreadRateLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luSpreadRateLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luSurveillanceMechanism
    CREATE TABLE [dbo].[luSurveillanceMechanism](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luSurveillanceMechanism] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luCasesPerYear
    CREATE TABLE [dbo].[luCasesPerYear](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luCasesPerYear] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luCommoditiesCompromisedLevel
    CREATE TABLE [dbo].[luCommoditiesCompromisedLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luCommoditiesCompromisedLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luIssueExtent
    CREATE TABLE [dbo].[luIssueExtent](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luIssueExtent] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luHumanExposureReductionLevel
    CREATE TABLE [dbo].[luHumanExposureReductionLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luHumanExposureReductionLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luHumanCasesLevel
    CREATE TABLE [dbo].[luHumanCasesLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luHumanCasesLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luModalSeverityLevel
    CREATE TABLE [dbo].[luModalSeverityLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luModalSeverityLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luTradeImpactLevel
    CREATE TABLE [dbo].[luTradeImpactLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luTradeImpactLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luGeographicArea
    CREATE TABLE [dbo].[luGeographicArea](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luGeographicArea] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luMaximumSeverityLevel
    CREATE TABLE [dbo].[luMaximumSeverityLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luMaximumSeverityLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luCostLevel
    CREATE TABLE [dbo].[luCostLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luCostLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luLocalEnvironmentImpactLevel
    CREATE TABLE [dbo].[luLocalEnvironmentImpactLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luLocalEnvironmentImpactLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luRegionalisationLevel
    CREATE TABLE [dbo].[luRegionalisationLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luRegionalisationLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luLegislationType
    CREATE TABLE [dbo].[luLegislationType](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luLegislationType] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luWildlifeReservoirIndicator
    CREATE TABLE [dbo].[luWildlifeReservoirIndicator](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luWildlifeReservoirIndicator] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luGlobalEnvironmentImpactLevel
    CREATE TABLE [dbo].[luGlobalEnvironmentImpactLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luGlobalEnvironmentImpactLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luDiagnosisAndDetectionMechanism
    CREATE TABLE [dbo].[luDiagnosisAndDetectionMechanism](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luDiagnosisAndDetectionMechanism] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luUnplannedCostLevel
    CREATE TABLE [dbo].[luUnplannedCostLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luUnplannedCostLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luBooleanFlag
    CREATE TABLE [dbo].[luBooleanFlag](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luBooleanFlag] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luAttributableFraction
    CREATE TABLE [dbo].[luAttributableFraction](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luAttributableFraction] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luRiskChange
    CREATE TABLE [dbo].[luRiskChange](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luRiskChange] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luControlMechanism
    CREATE TABLE [dbo].[luControlMechanism](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
    [EffectiveDateFrom] [smalldatetime] NOT NULL,
    [EffectiveDateTo] [smalldatetime] NULL,
    [LastUpdated] [timestamp],
      
    CONSTRAINT [PK_luControlMechanism] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luIndicatorFlag
    CREATE TABLE [dbo].[luIndicatorFlag](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luIndicatorFlag] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luTimePeriod
    CREATE TABLE [dbo].[luTimePeriod](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luTimePeriod] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luRiskLevel
    CREATE TABLE [dbo].[luRiskLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luRiskLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luImpactLevel
    CREATE TABLE [dbo].[luImpactLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luImpactLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  
    -- Create reference table luPrevalenceLevel
    CREATE TABLE [dbo].[luPrevalenceLevel](
    [Id] [uniqueidentifier] NOT NULL,
    [LookupValue] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
    
        [SequenceNumber] [tinyint] NOT NULL,
      
    CONSTRAINT [PK_luPrevalenceLevel] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    GO

  

    -- CREATE TABLE AnimalWelfare
        CREATE TABLE [dbo].[AnimalWelfare](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [SummaryImpactOnAnimalWelfare] text NULL,
        
        CONSTRAINT [PK_AnimalWelfare] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from AnimalWelfare to ProfileVersion table
        ALTER TABLE [dbo].[AnimalWelfare]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfare_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to AnimalWelfare table
      
      
      -- Create FK constraints from foreign key ids of AnimalWelfare table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to AnimalWelfare table
      

    -- CREATE TABLE ApproachToControl
        CREATE TABLE [dbo].[ApproachToControl](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [ControlsAboveTheHoldingLevel] uniqueidentifier NULL,
        
          [ControlsAboveTheHoldingLevelComments] text NULL,
        
        CONSTRAINT [PK_ApproachToControl] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from ApproachToControl to ProfileVersion table
        ALTER TABLE [dbo].[ApproachToControl]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControl_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to ApproachToControl table
      
      
      -- Create FK constraints from foreign key ids of ApproachToControl table to lookup tables
    
          ALTER TABLE [dbo].[ApproachToControl]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControl_ControlsAboveTheHoldingLevel] FOREIGN KEY([ControlsAboveTheHoldingLevel])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to ApproachToControl table
      

    -- CREATE TABLE AreasOfUncertainty
        CREATE TABLE [dbo].[AreasOfUncertainty](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [AreasOfUncertaintySummary] text NULL,
        
        CONSTRAINT [PK_AreasOfUncertainty] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from AreasOfUncertainty to ProfileVersion table
        ALTER TABLE [dbo].[AreasOfUncertainty]  WITH CHECK ADD  CONSTRAINT [FK_AreasOfUncertainty_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to AreasOfUncertainty table
      
      
      -- Create FK constraints from foreign key ids of AreasOfUncertainty table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to AreasOfUncertainty table
      

    -- CREATE TABLE Epidemiology
        CREATE TABLE [dbo].[Epidemiology](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [SuspectCaseDefinition] text NULL,
        
          [ProbableCaseDefinition] text NULL,
        
          [ConfirmedCaseDefinition] text NULL,
        
          [DiagnosisMechanismComments] text NULL,
        
          [AgentDescription] text NULL,
        
          [TherapeuticAgentSusceptibility] text NULL,
        
          [PersistenceInEnvironmentIndicator] uniqueidentifier NULL,
        
          [PersistenceInEnvironmentIndicatorComments] text NULL,
        
          [SpreadMechanismComments] text NULL,
        
          [MultiSpeciesSummary] text NULL,
        
        CONSTRAINT [PK_Epidemiology] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from Epidemiology to ProfileVersion table
        ALTER TABLE [dbo].[Epidemiology]  WITH CHECK ADD  CONSTRAINT [FK_Epidemiology_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to Epidemiology table
      
        CREATE TABLE [dbo].[ConfirmationOfDiagnosis](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [DiagnosisAndDetectionMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_ConfirmationOfDiagnosis] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[ConfirmationOfDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationOfDiagnosis_Epidemiology] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[Epidemiology] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[ConfirmationOfDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationOfDiagnosis_DiagnosisAndDetectionMechanism] FOREIGN KEY([DiagnosisAndDetectionMechanismId])
        REFERENCES [dbo].[luDiagnosisAndDetectionMechanism] ([Id])
        GO
      
        CREATE TABLE [dbo].[SpreadMechanism](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpreadMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_SpreadMechanism] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[SpreadMechanism]  WITH CHECK ADD  CONSTRAINT [FK_SpreadMechanism_Epidemiology] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[Epidemiology] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[SpreadMechanism]  WITH CHECK ADD  CONSTRAINT [FK_SpreadMechanism_SpreadMechanism] FOREIGN KEY([SpreadMechanismId])
        REFERENCES [dbo].[luSpreadMechanism] ([Id])
        GO
      
      
      -- Create FK constraints from foreign key ids of Epidemiology table to lookup tables
    
          ALTER TABLE [dbo].[Epidemiology]  WITH CHECK ADD  CONSTRAINT [FK_Epidemiology_PersistenceInEnvironmentIndicator] FOREIGN KEY([PersistenceInEnvironmentIndicator])
          REFERENCES [dbo].[luTimePeriod] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to Epidemiology table
      

    -- CREATE TABLE GeographicDistribution
        CREATE TABLE [dbo].[GeographicDistribution](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [GBPresenceIndicator] bit NULL,
        
          [GBPresenceIndicatorComments] text NULL,
        
          [CurrentPrevalenceInGB] uniqueidentifier NULL,
        
          [CurrentPrevalenceInGBComments] text NULL,
        
          [DateOfMostRecentOccurrenceInGB] datetime NULL,
        
          [DateOfMostRecentOccurrenceInGBComments] text NULL,
        
          [RiskOfIntroductionToGB] uniqueidentifier NULL,
        
          [RiskOfIntroductionToGBComments] text NULL,
        
          [GlobalGeographicDistributionComments] text NULL,
        
        CONSTRAINT [PK_GeographicDistribution] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from GeographicDistribution to ProfileVersion table
        ALTER TABLE [dbo].[GeographicDistribution]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistribution_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to GeographicDistribution table
      
        CREATE TABLE [dbo].[GlobalGeographicDistribution](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [GeographicAreaId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_GlobalGeographicDistribution] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[GlobalGeographicDistribution]  WITH CHECK ADD  CONSTRAINT [FK_GlobalGeographicDistribution_GeographicDistribution] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[GeographicDistribution] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[GlobalGeographicDistribution]  WITH CHECK ADD  CONSTRAINT [FK_GlobalGeographicDistribution_GeographicArea] FOREIGN KEY([GeographicAreaId])
        REFERENCES [dbo].[luGeographicArea] ([Id])
        GO
      
      
      -- Create FK constraints from foreign key ids of GeographicDistribution table to lookup tables
    
          ALTER TABLE [dbo].[GeographicDistribution]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistribution_CurrentPrevalenceInGB] FOREIGN KEY([CurrentPrevalenceInGB])
          REFERENCES [dbo].[luPrevalenceLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[GeographicDistribution]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistribution_RiskOfIntroductionToGB] FOREIGN KEY([RiskOfIntroductionToGB])
          REFERENCES [dbo].[luRiskLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to GeographicDistribution table
      

    -- CREATE TABLE HumanHealth
        CREATE TABLE [dbo].[HumanHealth](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [ZoonoticIndicator] uniqueidentifier NULL,
        
          [ZoonoticIndicatorComments] text NULL,
        
          [HumanTransmissionMechanismComments] text NULL,
        
          [SymptomsOfHumanDisease] text NULL,
        
          [TransmissibilityIndicator] uniqueidentifier NULL,
        
          [TransmissibilityIndicatorComments] text NULL,
        
          [ModalSeverityOfHumanDisease] uniqueidentifier NULL,
        
          [ModalSeverityOfHumanDiseaseComments] text NULL,
        
          [MaximumSeverityOfHumanDisease] uniqueidentifier NULL,
        
          [MaximumSeverityOfHumanDiseaseComments] text NULL,
        
          [GeographicDistributionOfHumanDiseaseComments] text NULL,
        
          [AnnualNumberOfHumanCasesInGB] uniqueidentifier NULL,
        
          [AnnualNumberOfHumanCasesInGBComments] text NULL,
        
          [AverageCostPerCase] uniqueidentifier NULL,
        
          [AverageCostPerCaseComments] text NULL,
        
          [IndirectEconomicCostOfHumanIllness] uniqueidentifier NULL,
        
          [IndirectEconomicCostOfHumanIllnessComments] text NULL,
        
          [Uncertainty] uniqueidentifier NULL,
        
          [UncertaintyComments] text NULL,
        
          [ImpactOnHumanHealth] text NULL,
        
        CONSTRAINT [PK_HumanHealth] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from HumanHealth to ProfileVersion table
        ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to HumanHealth table
      
        CREATE TABLE [dbo].[HumanTransmissionMechanism](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [TransmissionMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_HumanTransmissionMechanism] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[HumanTransmissionMechanism]  WITH CHECK ADD  CONSTRAINT [FK_HumanTransmissionMechanism_HumanHealth] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[HumanHealth] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[HumanTransmissionMechanism]  WITH CHECK ADD  CONSTRAINT [FK_HumanTransmissionMechanism_TransmissionMechanism] FOREIGN KEY([TransmissionMechanismId])
        REFERENCES [dbo].[luTransmissionMechanism] ([Id])
        GO
      
        CREATE TABLE [dbo].[GeographicDistributionOfHumanDisease](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [GeographicAreaId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_GeographicDistributionOfHumanDisease] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistributionOfHumanDisease_HumanHealth] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[HumanHealth] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[GeographicDistributionOfHumanDisease]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistributionOfHumanDisease_GeographicArea] FOREIGN KEY([GeographicAreaId])
        REFERENCES [dbo].[luGeographicArea] ([Id])
        GO
      
      
      -- Create FK constraints from foreign key ids of HumanHealth table to lookup tables
    
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_ZoonoticIndicator] FOREIGN KEY([ZoonoticIndicator])
          REFERENCES [dbo].[luIndicatorFlag] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_TransmissibilityIndicator] FOREIGN KEY([TransmissibilityIndicator])
          REFERENCES [dbo].[luTransmissibilityIndicator] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_ModalSeverityOfHumanDisease] FOREIGN KEY([ModalSeverityOfHumanDisease])
          REFERENCES [dbo].[luModalSeverityLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_MaximumSeverityOfHumanDisease] FOREIGN KEY([MaximumSeverityOfHumanDisease])
          REFERENCES [dbo].[luMaximumSeverityLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_AnnualNumberOfHumanCasesInGB] FOREIGN KEY([AnnualNumberOfHumanCasesInGB])
          REFERENCES [dbo].[luHumanCasesLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_AverageCostPerCase] FOREIGN KEY([AverageCostPerCase])
          REFERENCES [dbo].[luCostLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_IndirectEconomicCostOfHumanIllness] FOREIGN KEY([IndirectEconomicCostOfHumanIllness])
          REFERENCES [dbo].[luCostLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealth]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealth_Uncertainty] FOREIGN KEY([Uncertainty])
          REFERENCES [dbo].[luUncertaintyLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to HumanHealth table
      

    -- CREATE TABLE InternationalTrade
        CREATE TABLE [dbo].[InternationalTrade](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [StatutoryObligationToControl] uniqueidentifier NULL,
        
          [StatutoryObligationToControlComments] text NULL,
        
          [ReestablishmentOfTradingStatus] uniqueidentifier NULL,
        
          [ReestablishmentOfTradingStatusComments] text NULL,
        
          [PotentialForRegionalisation] uniqueidentifier NULL,
        
          [PotentialForRegionalisationComments] text NULL,
        
          [RangeOfCommoditiesCompromised] uniqueidentifier NULL,
        
          [RangeOfCommoditiesCompromisedComments] text NULL,
        
          [ImpactOnInternationalTrade] text NULL,
        
        CONSTRAINT [PK_InternationalTrade] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from InternationalTrade to ProfileVersion table
        ALTER TABLE [dbo].[InternationalTrade]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTrade_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to InternationalTrade table
      
      
      -- Create FK constraints from foreign key ids of InternationalTrade table to lookup tables
    
          ALTER TABLE [dbo].[InternationalTrade]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTrade_StatutoryObligationToControl] FOREIGN KEY([StatutoryObligationToControl])
          REFERENCES [dbo].[luStatutoryObligationLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTrade]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTrade_ReestablishmentOfTradingStatus] FOREIGN KEY([ReestablishmentOfTradingStatus])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTrade]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTrade_PotentialForRegionalisation] FOREIGN KEY([PotentialForRegionalisation])
          REFERENCES [dbo].[luRegionalisationLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTrade]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTrade_RangeOfCommoditiesCompromised] FOREIGN KEY([RangeOfCommoditiesCompromised])
          REFERENCES [dbo].[luCommoditiesCompromisedLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to InternationalTrade table
      

    -- CREATE TABLE LegislationAndMandates
        CREATE TABLE [dbo].[LegislationAndMandates](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [NotifiableDiseaseIndicator] bit NULL,
        
          [ReportableCausativeOrganismIndicator] bit NULL,
        
          [ApplicableLegislationAndMandatesComments] text NULL,
        
          [LegislationOverview] text NULL,
        
        CONSTRAINT [PK_LegislationAndMandates] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from LegislationAndMandates to ProfileVersion table
        ALTER TABLE [dbo].[LegislationAndMandates]  WITH CHECK ADD  CONSTRAINT [FK_LegislationAndMandates_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to LegislationAndMandates table
      
        CREATE TABLE [dbo].[ApplicableLegislationAndMandates](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [LegislationTypeId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_ApplicableLegislationAndMandates] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[ApplicableLegislationAndMandates]  WITH CHECK ADD  CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationAndMandates] FOREIGN KEY([ProfileVersionId])
            REFERENCES [dbo].[LegislationAndMandates] ([ProfileVersionId])
            GO
          
        
        ALTER TABLE [dbo].[ApplicableLegislationAndMandates]  WITH CHECK ADD  CONSTRAINT [FK_ApplicableLegislationAndMandates_LegislationType] FOREIGN KEY([LegislationTypeId])
        REFERENCES [dbo].[luLegislationType] ([Id])
        GO
      
      
      -- Create FK constraints from foreign key ids of LegislationAndMandates table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to LegislationAndMandates table
      

    -- CREATE TABLE OpportunityToAddValue
        CREATE TABLE [dbo].[OpportunityToAddValue](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [OpportunityToAddValueSummary] text NULL,
        
        CONSTRAINT [PK_OpportunityToAddValue] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from OpportunityToAddValue to ProfileVersion table
        ALTER TABLE [dbo].[OpportunityToAddValue]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityToAddValue_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to OpportunityToAddValue table
      
      
      -- Create FK constraints from foreign key ids of OpportunityToAddValue table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to OpportunityToAddValue table
      

    -- CREATE TABLE PublicAndStakeholderPerception
        CREATE TABLE [dbo].[PublicAndStakeholderPerception](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [PublicAndStakeholderPerceptionSummary] text NULL,
        
        CONSTRAINT [PK_PublicAndStakeholderPerception] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from PublicAndStakeholderPerception to ProfileVersion table
        ALTER TABLE [dbo].[PublicAndStakeholderPerception]  WITH CHECK ADD  CONSTRAINT [FK_PublicAndStakeholderPerception_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to PublicAndStakeholderPerception table
      
      
      -- Create FK constraints from foreign key ids of PublicAndStakeholderPerception table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to PublicAndStakeholderPerception table
      

    -- CREATE TABLE Summary
        CREATE TABLE [dbo].[Summary](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [Description] text NULL,
        
          [AffectedSpeciesComments] text NULL,
        
          [OtherAffectedSpeciesComments] text NULL,
        
          [ScenarioDescription] text NULL,
        
          [RevisionHistory] text NULL,
        
        CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from Summary to ProfileVersion table
        ALTER TABLE [dbo].[Summary]  WITH CHECK ADD  CONSTRAINT [FK_Summary_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to Summary table
      
      
      -- Create FK constraints from foreign key ids of Summary table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to Summary table
      

    -- CREATE TABLE Surveillance
        CREATE TABLE [dbo].[Surveillance](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [SummaryOfSurveillanceActivities] text NULL,
        
        CONSTRAINT [PK_Surveillance] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from Surveillance to ProfileVersion table
        ALTER TABLE [dbo].[Surveillance]  WITH CHECK ADD  CONSTRAINT [FK_Surveillance_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to Surveillance table
      
      
      -- Create FK constraints from foreign key ids of Surveillance table to lookup tables
    
      -- Create link tables for repeating questions that need to be attached to Surveillance table
      

    -- CREATE TABLE WiderSociety
        CREATE TABLE [dbo].[WiderSociety](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        
          [PotentialUnplannedCostToExchequer] uniqueidentifier NULL,
        
          [PotentialUnplannedCostToExchequerComments] text NULL,
        
          [GlobalEnvironment] uniqueidentifier NULL,
        
          [GlobalEnvironmentComments] text NULL,
        
          [LocalEnvironment] uniqueidentifier NULL,
        
          [LocalEnvironmentComments] text NULL,
        
          [WiderRuralCommunity] uniqueidentifier NULL,
        
          [WiderRuralCommunityComments] text NULL,
        
          [TotalSurveillanceCosts] uniqueidentifier NULL,
        
          [TotalSurveillanceCostsComments] text NULL,
        
          [ImpactOnSocietySummary] text NULL,
        
          [FFGCostsSummary] text NULL,
        
        CONSTRAINT [PK_WiderSociety] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from WiderSociety to ProfileVersion table
        ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_ProfileVersion] FOREIGN KEY([ProfileVersionId])
          REFERENCES [dbo].[ProfileVersion] ([Id])
          GO
      
      
      -- Create link tables for multi-value fields that need to be attached to WiderSociety table
      
      
      -- Create FK constraints from foreign key ids of WiderSociety table to lookup tables
    
          ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_PotentialUnplannedCostToExchequer] FOREIGN KEY([PotentialUnplannedCostToExchequer])
          REFERENCES [dbo].[luUnplannedCostLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_GlobalEnvironment] FOREIGN KEY([GlobalEnvironment])
          REFERENCES [dbo].[luGlobalEnvironmentImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_LocalEnvironment] FOREIGN KEY([LocalEnvironment])
          REFERENCES [dbo].[luLocalEnvironmentImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_WiderRuralCommunity] FOREIGN KEY([WiderRuralCommunity])
          REFERENCES [dbo].[luMortalityLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[WiderSociety]  WITH CHECK ADD  CONSTRAINT [FK_WiderSociety_TotalSurveillanceCosts] FOREIGN KEY([TotalSurveillanceCosts])
          REFERENCES [dbo].[luTotalSurveillanceCosts] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to WiderSociety table
      

      -- CREATE TABLE AnimalWelfareSpecies
      
        CREATE TABLE [dbo].[AnimalWelfareSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [WelfareIssueIndicator] bit NULL,
        
          [WelfareIssueIndicatorComments] text NULL,
        
          [FreedomFromHungerAndThirst] uniqueidentifier NULL,
        
          [FreedomFromHungerAndThirstComments] text NULL,
        
          [FreedomFromDiscomfort] uniqueidentifier NULL,
        
          [FreedomFromDiscomfortComments] text NULL,
        
          [FreedomFromPainOrInjury] uniqueidentifier NULL,
        
          [FreedomFromPainOrInjuryComments] text NULL,
        
          [FreedomToExpressNormalBehaviour] uniqueidentifier NULL,
        
          [FreedomToExpressNormalBehaviourComments] text NULL,
        
          [FreedomFromFearAndDistress] uniqueidentifier NULL,
        
          [FreedomFromFearAndDistressComments] text NULL,
        
          [PotentialToReduceWelfareImplications] uniqueidentifier NULL,
        
          [PotentialToReduceWelfareImplicationsComments] text NULL,
        
          [ProportionOfAnimalsAffectedSufferingSeverely] uniqueidentifier NULL,
        
          [ProportionOfAnimalsAffectedSufferingSeverelyComments] text NULL,
        
        CONSTRAINT [PK_AnimalWelfareSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from AnimalWelfareSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to AnimalWelfareSpecies table
      

      -- Create FK constraints from foreign key ids of AnimalWelfareSpecies table to lookup tables
      
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromHungerAndThirst] FOREIGN KEY([FreedomFromHungerAndThirst])
          REFERENCES [dbo].[luIssueExtent] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromDiscomfort] FOREIGN KEY([FreedomFromDiscomfort])
          REFERENCES [dbo].[luIssueExtent] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromPainOrInjury] FOREIGN KEY([FreedomFromPainOrInjury])
          REFERENCES [dbo].[luIssueExtent] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_FreedomToExpressNormalBehaviour] FOREIGN KEY([FreedomToExpressNormalBehaviour])
          REFERENCES [dbo].[luIssueExtent] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_FreedomFromFearAndDistress] FOREIGN KEY([FreedomFromFearAndDistress])
          REFERENCES [dbo].[luIssueExtent] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_PotentialToReduceWelfareImplications] FOREIGN KEY([PotentialToReduceWelfareImplications])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[AnimalWelfareSpecies]  WITH CHECK ADD  CONSTRAINT [FK_AnimalWelfareSpecies_ProportionOfAnimalsAffectedSufferingSeverely] FOREIGN KEY([ProportionOfAnimalsAffectedSufferingSeverely])
          REFERENCES [dbo].[luProportionLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to AnimalWelfareSpecies table
      

      -- CREATE TABLE ApproachToControlSpecies
      
        CREATE TABLE [dbo].[ApproachToControlSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [CurrentControlMechanismsComments] text NULL,
        
          [OtherControlMechanismsComments] text NULL,
        
          [UptakeAtHoldingLevel] uniqueidentifier NULL,
        
          [UptakeAtHoldingLevelComments] text NULL,
        
          [WelfareEffect] uniqueidentifier NULL,
        
          [WelfareEffectComments] text NULL,
        
          [PotentialToReduceRisk] uniqueidentifier NULL,
        
          [PotentialToReduceRiskComments] text NULL,
        
          [PotentialToReduceHumanExposure] uniqueidentifier NULL,
        
          [PotentialToReduceHumanExposureComments] text NULL,
        
          [VaccinesAvailableIndicator] bit NULL,
        
          [VaccinesAvailableIndicatorComments] text NULL,
        
          [ControlsAtTheHoldingLevel] uniqueidentifier NULL,
        
          [ControlsAtTheHoldingLevelComments] text NULL,
        
          [Compensation] text NULL,
        
          [LevelOfNationalPreparedness] uniqueidentifier NULL,
        
          [LevelOfNationalPreparednessComments] text NULL,
        
        CONSTRAINT [PK_ApproachToControlSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from ApproachToControlSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to ApproachToControlSpecies table
      
        CREATE TABLE [dbo].[CurrentControlMechanisms](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] uniqueidentifier NOT NULL,
        [ControlMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_CurrentControlMechanisms] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[CurrentControlMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_CurrentControlMechanisms_ApproachToControlSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[ApproachToControlSpecies] ([ProfileVersionId], [SpeciesId])
            GO
          

        ALTER TABLE [dbo].[CurrentControlMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_CurrentControlMechanisms_ControlMechanism] FOREIGN KEY([ControlMechanismId])
        REFERENCES [dbo].[luControlMechanism] ([Id])
        GO
      
        CREATE TABLE [dbo].[OtherControlMechanisms](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] uniqueidentifier NOT NULL,
        [ControlMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_OtherControlMechanisms] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[OtherControlMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_OtherControlMechanisms_ApproachToControlSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[ApproachToControlSpecies] ([ProfileVersionId], [SpeciesId])
            GO
          

        ALTER TABLE [dbo].[OtherControlMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_OtherControlMechanisms_ControlMechanism] FOREIGN KEY([ControlMechanismId])
        REFERENCES [dbo].[luControlMechanism] ([Id])
        GO
      

      -- Create FK constraints from foreign key ids of ApproachToControlSpecies table to lookup tables
      
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_UptakeAtHoldingLevel] FOREIGN KEY([UptakeAtHoldingLevel])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_WelfareEffect] FOREIGN KEY([WelfareEffect])
          REFERENCES [dbo].[luProportionLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceRisk] FOREIGN KEY([PotentialToReduceRisk])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_PotentialToReduceHumanExposure] FOREIGN KEY([PotentialToReduceHumanExposure])
          REFERENCES [dbo].[luHumanExposureReductionLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_ControlsAtTheHoldingLevel] FOREIGN KEY([ControlsAtTheHoldingLevel])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[ApproachToControlSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ApproachToControlSpecies_LevelOfNationalPreparedness] FOREIGN KEY([LevelOfNationalPreparedness])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to ApproachToControlSpecies table
      

      -- CREATE TABLE EpidemiologySpecies
      
        CREATE TABLE [dbo].[EpidemiologySpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [DifferentialDiagnoses] text NULL,
        
          [PotentialForSilentSpread] uniqueidentifier NULL,
        
          [PotentialForSilentSpreadComments] text NULL,
        
          [IncubationPeriodTypicalLower] money NULL,
        
          [IncubationPeriodTypicalUpper] money NULL,
        
          [IncubationPeriodMinimum] money NULL,
        
          [IncubationPeriodMaximum] money NULL,
        
          [ClinicalSigns] text NULL,
        
          [PathologicalFeatures] text NULL,
        
          [MortalityIndicator] uniqueidentifier NULL,
        
          [MortalityIndicatorComments] text NULL,
        
          [DurationOfDisease] uniqueidentifier NULL,
        
          [DurationOfDiseaseComments] text NULL,
        
          [PrimaryDetectionMethods] uniqueidentifier NULL,
        
          [DetectionMethodTypeComments] text NULL,
        
          [TransmissionMechanismComments] text NULL,
        
          [RateOfSpreadOnPremises] uniqueidentifier NULL,
        
          [RateOfSpreadOnPremisesComments] text NULL,
        
          [WildlifeReservoirIndicator] uniqueidentifier NULL,
        
          [WildlifeReservoirIndicatorComments] text NULL,
        
          [IncreaseUnderstandingPotential] uniqueidentifier NULL,
        
          [IncreaseUnderstandingPotentialComments] text NULL,
        
        CONSTRAINT [PK_EpidemiologySpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from EpidemiologySpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to EpidemiologySpecies table
      
        CREATE TABLE [dbo].[TransmissionMechanism](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] uniqueidentifier NOT NULL,
        [TransmissionMechanismId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_TransmissionMechanism] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[TransmissionMechanism]  WITH CHECK ADD  CONSTRAINT [FK_TransmissionMechanism_EpidemiologySpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[EpidemiologySpecies] ([ProfileVersionId], [SpeciesId])
            GO
          

        ALTER TABLE [dbo].[TransmissionMechanism]  WITH CHECK ADD  CONSTRAINT [FK_TransmissionMechanism_TransmissionMechanism] FOREIGN KEY([TransmissionMechanismId])
        REFERENCES [dbo].[luTransmissionMechanism] ([Id])
        GO
      

      -- Create FK constraints from foreign key ids of EpidemiologySpecies table to lookup tables
      
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_PotentialForSilentSpread] FOREIGN KEY([PotentialForSilentSpread])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_MortalityIndicator] FOREIGN KEY([MortalityIndicator])
          REFERENCES [dbo].[luMortalityLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_DurationOfDisease] FOREIGN KEY([DurationOfDisease])
          REFERENCES [dbo].[luDiseaseDuration] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_PrimaryDetectionMethods] FOREIGN KEY([PrimaryDetectionMethods])
          REFERENCES [dbo].[luDiagnosisAndDetectionMechanism] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_RateOfSpreadOnPremises] FOREIGN KEY([RateOfSpreadOnPremises])
          REFERENCES [dbo].[luSpreadRateLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_WildlifeReservoirIndicator] FOREIGN KEY([WildlifeReservoirIndicator])
          REFERENCES [dbo].[luWildlifeReservoirIndicator] ([Id])
          GO
        
          ALTER TABLE [dbo].[EpidemiologySpecies]  WITH CHECK ADD  CONSTRAINT [FK_EpidemiologySpecies_IncreaseUnderstandingPotential] FOREIGN KEY([IncreaseUnderstandingPotential])
          REFERENCES [dbo].[luImpactLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to EpidemiologySpecies table
      

      -- CREATE TABLE GeographicDistributionSpecies
      
        CREATE TABLE [dbo].[GeographicDistributionSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [NumberOfCasesPerYearInGB] uniqueidentifier NULL,
        
          [NumberOfCasesPerYearInGBComments] text NULL,
        
          [PotentialForRiskChange] uniqueidentifier NULL,
        
          [PotentialForRiskChangeComments] text NULL,
        
        CONSTRAINT [PK_GeographicDistributionSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from GeographicDistributionSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[GeographicDistributionSpecies]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistributionSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to GeographicDistributionSpecies table
      

      -- Create FK constraints from foreign key ids of GeographicDistributionSpecies table to lookup tables
      
          ALTER TABLE [dbo].[GeographicDistributionSpecies]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistributionSpecies_NumberOfCasesPerYearInGB] FOREIGN KEY([NumberOfCasesPerYearInGB])
          REFERENCES [dbo].[luCasesPerYear] ([Id])
          GO
        
          ALTER TABLE [dbo].[GeographicDistributionSpecies]  WITH CHECK ADD  CONSTRAINT [FK_GeographicDistributionSpecies_PotentialForRiskChange] FOREIGN KEY([PotentialForRiskChange])
          REFERENCES [dbo].[luRiskChange] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to GeographicDistributionSpecies table
      

      -- CREATE TABLE HumanHealthSpecies
      
        CREATE TABLE [dbo].[HumanHealthSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [LevelOfHumanExposureToAnimalOrProducts] uniqueidentifier NULL,
        
          [LevelOfHumanExposureToAnimalOrProductsComments] text NULL,
        
          [AttributableFraction] uniqueidentifier NULL,
        
          [AttributableFractionComments] text NULL,
        
        CONSTRAINT [PK_HumanHealthSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from HumanHealthSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[HumanHealthSpecies]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealthSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to HumanHealthSpecies table
      

      -- Create FK constraints from foreign key ids of HumanHealthSpecies table to lookup tables
      
          ALTER TABLE [dbo].[HumanHealthSpecies]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealthSpecies_LevelOfHumanExposureToAnimalOrProducts] FOREIGN KEY([LevelOfHumanExposureToAnimalOrProducts])
          REFERENCES [dbo].[luExposureLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[HumanHealthSpecies]  WITH CHECK ADD  CONSTRAINT [FK_HumanHealthSpecies_AttributableFraction] FOREIGN KEY([AttributableFraction])
          REFERENCES [dbo].[luAttributableFraction] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to HumanHealthSpecies table
      

      -- CREATE TABLE InternationalTradeSpecies
      
        CREATE TABLE [dbo].[InternationalTradeSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [CommercialTrade] uniqueidentifier NULL,
        
          [CommercialTradeComments] text NULL,
        
          [ImpactOnLevelOfImports] uniqueidentifier NULL,
        
          [ImpactOnLevelOfImportsComments] text NULL,
        
          [ImportanceOfExportTrade] uniqueidentifier NULL,
        
          [ImportanceOfExportTradeComments] text NULL,
        
          [ImpactOnIntraCommunityFlows] uniqueidentifier NULL,
        
          [ImpactOnIntraCommunityFlowsComments] text NULL,
        
          [ImpactOnThirdCountryFlows] uniqueidentifier NULL,
        
          [ImpactOnThirdCountryFlowsComments] text NULL,
        
          [ExportMarketValue] uniqueidentifier NULL,
        
          [ExportMarketValueComments] text NULL,
        
        CONSTRAINT [PK_InternationalTradeSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from InternationalTradeSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to InternationalTradeSpecies table
      

      -- Create FK constraints from foreign key ids of InternationalTradeSpecies table to lookup tables
      
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_CommercialTrade] FOREIGN KEY([CommercialTrade])
          REFERENCES [dbo].[luBooleanFlag] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnLevelOfImports] FOREIGN KEY([ImpactOnLevelOfImports])
          REFERENCES [dbo].[luImportImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ImportanceOfExportTrade] FOREIGN KEY([ImportanceOfExportTrade])
          REFERENCES [dbo].[luTradeImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnIntraCommunityFlows] FOREIGN KEY([ImpactOnIntraCommunityFlows])
          REFERENCES [dbo].[luTradeImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ImpactOnThirdCountryFlows] FOREIGN KEY([ImpactOnThirdCountryFlows])
          REFERENCES [dbo].[luTradeImpactLevel] ([Id])
          GO
        
          ALTER TABLE [dbo].[InternationalTradeSpecies]  WITH CHECK ADD  CONSTRAINT [FK_InternationalTradeSpecies_ExportMarketValue] FOREIGN KEY([ExportMarketValue])
          REFERENCES [dbo].[luTradeImpactLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to InternationalTradeSpecies table
      

      -- CREATE TABLE RiskSpecies
      
        CREATE TABLE [dbo].[RiskSpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [RiskScenarios] text NULL,
        
        CONSTRAINT [PK_RiskSpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from RiskSpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[RiskSpecies]  WITH CHECK ADD  CONSTRAINT [FK_RiskSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to RiskSpecies table
      

      -- Create FK constraints from foreign key ids of RiskSpecies table to lookup tables
      
      -- Create link tables for repeating questions that need to be attached to RiskSpecies table
      

      -- CREATE TABLE SurveillanceSpecies
      
      
      -- Create link tables for multi-value fields that need to be attached to SurveillanceSpecies table
      

      -- Create FK constraints from foreign key ids of SurveillanceSpecies table to lookup tables
      
      -- Create link tables for repeating questions that need to be attached to SurveillanceSpecies table
      
        CREATE TABLE [dbo].[CurrentSurveillanceActivitiesSpecies](
        [Id] [uniqueidentifier] NOT NULL,
        [ProfileVersionId] uniqueidentifier NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [Reference] varchar(255) NULL,
        
          [Mechanism] uniqueidentifier NULL,
        
          [PurposeAndDetail] text NULL,
        
        CONSTRAINT [PK_CurrentSurveillanceActivities] PRIMARY KEY CLUSTERED
        (
        [Id] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        
            ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies]  WITH CHECK ADD  CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
            REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
            GO
          
        
        -- Create link tables for multi-value fields that need to be attached to CurrentSurveillanceActivitiesSpecies table
        

        -- Create FK constraints from foreign key ids of CurrentSurveillanceActivitiesSpecies table to lookup tables
        
            ALTER TABLE [dbo].[CurrentSurveillanceActivitiesSpecies]  WITH CHECK ADD  CONSTRAINT [FK_CurrentSurveillanceActivitiesSpecies_Mechanism] FOREIGN KEY([Mechanism])
            REFERENCES [dbo].[luSurveillanceMechanism] ([Id])
            GO
          

      -- CREATE TABLE WiderSocietySpecies
      
        CREATE TABLE [dbo].[WiderSocietySpecies](
        [ProfileVersionId] [uniqueidentifier] NOT NULL,
        [SpeciesId] [uniqueidentifier] NOT NULL,
        
          [LocalAgriculturalEconomy] uniqueidentifier NULL,
        
          [LocalAgriculturalEconomyComments] text NULL,
        
        CONSTRAINT [PK_WiderSocietySpecies] PRIMARY KEY CLUSTERED
        (
        [ProfileVersionId] ASC,
        [SpeciesId] ASC
        )WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
        ) ON [PRIMARY]
        GO

        -- Create link from WiderSocietySpecies to ProfileVersionSpecies table
        ALTER TABLE [dbo].[WiderSocietySpecies]  WITH CHECK ADD  CONSTRAINT [FK_WiderSocietySpecies_ProfileVersionSpecies] FOREIGN KEY([ProfileVersionId], [SpeciesId])
        REFERENCES [dbo].[ProfileVersionSpecies] ([ProfileVersionId], [SpeciesId])
        GO
    
      
      -- Create link tables for multi-value fields that need to be attached to WiderSocietySpecies table
      

      -- Create FK constraints from foreign key ids of WiderSocietySpecies table to lookup tables
      
          ALTER TABLE [dbo].[WiderSocietySpecies]  WITH CHECK ADD  CONSTRAINT [FK_WiderSocietySpecies_LocalAgriculturalEconomy] FOREIGN KEY([LocalAgriculturalEconomy])
          REFERENCES [dbo].[luMortalityLevel] ([Id])
          GO
        
      -- Create link tables for repeating questions that need to be attached to WiderSocietySpecies table
      
    
    -- POPULATE REFERENCE TABLES
    

      INSERT INTO luExposureLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A1C98473-B131-4233-9788-2A449F1C2776',
        'Very high',
        5
        )
      GO

  

      INSERT INTO luExposureLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'B2E32CFC-37F6-4764-9082-6225E7725E62',
        'Low',
        2
        )
      GO

  

      INSERT INTO luExposureLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C825EA45-2646-42B3-A7FA-733C9F71D084',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luExposureLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D96089A5-A617-4A25-B83E-9952F082122F',
        'Very low',
        1
        )
      GO

  

      INSERT INTO luExposureLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '6A8DFB7B-BADE-47A4-A8E1-E4040385345C',
        'High',
        4
        )
      GO

  

      INSERT INTO luTotalSurveillanceCosts
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '817AB548-5923-4DC1-8CF9-F24F050C0519',
        '> £5M',
        5
        )
      GO

  

      INSERT INTO luTotalSurveillanceCosts
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '13A598E9-2430-4BA9-9A7B-6547BDC3DF3B',
        '< £100K',
        1
        )
      GO

  

      INSERT INTO luTotalSurveillanceCosts
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F844322C-0DC1-431A-8F7B-2B53B3478E83',
        '£1M to £5M',
        4
        )
      GO

  

      INSERT INTO luTotalSurveillanceCosts
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1E3CE62E-C2AE-429E-8980-1B13BFAD799A',
        '£100K to £499K',
        2
        )
      GO

  

      INSERT INTO luTotalSurveillanceCosts
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'DA4AF5DE-B5B8-4E42-AD9A-13EC4351D0BC',
        '£500K to £999K',
        3
        )
      GO

  

      INSERT INTO luIncubationPeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D16578DC-3549-40B0-A5A0-2AF78312143A',
        'Months',
        3
        )
      GO

  

      INSERT INTO luIncubationPeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C2218193-97D1-4072-9363-BE43DCED970D',
        'Days',
        2
        )
      GO

  

      INSERT INTO luIncubationPeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '4074844A-29D3-46C8-89CF-E05A3EB02EDD',
        'Hours',
        1
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F1B4FC65-B9AF-4F21-8059-D89746B2997F',
        'Not applicable',
        1
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'E7F4FAE5-2245-445B-A474-EA557F3F2F02',
        'Weeks',
        4
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A4037745-3D33-4C2D-B116-887413AE95E1',
        'Years',
        6
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '77EA6051-2312-41A5-8B28-1AF4CD2CC49D',
        'Days',
        3
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '221CD009-E173-405B-A18B-1615895C4188',
        'Hours',
        2
        )
      GO

  

      INSERT INTO luDiseaseDuration
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'E9397129-B123-4F28-A749-05368052D602',
        'Months',
        5
        )
      GO

  

      INSERT INTO luStatutoryObligationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1A1B519A-23DA-46CD-8647-862D5A2E4FF4',
        'No',
        3
        )
      GO

  

      INSERT INTO luStatutoryObligationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F7190B7D-6A03-49FA-BC88-696EFEF50F18',
        'Yes',
        1
        )
      GO

  

      INSERT INTO luStatutoryObligationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7F79664A-3118-431C-9CF0-A42E5DB93CF3',
        'To some extent',
        2
        )
      GO

  

      INSERT INTO luImportImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
        'Not commercial',
        1
        )
      GO

  

      INSERT INTO luImportImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
        'Some',
        3
        )
      GO

  

      INSERT INTO luImportImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
        'Negligible',
        2
        )
      GO

  

      INSERT INTO luImportImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '9C2B1788-94CA-4721-B9F4-F02BB4234F9B',
        'Significant',
        4
        )
      GO

  

      INSERT INTO luProportionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'B3E0DDA5-C4C3-4423-B7F7-827047297E18',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luProportionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'DA228E32-ACEA-4D6C-B8B0-8CB26335E002',
        'None',
        1
        )
      GO

  

      INSERT INTO luProportionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '587BED9C-6917-4C2A-9951-A78BC7A7D9D3',
        'High',
        4
        )
      GO

  

      INSERT INTO luProportionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '39E1CF1A-CFCC-42A5-92EE-BC7F22F4C701',
        'Low',
        2
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '59543A13-BC62-4ACC-92F6-982B2D66DD84',
        'Vector',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'D7A8BCF9-600C-4277-BA5C-74C81E4BAA09',
        'Fomite',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'A6219B68-6216-4F2D-8384-55EE4FF73024',
        'Aerosol',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'CC1FD6D5-D5AF-4B44-BDC7-23AC61238D77',
        'Sexual transmission',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'B344E953-E842-47DD-ACC1-D8A1023544D1',
        'Long distance aerosol',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'DE70CCCA-4D28-4B7F-9CB4-BBC9993D9E7E',
        'Ingestion',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSpreadMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'A22F1693-39DE-49AD-A9DD-F67BA7594CD2',
        'Other',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luUncertaintyLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '3D5DE706-7A29-4496-A9A3-DF2C52649F08',
        'Low uncertainty',
        1
        )
      GO

  

      INSERT INTO luUncertaintyLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8CB80044-4D3F-4D63-87C9-24E3CC993260',
        'Medium uncertainty',
        2
        )
      GO

  

      INSERT INTO luUncertaintyLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7B67B103-9125-40C7-9EAC-36BCA2403740',
        'High uncertainty',
        3
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '7159297A-344E-42D1-A603-5946927B8FF2',
        'Vector',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '469B42D5-8BC7-4701-A98E-0AE0994853DD',
        'Direct animal contact',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'C93353DC-32B3-4E3E-AFEB-111FC1ACF201',
        'Sexual',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'ACEA173A-6997-452B-AEE7-124E6524BB13',
        'Waterborne',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '79DF15AC-5290-42D3-AE64-810D706D94A1',
        'Other environmental',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'E5E0E3AF-B122-42C3-8B82-82101ABC6FB9',
        'Foodborne',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'B2068D4E-6712-4D73-851A-8F906F0D8CC6',
        'Aerosol',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luTransmissibilityIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'CAB7B8A2-14C4-411D-8C2C-B4FA7AE7564F',
        'Uncommon',
        3
        )
      GO

  

      INSERT INTO luTransmissibilityIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '2899BF4E-20D8-481B-84AD-0121F2479365',
        'Common',
        5
        )
      GO

  

      INSERT INTO luTransmissibilityIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7D6CA5E2-3A20-4B8B-9271-F56379C75C6F',
        'Occasional',
        4
        )
      GO

  

      INSERT INTO luTransmissibilityIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'B55776E4-E26E-4C68-8CDC-CD7C10F37EE9',
        'Very slow / not applicable',
        1
        )
      GO

  

      INSERT INTO luTransmissibilityIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D64E8B93-0E00-426C-9445-CEC04E6A9ED0',
        'Rare',
        2
        )
      GO

  

      INSERT INTO luMortalityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A363E67B-0F6C-4CEE-9CE8-D3EB363DBD4F',
        'Very high',
        5
        )
      GO

  

      INSERT INTO luMortalityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'DF0A980E-93A1-40A0-9DAB-DA062CA12518',
        'Very low',
        1
        )
      GO

  

      INSERT INTO luMortalityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '72BCFA83-3AB0-448A-834A-310492FBF790',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luMortalityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '653BDC06-16FD-4C1D-8A3A-19CA465A95CB',
        'Low',
        2
        )
      GO

  

      INSERT INTO luMortalityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '02E6950B-B083-477E-8DD6-8ECFC8AB822C',
        'High',
        4
        )
      GO

  

      INSERT INTO luSpreadRateLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '88F7EFE7-0729-4739-A9B7-7414FCDA0B7A',
        'High',
        4
        )
      GO

  

      INSERT INTO luSpreadRateLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C1824D58-5133-4175-9E15-987D669A12E9',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luSpreadRateLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D6EDC88C-8E4D-48D3-8F86-3A09A2B6BC0B',
        'Very high',
        5
        )
      GO

  

      INSERT INTO luSpreadRateLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C66501CF-04FF-473A-B68D-3DCEFA02CD93',
        'Low',
        2
        )
      GO

  

      INSERT INTO luSpreadRateLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1FFF026A-55A3-4605-94C2-F0DA0934E195',
        'None',
        1
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '691D354F-9BDB-4870-A785-D8B350293833',
        'Notification',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '13692C1E-83A4-4194-94AD-F313959F655C',
        'Scanning surveillance',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'C878CD62-7CD7-4F6F-AC59-0900D8F58141',
        'Outbreak investigation',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '0AE4BBC5-726B-4CAC-A645-ABD08A149219',
        'Continuous survey',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '8F078954-1ADE-44ED-AEAE-A36E5EC4E7D8',
        'Sentinel surveillance',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '47870AF7-483D-4728-8009-52A84FD4CBF4',
        'Time limited survey',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luSurveillanceMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '0DEB0107-FF61-426F-9A24-8051D41187C1',
        'Census',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luCasesPerYear
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '69952CB1-0641-41CA-901E-7F2B3394B50C',
        '100Ks',
        4
        )
      GO

  

      INSERT INTO luCasesPerYear
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '026EF175-E896-4572-B2DD-95E35342BED4',
        '10s',
        1
        )
      GO

  

      INSERT INTO luCasesPerYear
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '0E598904-29D5-458B-9D16-83B05B9CF46D',
        '1000s',
        3
        )
      GO

  

      INSERT INTO luCasesPerYear
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '9CEED781-7DDF-4D74-BA5C-ED6154423D61',
        'Millions',
        5
        )
      GO

  

      INSERT INTO luCasesPerYear
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '6812B254-43C5-4A4A-84B2-D65365723457',
        '100s',
        2
        )
      GO

  

      INSERT INTO luCommoditiesCompromisedLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D3F9D36E-B7C2-4A25-A134-F3FCB0DA2305',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luCommoditiesCompromisedLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C7813A45-947D-486B-BE8A-914357F3F0E0',
        'None',
        1
        )
      GO

  

      INSERT INTO luCommoditiesCompromisedLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '2EACE78B-DAE8-422C-9F8C-13395A6BF898',
        'Very high',
        5
        )
      GO

  

      INSERT INTO luCommoditiesCompromisedLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8FDB4141-5898-417B-90A3-4C73B747DDC3',
        'Low',
        2
        )
      GO

  

      INSERT INTO luCommoditiesCompromisedLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '4F8A7425-34ED-400A-9136-4F9E48069A2B',
        'High',
        4
        )
      GO

  

      INSERT INTO luIssueExtent
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'EE54DC09-0ACA-4D97-AB4B-3DFE9AB20BBE',
        'None',
        1
        )
      GO

  

      INSERT INTO luIssueExtent
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F5AA682E-9E26-4597-8B68-115DE566642F',
        'Moderate',
        3
        )
      GO

  

      INSERT INTO luIssueExtent
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7D16C7B8-257F-43C8-B6D0-0EC5577B1BBF',
        'Severe',
        4
        )
      GO

  

      INSERT INTO luIssueExtent
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '0810ECDB-4ECB-46BC-8969-1C98262856BC',
        'Minor',
        2
        )
      GO

  

      INSERT INTO luHumanExposureReductionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '009C9A74-B6BB-4944-99DA-38420843C05A',
        'Not applicable',
        1
        )
      GO

  

      INSERT INTO luHumanExposureReductionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '502EE7E6-9FBC-4716-85FA-4DC89C3CEBD6',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luHumanExposureReductionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '222E5E51-877E-49F6-92EB-BAEF379FBB66',
        'Low',
        2
        )
      GO

  

      INSERT INTO luHumanExposureReductionLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '36227FC3-5C1E-4E6B-97D1-D87581C084C9',
        'High',
        4
        )
      GO

  

      INSERT INTO luHumanCasesLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'BFC48953-4F28-408B-B985-D358831CEA46',
        'High',
        4
        )
      GO

  

      INSERT INTO luHumanCasesLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A04C0746-DB86-4E59-841B-CE4967C300D2',
        'Very low',
        1
        )
      GO

  

      INSERT INTO luHumanCasesLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '35F7ADFB-D539-4E72-BB69-F30AA1304764',
        'Low',
        2
        )
      GO

  

      INSERT INTO luHumanCasesLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '2445F71D-E1CF-4A16-9EC9-83F14786E18D',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luModalSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'EF1FB030-FB8F-401A-ACC0-3C422BCF99F8',
        'Mild',
        1
        )
      GO

  

      INSERT INTO luModalSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '9994258C-1094-4D83-8FD9-65DB43B4D306',
        'Life threatening / maiming',
        4
        )
      GO

  

      INSERT INTO luModalSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '53B882AD-67E8-474E-BF8C-250BB10D2B88',
        'Serious',
        3
        )
      GO

  

      INSERT INTO luModalSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'EF3B2C4B-2CDA-4439-B727-D9F7201C5D38',
        'Medium',
        2
        )
      GO

  

      INSERT INTO luTradeImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
        'Not commercial',
        1
        )
      GO

  

      INSERT INTO luTradeImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '59EF471A-CA72-479E-8717-93FF37F85F7C',
        'High',
        4
        )
      GO

  

      INSERT INTO luTradeImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luTradeImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
        'Low',
        2
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'E865A287-B948-46F9-A3E3-A0E331BE3EDA',
        'Western Europe',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '4FB0E20B-3002-4991-B098-8BD0E8477803',
        'North America',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '8041CDBB-57E3-47BC-8390-274ECD82D340',
        'Central / South America',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '76E5922D-32D9-4CEA-93B5-35DB7A46A82C',
        'Middle East',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'D3BB4D8C-D62D-4ADB-B225-664DBE2CFE3C',
        'Central / Far East Asia',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '0F30B14E-A9CC-4E26-8E63-685DA2964154',
        'Australasia',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '0963FF1D-D8CF-4FAE-BC7F-4B163D75A166',
        'Indian subcontinent',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'C1A74D91-9BAA-4BCE-83FD-4F07B74BFEEF',
        'South East Asia',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '8CA8E861-5BE4-42C4-B5B2-3ED85CD8CDD9',
        'Africa',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luGeographicArea
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '1DBA2008-F52D-4FB6-B2CC-D079BD722122',
        'Eastern Europe',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luMaximumSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8FEBAB57-886A-4B87-A282-D4FF5CD5C34B',
        'High',
        3
        )
      GO

  

      INSERT INTO luMaximumSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '03E22E35-1572-452F-9440-DDA0ABDCE62E',
        'Very high',
        4
        )
      GO

  

      INSERT INTO luMaximumSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'DC28020B-33AA-4F50-9005-F9195A9D3181',
        'Low',
        1
        )
      GO

  

      INSERT INTO luMaximumSeverityLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '081A172C-59C3-4ED5-9B90-243D99087D61',
        'Medium',
        2
        )
      GO

  

      INSERT INTO luCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8FB26ACF-6C66-4D1A-9F54-1B8632F1E01E',
        'Very high',
        4
        )
      GO

  

      INSERT INTO luCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '8E228F0A-A8EC-4814-AD9D-3A7A204BEC58',
        'Medium',
        2
        )
      GO

  

      INSERT INTO luCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '13EDF126-03B0-4DE3-84C8-5C13654AEDB9',
        'High',
        3
        )
      GO

  

      INSERT INTO luCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '415344B3-AEF3-442C-86A4-95F75ADBAAFD',
        'Low',
        1
        )
      GO

  

      INSERT INTO luLocalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'DA057A99-B389-48F0-8B2E-9638EA7289E1',
        'Negligible',
        1
        )
      GO

  

      INSERT INTO luLocalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C8583C83-8963-46AA-BDB1-69BAC5C93BB5',
        'Very low',
        2
        )
      GO

  

      INSERT INTO luLocalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'D792C4B9-0600-44D1-9B90-B6719D766386',
        'Low',
        3
        )
      GO

  

      INSERT INTO luLocalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '48B95319-292E-4069-9591-1691214FA31E',
        'Medium',
        4
        )
      GO

  

      INSERT INTO luRegionalisationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '37034711-1214-4F15-915F-47C2C6520A5F',
        'High',
        3
        )
      GO

  

      INSERT INTO luRegionalisationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7EBD9BD8-79C6-44B8-A2D7-F5585EAD9B50',
        'Some',
        2
        )
      GO

  

      INSERT INTO luRegionalisationLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7648B40B-7213-4E42-BBFF-CD2CF5F2FF0F',
        'None',
        1
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '5AAE3EE9-65BF-42F2-A24C-C23EA9CC596B',
        'Other mandates',
        3
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '4AEACE50-3999-4768-AA3A-478F10208F2B',
        'OIE obligations',
        5
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'B1AC9446-2779-4559-9A02-B85CE2C1F1BA',
        'Specific domestic legislation',
        1
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '9057B373-1D8B-4A42-863A-B62009508278',
        'None',
        6
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A95CF339-9D8E-46CC-AAB4-AE3DB1B2C280',
        'EU obligations',
        2
        )
      GO

  

      INSERT INTO luLegislationType
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '53412EBA-769F-464E-A956-9C0B0EE7469C',
        'General domestic legislation',
        4
        )
      GO

  

      INSERT INTO luWildlifeReservoirIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '5534C71A-F3D2-482B-BEAF-78335C6CE3B4',
        'No',
        3
        )
      GO

  

      INSERT INTO luWildlifeReservoirIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '22D969B8-784F-40B5-90B0-C18FD59A10B8',
        'Yes',
        1
        )
      GO

  

      INSERT INTO luWildlifeReservoirIndicator
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '86D10028-679E-45FD-A57D-EC02DF3E1348',
        'Considerable uncertainty',
        2
        )
      GO

  

      INSERT INTO luGlobalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C8A862D6-FBC3-46CF-8665-C676BB1360FE',
        'Very low',
        2
        )
      GO

  

      INSERT INTO luGlobalEnvironmentImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '9E1E2348-5C73-4C63-B0B9-0182F9F4A99F',
        'Negligible',
        1
        )
      GO

  

      INSERT INTO luDiagnosisAndDetectionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '4609E099-128D-4A8F-A403-511788C185F9',
        'Livestock production data',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luDiagnosisAndDetectionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '6F4973E5-2F89-4719-82FA-C0EE5327E1D7',
        'Laboratory testing',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luDiagnosisAndDetectionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '9AC9E6FA-C62F-4528-988A-C7B568C1367F',
        'Post-mortem examination',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luDiagnosisAndDetectionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '13495FCE-845A-46D4-82D5-CD311F3CDFAD',
        'Behavioural changes',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luDiagnosisAndDetectionMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '72EFD34D-88ED-46B0-B054-E299AE730E19',
        'Clinical signs',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luUnplannedCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1EFC101E-4DB6-4D74-B424-FD443815C81F',
        'Low',
        2
        )
      GO

  

      INSERT INTO luUnplannedCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '98370339-ACD2-475A-B424-BFB18CC19CF5',
        'High',
        4
        )
      GO

  

      INSERT INTO luUnplannedCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '87D51717-9102-4703-B1C7-A6DBAC191E49',
        'Negligible',
        1
        )
      GO

  

      INSERT INTO luUnplannedCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'B46CEA75-EC76-4093-A67E-90C5655ADA1B',
        'Very high',
        5
        )
      GO

  

      INSERT INTO luUnplannedCostLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F10B4506-76AF-45CE-BBF3-093F30305C0E',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luBooleanFlag
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
        'Yes',
        1
        )
      GO

  

      INSERT INTO luBooleanFlag
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
        'No',
        2
        )
      GO

  

      INSERT INTO luAttributableFraction
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '2A20BF1A-40C5-42D1-8F17-A420DBCC095E',
        'Medium',
        3
        )
      GO

  

      INSERT INTO luAttributableFraction
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'A2D4889F-A7A3-4CEE-BC02-A942F46BC265',
        'High',
        4
        )
      GO

  

      INSERT INTO luAttributableFraction
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '0212EE8A-47FE-4BDC-96E9-73F678F82421',
        'Negligible',
        1
        )
      GO

  

      INSERT INTO luAttributableFraction
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1F131F9F-5661-4B2F-8BA8-57A493D5107C',
        'Very low',
        2
        )
      GO

  

      INSERT INTO luRiskChange
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '6FB70FDD-A021-4732-88F6-1A70086BE49E',
        'High',
        5
        )
      GO

  

      INSERT INTO luRiskChange
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '1A955A7B-A621-44B3-90EF-1D44479617B2',
        'Low',
        3
        )
      GO

  

      INSERT INTO luRiskChange
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '098C4F6B-CB4B-4967-8365-79FD4A9C7848',
        'No change',
        2
        )
      GO

  

      INSERT INTO luRiskChange
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '99C7F543-99EA-4BE4-A107-BE233EB895B6',
        'Medium',
        4
        )
      GO

  

      INSERT INTO luRiskChange
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'AC585B54-7BD4-4897-976B-D6A3C95FCF32',
        'Reduction',
        1
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '39D5AE2D-29C9-4958-8A83-BA9646B6B136',
        'Movement restrictions (enforced)',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '096B882F-C896-40D1-AF42-AC2BD42BA07C',
        'Vector control',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '1D4E585E-BCB8-486C-8FAD-9DD1A8CB9D03',
        'Protection of foodstuffs',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'F3E04DBB-AEFE-4157-8F69-8BEFD5A8BE97',
        'Movement restrictions (voluntary)',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'C56A67BD-5B59-4D26-97F5-83E2F2A363A3',
        'Genetic methods',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '338E32D5-202C-46D6-B8A2-20E5D56D04D7',
        'Other unlisted control types',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '8C9327EA-553A-4EC9-8606-3179DDAFF596',
        'Improve stockmanship',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '533262C1-454C-45E3-876B-2B47841AB5C2',
        'Import controls',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '3B2E8D44-81BD-4F06-AC9F-50DA38B717CA',
        'No practical control method available',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '331EE4DB-25BB-4986-8E4E-5FCA090896CD',
        'Farm bio-security',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        'F3B22390-A586-4889-98AC-6162905101B8',
        'Treatment of infected animals',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '13957250-081B-4685-A142-63D0560B9A7B',
        'Culling',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '3AA0FB56-ED65-4A8B-A732-6403F3EFCD73',
        'Vaccination',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '37A64447-44CC-4704-B029-3C8D8441313C',
        'Routine testing to identify cases',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luControlMechanism
      (
      [Id],
      [LookupValue],
      
          [EffectiveDateFrom]
        
        )
      VALUES
        (
        '84F36AE4-49CB-4F7C-8871-474D5B08D468',
        'Raise awareness for rapid detection',
        
        '1 January 2007'
      
        )
      GO

  

      INSERT INTO luIndicatorFlag
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'CBB4614A-4964-4CD1-8859-829D08CA3DFB',
        'No',
        2
        )
      GO

  

      INSERT INTO luIndicatorFlag
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7EF9BDE5-323B-428C-9D19-E3753A9FCD33',
        'Not known',
        3
        )
      GO

  

      INSERT INTO luIndicatorFlag
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'C5390074-3597-458C-AAF4-F42099F416E8',
        'Yes',
        1
        )
      GO

  

      INSERT INTO luTimePeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '7EF7C332-55E9-4259-8F61-D6DEC9B28EA0',
        'Months',
        4
        )
      GO

  

      INSERT INTO luTimePeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '0E23EA69-BB46-4FD1-A08C-80C6CC5FE361',
        'Days',
        2
        )
      GO

  

      INSERT INTO luTimePeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'EDC719FE-7779-423B-AE67-5BFBA6001385',
        'Weeks',
        3
        )
      GO

  

      INSERT INTO luTimePeriod
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'CDE9CFCE-858B-4A2E-A7D3-0DC60F7F5561',
        'Hours',
        1
        )
      GO

  

      INSERT INTO luRiskLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        'F9F33975-FE4C-4D5E-8AA1-00384654324B',
        'Very low',
        2
        )
      GO

  

      INSERT INTO luRiskLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '2B6ECEA7-6E3B-4481-96FF-182797FE0A5D',
        'Negligible',
        1
        )
      GO

  

      INSERT INTO luRiskLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '67FDD764-D257-485E-8B42-6959716848C9',
        'Medium',
        4
        )
      GO

  

      INSERT INTO luRiskLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '5C24CF19-D6F0-4383-A0D1-8CC36C7368F6',
        'Low',
        3
        )
      GO

  

      INSERT INTO luRiskLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '21B64335-B38D-4320-9295-F8EFF41F9EE8',
        'High',
        5
        )
      GO

  

      INSERT INTO luImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D',
        'Low',
        1
        )
      GO

  

      INSERT INTO luImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '90751241-41DD-493C-BDA2-84D8EFCBC02C',
        'High',
        3
        )
      GO

  

      INSERT INTO luImpactLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '99A6D8B5-EE90-4B7F-944C-3A005439EBC8',
        'Medium',
        2
        )
      GO

  

      INSERT INTO luPrevalenceLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '6E2DD137-4224-4FAB-BE6D-4D4DBC6568B0',
        '>10-20%',
        3
        )
      GO

  

      INSERT INTO luPrevalenceLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '83961ACE-E015-4B25-BE81-94A075C13F9E',
        '>20-50%',
        4
        )
      GO

  

      INSERT INTO luPrevalenceLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '5686922C-10B6-4B3D-9923-7482B1C43ECE',
        '>2-10%',
        2
        )
      GO

  

      INSERT INTO luPrevalenceLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '629F113D-1E78-4107-97A4-B1FF0F9E3BF1',
        '>0-2%',
        1
        )
      GO

  

      INSERT INTO luPrevalenceLevel
      (
      [Id],
      [LookupValue],
      
          [SequenceNumber]
        
        )
      VALUES
        (
        '97748F1B-9F7B-4C02-983E-C174300B323E',
        '>50%',
        5
        )
      GO

  
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesImportanceOfExportTrade_luTradeImpactLevel] FOREIGN KEY([ImportanceOfExportTrade])
      REFERENCES [dbo].[luTradeImpactLevel] ([Id])
      GO
    
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesExportMarketValue_luTradeImpactLevel] FOREIGN KEY([ExportMarketValue])
      REFERENCES [dbo].[luTradeImpactLevel] ([Id])
      GO
    
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesImpactOnIntraCommunityFlows_luTradeImpactLevel] FOREIGN KEY([ImpactOnIntraCommunityFlows])
      REFERENCES [dbo].[luTradeImpactLevel] ([Id])
      GO
    
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesImpactOnLevelOfImports_luImportImpactLevel] FOREIGN KEY([ImpactOnLevelOfImports])
      REFERENCES [dbo].[luImportImpactLevel] ([Id])
      GO
    
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesCommercialTrade_luBooleanFlag] FOREIGN KEY([CommercialTrade])
      REFERENCES [dbo].[luBooleanFlag] ([Id])
      GO
    
      ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_SpeciesImpactOnThirdCountryFlows_luTradeImpactLevel] FOREIGN KEY([ImpactOnThirdCountryFlows])
      REFERENCES [dbo].[luTradeImpactLevel] ([Id])
      GO
    