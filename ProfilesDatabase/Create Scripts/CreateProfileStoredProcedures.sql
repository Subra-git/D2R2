
	  IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersion]') AND type in (N'P', N'PC'))
	  DROP PROCEDURE [dbo].[spiProfileVersion]
	  GO

	  IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionSpecies]') AND type in (N'P', N'PC'))
	  DROP PROCEDURE [dbo].[spiProfileVersionSpecies]
	  GO

	  IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionSpeciesTradeData]') AND type in (N'P', N'PC'))
	  DROP PROCEDURE [dbo].[spuProfileVersionSpeciesTradeData]
	  GO

	  IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionSpecies]') AND type in (N'P', N'PC'))
	  DROP PROCEDURE [dbo].[spdProfileVersionSpecies]
	  GO

	  IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersion]') AND type in (N'P', N'PC'))
	  DROP PROCEDURE [dbo].[spdProfileVersion]
	  GO

	  

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluExposureLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluExposureLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluTotalSurveillanceCosts]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluTotalSurveillanceCosts]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluIncubationPeriod]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluIncubationPeriod]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluDiseaseDuration]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluDiseaseDuration]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluStatutoryObligationLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluStatutoryObligationLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluImportImpactLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluImportImpactLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluProportionLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluProportionLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluUncertaintyLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluUncertaintyLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluTransmissibilityIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluTransmissibilityIndicator]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluMortalityLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluMortalityLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluSpreadRateLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluSpreadRateLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluCasesPerYear]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluCasesPerYear]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluCommoditiesCompromisedLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluCommoditiesCompromisedLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluIssueExtent]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluIssueExtent]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluHumanExposureReductionLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluHumanExposureReductionLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluHumanCasesLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluHumanCasesLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluModalSeverityLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluModalSeverityLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluTradeImpactLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluTradeImpactLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluMaximumSeverityLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluMaximumSeverityLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluCostLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluCostLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluLocalEnvironmentImpactLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluLocalEnvironmentImpactLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluRegionalisationLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluRegionalisationLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluLegislationType]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluLegislationType]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluWildlifeReservoirIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluWildlifeReservoirIndicator]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluGlobalEnvironmentImpactLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluGlobalEnvironmentImpactLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluUnplannedCostLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluUnplannedCostLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluBooleanFlag]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluBooleanFlag]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluAttributableFraction]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluAttributableFraction]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluRiskChange]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluRiskChange]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluIndicatorFlag]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluIndicatorFlag]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluTimePeriod]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluTimePeriod]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluRiskLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluRiskLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluImpactLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluImpactLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluPrevalenceLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluPrevalenceLevel]
      GO
    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluSpreadMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluSpreadMechanism]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluSpreadMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluSpreadMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluSpreadMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluSpreadMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluSpreadMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluSpreadMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluSpreadMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluSpreadMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluSpreadMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluSpreadMechanismValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluTransmissionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluTransmissionMechanism]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluTransmissionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluTransmissionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluTransmissionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluTransmissionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluTransmissionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluTransmissionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluTransmissionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluTransmissionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluTransmissionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluTransmissionMechanismValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluSurveillanceMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluSurveillanceMechanism]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluSurveillanceMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluSurveillanceMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluSurveillanceMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluSurveillanceMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluSurveillanceMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluSurveillanceMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluSurveillanceMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluSurveillanceMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluSurveillanceMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluSurveillanceMechanismValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluGeographicArea]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluGeographicArea]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluGeographicAreaValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluGeographicAreaValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluGeographicAreaValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluGeographicAreaValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluGeographicAreaValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluGeographicAreaValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluGeographicAreaValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluGeographicAreaValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluGeographicAreaValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluGeographicAreaValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluDiagnosisAndDetectionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluDiagnosisAndDetectionMechanism]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluDiagnosisAndDetectionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluDiagnosisAndDetectionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluDiagnosisAndDetectionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluDiagnosisAndDetectionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluDiagnosisAndDetectionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluDiagnosisAndDetectionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluDiagnosisAndDetectionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluDiagnosisAndDetectionMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluDiagnosisAndDetectionMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluDiagnosisAndDetectionMechanismValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluControlMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgaluControlMechanism]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgluControlMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgluControlMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiluControlMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spiluControlMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdluControlMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spdluControlMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuluControlMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuluControlMechanismValue]
      GO

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppluControlMechanismValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[sppluControlMechanismValue]
      GO

    

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgWelfareIssueIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgWelfareIssueIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuWelfareIssueIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuWelfareIssueIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFreedomFromHungerAndThirst]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFreedomFromHungerAndThirst]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFreedomFromHungerAndThirst]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFreedomFromHungerAndThirst]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFreedomFromDiscomfort]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFreedomFromDiscomfort]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFreedomFromDiscomfort]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFreedomFromDiscomfort]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFreedomFromPainOrInjury]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFreedomFromPainOrInjury]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFreedomFromPainOrInjury]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFreedomFromPainOrInjury]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFreedomToExpressNormalBehaviour]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFreedomToExpressNormalBehaviour]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFreedomToExpressNormalBehaviour]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFreedomToExpressNormalBehaviour]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFreedomFromFearAndDistress]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFreedomFromFearAndDistress]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFreedomFromFearAndDistress]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFreedomFromFearAndDistress]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialToReduceWelfareImplications]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialToReduceWelfareImplications]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialToReduceWelfareImplications]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialToReduceWelfareImplications]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProportionOfAnimalsAffectedSufferingSeverely]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgProportionOfAnimalsAffectedSufferingSeverely]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProportionOfAnimalsAffectedSufferingSeverely]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuProportionOfAnimalsAffectedSufferingSeverely]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSummaryImpactOnAnimalWelfare]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSummaryImpactOnAnimalWelfare]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSummaryImpactOnAnimalWelfare]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSummaryImpactOnAnimalWelfare]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentControlMechanisms]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgCurrentControlMechanisms]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuCurrentControlMechanisms]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuCurrentControlMechanisms]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiCurrentControlMechanismsCurrentControlMechanisms]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiCurrentControlMechanismsCurrentControlMechanisms]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdCurrentControlMechanismsCurrentControlMechanisms]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdCurrentControlMechanismsCurrentControlMechanisms]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgOtherControlMechanisms]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgOtherControlMechanisms]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuOtherControlMechanisms]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuOtherControlMechanisms]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiOtherControlMechanismsOtherControlMechanisms]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiOtherControlMechanismsOtherControlMechanisms]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdOtherControlMechanismsOtherControlMechanisms]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdOtherControlMechanismsOtherControlMechanisms]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUptakeAtHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgUptakeAtHoldingLevel]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuUptakeAtHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuUptakeAtHoldingLevel]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgWelfareEffect]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgWelfareEffect]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuWelfareEffect]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuWelfareEffect]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialToReduceRisk]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialToReduceRisk]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialToReduceRisk]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialToReduceRisk]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialToReduceHumanExposure]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialToReduceHumanExposure]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialToReduceHumanExposure]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialToReduceHumanExposure]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgVaccinesAvailableIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgVaccinesAvailableIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuVaccinesAvailableIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuVaccinesAvailableIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgControlsAtTheHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgControlsAtTheHoldingLevel]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuControlsAtTheHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuControlsAtTheHoldingLevel]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgControlsAboveTheHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgControlsAboveTheHoldingLevel]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuControlsAboveTheHoldingLevel]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuControlsAboveTheHoldingLevel]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCompensation]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgCompensation]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuCompensation]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuCompensation]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLevelOfNationalPreparedness]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgLevelOfNationalPreparedness]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLevelOfNationalPreparedness]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuLevelOfNationalPreparedness]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAreasOfUncertaintySummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgAreasOfUncertaintySummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAreasOfUncertaintySummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuAreasOfUncertaintySummary]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSuspectCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSuspectCaseDefinition]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSuspectCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSuspectCaseDefinition]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProbableCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgProbableCaseDefinition]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProbableCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuProbableCaseDefinition]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgConfirmedCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgConfirmedCaseDefinition]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuConfirmedCaseDefinition]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuConfirmedCaseDefinition]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgDifferentialDiagnoses]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgDifferentialDiagnoses]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuDifferentialDiagnoses]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuDifferentialDiagnoses]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialForSilentSpread]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialForSilentSpread]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialForSilentSpread]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialForSilentSpread]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgIncubationPeriod]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgIncubationPeriod]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuIncubationPeriod]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuIncubationPeriod]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgClinicalSigns]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgClinicalSigns]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuClinicalSigns]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuClinicalSigns]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPathologicalFeatures]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPathologicalFeatures]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPathologicalFeatures]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPathologicalFeatures]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgMortalityIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgMortalityIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuMortalityIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuMortalityIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgDurationOfDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgDurationOfDisease]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuDurationOfDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuDurationOfDisease]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrimaryDetectionMethods]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPrimaryDetectionMethods]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrimaryDetectionMethods]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPrimaryDetectionMethods]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgConfirmationOfDiagnosis]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgConfirmationOfDiagnosis]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuConfirmationOfDiagnosis]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuConfirmationOfDiagnosis]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiConfirmationOfDiagnosisConfirmationOfDiagnosis]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiConfirmationOfDiagnosisConfirmationOfDiagnosis]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdConfirmationOfDiagnosisConfirmationOfDiagnosis]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdConfirmationOfDiagnosisConfirmationOfDiagnosis]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgTransmissionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgTransmissionMechanism]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuTransmissionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuTransmissionMechanism]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiTransmissionMechanismTransmissionMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiTransmissionMechanismTransmissionMechanism]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdTransmissionMechanismTransmissionMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdTransmissionMechanismTransmissionMechanism]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgRateOfSpreadOnPremises]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgRateOfSpreadOnPremises]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuRateOfSpreadOnPremises]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuRateOfSpreadOnPremises]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAgentDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgAgentDescription]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAgentDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuAgentDescription]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgTherapeuticAgentSusceptibility]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgTherapeuticAgentSusceptibility]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuTherapeuticAgentSusceptibility]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuTherapeuticAgentSusceptibility]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPersistenceInEnvironmentIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPersistenceInEnvironmentIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPersistenceInEnvironmentIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPersistenceInEnvironmentIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpreadMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSpreadMechanism]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpreadMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSpreadMechanism]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpreadMechanismSpreadMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiSpreadMechanismSpreadMechanism]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpreadMechanismSpreadMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdSpreadMechanismSpreadMechanism]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgWildlifeReservoirIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgWildlifeReservoirIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuWildlifeReservoirIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuWildlifeReservoirIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgIncreaseUnderstandingPotential]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgIncreaseUnderstandingPotential]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuIncreaseUnderstandingPotential]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuIncreaseUnderstandingPotential]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgMultiSpeciesSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgMultiSpeciesSummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuMultiSpeciesSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuMultiSpeciesSummary]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgGBPresenceIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgGBPresenceIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuGBPresenceIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuGBPresenceIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentPrevalenceInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgCurrentPrevalenceInGB]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuCurrentPrevalenceInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuCurrentPrevalenceInGB]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgDateOfMostRecentOccurrenceInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgDateOfMostRecentOccurrenceInGB]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuDateOfMostRecentOccurrenceInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuDateOfMostRecentOccurrenceInGB]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgRiskOfIntroductionToGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgRiskOfIntroductionToGB]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuRiskOfIntroductionToGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuRiskOfIntroductionToGB]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgNumberOfCasesPerYearInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgNumberOfCasesPerYearInGB]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuNumberOfCasesPerYearInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuNumberOfCasesPerYearInGB]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialForRiskChange]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialForRiskChange]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialForRiskChange]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialForRiskChange]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgGlobalGeographicDistribution]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgGlobalGeographicDistribution]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuGlobalGeographicDistribution]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuGlobalGeographicDistribution]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiGlobalGeographicDistributionGlobalGeographicDistribution]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiGlobalGeographicDistributionGlobalGeographicDistribution]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdGlobalGeographicDistributionGlobalGeographicDistribution]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdGlobalGeographicDistributionGlobalGeographicDistribution]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgZoonoticIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgZoonoticIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuZoonoticIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuZoonoticIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLevelOfHumanExposureToAnimalOrProducts]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgLevelOfHumanExposureToAnimalOrProducts]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLevelOfHumanExposureToAnimalOrProducts]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuLevelOfHumanExposureToAnimalOrProducts]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgHumanTransmissionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgHumanTransmissionMechanism]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuHumanTransmissionMechanism]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuHumanTransmissionMechanism]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiHumanTransmissionMechanismHumanTransmissionMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiHumanTransmissionMechanismHumanTransmissionMechanism]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdHumanTransmissionMechanismHumanTransmissionMechanism]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdHumanTransmissionMechanismHumanTransmissionMechanism]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAttributableFraction]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgAttributableFraction]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAttributableFraction]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuAttributableFraction]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSymptomsOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSymptomsOfHumanDisease]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSymptomsOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSymptomsOfHumanDisease]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgTransmissibilityIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgTransmissibilityIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuTransmissibilityIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuTransmissibilityIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgModalSeverityOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgModalSeverityOfHumanDisease]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuModalSeverityOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuModalSeverityOfHumanDisease]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgMaximumSeverityOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgMaximumSeverityOfHumanDisease]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuMaximumSeverityOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuMaximumSeverityOfHumanDisease]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgGeographicDistributionOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgGeographicDistributionOfHumanDisease]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuGeographicDistributionOfHumanDisease]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuGeographicDistributionOfHumanDisease]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAnnualNumberOfHumanCasesInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgAnnualNumberOfHumanCasesInGB]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAnnualNumberOfHumanCasesInGB]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuAnnualNumberOfHumanCasesInGB]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAverageCostPerCase]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgAverageCostPerCase]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAverageCostPerCase]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuAverageCostPerCase]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgIndirectEconomicCostOfHumanIllness]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgIndirectEconomicCostOfHumanIllness]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuIndirectEconomicCostOfHumanIllness]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuIndirectEconomicCostOfHumanIllness]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUncertainty]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgUncertainty]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuUncertainty]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuUncertainty]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnHumanHealth]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnHumanHealth]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnHumanHealth]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnHumanHealth]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSubstantialCommercialTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSubstantialCommercialTrade]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSubstantialCommercialTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSubstantialCommercialTrade]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnLevelOfImports]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnLevelOfImports]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnLevelOfImports]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnLevelOfImports]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStatutoryObligationToControl]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgStatutoryObligationToControl]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuStatutoryObligationToControl]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuStatutoryObligationToControl]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImportanceOfExportTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImportanceOfExportTrade]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImportanceOfExportTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImportanceOfExportTrade]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReestablishmentOfTradingStatus]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgReestablishmentOfTradingStatus]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReestablishmentOfTradingStatus]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuReestablishmentOfTradingStatus]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialForRegionalisation]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialForRegionalisation]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialForRegionalisation]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialForRegionalisation]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgRangeOfCommoditiesCompromised]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgRangeOfCommoditiesCompromised]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuRangeOfCommoditiesCompromised]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuRangeOfCommoditiesCompromised]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnIntraCommunityFlows]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnIntraCommunityFlows]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnIntraCommunityFlows]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnIntraCommunityFlows]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnThirdCountryFlows]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnThirdCountryFlows]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnThirdCountryFlows]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnThirdCountryFlows]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgExportMarketValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgExportMarketValue]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuExportMarketValue]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuExportMarketValue]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnInternationalTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnInternationalTrade]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnInternationalTrade]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnInternationalTrade]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgNotifiableDiseaseIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgNotifiableDiseaseIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuNotifiableDiseaseIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuNotifiableDiseaseIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReportableCausativeOrganismIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgReportableCausativeOrganismIndicator]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReportableCausativeOrganismIndicator]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuReportableCausativeOrganismIndicator]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgApplicableLegislationAndMandates]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgApplicableLegislationAndMandates]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuApplicableLegislationAndMandates]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuApplicableLegislationAndMandates]
      GO

      
        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiApplicableLegislationAndMandatesApplicableLegislationAndMandates]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spiApplicableLegislationAndMandatesApplicableLegislationAndMandates]
        GO

        IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdApplicableLegislationAndMandatesApplicableLegislationAndMandates]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[spdApplicableLegislationAndMandatesApplicableLegislationAndMandates]
        GO
        
      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLegislationOverview]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgLegislationOverview]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLegislationOverview]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuLegislationOverview]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgOpportunityToAddValueSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgOpportunityToAddValueSummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuOpportunityToAddValueSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuOpportunityToAddValueSummary]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPublicAndStakeholderPerceptionSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPublicAndStakeholderPerceptionSummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPublicAndStakeholderPerceptionSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPublicAndStakeholderPerceptionSummary]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgRiskScenarios]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgRiskScenarios]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuRiskScenarios]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuRiskScenarios]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgDescription]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuDescription]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfiledSpecies]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgProfiledSpecies]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfiledSpecies]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuProfiledSpecies]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgOtherAffectedSpecies]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgOtherAffectedSpecies]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuOtherAffectedSpecies]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuOtherAffectedSpecies]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgScenarioDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgScenarioDescription]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuScenarioDescription]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuScenarioDescription]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgRevisionHistory]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgRevisionHistory]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuRevisionHistory]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuRevisionHistory]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentSurveillanceActivities]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgCurrentSurveillanceActivities]
      GO

        
          IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiCurrentSurveillanceActivities]') AND type in (N'P', N'PC'))
          DROP PROCEDURE [dbo].[spiCurrentSurveillanceActivities]
          GO

          IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdCurrentSurveillanceActivities]') AND type in (N'P', N'PC'))
          DROP PROCEDURE [dbo].[spdCurrentSurveillanceActivities]
          GO
        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuCurrentSurveillanceActivities]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuCurrentSurveillanceActivities]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSummaryOfSurveillanceActivities]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgSummaryOfSurveillanceActivities]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSummaryOfSurveillanceActivities]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuSummaryOfSurveillanceActivities]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPotentialUnplannedCostToExchequer]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgPotentialUnplannedCostToExchequer]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPotentialUnplannedCostToExchequer]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuPotentialUnplannedCostToExchequer]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgGlobalEnvironment]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgGlobalEnvironment]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuGlobalEnvironment]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuGlobalEnvironment]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLocalEnvironment]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgLocalEnvironment]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLocalEnvironment]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuLocalEnvironment]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLocalAgriculturalEconomy]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgLocalAgriculturalEconomy]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLocalAgriculturalEconomy]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuLocalAgriculturalEconomy]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgWiderRuralCommunity]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgWiderRuralCommunity]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuWiderRuralCommunity]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuWiderRuralCommunity]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgTotalSurveillanceCosts]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgTotalSurveillanceCosts]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuTotalSurveillanceCosts]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuTotalSurveillanceCosts]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgImpactOnSocietySummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgImpactOnSocietySummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuImpactOnSocietySummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuImpactOnSocietySummary]
      GO

      

      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgFFGCostsSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spgFFGCostsSummary]
      GO

        
        
      IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuFFGCostsSummary]') AND type in (N'P', N'PC'))
      DROP PROCEDURE [dbo].[spuFFGCostsSummary]
      GO

      
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    -- =============================================
    --  This stored procedure was autogenerated by the Profiles
    --  CodeGen application on 13/11/2008 18:47:37 .
	  -- =============================================
	  CREATE PROCEDURE spiProfileVersion
	  @ProfileVersionId uniqueidentifier,
	  @ProfileId uniqueidentifier,
	  @Title varchar(255),
	  @ScenarioTitle varchar(255) = NULL,
	  @VersionMajor tinyint,
	  @VersionMinor tinyint,
	  @State varchar(50),
	  @EffectiveDateFrom smalldatetime,
	  @CloneProfileVersionId uniqueidentifier = NULL
	  AS
	  BEGIN
	  -- SET NOCOUNT ON added to prevent extra result sets from
	  -- interfering with SELECT statements.
	  SET NOCOUNT ON;

	  DECLARE @ProfileVersionStateId uniqueidentifier

	  SELECT
	  @ProfileVersionStateId = [Id]
	  FROM
	  [luProfileVersionState]
	  WHERE
	  [Name] = @State

	  IF EXISTS (
	  SELECT
	  [Id]
	  FROM
	  [ProfileVersion]
	  WHERE
	  [ProfileId] = @ProfileId AND
	  [VersionMajor] = @VersionMajor AND
	  [VersionMinor] = @VersionMinor
	  ) BEGIN
	  RAISERROR('There is already a profile version for this profile with the specified version number. The profile may have been altered by another user.',16,1)
	  RETURN
	  END

	  INSERT INTO [ProfileVersion]
	  (
	  [Id],
	  [ProfileId],
	  [Title],
	  [ScenarioTitle],
	  [VersionMajor],
	  [VersionMinor],
	  [ProfileVersionStateId],
	  [EffectiveDateFrom]
	  )
	  VALUES
	  (
	  @ProfileVersionId,
	  @ProfileId,
	  @Title,
	  @ScenarioTitle,
	  @VersionMajor,
	  @VersionMinor,
	  @ProfileVersionStateId,
	  @EffectiveDateFrom
	  )

	  IF @CloneProfileVersionId IS NULL BEGIN

	  INSERT INTO [ProfileVersionSection]
	  (
	  [ProfileVersionId],
	  [ProfileSectionId]
	  )
	  SELECT
	  @ProfileVersionId,
	  [ProfileSection].[Id]
	  FROM
	  [ProfileSection]

	  END ELSE BEGIN

	  INSERT INTO [ProfileVersionSection]
	  (
	  [ProfileVersionId],
	  [ProfileSectionId],
	  [TechnicalReviewFrequency],
	  [PolicyReviewFrequency],
	  [NextTechnicalReview],
	  [NextPolicyReview]
	  )
	  SELECT
	  @ProfileVersionId,
	  [ProfileSectionId],
	  [TechnicalReviewFrequency],
	  [PolicyReviewFrequency],
	  [NextTechnicalReview],
	  [NextPolicyReview]
	  FROM
	  [ProfileVersionSection]
	  WHERE
	  [ProfileVersionId] = @CloneProfileVersionId

	  DECLARE @IdTable TABLE
	  (
	  [Id] uniqueidentifier,
	  [NewId] uniqueidentifier
	  )

	  INSERT INTO @IdTable ([Id], [NewId])
	  SELECT
	  [Id],
	  NEWID()
	  FROM
	  [ProfileVersionNote]
	  WHERE
	  [ProfileVersionId] = @CloneProfileVersionId

	  INSERT INTO [ProfileVersionNote]
	  (
	  [Id],
	  [ProfileVersionId],
	  [ProfileSectionId],
	  [ProfileNoteTypeId],
	  [NoteText]
	  )
	  SELECT
	  Idt.[NewId],
	  @ProfileVersionId,
	  [ProfileVersionNote].[ProfileSectionId],
	  [ProfileVersionNote].[ProfileNoteTypeId],
	  [ProfileVersionNote].[NoteText]
	  FROM
	  [ProfileVersionNote] INNER JOIN
	  @IdTable Idt ON [ProfileVersionNote].[Id] = Idt.[Id]
	  WHERE
	  [ProfileVersionNote].[ProfileVersionId] = @CloneProfileVersionId

	  INSERT INTO [ProfileVersionNoteQuestion]
	  (
	  [ProfileVersionNoteId],
	  [ProfileQuestionId]
	  )
	  SELECT
	  Idt.[NewId],
	  [ProfileVersionNoteQuestion].[ProfileQuestionId]
	  FROM
	  [ProfileVersionNote] INNER JOIN
	  [ProfileVersionNoteQuestion] ON [ProfileVersionNote].[Id] = [ProfileVersionNoteQuestion].[ProfileVersionNoteId] INNER JOIN
	  @IdTable Idt ON [ProfileVersionNote].[Id] = Idt.[Id]
	  WHERE
	  [ProfileVersionNote].[ProfileVersionId] = @CloneProfileVersionId;

	  WITH [ReviewCommentList] (
	  [Id],
	  [NewId],
	  [ProfileSectionId],
	  [CommentDate],
	  [Subject],
	  [CommentReference],
	  [Comment],
	  [UserId],
	  [ParentId],
	  [NewParentId]
	  ) AS
	  (

	  SELECT
	  [ReviewComment].[Id],
	  NEWID() AS [NewId],
	  [ReviewComment].[ProfileSectionId],
	  [ReviewComment].[CommentDate],
	  [ReviewComment].[Subject],
	  [ReviewComment].[CommentReference],
	  [ReviewComment].[Comment],
	  [ReviewComment].[UserId],
	  [ReviewComment].[ParentId],
	  CAST(NULL AS uniqueidentifier) AS [NewParentId]
	  FROM
	  [ReviewComment]
	  WHERE
	  [ReviewComment].[ProfileVersionId] = @CloneProfileVersionId AND
	  [ReviewComment].[ParentId] IS NULL

	  UNION ALL

	  SELECT
	  [ReviewComment].[Id],
	  NEWID() AS [NewId],
	  [ReviewComment].[ProfileSectionId],
	  [ReviewComment].[CommentDate],
	  [ReviewComment].[Subject],
	  [ReviewComment].[CommentReference],
	  [ReviewComment].[Comment],
	  [ReviewComment].[UserId],
	  [ReviewComment].[ParentId],
	  [ReviewCommentList].[NewId] AS [NewParentId]
	  FROM
	  [ReviewComment] INNER JOIN [ReviewCommentList] ON [ReviewComment].[ParentId] = [ReviewCommentList].[Id]
	  WHERE
	  [ReviewComment].[ProfileVersionId] = @CloneProfileVersionId
	  )

	  INSERT INTO [ReviewComment]
	  (
	  [Id],
	  [ProfileVersionId],
	  [ProfileSectionId],
	  [CommentDate],
	  [Subject],
	  [CommentReference],
	  [Comment],
	  [UserId],
	  [ParentId]
	  )
	  SELECT
	  [NewId],
	  @ProfileVersionId,
	  [ProfileSectionId],
	  [CommentDate],
	  [Subject],
	  [CommentReference],
	  [Comment],
	  [UserId],
	  [NewParentId]
	  FROM
	  [ReviewCommentList]

	  END

	  

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [AnimalWelfare]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [AnimalWelfare]
      (
      [ProfileVersionId]
      
        , [SummaryImpactOnAnimalWelfare]
      
      )
      SELECT
      @ProfileVersionId
      
        , [SummaryImpactOnAnimalWelfare]
      
      FROM
      [AnimalWelfare]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [ApproachToControl]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [ApproachToControl]
      (
      [ProfileVersionId]
      
        , [ControlsAboveTheHoldingLevel]
      
        , [ControlsAboveTheHoldingLevelComments]
      
      )
      SELECT
      @ProfileVersionId
      
        , [ControlsAboveTheHoldingLevel]
      
        , [ControlsAboveTheHoldingLevelComments]
      
      FROM
      [ApproachToControl]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [AreasOfUncertainty]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [AreasOfUncertainty]
      (
      [ProfileVersionId]
      
        , [AreasOfUncertaintySummary]
      
      )
      SELECT
      @ProfileVersionId
      
        , [AreasOfUncertaintySummary]
      
      FROM
      [AreasOfUncertainty]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [Epidemiology]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [Epidemiology]
      (
      [ProfileVersionId]
      
        , [SuspectCaseDefinition]
      
        , [ProbableCaseDefinition]
      
        , [ConfirmedCaseDefinition]
      
        , [DiagnosisMechanismComments]
      
        , [AgentDescription]
      
        , [TherapeuticAgentSusceptibility]
      
        , [PersistenceInEnvironmentIndicator]
      
        , [PersistenceInEnvironmentIndicatorComments]
      
        , [SpreadMechanismComments]
      
        , [MultiSpeciesSummary]
      
      )
      SELECT
      @ProfileVersionId
      
        , [SuspectCaseDefinition]
      
        , [ProbableCaseDefinition]
      
        , [ConfirmedCaseDefinition]
      
        , [DiagnosisMechanismComments]
      
        , [AgentDescription]
      
        , [TherapeuticAgentSusceptibility]
      
        , [PersistenceInEnvironmentIndicator]
      
        , [PersistenceInEnvironmentIndicatorComments]
      
        , [SpreadMechanismComments]
      
        , [MultiSpeciesSummary]
      
      FROM
      [Epidemiology]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [ConfirmationOfDiagnosis]
      (
      [Id],
      [ProfileVersionId],
      [DiagnosisAndDetectionMechanismId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [DiagnosisAndDetectionMechanismId]
      FROM
      [ConfirmationOfDiagnosis]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [SpreadMechanism]
      (
      [Id],
      [ProfileVersionId],
      [SpreadMechanismId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [SpreadMechanismId]
      FROM
      [SpreadMechanism]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [GeographicDistribution]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [GeographicDistribution]
      (
      [ProfileVersionId]
      
        , [GBPresenceIndicator]
      
        , [GBPresenceIndicatorComments]
      
        , [CurrentPrevalenceInGB]
      
        , [CurrentPrevalenceInGBComments]
      
        , [DateOfMostRecentOccurrenceInGB]
      
        , [DateOfMostRecentOccurrenceInGBComments]
      
        , [RiskOfIntroductionToGB]
      
        , [RiskOfIntroductionToGBComments]
      
        , [GlobalGeographicDistributionComments]
      
      )
      SELECT
      @ProfileVersionId
      
        , [GBPresenceIndicator]
      
        , [GBPresenceIndicatorComments]
      
        , [CurrentPrevalenceInGB]
      
        , [CurrentPrevalenceInGBComments]
      
        , [DateOfMostRecentOccurrenceInGB]
      
        , [DateOfMostRecentOccurrenceInGBComments]
      
        , [RiskOfIntroductionToGB]
      
        , [RiskOfIntroductionToGBComments]
      
        , [GlobalGeographicDistributionComments]
      
      FROM
      [GeographicDistribution]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [GlobalGeographicDistribution]
      (
      [Id],
      [ProfileVersionId],
      [GeographicAreaId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [GeographicAreaId]
      FROM
      [GlobalGeographicDistribution]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [HumanHealth]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [HumanHealth]
      (
      [ProfileVersionId]
      
        , [ZoonoticIndicator]
      
        , [ZoonoticIndicatorComments]
      
        , [HumanTransmissionMechanismComments]
      
        , [SymptomsOfHumanDisease]
      
        , [TransmissibilityIndicator]
      
        , [TransmissibilityIndicatorComments]
      
        , [ModalSeverityOfHumanDisease]
      
        , [ModalSeverityOfHumanDiseaseComments]
      
        , [MaximumSeverityOfHumanDisease]
      
        , [MaximumSeverityOfHumanDiseaseComments]
      
        , [GeographicDistributionOfHumanDiseaseComments]
      
        , [AnnualNumberOfHumanCasesInGB]
      
        , [AnnualNumberOfHumanCasesInGBComments]
      
        , [AverageCostPerCase]
      
        , [AverageCostPerCaseComments]
      
        , [IndirectEconomicCostOfHumanIllness]
      
        , [IndirectEconomicCostOfHumanIllnessComments]
      
        , [Uncertainty]
      
        , [UncertaintyComments]
      
        , [ImpactOnHumanHealth]
      
      )
      SELECT
      @ProfileVersionId
      
        , [ZoonoticIndicator]
      
        , [ZoonoticIndicatorComments]
      
        , [HumanTransmissionMechanismComments]
      
        , [SymptomsOfHumanDisease]
      
        , [TransmissibilityIndicator]
      
        , [TransmissibilityIndicatorComments]
      
        , [ModalSeverityOfHumanDisease]
      
        , [ModalSeverityOfHumanDiseaseComments]
      
        , [MaximumSeverityOfHumanDisease]
      
        , [MaximumSeverityOfHumanDiseaseComments]
      
        , [GeographicDistributionOfHumanDiseaseComments]
      
        , [AnnualNumberOfHumanCasesInGB]
      
        , [AnnualNumberOfHumanCasesInGBComments]
      
        , [AverageCostPerCase]
      
        , [AverageCostPerCaseComments]
      
        , [IndirectEconomicCostOfHumanIllness]
      
        , [IndirectEconomicCostOfHumanIllnessComments]
      
        , [Uncertainty]
      
        , [UncertaintyComments]
      
        , [ImpactOnHumanHealth]
      
      FROM
      [HumanHealth]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [HumanTransmissionMechanism]
      (
      [Id],
      [ProfileVersionId],
      [TransmissionMechanismId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [TransmissionMechanismId]
      FROM
      [HumanTransmissionMechanism]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [GeographicDistributionOfHumanDisease]
      (
      [Id],
      [ProfileVersionId],
      [GeographicAreaId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [GeographicAreaId]
      FROM
      [GeographicDistributionOfHumanDisease]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [InternationalTrade]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [InternationalTrade]
      (
      [ProfileVersionId]
      
        , [StatutoryObligationToControl]
      
        , [StatutoryObligationToControlComments]
      
        , [ReestablishmentOfTradingStatus]
      
        , [ReestablishmentOfTradingStatusComments]
      
        , [PotentialForRegionalisation]
      
        , [PotentialForRegionalisationComments]
      
        , [RangeOfCommoditiesCompromised]
      
        , [RangeOfCommoditiesCompromisedComments]
      
        , [ImpactOnInternationalTrade]
      
      )
      SELECT
      @ProfileVersionId
      
        , [StatutoryObligationToControl]
      
        , [StatutoryObligationToControlComments]
      
        , [ReestablishmentOfTradingStatus]
      
        , [ReestablishmentOfTradingStatusComments]
      
        , [PotentialForRegionalisation]
      
        , [PotentialForRegionalisationComments]
      
        , [RangeOfCommoditiesCompromised]
      
        , [RangeOfCommoditiesCompromisedComments]
      
        , [ImpactOnInternationalTrade]
      
      FROM
      [InternationalTrade]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [LegislationAndMandates]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [LegislationAndMandates]
      (
      [ProfileVersionId]
      
        , [NotifiableDiseaseIndicator]
      
        , [ReportableCausativeOrganismIndicator]
      
        , [ApplicableLegislationAndMandatesComments]
      
        , [LegislationOverview]
      
      )
      SELECT
      @ProfileVersionId
      
        , [NotifiableDiseaseIndicator]
      
        , [ReportableCausativeOrganismIndicator]
      
        , [ApplicableLegislationAndMandatesComments]
      
        , [LegislationOverview]
      
      FROM
      [LegislationAndMandates]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    
      IF @CloneProfileVersionId IS NOT NULL BEGIN

      INSERT INTO [ApplicableLegislationAndMandates]
      (
      [Id],
      [ProfileVersionId],
      [LegislationTypeId]
      )
      SELECT
      NEWID(),
      @ProfileVersionId,
      [LegislationTypeId]
      FROM
      [ApplicableLegislationAndMandates]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [OpportunityToAddValue]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [OpportunityToAddValue]
      (
      [ProfileVersionId]
      
        , [OpportunityToAddValueSummary]
      
      )
      SELECT
      @ProfileVersionId
      
        , [OpportunityToAddValueSummary]
      
      FROM
      [OpportunityToAddValue]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [PublicAndStakeholderPerception]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [PublicAndStakeholderPerception]
      (
      [ProfileVersionId]
      
        , [PublicAndStakeholderPerceptionSummary]
      
      )
      SELECT
      @ProfileVersionId
      
        , [PublicAndStakeholderPerceptionSummary]
      
      FROM
      [PublicAndStakeholderPerception]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [Summary]
		(
		[ProfileVersionId]
		
			, [ScenarioDescription]
		
		)
		VALUES
		(
		@ProfileVersionId
		
			, 'The data presented in this profile is based on the current situation for this disease/issue.'
      )

      END ELSE BEGIN

      INSERT INTO [Summary]
      (
      [ProfileVersionId]
      
        , [Description]
      
        , [AffectedSpeciesComments]
      
        , [OtherAffectedSpeciesComments]
      
        , [ScenarioDescription]
      
        , [RevisionHistory]
      
      )
      SELECT
      @ProfileVersionId
      
        , [Description]
      
        , [AffectedSpeciesComments]
      
        , [OtherAffectedSpeciesComments]
      
        , [ScenarioDescription]
      
        , [RevisionHistory]
      
      FROM
      [Summary]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [Surveillance]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [Surveillance]
      (
      [ProfileVersionId]
      
        , [SummaryOfSurveillanceActivities]
      
      )
      SELECT
      @ProfileVersionId
      
        , [SummaryOfSurveillanceActivities]
      
      FROM
      [Surveillance]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

      IF @CloneProfileVersionId IS NULL BEGIN

      INSERT INTO [WiderSociety]
		(
		[ProfileVersionId]
		
		)
		VALUES
		(
		@ProfileVersionId
		
      )

      END ELSE BEGIN

      INSERT INTO [WiderSociety]
      (
      [ProfileVersionId]
      
        , [PotentialUnplannedCostToExchequer]
      
        , [PotentialUnplannedCostToExchequerComments]
      
        , [GlobalEnvironment]
      
        , [GlobalEnvironmentComments]
      
        , [LocalEnvironment]
      
        , [LocalEnvironmentComments]
      
        , [WiderRuralCommunity]
      
        , [WiderRuralCommunityComments]
      
        , [TotalSurveillanceCosts]
      
        , [TotalSurveillanceCostsComments]
      
        , [ImpactOnSocietySummary]
      
        , [FFGCostsSummary]
      
      )
      SELECT
      @ProfileVersionId
      
        , [PotentialUnplannedCostToExchequer]
      
        , [PotentialUnplannedCostToExchequerComments]
      
        , [GlobalEnvironment]
      
        , [GlobalEnvironmentComments]
      
        , [LocalEnvironment]
      
        , [LocalEnvironmentComments]
      
        , [WiderRuralCommunity]
      
        , [WiderRuralCommunityComments]
      
        , [TotalSurveillanceCosts]
      
        , [TotalSurveillanceCostsComments]
      
        , [ImpactOnSocietySummary]
      
        , [FFGCostsSummary]
      
      FROM
      [WiderSociety]
      WHERE
      [ProfileVersionId] = @CloneProfileVersionId

      END
    

	  END
	  GO

	  GRANT EXECUTE ON [dbo].[spiProfileVersion] TO [VLAProfilesUser]
	  GO

	  
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    -- =============================================
    --  This stored procedure was autogenerated by the Profiles
    --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spiProfileVersionSpecies
    @ProfileVersionId uniqueidentifier,
    @SpeciesId uniqueidentifier,
    @CloneProfileVersionId uniqueidentifier = NULL,
	@AffectedSpeciesTypeName varchar(50)

    AS
    BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    DECLARE @ParentSpeciesCount int
    DECLARE @ChildSpeciesCount int
    DECLARE @SpeciesIsActive bit
    DECLARE @AffectedSpeciesTypeId uniqueidentifier
	
    -- if this species doesn't exist (or isn't profiled) in the profile being cloned, treat as if we are not cloning
    IF NOT EXISTS
    (
    SELECT * 
	FROM
		[ProfileVersionSpecies] INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
	WHERE
		[ProfileVersionId] = @CloneProfileVersionId AND 
		[SpeciesId] = @SpeciesId AND
		[luAffectedSpeciesType].[Name] = 'Profiled'
    ) BEGIN
    SET @CloneProfileVersionId = NULL
    END

    SELECT
    @ChildSpeciesCount = MAX(CAST(dbo.IsAncestorSpecies([SpeciesId], @SpeciesId) AS int)),
    @ParentSpeciesCount = MAX(CAST(dbo.IsAncestorSpecies(@SpeciesId, [SpeciesId]) AS int))
    FROM
    [ProfileVersionSpecies]
    WHERE
    [ProfileVersionId] = @ProfileVersionId

    IF @ParentSpeciesCount > 0 BEGIN
    RAISERROR('You cannot add this species to the profile version because it is an ancestor of an existing affected species', 16, 1)
    RETURN
    END

    IF @ChildSpeciesCount > 0 BEGIN
    RAISERROR('You cannot add this species to the profile version because it is a descendant of an existing affected species', 16, 1)
    RETURN
    END

    SELECT
    @SpeciesIsActive = CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN GETDATE() BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit)
    FROM
    [Species]
    WHERE
    [Id] = @SpeciesId

    IF @SpeciesIsActive = 0 BEGIN
    RAISERROR('You cannot add an inactive species to a profile version', 16, 1)
    RETURN
    END

	SELECT
		@AffectedSpeciesTypeId = [Id]
	FROM
		[luAffectedSpeciesType]
	WHERE
		[Name] = @AffectedSpeciesTypeName
	
	IF @AffectedSpeciesTypeId IS NULL BEGIN
		RAISERROR('The specified affected species type name does not exist in the database.', 16, 1)
		RETURN
	END
	
    --create the row in the link table to indicate that this species is affected for this profile version
    INSERT INTO [ProfileVersionSpecies]
    (
    ProfileVersionId,
    SpeciesId,
	AffectedSpeciesTypeId
    )
    VALUES
    (
    @ProfileVersionId,
    @SpeciesId,
	@AffectedSpeciesTypeId
    )

	IF @AffectedSpeciesTypeName = 'Profiled' BEGIN
	
    -- create rows in all the profile version section tables for per species questions
    
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [AnimalWelfareSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [AnimalWelfareSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [WelfareIssueIndicator]
        
          , [WelfareIssueIndicatorComments]
        
          , [FreedomFromHungerAndThirst]
        
          , [FreedomFromHungerAndThirstComments]
        
          , [FreedomFromDiscomfort]
        
          , [FreedomFromDiscomfortComments]
        
          , [FreedomFromPainOrInjury]
        
          , [FreedomFromPainOrInjuryComments]
        
          , [FreedomToExpressNormalBehaviour]
        
          , [FreedomToExpressNormalBehaviourComments]
        
          , [FreedomFromFearAndDistress]
        
          , [FreedomFromFearAndDistressComments]
        
          , [PotentialToReduceWelfareImplications]
        
          , [PotentialToReduceWelfareImplicationsComments]
        
          , [ProportionOfAnimalsAffectedSufferingSeverely]
        
          , [ProportionOfAnimalsAffectedSufferingSeverelyComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [WelfareIssueIndicator]
        
          , [WelfareIssueIndicatorComments]
        
          , [FreedomFromHungerAndThirst]
        
          , [FreedomFromHungerAndThirstComments]
        
          , [FreedomFromDiscomfort]
        
          , [FreedomFromDiscomfortComments]
        
          , [FreedomFromPainOrInjury]
        
          , [FreedomFromPainOrInjuryComments]
        
          , [FreedomToExpressNormalBehaviour]
        
          , [FreedomToExpressNormalBehaviourComments]
        
          , [FreedomFromFearAndDistress]
        
          , [FreedomFromFearAndDistressComments]
        
          , [PotentialToReduceWelfareImplications]
        
          , [PotentialToReduceWelfareImplicationsComments]
        
          , [ProportionOfAnimalsAffectedSufferingSeverely]
        
          , [ProportionOfAnimalsAffectedSufferingSeverelyComments]
        
        FROM
        [AnimalWelfareSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [ApproachToControlSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [ApproachToControlSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [CurrentControlMechanismsComments]
        
          , [OtherControlMechanismsComments]
        
          , [UptakeAtHoldingLevel]
        
          , [UptakeAtHoldingLevelComments]
        
          , [WelfareEffect]
        
          , [WelfareEffectComments]
        
          , [PotentialToReduceRisk]
        
          , [PotentialToReduceRiskComments]
        
          , [PotentialToReduceHumanExposure]
        
          , [PotentialToReduceHumanExposureComments]
        
          , [VaccinesAvailableIndicator]
        
          , [VaccinesAvailableIndicatorComments]
        
          , [ControlsAtTheHoldingLevel]
        
          , [ControlsAtTheHoldingLevelComments]
        
          , [Compensation]
        
          , [LevelOfNationalPreparedness]
        
          , [LevelOfNationalPreparednessComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [CurrentControlMechanismsComments]
        
          , [OtherControlMechanismsComments]
        
          , [UptakeAtHoldingLevel]
        
          , [UptakeAtHoldingLevelComments]
        
          , [WelfareEffect]
        
          , [WelfareEffectComments]
        
          , [PotentialToReduceRisk]
        
          , [PotentialToReduceRiskComments]
        
          , [PotentialToReduceHumanExposure]
        
          , [PotentialToReduceHumanExposureComments]
        
          , [VaccinesAvailableIndicator]
        
          , [VaccinesAvailableIndicatorComments]
        
          , [ControlsAtTheHoldingLevel]
        
          , [ControlsAtTheHoldingLevelComments]
        
          , [Compensation]
        
          , [LevelOfNationalPreparedness]
        
          , [LevelOfNationalPreparednessComments]
        
        FROM
        [ApproachToControlSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        IF @CloneProfileVersionId IS NOT NULL BEGIN

        INSERT INTO [CurrentControlMechanisms]
        (
        [Id],
        [ProfileVersionId],
        [SpeciesId],
        [ControlMechanismId]
        )
        SELECT
        NEWID(),
        @ProfileVersionId,
        @SpeciesId,
        [ControlMechanismId]
        FROM
        [CurrentControlMechanisms]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        IF @CloneProfileVersionId IS NOT NULL BEGIN

        INSERT INTO [OtherControlMechanisms]
        (
        [Id],
        [ProfileVersionId],
        [SpeciesId],
        [ControlMechanismId]
        )
        SELECT
        NEWID(),
        @ProfileVersionId,
        @SpeciesId,
        [ControlMechanismId]
        FROM
        [OtherControlMechanisms]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [EpidemiologySpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [EpidemiologySpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [DifferentialDiagnoses]
        
          , [PotentialForSilentSpread]
        
          , [PotentialForSilentSpreadComments]
        
          , [IncubationPeriodTypicalLower]
        
          , [IncubationPeriodTypicalUpper]
        
          , [IncubationPeriodMinimum]
        
          , [IncubationPeriodMaximum]
        
          , [ClinicalSigns]
        
          , [PathologicalFeatures]
        
          , [MortalityIndicator]
        
          , [MortalityIndicatorComments]
        
          , [DurationOfDisease]
        
          , [DurationOfDiseaseComments]
        
          , [PrimaryDetectionMethods]
        
          , [DetectionMethodTypeComments]
        
          , [TransmissionMechanismComments]
        
          , [RateOfSpreadOnPremises]
        
          , [RateOfSpreadOnPremisesComments]
        
          , [WildlifeReservoirIndicator]
        
          , [WildlifeReservoirIndicatorComments]
        
          , [IncreaseUnderstandingPotential]
        
          , [IncreaseUnderstandingPotentialComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [DifferentialDiagnoses]
        
          , [PotentialForSilentSpread]
        
          , [PotentialForSilentSpreadComments]
        
          , [IncubationPeriodTypicalLower]
        
          , [IncubationPeriodTypicalUpper]
        
          , [IncubationPeriodMinimum]
        
          , [IncubationPeriodMaximum]
        
          , [ClinicalSigns]
        
          , [PathologicalFeatures]
        
          , [MortalityIndicator]
        
          , [MortalityIndicatorComments]
        
          , [DurationOfDisease]
        
          , [DurationOfDiseaseComments]
        
          , [PrimaryDetectionMethods]
        
          , [DetectionMethodTypeComments]
        
          , [TransmissionMechanismComments]
        
          , [RateOfSpreadOnPremises]
        
          , [RateOfSpreadOnPremisesComments]
        
          , [WildlifeReservoirIndicator]
        
          , [WildlifeReservoirIndicatorComments]
        
          , [IncreaseUnderstandingPotential]
        
          , [IncreaseUnderstandingPotentialComments]
        
        FROM
        [EpidemiologySpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        IF @CloneProfileVersionId IS NOT NULL BEGIN

        INSERT INTO [TransmissionMechanism]
        (
        [Id],
        [ProfileVersionId],
        [SpeciesId],
        [TransmissionMechanismId]
        )
        SELECT
        NEWID(),
        @ProfileVersionId,
        @SpeciesId,
        [TransmissionMechanismId]
        FROM
        [TransmissionMechanism]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [GeographicDistributionSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [GeographicDistributionSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [NumberOfCasesPerYearInGB]
        
          , [NumberOfCasesPerYearInGBComments]
        
          , [PotentialForRiskChange]
        
          , [PotentialForRiskChangeComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [NumberOfCasesPerYearInGB]
        
          , [NumberOfCasesPerYearInGBComments]
        
          , [PotentialForRiskChange]
        
          , [PotentialForRiskChangeComments]
        
        FROM
        [GeographicDistributionSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [HumanHealthSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [HumanHealthSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [LevelOfHumanExposureToAnimalOrProducts]
        
          , [LevelOfHumanExposureToAnimalOrProductsComments]
        
          , [AttributableFraction]
        
          , [AttributableFractionComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [LevelOfHumanExposureToAnimalOrProducts]
        
          , [LevelOfHumanExposureToAnimalOrProductsComments]
        
          , [AttributableFraction]
        
          , [AttributableFractionComments]
        
        FROM
        [HumanHealthSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [InternationalTradeSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [InternationalTradeSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [CommercialTrade]
        
          , [CommercialTradeComments]
        
          , [ImpactOnLevelOfImports]
        
          , [ImpactOnLevelOfImportsComments]
        
          , [ImportanceOfExportTrade]
        
          , [ImportanceOfExportTradeComments]
        
          , [ImpactOnIntraCommunityFlows]
        
          , [ImpactOnIntraCommunityFlowsComments]
        
          , [ImpactOnThirdCountryFlows]
        
          , [ImpactOnThirdCountryFlowsComments]
        
          , [ExportMarketValue]
        
          , [ExportMarketValueComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [CommercialTrade]
        
          , [CommercialTradeComments]
        
          , [ImpactOnLevelOfImports]
        
          , [ImpactOnLevelOfImportsComments]
        
          , [ImportanceOfExportTrade]
        
          , [ImportanceOfExportTradeComments]
        
          , [ImpactOnIntraCommunityFlows]
        
          , [ImpactOnIntraCommunityFlowsComments]
        
          , [ImpactOnThirdCountryFlows]
        
          , [ImpactOnThirdCountryFlowsComments]
        
          , [ExportMarketValue]
        
          , [ExportMarketValueComments]
        
        FROM
        [InternationalTradeSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [RiskSpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [RiskSpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [RiskScenarios]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [RiskScenarios]
        
        FROM
        [RiskSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      

        IF @CloneProfileVersionId IS NOT NULL BEGIN

        DECLARE @TempCurrentSurveillanceActivitiesSpecies TABLE
        (
        [OldId] uniqueidentifier,
        [NewId] uniqueidentifier
        )

        INSERT INTO @TempCurrentSurveillanceActivitiesSpecies
        SELECT
        [Id],
        NEWID()
        FROM
        [CurrentSurveillanceActivitiesSpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        INSERT INTO [CurrentSurveillanceActivitiesSpecies]
        (
        [Id],
        [ProfileVersionId],
        [SpeciesId]
        
          , [Reference]
        
          , [Mechanism]
        
          , [PurposeAndDetail]
        
        )
        SELECT
        [NewId],
        @ProfileVersionId,
        @SpeciesId
        
          , [Reference]
        
          , [Mechanism]
        
          , [PurposeAndDetail]
        
        FROM
        [CurrentSurveillanceActivitiesSpecies] INNER JOIN @TempCurrentSurveillanceActivitiesSpecies tmp ON [CurrentSurveillanceActivitiesSpecies].[Id] = tmp.[OldId]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        

        END

      
        
        IF @CloneProfileVersionId IS NULL BEGIN
        
        INSERT INTO [WiderSocietySpecies]
		  (
		  [ProfileVersionId],
		  [SpeciesId]
		  
		  )
		  VALUES
		  (
		  @ProfileVersionId,
		  @SpeciesId
		  
        )

        END ELSE BEGIN

        INSERT INTO [WiderSocietySpecies]
        (
        [ProfileVersionId],
        [SpeciesId]
        
          , [LocalAgriculturalEconomy]
        
          , [LocalAgriculturalEconomyComments]
        
        )
        SELECT
        @ProfileVersionId,
        @SpeciesId
        
          , [LocalAgriculturalEconomy]
        
          , [LocalAgriculturalEconomyComments]
        
        FROM
        [WiderSocietySpecies]
        WHERE
        [ProfileVersionId] = @CloneProfileVersionId AND
        [SpeciesId] = @SpeciesId

        END
      

		END
		
  	  END
	  GO

	  GRANT EXECUTE ON [dbo].[spiProfileVersionSpecies] TO [VLAProfilesUser]
	  GO


  SET ANSI_NULLS ON
  GO
  SET QUOTED_IDENTIFIER ON
  GO
  -- =============================================
  --  This stored procedure was autogenerated by the Profiles
  --  CodeGen application on 13/11/2008 18:47:37 .
	  -- =============================================
	  CREATE PROCEDURE spuProfileVersionSpeciesTradeData
	  @ProfileVersionId uniqueidentifier,
	  @SpeciesId uniqueidentifier

	  AS
	  BEGIN
	  -- SET NOCOUNT ON added to prevent extra result sets from
	  -- interfering with SELECT statements.
	  SET NOCOUNT ON;

	  -- copy the data that is held at the species level to the profile version
	  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnThirdCountryFlowsComments] = [Species].[ImpactOnThirdCountryFlowsComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImportanceOfExportTrade] = [Species].[ImportanceOfExportTrade]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ExportMarketValue] = [Species].[ExportMarketValue]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnIntraCommunityFlows] = [Species].[ImpactOnIntraCommunityFlows]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnLevelOfImports] = [Species].[ImpactOnLevelOfImports]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [CommercialTradeComments] = [Species].[CommercialTradeComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [CommercialTrade] = [Species].[CommercialTrade]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ExportMarketValueComments] = [Species].[ExportMarketValueComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnThirdCountryFlows] = [Species].[ImpactOnThirdCountryFlows]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnLevelOfImportsComments] = [Species].[ImpactOnLevelOfImportsComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImportanceOfExportTradeComments] = [Species].[ImportanceOfExportTradeComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  
				  UPDATE
				  [InternationalTradeSpecies]
				  SET
				  [ImpactOnIntraCommunityFlowsComments] = [Species].[ImpactOnIntraCommunityFlowsComments]
				  FROM
				  [InternationalTradeSpecies] INNER JOIN [Species] ON [InternationalTradeSpecies].[SpeciesId] = [Species].[Id]
				  WHERE
				  [Species].[Id] = @SpeciesId AND
				  [InternationalTradeSpecies].[ProfileVersionId] = @ProfileVersionId
			  

	  END
	  GO

	  GRANT EXECUTE ON [dbo].[spuProfileVersionSpeciesTradeData] TO [VLAProfilesUser]
	  GO

	  
  SET ANSI_NULLS ON
  GO
  SET QUOTED_IDENTIFIER ON
  GO
  -- =============================================
  --  This stored procedure was autogenerated by the Profiles
  --  CodeGen application on 13/11/2008 18:47:37 .
  -- =============================================
  CREATE PROCEDURE spdProfileVersionSpecies
  @ProfileVersionId uniqueidentifier,
  @SpeciesId uniqueidentifier

  AS
  BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

  

    -- Delete from any link tables that are linked to AnimalWelfareSpecies
     
      -- Delete from table AnimalWelfareSpecies
      DELETE FROM
      [AnimalWelfareSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to ApproachToControlSpecies
     
    DELETE FROM
      [CurrentControlMechanisms]
    WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
  
    DELETE FROM
      [OtherControlMechanisms]
    WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
  
      -- Delete from table ApproachToControlSpecies
      DELETE FROM
      [ApproachToControlSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to EpidemiologySpecies
     
    DELETE FROM
      [TransmissionMechanism]
    WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
  
      -- Delete from table EpidemiologySpecies
      DELETE FROM
      [EpidemiologySpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to GeographicDistributionSpecies
     
      -- Delete from table GeographicDistributionSpecies
      DELETE FROM
      [GeographicDistributionSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to HumanHealthSpecies
     
      -- Delete from table HumanHealthSpecies
      DELETE FROM
      [HumanHealthSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to InternationalTradeSpecies
     
      -- Delete from table InternationalTradeSpecies
      DELETE FROM
      [InternationalTradeSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

    -- Delete from any link tables that are linked to RiskSpecies
     
      -- Delete from table RiskSpecies
      DELETE FROM
      [RiskSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
        
      
      --Delete from any link tables that are linked to CurrentSurveillanceActivitiesSpecies
      

      DELETE FROM
      [CurrentSurveillanceActivitiesSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId

    

    -- Delete from any link tables that are linked to SurveillanceSpecies
     

    -- Delete from any link tables that are linked to WiderSocietySpecies
     
      -- Delete from table WiderSocietySpecies
      DELETE FROM
      [WiderSocietySpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId AND
      [SpeciesId] = @SpeciesId
    

	  --delete from prioritisation tables
	  DELETE
	  [ProfileVersionSpeciesPrioritisation]
	  FROM
	  [ProfileVersionSpeciesPrioritisation] INNER JOIN [ProfileVersionPrioritisedSpecies] ON [ProfileVersionSpeciesPrioritisation].[ProfileVersionId] = [ProfileVersionPrioritisedSpecies].[ProfileVersionId] AND [ProfileVersionSpeciesPrioritisation].[SpeciesId] = [ProfileVersionPrioritisedSpecies].[SpeciesId]
	  WHERE
	  [ProfileVersionSpeciesPrioritisation].[ProfileVersionId] = @ProfileVersionId AND
	  [ProfileVersionPrioritisedSpecies].[AffectedSpeciesId] = @SpeciesId

	  DELETE FROM
	  [ProfileVersionPrioritisedSpecies]
	  WHERE
	  [ProfileVersionPrioritisedSpecies].[ProfileVersionId] = @ProfileVersionId AND
	  [ProfileVersionPrioritisedSpecies].[AffectedSpeciesId] = @SpeciesId
	  
	  --delete the row in the link table to indicate that this species is affected for this profile version
	  DELETE FROM
	  [ProfileVersionSpecies]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId AND
	  [SpeciesId] = @SpeciesId

	  END
	  GO

	  GRANT EXECUTE ON [dbo].[spdProfileVersionSpecies] TO [VLAProfilesUser]
	  GO

	  
  SET ANSI_NULLS ON
  GO
  SET QUOTED_IDENTIFIER ON
  GO
  -- =============================================
  --  This stored procedure was autogenerated by the Profiles
  --  CodeGen application on 13/11/2008 18:47:37 .
	  -- =============================================
	  CREATE PROCEDURE spdProfileVersion
	  @ProfileVersionId uniqueidentifier,
	  @NextLatestProfileVersionId uniqueidentifier OUTPUT,
	  @ProfileDeleted bit OUTPUT

	  AS
	  BEGIN
	  -- SET NOCOUNT ON added to prevent extra result sets from
	  -- interfering with SELECT statements.
	  SET NOCOUNT ON;

	  DECLARE @ProfileId uniqueidentifier
	  DECLARE @VersionMajor tinyint
	  DECLARE @EffectiveDateTo smalldatetime
	  DECLARE @StateName varchar(50)
	  DECLARE @ProfileVersionCount int
	  DECLARE @ParentProfileCount int

	  SELECT
	  @ProfileId = [ProfileVersion].[ProfileId],
	  @VersionMajor = [ProfileVersion].[VersionMajor],
	  @EffectiveDateTo = [ProfileVersion].[EffectiveDateTo],
	  @StateName = [luProfileVersionState].[Name]
	  FROM
	  [ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	  WHERE
	  [ProfileVersion].[Id] = @ProfileVersionId

	  IF @EffectiveDateTo IS NOT NULL BEGIN
	  RAISERROR('You cannot delete this profile version because it is not current', 16, 1)
	  RETURN
	  END

	  IF @StateName != 'Draft' BEGIN
	  RAISERROR('You cannot delete this profile version because it is not draft', 16, 1)
	  RETURN
	  END

	  -- check that we are not trying to delete the last profile version of a profile that has scenarios
	  SELECT
	  @ProfileVersionCount = COUNT(*)
	  FROM
	  [ProfileVersion]
	  WHERE
	  [ProfileId] = @ProfileId

	  SELECT
	  @ParentProfileCount = COUNT(*)
	  FROM
	  [Profile]
	  WHERE
	  [ParentId] = @ProfileId

	  IF @ProfileVersionCount = 1 AND @ParentProfileCount > 0 BEGIN
	  RAISERROR('You cannot delete this profile because it has associated "what-if" scenarios. Delete them before deleting this profile.', 16, 1)
	  RETURN
	  END

	  -- Get the ID of the next latest profile version
	  SELECT
	  @NextLatestProfileVersionId = [ProfileVersion].[Id]
	  FROM
	  [ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	  WHERE
	  [luProfileVersionState].[Name] = 'Draft' AND
	  [ProfileVersion].[ProfileId] = @ProfileId AND
	  [ProfileVersion].[VersionMajor] = @VersionMajor AND
	  [ProfileVersion].[VersionMinor] = (
	  SELECT
	  MAX([VersionMinor])
	  FROM
	  [ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	  WHERE
	  [luProfileVersionState].[Name] = 'Draft' AND
	  [ProfileId] = @ProfileId AND
	  [VersionMajor] = @VersionMajor AND
	  [EffectiveDateTo] IS NOT NULL
	  )

	  

    -- Delete from any link tables that are linked to AnimalWelfare
      -- Delete from table AnimalWelfare
    DELETE FROM
    [AnimalWelfare]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to ApproachToControl
      DELETE FROM
      [CurrentControlMechanisms]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      DELETE FROM
      [OtherControlMechanisms]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      -- Delete from table ApproachToControl
    DELETE FROM
    [ApproachToControl]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to AreasOfUncertainty
      -- Delete from table AreasOfUncertainty
    DELETE FROM
    [AreasOfUncertainty]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to Epidemiology
      DELETE FROM
      [ConfirmationOfDiagnosis]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      DELETE FROM
      [TransmissionMechanism]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      DELETE FROM
      [SpreadMechanism]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      -- Delete from table Epidemiology
    DELETE FROM
    [Epidemiology]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to GeographicDistribution
      DELETE FROM
      [GlobalGeographicDistribution]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      -- Delete from table GeographicDistribution
    DELETE FROM
    [GeographicDistribution]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to HumanHealth
      DELETE FROM
      [HumanTransmissionMechanism]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      DELETE FROM
      [GeographicDistributionOfHumanDisease]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      -- Delete from table HumanHealth
    DELETE FROM
    [HumanHealth]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to InternationalTrade
      -- Delete from table InternationalTrade
    DELETE FROM
    [InternationalTrade]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to LegislationAndMandates
      DELETE FROM
      [ApplicableLegislationAndMandates]
      WHERE
      [ProfileVersionId] = @ProfileVersionId
    
      -- Delete from table LegislationAndMandates
    DELETE FROM
    [LegislationAndMandates]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to OpportunityToAddValue
      -- Delete from table OpportunityToAddValue
    DELETE FROM
    [OpportunityToAddValue]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to PublicAndStakeholderPerception
      -- Delete from table PublicAndStakeholderPerception
    DELETE FROM
    [PublicAndStakeholderPerception]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to Summary
      -- Delete from table Summary
    DELETE FROM
    [Summary]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    --Delete from any link tables that are linked to CurrentSurveillanceActivitiesSpecies

    -- Delete from CurrentSurveillanceActivitiesSpecies
      DELETE FROM
      [CurrentSurveillanceActivitiesSpecies]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 

    

    -- Delete from any link tables that are linked to Surveillance
      -- Delete from table Surveillance
    DELETE FROM
    [Surveillance]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    

    -- Delete from any link tables that are linked to WiderSociety
      -- Delete from table WiderSociety
    DELETE FROM
    [WiderSociety]
      WHERE
      [ProfileVersionId] = @ProfileVersionId 
    


	  DELETE FROM
	  [ProfileVersionNoteQuestion]
	  WHERE
	  [ProfileVersionNoteQuestion].[ProfileVersionNoteId] IN
	  (
	  SELECT
	  [Id]
	  FROM
	  [ProfileVersionNote]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId
	  )

	  DELETE FROM
	  [ProfileVersionNote]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  DELETE FROM
	  [ReviewComment]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  DELETE FROM
	  [ProfileVersionSectionUser]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  DELETE FROM
	  [ProfileVersionSection]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  --delete prioritisation scores for this profile version
	  DELETE FROM
	  [PrioritisationScore]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  --delete profile reports for this profile version
	  DELETE FROM
	  [ProfileVersionReport]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  --delete the rows in the link table for the affected species in this profile version
	  DELETE FROM
	  [ProfileVersionSpecies]
	  WHERE
	  [ProfileVersionId] = @ProfileVersionId

	  --delete the row in the profile version table
	  DELETE FROM
	  [ProfileVersion]
	  WHERE
	  [Id] = @ProfileVersionId


	  -- change the current draft version

	  IF @NextLatestProfileVersionId IS NOT NULL BEGIN
	  UPDATE
	  [ProfileVersion]
	  SET
	  [EffectiveDateTo] = NULL
	  WHERE
	  [Id] = @NextLatestProfileVersionId
	  END

	  SET @ProfileDeleted = 0

	  -- if there are no profile versions left in this profile, remove the profile
	  IF NOT EXISTS (SELECT * FROM [ProfileVersion] WHERE [ProfileId] = @ProfileId) BEGIN

	  DELETE FROM
	  [ProfileSectionUser]
	  WHERE
	  [ProfileId] = @ProfileId

	  DELETE FROM
	  [ProfileUser]
	  WHERE
	  [ProfileId] = @ProfileId

	  DELETE FROM
	  [Profile]
	  WHERE
	  [Id] = @ProfileId

	  SET @ProfileDeleted = 1
	  END

	  END
	  GO

	  GRANT EXECUTE ON [dbo].[spdProfileVersion] TO [VLAProfilesUser]
	  GO

	  

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluSpreadMechanism

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luSpreadMechanism].[Id],
            [luSpreadMechanism].[LookupValue],
            [luSpreadMechanism].[EffectiveDateFrom],
            [luSpreadMechanism].[EffectiveDateTo],
            
                
                CAST(CASE WHEN

                

                [tmpSpreadMechanism].[SpreadMechanismId]

                IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luSpreadMechanism].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luSpreadMechanism].[EffectiveDateFrom] AND [luSpreadMechanism].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luSpreadMechanism] LEFT JOIN [ReferenceValue] ON [luSpreadMechanism].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [SpreadMechanismId]
              FROM
              [SpreadMechanism]
              GROUP BY
              [SpreadMechanismId]
              ) tmpSpreadMechanism ON [luSpreadMechanism].[Id] = [tmpSpreadMechanism].[SpreadMechanismId]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luSpreadMechanism].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluSpreadMechanism] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluSpreadMechanismValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luSpreadMechanism].[LookupValue],
      

        CAST(CASE WHEN

        

          [tmpSpreadMechanism].[SpreadMechanismId]

          IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
        
       [luSpreadMechanism].[EffectiveDateTo],
      [luSpreadMechanism].[EffectiveDateFrom],
      [luSpreadMechanism].[LastUpdated]

      FROM
      [luSpreadMechanism] LEFT JOIN [ReferenceValue] ON [luSpreadMechanism].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [SpreadMechanismId]
        FROM
        [SpreadMechanism]
        GROUP BY
        [SpreadMechanismId]
        ) tmpSpreadMechanism ON [luSpreadMechanism].[Id] = [tmpSpreadMechanism].[SpreadMechanismId]
      

      WHERE
      [luSpreadMechanism].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluSpreadMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluSpreadMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luSpreadMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '92104271-8505-4189-A43D-23F88E25DBEE',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luSpreadMechanism]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluSpreadMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluSpreadMechanismValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSpreadMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The SpreadMechanism Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '92104271-8505-4189-A43D-23F88E25DBEE',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luSpreadMechanism]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluSpreadMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluSpreadMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luSpreadMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSpreadMechanism]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The SpreadMechanism Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luSpreadMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '92104271-8505-4189-A43D-23F88E25DBEE',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luSpreadMechanism]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluSpreadMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluSpreadMechanismValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSpreadMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The SpreadMechanism Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luSpreadMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '92104271-8505-4189-A43D-23F88E25DBEE',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luSpreadMechanism]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluSpreadMechanismValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluTransmissionMechanism

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luTransmissionMechanism].[Id],
            [luTransmissionMechanism].[LookupValue],
            [luTransmissionMechanism].[EffectiveDateFrom],
            [luTransmissionMechanism].[EffectiveDateTo],
            
                
                CAST(CASE WHEN COALESCE(

                


                  [tmpTransmissionMechanism].[TransmissionMechanismId]
                  , 


                  [tmpHumanTransmissionMechanism].[TransmissionMechanismId]
                  

                ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luTransmissionMechanism].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luTransmissionMechanism].[EffectiveDateFrom] AND [luTransmissionMechanism].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luTransmissionMechanism] LEFT JOIN [ReferenceValue] ON [luTransmissionMechanism].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [TransmissionMechanismId]
              FROM
              [TransmissionMechanism]
              GROUP BY
              [TransmissionMechanismId]
              ) tmpTransmissionMechanism ON [luTransmissionMechanism].[Id] = [tmpTransmissionMechanism].[TransmissionMechanismId]
            

              LEFT JOIN
              (
              SELECT
              [TransmissionMechanismId]
              FROM
              [HumanTransmissionMechanism]
              GROUP BY
              [TransmissionMechanismId]
              ) tmpHumanTransmissionMechanism ON [luTransmissionMechanism].[Id] = [tmpHumanTransmissionMechanism].[TransmissionMechanismId]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luTransmissionMechanism].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluTransmissionMechanism] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluTransmissionMechanismValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luTransmissionMechanism].[LookupValue],
      
       
        CAST(CASE WHEN COALESCE(

        


          [tmpTransmissionMechanism].[TransmissionMechanismId]
          , 


          [tmpHumanTransmissionMechanism].[TransmissionMechanismId]
          

        ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
      
       [luTransmissionMechanism].[EffectiveDateTo],
      [luTransmissionMechanism].[EffectiveDateFrom],
      [luTransmissionMechanism].[LastUpdated]

      FROM
      [luTransmissionMechanism] LEFT JOIN [ReferenceValue] ON [luTransmissionMechanism].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [TransmissionMechanismId]
        FROM
        [TransmissionMechanism]
        GROUP BY
        [TransmissionMechanismId]
        ) tmpTransmissionMechanism ON [luTransmissionMechanism].[Id] = [tmpTransmissionMechanism].[TransmissionMechanismId]
      

        LEFT JOIN
        (
        SELECT
        [TransmissionMechanismId]
        FROM
        [HumanTransmissionMechanism]
        GROUP BY
        [TransmissionMechanismId]
        ) tmpHumanTransmissionMechanism ON [luTransmissionMechanism].[Id] = [tmpHumanTransmissionMechanism].[TransmissionMechanismId]
      

      WHERE
      [luTransmissionMechanism].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluTransmissionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluTransmissionMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luTransmissionMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luTransmissionMechanism]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluTransmissionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluTransmissionMechanismValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luTransmissionMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The TransmissionMechanism Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luTransmissionMechanism]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluTransmissionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluTransmissionMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luTransmissionMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luTransmissionMechanism]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The TransmissionMechanism Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luTransmissionMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luTransmissionMechanism]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluTransmissionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluTransmissionMechanismValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luTransmissionMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The TransmissionMechanism Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luTransmissionMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luTransmissionMechanism]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluTransmissionMechanismValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluSurveillanceMechanism

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luSurveillanceMechanism].[Id],
            [luSurveillanceMechanism].[LookupValue],
            [luSurveillanceMechanism].[EffectiveDateFrom],
            [luSurveillanceMechanism].[EffectiveDateTo],
            
                
                CAST(CASE WHEN

                

                [tmpCurrentSurveillanceActivitiesSpecies].[Mechanism]

                IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luSurveillanceMechanism].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luSurveillanceMechanism].[EffectiveDateFrom] AND [luSurveillanceMechanism].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luSurveillanceMechanism] LEFT JOIN [ReferenceValue] ON [luSurveillanceMechanism].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [Mechanism]
              FROM
              [CurrentSurveillanceActivitiesSpecies]
              GROUP BY
              [Mechanism]
              ) tmpCurrentSurveillanceActivitiesSpecies ON [luSurveillanceMechanism].[Id] = [tmpCurrentSurveillanceActivitiesSpecies].[Mechanism]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luSurveillanceMechanism].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluSurveillanceMechanism] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluSurveillanceMechanismValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luSurveillanceMechanism].[LookupValue],
      

        CAST(CASE WHEN

        

          [tmpCurrentSurveillanceActivitiesSpecies].[Mechanism]

          IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
        
       [luSurveillanceMechanism].[EffectiveDateTo],
      [luSurveillanceMechanism].[EffectiveDateFrom],
      [luSurveillanceMechanism].[LastUpdated]

      FROM
      [luSurveillanceMechanism] LEFT JOIN [ReferenceValue] ON [luSurveillanceMechanism].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [Mechanism]
        FROM
        [CurrentSurveillanceActivitiesSpecies]
        GROUP BY
        [Mechanism]
        ) tmpCurrentSurveillanceActivitiesSpecies ON [luSurveillanceMechanism].[Id] = [tmpCurrentSurveillanceActivitiesSpecies].[Mechanism]
      

      WHERE
      [luSurveillanceMechanism].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluSurveillanceMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluSurveillanceMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luSurveillanceMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luSurveillanceMechanism]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluSurveillanceMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluSurveillanceMechanismValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSurveillanceMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The SurveillanceMechanism Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luSurveillanceMechanism]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluSurveillanceMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluSurveillanceMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luSurveillanceMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSurveillanceMechanism]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The SurveillanceMechanism Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luSurveillanceMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luSurveillanceMechanism]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluSurveillanceMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluSurveillanceMechanismValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luSurveillanceMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The SurveillanceMechanism Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luSurveillanceMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luSurveillanceMechanism]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluSurveillanceMechanismValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluGeographicArea

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luGeographicArea].[Id],
            [luGeographicArea].[LookupValue],
            [luGeographicArea].[EffectiveDateFrom],
            [luGeographicArea].[EffectiveDateTo],
            
                
                CAST(CASE WHEN COALESCE(

                


                  [tmpGlobalGeographicDistribution].[GeographicAreaId]
                  , 


                  [tmpGeographicDistributionOfHumanDisease].[GeographicAreaId]
                  

                ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luGeographicArea].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luGeographicArea].[EffectiveDateFrom] AND [luGeographicArea].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luGeographicArea] LEFT JOIN [ReferenceValue] ON [luGeographicArea].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [GeographicAreaId]
              FROM
              [GlobalGeographicDistribution]
              GROUP BY
              [GeographicAreaId]
              ) tmpGlobalGeographicDistribution ON [luGeographicArea].[Id] = [tmpGlobalGeographicDistribution].[GeographicAreaId]
            

              LEFT JOIN
              (
              SELECT
              [GeographicAreaId]
              FROM
              [GeographicDistributionOfHumanDisease]
              GROUP BY
              [GeographicAreaId]
              ) tmpGeographicDistributionOfHumanDisease ON [luGeographicArea].[Id] = [tmpGeographicDistributionOfHumanDisease].[GeographicAreaId]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luGeographicArea].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluGeographicArea] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluGeographicAreaValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luGeographicArea].[LookupValue],
      
       
        CAST(CASE WHEN COALESCE(

        


          [tmpGlobalGeographicDistribution].[GeographicAreaId]
          , 


          [tmpGeographicDistributionOfHumanDisease].[GeographicAreaId]
          

        ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
      
       [luGeographicArea].[EffectiveDateTo],
      [luGeographicArea].[EffectiveDateFrom],
      [luGeographicArea].[LastUpdated]

      FROM
      [luGeographicArea] LEFT JOIN [ReferenceValue] ON [luGeographicArea].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [GeographicAreaId]
        FROM
        [GlobalGeographicDistribution]
        GROUP BY
        [GeographicAreaId]
        ) tmpGlobalGeographicDistribution ON [luGeographicArea].[Id] = [tmpGlobalGeographicDistribution].[GeographicAreaId]
      

        LEFT JOIN
        (
        SELECT
        [GeographicAreaId]
        FROM
        [GeographicDistributionOfHumanDisease]
        GROUP BY
        [GeographicAreaId]
        ) tmpGeographicDistributionOfHumanDisease ON [luGeographicArea].[Id] = [tmpGeographicDistributionOfHumanDisease].[GeographicAreaId]
      

      WHERE
      [luGeographicArea].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluGeographicAreaValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluGeographicAreaValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luGeographicArea]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luGeographicArea]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluGeographicAreaValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluGeographicAreaValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luGeographicArea]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The GeographicArea Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luGeographicArea]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluGeographicAreaValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluGeographicAreaValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luGeographicArea]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luGeographicArea]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The GeographicArea Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luGeographicArea]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luGeographicArea]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluGeographicAreaValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluGeographicAreaValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luGeographicArea]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The GeographicArea Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luGeographicArea]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luGeographicArea]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluGeographicAreaValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluDiagnosisAndDetectionMechanism

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luDiagnosisAndDetectionMechanism].[Id],
            [luDiagnosisAndDetectionMechanism].[LookupValue],
            [luDiagnosisAndDetectionMechanism].[EffectiveDateFrom],
            [luDiagnosisAndDetectionMechanism].[EffectiveDateTo],
            
                
                CAST(CASE WHEN COALESCE(

                


                  [tmpEpidemiologySpecies].[PrimaryDetectionMethods]
                  , 


                  [tmpConfirmationOfDiagnosis].[DiagnosisAndDetectionMechanismId]
                  

                ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luDiagnosisAndDetectionMechanism].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luDiagnosisAndDetectionMechanism].[EffectiveDateFrom] AND [luDiagnosisAndDetectionMechanism].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luDiagnosisAndDetectionMechanism] LEFT JOIN [ReferenceValue] ON [luDiagnosisAndDetectionMechanism].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [PrimaryDetectionMethods]
              FROM
              [EpidemiologySpecies]
              GROUP BY
              [PrimaryDetectionMethods]
              ) tmpEpidemiologySpecies ON [luDiagnosisAndDetectionMechanism].[Id] = [tmpEpidemiologySpecies].[PrimaryDetectionMethods]
            

              LEFT JOIN
              (
              SELECT
              [DiagnosisAndDetectionMechanismId]
              FROM
              [ConfirmationOfDiagnosis]
              GROUP BY
              [DiagnosisAndDetectionMechanismId]
              ) tmpConfirmationOfDiagnosis ON [luDiagnosisAndDetectionMechanism].[Id] = [tmpConfirmationOfDiagnosis].[DiagnosisAndDetectionMechanismId]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luDiagnosisAndDetectionMechanism].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluDiagnosisAndDetectionMechanism] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluDiagnosisAndDetectionMechanismValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luDiagnosisAndDetectionMechanism].[LookupValue],
      
       
        CAST(CASE WHEN COALESCE(

        


          [tmpEpidemiologySpecies].[PrimaryDetectionMethods]
          , 


          [tmpConfirmationOfDiagnosis].[DiagnosisAndDetectionMechanismId]
          

        ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
      
       [luDiagnosisAndDetectionMechanism].[EffectiveDateTo],
      [luDiagnosisAndDetectionMechanism].[EffectiveDateFrom],
      [luDiagnosisAndDetectionMechanism].[LastUpdated]

      FROM
      [luDiagnosisAndDetectionMechanism] LEFT JOIN [ReferenceValue] ON [luDiagnosisAndDetectionMechanism].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [PrimaryDetectionMethods]
        FROM
        [EpidemiologySpecies]
        GROUP BY
        [PrimaryDetectionMethods]
        ) tmpEpidemiologySpecies ON [luDiagnosisAndDetectionMechanism].[Id] = [tmpEpidemiologySpecies].[PrimaryDetectionMethods]
      

        LEFT JOIN
        (
        SELECT
        [DiagnosisAndDetectionMechanismId]
        FROM
        [ConfirmationOfDiagnosis]
        GROUP BY
        [DiagnosisAndDetectionMechanismId]
        ) tmpConfirmationOfDiagnosis ON [luDiagnosisAndDetectionMechanism].[Id] = [tmpConfirmationOfDiagnosis].[DiagnosisAndDetectionMechanismId]
      

      WHERE
      [luDiagnosisAndDetectionMechanism].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluDiagnosisAndDetectionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluDiagnosisAndDetectionMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luDiagnosisAndDetectionMechanism]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluDiagnosisAndDetectionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluDiagnosisAndDetectionMechanismValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The DiagnosisAndDetectionMechanism Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luDiagnosisAndDetectionMechanism]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluDiagnosisAndDetectionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluDiagnosisAndDetectionMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The DiagnosisAndDetectionMechanism Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luDiagnosisAndDetectionMechanism]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluDiagnosisAndDetectionMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluDiagnosisAndDetectionMechanismValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luDiagnosisAndDetectionMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The DiagnosisAndDetectionMechanism Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luDiagnosisAndDetectionMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luDiagnosisAndDetectionMechanism]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluDiagnosisAndDetectionMechanismValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluControlMechanism

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      

      DECLARE @DateNow As SmallDateTime
      SET @DateNow = DateAdd(mi, 1, GETDATE())

      SELECT
            [luControlMechanism].[Id],
            [luControlMechanism].[LookupValue],
            [luControlMechanism].[EffectiveDateFrom],
            [luControlMechanism].[EffectiveDateTo],
            
                
                CAST(CASE WHEN COALESCE(

                


                  [tmpCurrentControlMechanisms].[ControlMechanismId]
                  , 


                  [tmpOtherControlMechanisms].[ControlMechanismId]
                  

                ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
              

      CAST(CASE WHEN [luControlMechanism].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [luControlMechanism].[EffectiveDateFrom] AND [luControlMechanism].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
      FROM
      [luControlMechanism] LEFT JOIN [ReferenceValue] ON [luControlMechanism].[Id] = [ReferenceValue].[Id]

            

              LEFT JOIN
              (
              SELECT
              [ControlMechanismId]
              FROM
              [CurrentControlMechanisms]
              GROUP BY
              [ControlMechanismId]
              ) tmpCurrentControlMechanisms ON [luControlMechanism].[Id] = [tmpCurrentControlMechanisms].[ControlMechanismId]
            

              LEFT JOIN
              (
              SELECT
              [ControlMechanismId]
              FROM
              [OtherControlMechanisms]
              GROUP BY
              [ControlMechanismId]
              ) tmpOtherControlMechanisms ON [luControlMechanism].[Id] = [tmpOtherControlMechanisms].[ControlMechanismId]
            
      ORDER BY
      ISNULL([ReferenceValue].[SequenceNumber], 255),
      [luControlMechanism].[EffectiveDateFrom]

      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluControlMechanism] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgluControlMechanismValue
      @ValueId uniqueidentifier

      AS
      BEGIN

      SELECT
      [luControlMechanism].[LookupValue],
      
       
        CAST(CASE WHEN COALESCE(

        


          [tmpCurrentControlMechanisms].[ControlMechanismId]
          , 


          [tmpOtherControlMechanisms].[ControlMechanismId]
          

        ) IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
      
       [luControlMechanism].[EffectiveDateTo],
      [luControlMechanism].[EffectiveDateFrom],
      [luControlMechanism].[LastUpdated]

      FROM
      [luControlMechanism] LEFT JOIN [ReferenceValue] ON [luControlMechanism].[Id] = [ReferenceValue].[Id]

      

        LEFT JOIN
        (
        SELECT
        [ControlMechanismId]
        FROM
        [CurrentControlMechanisms]
        GROUP BY
        [ControlMechanismId]
        ) tmpCurrentControlMechanisms ON [luControlMechanism].[Id] = [tmpCurrentControlMechanisms].[ControlMechanismId]
      

        LEFT JOIN
        (
        SELECT
        [ControlMechanismId]
        FROM
        [OtherControlMechanisms]
        GROUP BY
        [ControlMechanismId]
        ) tmpOtherControlMechanisms ON [luControlMechanism].[Id] = [tmpOtherControlMechanisms].[ControlMechanismId]
      

      WHERE
      [luControlMechanism].[Id] = @ValueId

      END
      GO

      GRANT EXECUTE ON [dbo].[spgluControlMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiluControlMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255)

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luControlMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      @ValueId,
      '- new entry -',
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )

      INSERT INTO [luControlMechanism]
    (
    [Id],
    [LookupValue],
    [EffectiveDateFrom],
    [EffectiveDateTo]
    )
    VALUES
    (
    @ValueId,
    @NewLookupValue,
    @EffectiveDate,
    NULL
    )

    END
    GO

    GRANT EXECUTE ON [dbo].[spiluControlMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdluControlMechanismValue
      @ValueId uniqueidentifier,
      @OldLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luControlMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The ControlMechanism Value cannot be deleted because it has been edited by another user',16,1)
      RETURN
      END

      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      @ValueId,
      @OldLookupValue,
      '- to be deleted -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )



      DELETE FROM
      [luControlMechanism]

      WHERE
      (
      [Id] = @ValueId
      )

      END
      GO

      GRANT EXECUTE ON [dbo].[spdluControlMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spuluControlMechanismValue
      @ValueId uniqueidentifier,
      @NewLookupValue varchar(50),
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF EXISTS
      (
      SELECT
      [Id]
      FROM
      [luControlMechanism]
      WHERE
      [LookupValue] = @NewLookupValue
      ) BEGIN
      RAISERROR(' there is already a reference value with this name', 16, 1)
      END


      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luControlMechanism]
      WHERE
    [Id] = @ValueId AND
    [LastUpdated] = @LastUpdated
    ) BEGIN
    RAISERROR('The ControlMechanism Value cannot be updated because it has been edited by another user',16,1)
      RETURN
      END


      --Get the current Value
      DECLARE @OldLookupValue varchar(50)

      SELECT
      @OldLookupValue = [LookupValue]
      FROM
      [luControlMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      @ValueId,
      @OldLookupValue,
      @NewLookupValue,
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luControlMechanism]
      SET
      [LookupValue] = @NewLookupValue

      WHERE
      [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[spuluControlMechanismValue] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE sppluControlMechanismValue
      @ValueId uniqueidentifier,
      @UserId uniqueidentifier,
      @Reason varchar(255),
      @LastUpdated timestamp

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @EffectiveDate smalldatetime
      SET @EffectiveDate = GetDate()

      IF NOT EXISTS (
      SELECT
      [Id]
      FROM
      [luControlMechanism]
      WHERE
      [Id] = @ValueId AND
      [LastUpdated] = @LastUpdated
      ) BEGIN
      RAISERROR('The ControlMechanism Value cannot be invalidated because it has been edited by another user',16,1)
    RETURN
    END


    --Get the current Value
    DECLARE @OldLookupValue varchar(50)

    SELECT
    @OldLookupValue = [LookupValue]
    FROM
    [luControlMechanism]
      WHERE
      [Id] = @ValueId



      INSERT INTO [ReferenceTableAuditLog]
      (
      [Id],
      [ReferenceTableId],
      [ReferenceValueId],
      [OldLookupValue],
      [NewLookupValue],
      [UserId],
      [EffectiveDate],
      [LogDate],
      [Reason]
      )
      VALUES
      (
      newid(),
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      @ValueId,
      @OldLookupValue,
      '- to be invalidated -',
      @UserId,
      @EffectiveDate,
      @EffectiveDate,
      @Reason
      )


      UPDATE
      [luControlMechanism]
    SET
    [EffectiveDateTo] = @EffectiveDate

    WHERE
    [Id] = @ValueId


    END
    GO

    GRANT EXECUTE ON [dbo].[sppluControlMechanismValue] TO [VLAProfilesUser]
      GO
      
    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluExposureLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luExposureLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluExposureLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluTotalSurveillanceCosts

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luTotalSurveillanceCosts]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluTotalSurveillanceCosts] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluIncubationPeriod

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luIncubationPeriod]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluIncubationPeriod] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluDiseaseDuration

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luDiseaseDuration]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluDiseaseDuration] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluStatutoryObligationLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luStatutoryObligationLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluStatutoryObligationLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluImportImpactLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luImportImpactLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluImportImpactLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluProportionLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luProportionLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluProportionLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluUncertaintyLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luUncertaintyLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluUncertaintyLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluTransmissibilityIndicator

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luTransmissibilityIndicator]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluTransmissibilityIndicator] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluMortalityLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luMortalityLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluMortalityLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluSpreadRateLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luSpreadRateLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluSpreadRateLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluCasesPerYear

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luCasesPerYear]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluCasesPerYear] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluCommoditiesCompromisedLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luCommoditiesCompromisedLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluCommoditiesCompromisedLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluIssueExtent

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luIssueExtent]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluIssueExtent] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluHumanExposureReductionLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luHumanExposureReductionLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluHumanExposureReductionLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluHumanCasesLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luHumanCasesLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluHumanCasesLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluModalSeverityLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luModalSeverityLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluModalSeverityLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluTradeImpactLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luTradeImpactLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluTradeImpactLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluMaximumSeverityLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luMaximumSeverityLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluMaximumSeverityLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluCostLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luCostLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluCostLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluLocalEnvironmentImpactLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luLocalEnvironmentImpactLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluLocalEnvironmentImpactLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluRegionalisationLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luRegionalisationLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluRegionalisationLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluLegislationType

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luLegislationType]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluLegislationType] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluWildlifeReservoirIndicator

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luWildlifeReservoirIndicator]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluWildlifeReservoirIndicator] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluGlobalEnvironmentImpactLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luGlobalEnvironmentImpactLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluGlobalEnvironmentImpactLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluUnplannedCostLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luUnplannedCostLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluUnplannedCostLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluBooleanFlag

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luBooleanFlag]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluBooleanFlag] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluAttributableFraction

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luAttributableFraction]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluAttributableFraction] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluRiskChange

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luRiskChange]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluRiskChange] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluIndicatorFlag

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luIndicatorFlag]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluIndicatorFlag] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluTimePeriod

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luTimePeriod]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluTimePeriod] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluRiskLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luRiskLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluRiskLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluImpactLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luImpactLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluImpactLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgaluPrevalenceLevel

      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

          SELECT
          [Id],
          [LookupValue]
          FROM
          [luPrevalenceLevel]
          ORDER BY
          [SequenceNumber]
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spgaluPrevalenceLevel] TO [VLAProfilesUser]
      GO

    

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgWelfareIssueIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [WelfareIssueIndicator], 
        [WelfareIssueIndicatorComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgWelfareIssueIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuWelfareIssueIndicator
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @WelfareIssueIndicator bit
        , @WelfareIssueIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [WelfareIssueIndicator] = @WelfareIssueIndicator, 
        [WelfareIssueIndicatorComments] = @WelfareIssueIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuWelfareIssueIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFreedomFromHungerAndThirst
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [FreedomFromHungerAndThirst], 
        [FreedomFromHungerAndThirstComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFreedomFromHungerAndThirst] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFreedomFromHungerAndThirst
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @FreedomFromHungerAndThirst uniqueidentifier
        , @FreedomFromHungerAndThirstComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [FreedomFromHungerAndThirst] = @FreedomFromHungerAndThirst, 
        [FreedomFromHungerAndThirstComments] = @FreedomFromHungerAndThirstComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFreedomFromHungerAndThirst] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFreedomFromDiscomfort
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [FreedomFromDiscomfort], 
        [FreedomFromDiscomfortComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFreedomFromDiscomfort] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFreedomFromDiscomfort
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @FreedomFromDiscomfort uniqueidentifier
        , @FreedomFromDiscomfortComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [FreedomFromDiscomfort] = @FreedomFromDiscomfort, 
        [FreedomFromDiscomfortComments] = @FreedomFromDiscomfortComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFreedomFromDiscomfort] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFreedomFromPainOrInjury
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [FreedomFromPainOrInjury], 
        [FreedomFromPainOrInjuryComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFreedomFromPainOrInjury] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFreedomFromPainOrInjury
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @FreedomFromPainOrInjury uniqueidentifier
        , @FreedomFromPainOrInjuryComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [FreedomFromPainOrInjury] = @FreedomFromPainOrInjury, 
        [FreedomFromPainOrInjuryComments] = @FreedomFromPainOrInjuryComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFreedomFromPainOrInjury] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFreedomToExpressNormalBehaviour
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [FreedomToExpressNormalBehaviour], 
        [FreedomToExpressNormalBehaviourComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFreedomToExpressNormalBehaviour] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFreedomToExpressNormalBehaviour
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @FreedomToExpressNormalBehaviour uniqueidentifier
        , @FreedomToExpressNormalBehaviourComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [FreedomToExpressNormalBehaviour] = @FreedomToExpressNormalBehaviour, 
        [FreedomToExpressNormalBehaviourComments] = @FreedomToExpressNormalBehaviourComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFreedomToExpressNormalBehaviour] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFreedomFromFearAndDistress
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [FreedomFromFearAndDistress], 
        [FreedomFromFearAndDistressComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFreedomFromFearAndDistress] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFreedomFromFearAndDistress
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @FreedomFromFearAndDistress uniqueidentifier
        , @FreedomFromFearAndDistressComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [FreedomFromFearAndDistress] = @FreedomFromFearAndDistress, 
        [FreedomFromFearAndDistressComments] = @FreedomFromFearAndDistressComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFreedomFromFearAndDistress] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialToReduceWelfareImplications
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PotentialToReduceWelfareImplications], 
        [PotentialToReduceWelfareImplicationsComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialToReduceWelfareImplications] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialToReduceWelfareImplications
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PotentialToReduceWelfareImplications uniqueidentifier
        , @PotentialToReduceWelfareImplicationsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [PotentialToReduceWelfareImplications] = @PotentialToReduceWelfareImplications, 
        [PotentialToReduceWelfareImplicationsComments] = @PotentialToReduceWelfareImplicationsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialToReduceWelfareImplications] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgProportionOfAnimalsAffectedSufferingSeverely
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ProportionOfAnimalsAffectedSufferingSeverely], 
        [ProportionOfAnimalsAffectedSufferingSeverelyComments]
      FROM
        
      [AnimalWelfareSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgProportionOfAnimalsAffectedSufferingSeverely] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuProportionOfAnimalsAffectedSufferingSeverely
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ProportionOfAnimalsAffectedSufferingSeverely uniqueidentifier
        , @ProportionOfAnimalsAffectedSufferingSeverelyComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfareSpecies]
        
      SET
      
        [ProportionOfAnimalsAffectedSufferingSeverely] = @ProportionOfAnimalsAffectedSufferingSeverely, 
        [ProportionOfAnimalsAffectedSufferingSeverelyComments] = @ProportionOfAnimalsAffectedSufferingSeverelyComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuProportionOfAnimalsAffectedSufferingSeverely] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSummaryImpactOnAnimalWelfare
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [SummaryImpactOnAnimalWelfare]
      FROM
        
      [AnimalWelfare]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSummaryImpactOnAnimalWelfare] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSummaryImpactOnAnimalWelfare
          @ProfileVersionId uniqueidentifier
          
        , @SummaryImpactOnAnimalWelfare text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AnimalWelfare]
        
      SET
      
        [SummaryImpactOnAnimalWelfare] = @SummaryImpactOnAnimalWelfare
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSummaryImpactOnAnimalWelfare] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgCurrentControlMechanisms
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [CurrentControlMechanismsComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        [SpeciesId],
        [ControlMechanismId]
        FROM
        [CurrentControlMechanisms]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgCurrentControlMechanisms] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuCurrentControlMechanisms
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @CurrentControlMechanismsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [CurrentControlMechanismsComments] = @CurrentControlMechanismsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
        DELETE FROM
        [CurrentControlMechanisms]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
               AND [SpeciesId] = @SpeciesId
      END
      GO

      GRANT EXECUTE ON [dbo].[spuCurrentControlMechanisms] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiCurrentControlMechanismsCurrentControlMechanisms
            @ProfileVersionId uniqueidentifier,
            @SpeciesId uniqueidentifier,
        @ControlMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [CurrentControlMechanisms]
        (
        [Id],
        
            [ProfileVersionId],
            [SpeciesId],
        [ControlMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            @SpeciesId,
        @ControlMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiCurrentControlMechanismsCurrentControlMechanisms] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdCurrentControlMechanismsCurrentControlMechanisms
            @ProfileVersionId uniqueidentifier
            , @SpeciesId uniqueidentifier
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [CurrentControlMechanisms]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            AND [SpeciesId] = @SpeciesId
        END
        GO

        GRANT EXECUTE ON [dbo].[spdCurrentControlMechanismsCurrentControlMechanisms] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgOtherControlMechanisms
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [OtherControlMechanismsComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        [SpeciesId],
        [ControlMechanismId]
        FROM
        [OtherControlMechanisms]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgOtherControlMechanisms] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuOtherControlMechanisms
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @OtherControlMechanismsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [OtherControlMechanismsComments] = @OtherControlMechanismsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
        DELETE FROM
        [OtherControlMechanisms]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
               AND [SpeciesId] = @SpeciesId
      END
      GO

      GRANT EXECUTE ON [dbo].[spuOtherControlMechanisms] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiOtherControlMechanismsOtherControlMechanisms
            @ProfileVersionId uniqueidentifier,
            @SpeciesId uniqueidentifier,
        @ControlMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [OtherControlMechanisms]
        (
        [Id],
        
            [ProfileVersionId],
            [SpeciesId],
        [ControlMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            @SpeciesId,
        @ControlMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiOtherControlMechanismsOtherControlMechanisms] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdOtherControlMechanismsOtherControlMechanisms
            @ProfileVersionId uniqueidentifier
            , @SpeciesId uniqueidentifier
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [OtherControlMechanisms]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            AND [SpeciesId] = @SpeciesId
        END
        GO

        GRANT EXECUTE ON [dbo].[spdOtherControlMechanismsOtherControlMechanisms] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgUptakeAtHoldingLevel
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [UptakeAtHoldingLevel], 
        [UptakeAtHoldingLevelComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgUptakeAtHoldingLevel] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuUptakeAtHoldingLevel
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @UptakeAtHoldingLevel uniqueidentifier
        , @UptakeAtHoldingLevelComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [UptakeAtHoldingLevel] = @UptakeAtHoldingLevel, 
        [UptakeAtHoldingLevelComments] = @UptakeAtHoldingLevelComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuUptakeAtHoldingLevel] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgWelfareEffect
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [WelfareEffect], 
        [WelfareEffectComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgWelfareEffect] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuWelfareEffect
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @WelfareEffect uniqueidentifier
        , @WelfareEffectComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [WelfareEffect] = @WelfareEffect, 
        [WelfareEffectComments] = @WelfareEffectComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuWelfareEffect] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialToReduceRisk
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PotentialToReduceRisk], 
        [PotentialToReduceRiskComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialToReduceRisk] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialToReduceRisk
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PotentialToReduceRisk uniqueidentifier
        , @PotentialToReduceRiskComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [PotentialToReduceRisk] = @PotentialToReduceRisk, 
        [PotentialToReduceRiskComments] = @PotentialToReduceRiskComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialToReduceRisk] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialToReduceHumanExposure
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PotentialToReduceHumanExposure], 
        [PotentialToReduceHumanExposureComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialToReduceHumanExposure] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialToReduceHumanExposure
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PotentialToReduceHumanExposure uniqueidentifier
        , @PotentialToReduceHumanExposureComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [PotentialToReduceHumanExposure] = @PotentialToReduceHumanExposure, 
        [PotentialToReduceHumanExposureComments] = @PotentialToReduceHumanExposureComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialToReduceHumanExposure] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgVaccinesAvailableIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [VaccinesAvailableIndicator], 
        [VaccinesAvailableIndicatorComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgVaccinesAvailableIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuVaccinesAvailableIndicator
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @VaccinesAvailableIndicator bit
        , @VaccinesAvailableIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [VaccinesAvailableIndicator] = @VaccinesAvailableIndicator, 
        [VaccinesAvailableIndicatorComments] = @VaccinesAvailableIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuVaccinesAvailableIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgControlsAtTheHoldingLevel
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ControlsAtTheHoldingLevel], 
        [ControlsAtTheHoldingLevelComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgControlsAtTheHoldingLevel] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuControlsAtTheHoldingLevel
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ControlsAtTheHoldingLevel uniqueidentifier
        , @ControlsAtTheHoldingLevelComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [ControlsAtTheHoldingLevel] = @ControlsAtTheHoldingLevel, 
        [ControlsAtTheHoldingLevelComments] = @ControlsAtTheHoldingLevelComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuControlsAtTheHoldingLevel] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgControlsAboveTheHoldingLevel
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ControlsAboveTheHoldingLevel], 
        [ControlsAboveTheHoldingLevelComments]
      FROM
        
      [ApproachToControl]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgControlsAboveTheHoldingLevel] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuControlsAboveTheHoldingLevel
          @ProfileVersionId uniqueidentifier
          
        , @ControlsAboveTheHoldingLevel uniqueidentifier
        , @ControlsAboveTheHoldingLevelComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControl]
        
      SET
      
        [ControlsAboveTheHoldingLevel] = @ControlsAboveTheHoldingLevel, 
        [ControlsAboveTheHoldingLevelComments] = @ControlsAboveTheHoldingLevelComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuControlsAboveTheHoldingLevel] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgCompensation
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [Compensation]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgCompensation] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuCompensation
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @Compensation text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [Compensation] = @Compensation
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuCompensation] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgLevelOfNationalPreparedness
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [LevelOfNationalPreparedness], 
        [LevelOfNationalPreparednessComments]
      FROM
        
      [ApproachToControlSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgLevelOfNationalPreparedness] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuLevelOfNationalPreparedness
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @LevelOfNationalPreparedness uniqueidentifier
        , @LevelOfNationalPreparednessComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [ApproachToControlSpecies]
        
      SET
      
        [LevelOfNationalPreparedness] = @LevelOfNationalPreparedness, 
        [LevelOfNationalPreparednessComments] = @LevelOfNationalPreparednessComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuLevelOfNationalPreparedness] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgAreasOfUncertaintySummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [AreasOfUncertaintySummary]
      FROM
        
      [AreasOfUncertainty]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgAreasOfUncertaintySummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuAreasOfUncertaintySummary
          @ProfileVersionId uniqueidentifier
          
        , @AreasOfUncertaintySummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [AreasOfUncertainty]
        
      SET
      
        [AreasOfUncertaintySummary] = @AreasOfUncertaintySummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuAreasOfUncertaintySummary] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSuspectCaseDefinition
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [SuspectCaseDefinition]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSuspectCaseDefinition] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSuspectCaseDefinition
          @ProfileVersionId uniqueidentifier
          
        , @SuspectCaseDefinition text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [SuspectCaseDefinition] = @SuspectCaseDefinition
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSuspectCaseDefinition] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgProbableCaseDefinition
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ProbableCaseDefinition]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgProbableCaseDefinition] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuProbableCaseDefinition
          @ProfileVersionId uniqueidentifier
          
        , @ProbableCaseDefinition text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [ProbableCaseDefinition] = @ProbableCaseDefinition
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuProbableCaseDefinition] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgConfirmedCaseDefinition
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ConfirmedCaseDefinition]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgConfirmedCaseDefinition] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuConfirmedCaseDefinition
          @ProfileVersionId uniqueidentifier
          
        , @ConfirmedCaseDefinition text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [ConfirmedCaseDefinition] = @ConfirmedCaseDefinition
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuConfirmedCaseDefinition] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgDifferentialDiagnoses
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [DifferentialDiagnoses]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgDifferentialDiagnoses] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuDifferentialDiagnoses
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @DifferentialDiagnoses text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [DifferentialDiagnoses] = @DifferentialDiagnoses
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuDifferentialDiagnoses] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialForSilentSpread
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PotentialForSilentSpread], 
        [PotentialForSilentSpreadComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialForSilentSpread] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialForSilentSpread
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PotentialForSilentSpread uniqueidentifier
        , @PotentialForSilentSpreadComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [PotentialForSilentSpread] = @PotentialForSilentSpread, 
        [PotentialForSilentSpreadComments] = @PotentialForSilentSpreadComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialForSilentSpread] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgIncubationPeriod
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [IncubationPeriodTypicalLower], 
        [IncubationPeriodTypicalUpper], 
        [IncubationPeriodMinimum], 
        [IncubationPeriodMaximum]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgIncubationPeriod] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuIncubationPeriod
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @IncubationPeriodTypicalLower money
        , @IncubationPeriodTypicalUpper money
        , @IncubationPeriodMinimum money
        , @IncubationPeriodMaximum money
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [IncubationPeriodTypicalLower] = @IncubationPeriodTypicalLower, 
        [IncubationPeriodTypicalUpper] = @IncubationPeriodTypicalUpper, 
        [IncubationPeriodMinimum] = @IncubationPeriodMinimum, 
        [IncubationPeriodMaximum] = @IncubationPeriodMaximum
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuIncubationPeriod] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgClinicalSigns
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ClinicalSigns]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgClinicalSigns] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuClinicalSigns
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ClinicalSigns text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [ClinicalSigns] = @ClinicalSigns
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuClinicalSigns] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPathologicalFeatures
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PathologicalFeatures]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPathologicalFeatures] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPathologicalFeatures
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PathologicalFeatures text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [PathologicalFeatures] = @PathologicalFeatures
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPathologicalFeatures] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgMortalityIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [MortalityIndicator], 
        [MortalityIndicatorComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgMortalityIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuMortalityIndicator
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @MortalityIndicator uniqueidentifier
        , @MortalityIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [MortalityIndicator] = @MortalityIndicator, 
        [MortalityIndicatorComments] = @MortalityIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuMortalityIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgDurationOfDisease
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [DurationOfDisease], 
        [DurationOfDiseaseComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgDurationOfDisease] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuDurationOfDisease
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @DurationOfDisease uniqueidentifier
        , @DurationOfDiseaseComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [DurationOfDisease] = @DurationOfDisease, 
        [DurationOfDiseaseComments] = @DurationOfDiseaseComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuDurationOfDisease] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPrimaryDetectionMethods
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PrimaryDetectionMethods], 
        [DetectionMethodTypeComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPrimaryDetectionMethods] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPrimaryDetectionMethods
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PrimaryDetectionMethods uniqueidentifier
        , @DetectionMethodTypeComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [PrimaryDetectionMethods] = @PrimaryDetectionMethods, 
        [DetectionMethodTypeComments] = @DetectionMethodTypeComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPrimaryDetectionMethods] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgConfirmationOfDiagnosis
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [DiagnosisMechanismComments]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [DiagnosisAndDetectionMechanismId]
        FROM
        [ConfirmationOfDiagnosis]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgConfirmationOfDiagnosis] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuConfirmationOfDiagnosis
          @ProfileVersionId uniqueidentifier
          
        , @DiagnosisMechanismComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [DiagnosisMechanismComments] = @DiagnosisMechanismComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [ConfirmationOfDiagnosis]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuConfirmationOfDiagnosis] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiConfirmationOfDiagnosisConfirmationOfDiagnosis
            @ProfileVersionId uniqueidentifier,
            
        @DiagnosisAndDetectionMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [ConfirmationOfDiagnosis]
        (
        [Id],
        
            [ProfileVersionId],
            
        [DiagnosisAndDetectionMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @DiagnosisAndDetectionMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiConfirmationOfDiagnosisConfirmationOfDiagnosis] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdConfirmationOfDiagnosisConfirmationOfDiagnosis
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [ConfirmationOfDiagnosis]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdConfirmationOfDiagnosisConfirmationOfDiagnosis] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgTransmissionMechanism
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [TransmissionMechanismComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        [SpeciesId],
        [TransmissionMechanismId]
        FROM
        [TransmissionMechanism]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgTransmissionMechanism] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuTransmissionMechanism
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @TransmissionMechanismComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [TransmissionMechanismComments] = @TransmissionMechanismComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
        DELETE FROM
        [TransmissionMechanism]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
               AND [SpeciesId] = @SpeciesId
      END
      GO

      GRANT EXECUTE ON [dbo].[spuTransmissionMechanism] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiTransmissionMechanismTransmissionMechanism
            @ProfileVersionId uniqueidentifier,
            @SpeciesId uniqueidentifier,
        @TransmissionMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [TransmissionMechanism]
        (
        [Id],
        
            [ProfileVersionId],
            [SpeciesId],
        [TransmissionMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            @SpeciesId,
        @TransmissionMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiTransmissionMechanismTransmissionMechanism] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdTransmissionMechanismTransmissionMechanism
            @ProfileVersionId uniqueidentifier
            , @SpeciesId uniqueidentifier
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [TransmissionMechanism]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            AND [SpeciesId] = @SpeciesId
        END
        GO

        GRANT EXECUTE ON [dbo].[spdTransmissionMechanismTransmissionMechanism] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgRateOfSpreadOnPremises
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [RateOfSpreadOnPremises], 
        [RateOfSpreadOnPremisesComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgRateOfSpreadOnPremises] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuRateOfSpreadOnPremises
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @RateOfSpreadOnPremises uniqueidentifier
        , @RateOfSpreadOnPremisesComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [RateOfSpreadOnPremises] = @RateOfSpreadOnPremises, 
        [RateOfSpreadOnPremisesComments] = @RateOfSpreadOnPremisesComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuRateOfSpreadOnPremises] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgAgentDescription
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [AgentDescription]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgAgentDescription] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuAgentDescription
          @ProfileVersionId uniqueidentifier
          
        , @AgentDescription text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [AgentDescription] = @AgentDescription
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuAgentDescription] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgTherapeuticAgentSusceptibility
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [TherapeuticAgentSusceptibility]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgTherapeuticAgentSusceptibility] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuTherapeuticAgentSusceptibility
          @ProfileVersionId uniqueidentifier
          
        , @TherapeuticAgentSusceptibility text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [TherapeuticAgentSusceptibility] = @TherapeuticAgentSusceptibility
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuTherapeuticAgentSusceptibility] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPersistenceInEnvironmentIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [PersistenceInEnvironmentIndicator], 
        [PersistenceInEnvironmentIndicatorComments]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPersistenceInEnvironmentIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPersistenceInEnvironmentIndicator
          @ProfileVersionId uniqueidentifier
          
        , @PersistenceInEnvironmentIndicator uniqueidentifier
        , @PersistenceInEnvironmentIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [PersistenceInEnvironmentIndicator] = @PersistenceInEnvironmentIndicator, 
        [PersistenceInEnvironmentIndicatorComments] = @PersistenceInEnvironmentIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPersistenceInEnvironmentIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSpreadMechanism
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [SpreadMechanismComments]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [SpreadMechanismId]
        FROM
        [SpreadMechanism]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSpreadMechanism] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSpreadMechanism
          @ProfileVersionId uniqueidentifier
          
        , @SpreadMechanismComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [SpreadMechanismComments] = @SpreadMechanismComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [SpreadMechanism]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSpreadMechanism] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiSpreadMechanismSpreadMechanism
            @ProfileVersionId uniqueidentifier,
            
        @SpreadMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [SpreadMechanism]
        (
        [Id],
        
            [ProfileVersionId],
            
        [SpreadMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @SpreadMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiSpreadMechanismSpreadMechanism] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdSpreadMechanismSpreadMechanism
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [SpreadMechanism]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdSpreadMechanismSpreadMechanism] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgWildlifeReservoirIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [WildlifeReservoirIndicator], 
        [WildlifeReservoirIndicatorComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgWildlifeReservoirIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuWildlifeReservoirIndicator
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @WildlifeReservoirIndicator uniqueidentifier
        , @WildlifeReservoirIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [WildlifeReservoirIndicator] = @WildlifeReservoirIndicator, 
        [WildlifeReservoirIndicatorComments] = @WildlifeReservoirIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuWildlifeReservoirIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgIncreaseUnderstandingPotential
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [IncreaseUnderstandingPotential], 
        [IncreaseUnderstandingPotentialComments]
      FROM
        
      [EpidemiologySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgIncreaseUnderstandingPotential] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuIncreaseUnderstandingPotential
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @IncreaseUnderstandingPotential uniqueidentifier
        , @IncreaseUnderstandingPotentialComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [EpidemiologySpecies]
        
      SET
      
        [IncreaseUnderstandingPotential] = @IncreaseUnderstandingPotential, 
        [IncreaseUnderstandingPotentialComments] = @IncreaseUnderstandingPotentialComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuIncreaseUnderstandingPotential] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgMultiSpeciesSummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [MultiSpeciesSummary]
      FROM
        
      [Epidemiology]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgMultiSpeciesSummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuMultiSpeciesSummary
          @ProfileVersionId uniqueidentifier
          
        , @MultiSpeciesSummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Epidemiology]
        
      SET
      
        [MultiSpeciesSummary] = @MultiSpeciesSummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuMultiSpeciesSummary] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgGBPresenceIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [GBPresenceIndicator], 
        [GBPresenceIndicatorComments]
      FROM
        
      [GeographicDistribution]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgGBPresenceIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuGBPresenceIndicator
          @ProfileVersionId uniqueidentifier
          
        , @GBPresenceIndicator bit
        , @GBPresenceIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistribution]
        
      SET
      
        [GBPresenceIndicator] = @GBPresenceIndicator, 
        [GBPresenceIndicatorComments] = @GBPresenceIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuGBPresenceIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgCurrentPrevalenceInGB
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [CurrentPrevalenceInGB], 
        [CurrentPrevalenceInGBComments]
      FROM
        
      [GeographicDistribution]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgCurrentPrevalenceInGB] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuCurrentPrevalenceInGB
          @ProfileVersionId uniqueidentifier
          
        , @CurrentPrevalenceInGB uniqueidentifier
        , @CurrentPrevalenceInGBComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistribution]
        
      SET
      
        [CurrentPrevalenceInGB] = @CurrentPrevalenceInGB, 
        [CurrentPrevalenceInGBComments] = @CurrentPrevalenceInGBComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuCurrentPrevalenceInGB] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgDateOfMostRecentOccurrenceInGB
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [DateOfMostRecentOccurrenceInGB], 
        [DateOfMostRecentOccurrenceInGBComments]
      FROM
        
      [GeographicDistribution]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgDateOfMostRecentOccurrenceInGB] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuDateOfMostRecentOccurrenceInGB
          @ProfileVersionId uniqueidentifier
          
        , @DateOfMostRecentOccurrenceInGB datetime
        , @DateOfMostRecentOccurrenceInGBComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistribution]
        
      SET
      
        [DateOfMostRecentOccurrenceInGB] = @DateOfMostRecentOccurrenceInGB, 
        [DateOfMostRecentOccurrenceInGBComments] = @DateOfMostRecentOccurrenceInGBComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuDateOfMostRecentOccurrenceInGB] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgRiskOfIntroductionToGB
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [RiskOfIntroductionToGB], 
        [RiskOfIntroductionToGBComments]
      FROM
        
      [GeographicDistribution]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgRiskOfIntroductionToGB] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuRiskOfIntroductionToGB
          @ProfileVersionId uniqueidentifier
          
        , @RiskOfIntroductionToGB uniqueidentifier
        , @RiskOfIntroductionToGBComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistribution]
        
      SET
      
        [RiskOfIntroductionToGB] = @RiskOfIntroductionToGB, 
        [RiskOfIntroductionToGBComments] = @RiskOfIntroductionToGBComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuRiskOfIntroductionToGB] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgNumberOfCasesPerYearInGB
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [NumberOfCasesPerYearInGB], 
        [NumberOfCasesPerYearInGBComments]
      FROM
        
      [GeographicDistributionSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgNumberOfCasesPerYearInGB] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuNumberOfCasesPerYearInGB
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @NumberOfCasesPerYearInGB uniqueidentifier
        , @NumberOfCasesPerYearInGBComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistributionSpecies]
        
      SET
      
        [NumberOfCasesPerYearInGB] = @NumberOfCasesPerYearInGB, 
        [NumberOfCasesPerYearInGBComments] = @NumberOfCasesPerYearInGBComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuNumberOfCasesPerYearInGB] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialForRiskChange
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [PotentialForRiskChange], 
        [PotentialForRiskChangeComments]
      FROM
        
      [GeographicDistributionSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialForRiskChange] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialForRiskChange
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @PotentialForRiskChange uniqueidentifier
        , @PotentialForRiskChangeComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistributionSpecies]
        
      SET
      
        [PotentialForRiskChange] = @PotentialForRiskChange, 
        [PotentialForRiskChangeComments] = @PotentialForRiskChangeComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialForRiskChange] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgGlobalGeographicDistribution
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [GlobalGeographicDistributionComments]
      FROM
        
      [GeographicDistribution]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [GeographicAreaId]
        FROM
        [GlobalGeographicDistribution]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgGlobalGeographicDistribution] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuGlobalGeographicDistribution
          @ProfileVersionId uniqueidentifier
          
        , @GlobalGeographicDistributionComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [GeographicDistribution]
        
      SET
      
        [GlobalGeographicDistributionComments] = @GlobalGeographicDistributionComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [GlobalGeographicDistribution]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuGlobalGeographicDistribution] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiGlobalGeographicDistributionGlobalGeographicDistribution
            @ProfileVersionId uniqueidentifier,
            
        @GeographicAreaId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [GlobalGeographicDistribution]
        (
        [Id],
        
            [ProfileVersionId],
            
        [GeographicAreaId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @GeographicAreaId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiGlobalGeographicDistributionGlobalGeographicDistribution] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdGlobalGeographicDistributionGlobalGeographicDistribution
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [GlobalGeographicDistribution]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdGlobalGeographicDistributionGlobalGeographicDistribution] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgZoonoticIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ZoonoticIndicator], 
        [ZoonoticIndicatorComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgZoonoticIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuZoonoticIndicator
          @ProfileVersionId uniqueidentifier
          
        , @ZoonoticIndicator uniqueidentifier
        , @ZoonoticIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [ZoonoticIndicator] = @ZoonoticIndicator, 
        [ZoonoticIndicatorComments] = @ZoonoticIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuZoonoticIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgLevelOfHumanExposureToAnimalOrProducts
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [LevelOfHumanExposureToAnimalOrProducts], 
        [LevelOfHumanExposureToAnimalOrProductsComments]
      FROM
        
      [HumanHealthSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgLevelOfHumanExposureToAnimalOrProducts] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuLevelOfHumanExposureToAnimalOrProducts
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @LevelOfHumanExposureToAnimalOrProducts uniqueidentifier
        , @LevelOfHumanExposureToAnimalOrProductsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealthSpecies]
        
      SET
      
        [LevelOfHumanExposureToAnimalOrProducts] = @LevelOfHumanExposureToAnimalOrProducts, 
        [LevelOfHumanExposureToAnimalOrProductsComments] = @LevelOfHumanExposureToAnimalOrProductsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuLevelOfHumanExposureToAnimalOrProducts] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgHumanTransmissionMechanism
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [HumanTransmissionMechanismComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [TransmissionMechanismId]
        FROM
        [HumanTransmissionMechanism]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgHumanTransmissionMechanism] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuHumanTransmissionMechanism
          @ProfileVersionId uniqueidentifier
          
        , @HumanTransmissionMechanismComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [HumanTransmissionMechanismComments] = @HumanTransmissionMechanismComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [HumanTransmissionMechanism]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuHumanTransmissionMechanism] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiHumanTransmissionMechanismHumanTransmissionMechanism
            @ProfileVersionId uniqueidentifier,
            
        @TransmissionMechanismId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [HumanTransmissionMechanism]
        (
        [Id],
        
            [ProfileVersionId],
            
        [TransmissionMechanismId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @TransmissionMechanismId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiHumanTransmissionMechanismHumanTransmissionMechanism] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdHumanTransmissionMechanismHumanTransmissionMechanism
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [HumanTransmissionMechanism]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdHumanTransmissionMechanismHumanTransmissionMechanism] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgAttributableFraction
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [AttributableFraction], 
        [AttributableFractionComments]
      FROM
        
      [HumanHealthSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgAttributableFraction] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuAttributableFraction
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @AttributableFraction uniqueidentifier
        , @AttributableFractionComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealthSpecies]
        
      SET
      
        [AttributableFraction] = @AttributableFraction, 
        [AttributableFractionComments] = @AttributableFractionComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuAttributableFraction] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSymptomsOfHumanDisease
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [SymptomsOfHumanDisease]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSymptomsOfHumanDisease] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSymptomsOfHumanDisease
          @ProfileVersionId uniqueidentifier
          
        , @SymptomsOfHumanDisease text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [SymptomsOfHumanDisease] = @SymptomsOfHumanDisease
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSymptomsOfHumanDisease] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgTransmissibilityIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [TransmissibilityIndicator], 
        [TransmissibilityIndicatorComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgTransmissibilityIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuTransmissibilityIndicator
          @ProfileVersionId uniqueidentifier
          
        , @TransmissibilityIndicator uniqueidentifier
        , @TransmissibilityIndicatorComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [TransmissibilityIndicator] = @TransmissibilityIndicator, 
        [TransmissibilityIndicatorComments] = @TransmissibilityIndicatorComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuTransmissibilityIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgModalSeverityOfHumanDisease
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ModalSeverityOfHumanDisease], 
        [ModalSeverityOfHumanDiseaseComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgModalSeverityOfHumanDisease] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuModalSeverityOfHumanDisease
          @ProfileVersionId uniqueidentifier
          
        , @ModalSeverityOfHumanDisease uniqueidentifier
        , @ModalSeverityOfHumanDiseaseComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [ModalSeverityOfHumanDisease] = @ModalSeverityOfHumanDisease, 
        [ModalSeverityOfHumanDiseaseComments] = @ModalSeverityOfHumanDiseaseComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuModalSeverityOfHumanDisease] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgMaximumSeverityOfHumanDisease
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [MaximumSeverityOfHumanDisease], 
        [MaximumSeverityOfHumanDiseaseComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgMaximumSeverityOfHumanDisease] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuMaximumSeverityOfHumanDisease
          @ProfileVersionId uniqueidentifier
          
        , @MaximumSeverityOfHumanDisease uniqueidentifier
        , @MaximumSeverityOfHumanDiseaseComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [MaximumSeverityOfHumanDisease] = @MaximumSeverityOfHumanDisease, 
        [MaximumSeverityOfHumanDiseaseComments] = @MaximumSeverityOfHumanDiseaseComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuMaximumSeverityOfHumanDisease] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgGeographicDistributionOfHumanDisease
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [GeographicDistributionOfHumanDiseaseComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [GeographicAreaId]
        FROM
        [GeographicDistributionOfHumanDisease]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgGeographicDistributionOfHumanDisease] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuGeographicDistributionOfHumanDisease
          @ProfileVersionId uniqueidentifier
          
        , @GeographicDistributionOfHumanDiseaseComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [GeographicDistributionOfHumanDiseaseComments] = @GeographicDistributionOfHumanDiseaseComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [GeographicDistributionOfHumanDisease]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuGeographicDistributionOfHumanDisease] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease
            @ProfileVersionId uniqueidentifier,
            
        @GeographicAreaId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [GeographicDistributionOfHumanDisease]
        (
        [Id],
        
            [ProfileVersionId],
            
        [GeographicAreaId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @GeographicAreaId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [GeographicDistributionOfHumanDisease]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdGeographicDistributionOfHumanDiseaseGeographicDistributionOfHumanDisease] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgAnnualNumberOfHumanCasesInGB
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [AnnualNumberOfHumanCasesInGB], 
        [AnnualNumberOfHumanCasesInGBComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgAnnualNumberOfHumanCasesInGB] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuAnnualNumberOfHumanCasesInGB
          @ProfileVersionId uniqueidentifier
          
        , @AnnualNumberOfHumanCasesInGB uniqueidentifier
        , @AnnualNumberOfHumanCasesInGBComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [AnnualNumberOfHumanCasesInGB] = @AnnualNumberOfHumanCasesInGB, 
        [AnnualNumberOfHumanCasesInGBComments] = @AnnualNumberOfHumanCasesInGBComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuAnnualNumberOfHumanCasesInGB] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgAverageCostPerCase
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [AverageCostPerCase], 
        [AverageCostPerCaseComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgAverageCostPerCase] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuAverageCostPerCase
          @ProfileVersionId uniqueidentifier
          
        , @AverageCostPerCase uniqueidentifier
        , @AverageCostPerCaseComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [AverageCostPerCase] = @AverageCostPerCase, 
        [AverageCostPerCaseComments] = @AverageCostPerCaseComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuAverageCostPerCase] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgIndirectEconomicCostOfHumanIllness
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [IndirectEconomicCostOfHumanIllness], 
        [IndirectEconomicCostOfHumanIllnessComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgIndirectEconomicCostOfHumanIllness] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuIndirectEconomicCostOfHumanIllness
          @ProfileVersionId uniqueidentifier
          
        , @IndirectEconomicCostOfHumanIllness uniqueidentifier
        , @IndirectEconomicCostOfHumanIllnessComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [IndirectEconomicCostOfHumanIllness] = @IndirectEconomicCostOfHumanIllness, 
        [IndirectEconomicCostOfHumanIllnessComments] = @IndirectEconomicCostOfHumanIllnessComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuIndirectEconomicCostOfHumanIllness] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgUncertainty
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [Uncertainty], 
        [UncertaintyComments]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgUncertainty] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuUncertainty
          @ProfileVersionId uniqueidentifier
          
        , @Uncertainty uniqueidentifier
        , @UncertaintyComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [Uncertainty] = @Uncertainty, 
        [UncertaintyComments] = @UncertaintyComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuUncertainty] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnHumanHealth
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ImpactOnHumanHealth]
      FROM
        
      [HumanHealth]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnHumanHealth] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnHumanHealth
          @ProfileVersionId uniqueidentifier
          
        , @ImpactOnHumanHealth text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [HumanHealth]
        
      SET
      
        [ImpactOnHumanHealth] = @ImpactOnHumanHealth
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnHumanHealth] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSubstantialCommercialTrade
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [CommercialTrade], 
        [CommercialTradeComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSubstantialCommercialTrade] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSubstantialCommercialTrade
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @CommercialTrade uniqueidentifier
        , @CommercialTradeComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [CommercialTrade] = @CommercialTrade, 
        [CommercialTradeComments] = @CommercialTradeComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSubstantialCommercialTrade] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnLevelOfImports
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ImpactOnLevelOfImports], 
        [ImpactOnLevelOfImportsComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnLevelOfImports] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnLevelOfImports
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ImpactOnLevelOfImports uniqueidentifier
        , @ImpactOnLevelOfImportsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [ImpactOnLevelOfImports] = @ImpactOnLevelOfImports, 
        [ImpactOnLevelOfImportsComments] = @ImpactOnLevelOfImportsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnLevelOfImports] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgStatutoryObligationToControl
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [StatutoryObligationToControl], 
        [StatutoryObligationToControlComments]
      FROM
        
      [InternationalTrade]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgStatutoryObligationToControl] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuStatutoryObligationToControl
          @ProfileVersionId uniqueidentifier
          
        , @StatutoryObligationToControl uniqueidentifier
        , @StatutoryObligationToControlComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTrade]
        
      SET
      
        [StatutoryObligationToControl] = @StatutoryObligationToControl, 
        [StatutoryObligationToControlComments] = @StatutoryObligationToControlComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuStatutoryObligationToControl] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImportanceOfExportTrade
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ImportanceOfExportTrade], 
        [ImportanceOfExportTradeComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImportanceOfExportTrade] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImportanceOfExportTrade
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ImportanceOfExportTrade uniqueidentifier
        , @ImportanceOfExportTradeComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [ImportanceOfExportTrade] = @ImportanceOfExportTrade, 
        [ImportanceOfExportTradeComments] = @ImportanceOfExportTradeComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImportanceOfExportTrade] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgReestablishmentOfTradingStatus
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ReestablishmentOfTradingStatus], 
        [ReestablishmentOfTradingStatusComments]
      FROM
        
      [InternationalTrade]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgReestablishmentOfTradingStatus] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuReestablishmentOfTradingStatus
          @ProfileVersionId uniqueidentifier
          
        , @ReestablishmentOfTradingStatus uniqueidentifier
        , @ReestablishmentOfTradingStatusComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTrade]
        
      SET
      
        [ReestablishmentOfTradingStatus] = @ReestablishmentOfTradingStatus, 
        [ReestablishmentOfTradingStatusComments] = @ReestablishmentOfTradingStatusComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuReestablishmentOfTradingStatus] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialForRegionalisation
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [PotentialForRegionalisation], 
        [PotentialForRegionalisationComments]
      FROM
        
      [InternationalTrade]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialForRegionalisation] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialForRegionalisation
          @ProfileVersionId uniqueidentifier
          
        , @PotentialForRegionalisation uniqueidentifier
        , @PotentialForRegionalisationComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTrade]
        
      SET
      
        [PotentialForRegionalisation] = @PotentialForRegionalisation, 
        [PotentialForRegionalisationComments] = @PotentialForRegionalisationComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialForRegionalisation] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgRangeOfCommoditiesCompromised
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [RangeOfCommoditiesCompromised], 
        [RangeOfCommoditiesCompromisedComments]
      FROM
        
      [InternationalTrade]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgRangeOfCommoditiesCompromised] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuRangeOfCommoditiesCompromised
          @ProfileVersionId uniqueidentifier
          
        , @RangeOfCommoditiesCompromised uniqueidentifier
        , @RangeOfCommoditiesCompromisedComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTrade]
        
      SET
      
        [RangeOfCommoditiesCompromised] = @RangeOfCommoditiesCompromised, 
        [RangeOfCommoditiesCompromisedComments] = @RangeOfCommoditiesCompromisedComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuRangeOfCommoditiesCompromised] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnIntraCommunityFlows
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ImpactOnIntraCommunityFlows], 
        [ImpactOnIntraCommunityFlowsComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnIntraCommunityFlows] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnIntraCommunityFlows
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ImpactOnIntraCommunityFlows uniqueidentifier
        , @ImpactOnIntraCommunityFlowsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [ImpactOnIntraCommunityFlows] = @ImpactOnIntraCommunityFlows, 
        [ImpactOnIntraCommunityFlowsComments] = @ImpactOnIntraCommunityFlowsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnIntraCommunityFlows] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnThirdCountryFlows
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ImpactOnThirdCountryFlows], 
        [ImpactOnThirdCountryFlowsComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnThirdCountryFlows] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnThirdCountryFlows
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ImpactOnThirdCountryFlows uniqueidentifier
        , @ImpactOnThirdCountryFlowsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [ImpactOnThirdCountryFlows] = @ImpactOnThirdCountryFlows, 
        [ImpactOnThirdCountryFlowsComments] = @ImpactOnThirdCountryFlowsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnThirdCountryFlows] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgExportMarketValue
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [ExportMarketValue], 
        [ExportMarketValueComments]
      FROM
        
      [InternationalTradeSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgExportMarketValue] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuExportMarketValue
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @ExportMarketValue uniqueidentifier
        , @ExportMarketValueComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTradeSpecies]
        
      SET
      
        [ExportMarketValue] = @ExportMarketValue, 
        [ExportMarketValueComments] = @ExportMarketValueComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuExportMarketValue] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnInternationalTrade
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ImpactOnInternationalTrade]
      FROM
        
      [InternationalTrade]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnInternationalTrade] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnInternationalTrade
          @ProfileVersionId uniqueidentifier
          
        , @ImpactOnInternationalTrade text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [InternationalTrade]
        
      SET
      
        [ImpactOnInternationalTrade] = @ImpactOnInternationalTrade
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnInternationalTrade] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgNotifiableDiseaseIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [NotifiableDiseaseIndicator]
      FROM
        
      [LegislationAndMandates]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgNotifiableDiseaseIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuNotifiableDiseaseIndicator
          @ProfileVersionId uniqueidentifier
          
        , @NotifiableDiseaseIndicator bit
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [LegislationAndMandates]
        
      SET
      
        [NotifiableDiseaseIndicator] = @NotifiableDiseaseIndicator
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuNotifiableDiseaseIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgReportableCausativeOrganismIndicator
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ReportableCausativeOrganismIndicator]
      FROM
        
      [LegislationAndMandates]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgReportableCausativeOrganismIndicator] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuReportableCausativeOrganismIndicator
          @ProfileVersionId uniqueidentifier
          
        , @ReportableCausativeOrganismIndicator bit
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [LegislationAndMandates]
        
      SET
      
        [ReportableCausativeOrganismIndicator] = @ReportableCausativeOrganismIndicator
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuReportableCausativeOrganismIndicator] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgApplicableLegislationAndMandates
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ApplicableLegislationAndMandatesComments]
      FROM
        
      [LegislationAndMandates]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
        SELECT
        
        [LegislationTypeId]
        FROM
        [ApplicableLegislationAndMandates]
        
      WHERE
        [ProfileVersionId] = @ProfileVersionId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spgApplicableLegislationAndMandates] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuApplicableLegislationAndMandates
          @ProfileVersionId uniqueidentifier
          
        , @ApplicableLegislationAndMandatesComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [LegislationAndMandates]
        
      SET
      
        [ApplicableLegislationAndMandatesComments] = @ApplicableLegislationAndMandatesComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
        DELETE FROM
        [ApplicableLegislationAndMandates]
        WHERE
        
              [ProfileVersionId] = @ProfileVersionId
              
      END
      GO

      GRANT EXECUTE ON [dbo].[spuApplicableLegislationAndMandates] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiApplicableLegislationAndMandatesApplicableLegislationAndMandates
            @ProfileVersionId uniqueidentifier,
            
        @LegislationTypeId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO
      [ApplicableLegislationAndMandates]
        (
        [Id],
        
            [ProfileVersionId],
            
        [LegislationTypeId]
        )
        VALUES
        (
        NEWID(),
        
            @ProfileVersionId,
            
        @LegislationTypeId
        )
        END
        GO

        GRANT EXECUTE ON [dbo].[spiApplicableLegislationAndMandatesApplicableLegislationAndMandates] TO [VLAProfilesUser]
        GO

        SET ANSI_NULLS ON
        GO
        SET QUOTED_IDENTIFIER ON
        GO
        -- =============================================
        --  This stored procedure was autogenerated by the Profiles
        --  CodeGen application on 13/11/2008 18:47:37 .
        -- =============================================
        CREATE PROCEDURE spdApplicableLegislationAndMandatesApplicableLegislationAndMandates
            @ProfileVersionId uniqueidentifier
            
        AS
        BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

        DELETE FROM
        [ApplicableLegislationAndMandates]
        WHERE
        
            [ProfileVersionId] = @ProfileVersionId
            
        END
        GO

        GRANT EXECUTE ON [dbo].[spdApplicableLegislationAndMandatesApplicableLegislationAndMandates] TO [VLAProfilesUser]
        GO
        
      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgLegislationOverview
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [LegislationOverview]
      FROM
        
      [LegislationAndMandates]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgLegislationOverview] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuLegislationOverview
          @ProfileVersionId uniqueidentifier
          
        , @LegislationOverview text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [LegislationAndMandates]
        
      SET
      
        [LegislationOverview] = @LegislationOverview
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuLegislationOverview] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgOpportunityToAddValueSummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [OpportunityToAddValueSummary]
      FROM
        
      [OpportunityToAddValue]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgOpportunityToAddValueSummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuOpportunityToAddValueSummary
          @ProfileVersionId uniqueidentifier
          
        , @OpportunityToAddValueSummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [OpportunityToAddValue]
        
      SET
      
        [OpportunityToAddValueSummary] = @OpportunityToAddValueSummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuOpportunityToAddValueSummary] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPublicAndStakeholderPerceptionSummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [PublicAndStakeholderPerceptionSummary]
      FROM
        
      [PublicAndStakeholderPerception]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPublicAndStakeholderPerceptionSummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPublicAndStakeholderPerceptionSummary
          @ProfileVersionId uniqueidentifier
          
        , @PublicAndStakeholderPerceptionSummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [PublicAndStakeholderPerception]
        
      SET
      
        [PublicAndStakeholderPerceptionSummary] = @PublicAndStakeholderPerceptionSummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPublicAndStakeholderPerceptionSummary] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgRiskScenarios
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [RiskScenarios]
      FROM
        
      [RiskSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgRiskScenarios] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuRiskScenarios
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @RiskScenarios text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [RiskSpecies]
        
      SET
      
        [RiskScenarios] = @RiskScenarios
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuRiskScenarios] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgDescription
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [Description]
      FROM
        
      [Summary]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgDescription] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuDescription
          @ProfileVersionId uniqueidentifier
          
        , @Description text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Summary]
        
      SET
      
        [Description] = @Description
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuDescription] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgProfiledSpecies
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [AffectedSpeciesComments]
      FROM
        
      [Summary]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgProfiledSpecies] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuProfiledSpecies
          @ProfileVersionId uniqueidentifier
          
        , @AffectedSpeciesComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Summary]
        
      SET
      
        [AffectedSpeciesComments] = @AffectedSpeciesComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuProfiledSpecies] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgOtherAffectedSpecies
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [OtherAffectedSpeciesComments]
      FROM
        
      [Summary]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgOtherAffectedSpecies] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuOtherAffectedSpecies
          @ProfileVersionId uniqueidentifier
          
        , @OtherAffectedSpeciesComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Summary]
        
      SET
      
        [OtherAffectedSpeciesComments] = @OtherAffectedSpeciesComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuOtherAffectedSpecies] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgScenarioDescription
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ScenarioDescription]
      FROM
        
      [Summary]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgScenarioDescription] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuScenarioDescription
          @ProfileVersionId uniqueidentifier
          
        , @ScenarioDescription text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Summary]
        
      SET
      
        [ScenarioDescription] = @ScenarioDescription
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuScenarioDescription] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgRevisionHistory
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [RevisionHistory]
      FROM
        
      [Summary]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgRevisionHistory] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuRevisionHistory
          @ProfileVersionId uniqueidentifier
          
        , @RevisionHistory text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Summary]
        
      SET
      
        [RevisionHistory] = @RevisionHistory
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuRevisionHistory] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgCurrentSurveillanceActivities
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId], [Id],
        [Reference], 
        [Mechanism], 
        [PurposeAndDetail]
      FROM
        
      [CurrentSurveillanceActivitiesSpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgCurrentSurveillanceActivities] TO [VLAProfilesUser]
      GO


      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spiCurrentSurveillanceActivities
      @Id uniqueidentifier
      , @ProfileVersionId uniqueidentifier
      , @SpeciesId uniqueidentifier
        , @Reference varchar(255)
        , @Mechanism uniqueidentifier
        , @PurposeAndDetail text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      INSERT INTO [CurrentSurveillanceActivitiesSpecies]
      (
      [Id]
      , [ProfileVersionId]
      , [SpeciesId]
       , [Reference]
      
       , [Mechanism]
      
       , [PurposeAndDetail]
      
      )
      VALUES
      (
      @Id
      , @ProfileVersionId
      , @SpeciesId
        , @Reference
        , @Mechanism
        , @PurposeAndDetail
      )
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spiCurrentSurveillanceActivities] TO [VLAProfilesUser]
      GO

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spdCurrentSurveillanceActivities
      @Id uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      
  
      DELETE FROM
        [CurrentSurveillanceActivitiesSpecies]
      WHERE
        [Id] = @Id
      END
      GO

      GRANT EXECUTE ON [dbo].[spdCurrentSurveillanceActivities] TO [VLAProfilesUser]
      GO

      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuCurrentSurveillanceActivities
          @Id uniqueidentifier
        
        , @Reference varchar(255)
        , @Mechanism uniqueidentifier
        , @PurposeAndDetail text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [CurrentSurveillanceActivitiesSpecies]
        
      SET
      
        [Reference] = @Reference, 
        [Mechanism] = @Mechanism, 
        [PurposeAndDetail] = @PurposeAndDetail
      WHERE
      
          [Id] = @Id
        
      END
      GO

      GRANT EXECUTE ON [dbo].[spuCurrentSurveillanceActivities] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgSummaryOfSurveillanceActivities
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [SummaryOfSurveillanceActivities]
      FROM
        
      [Surveillance]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgSummaryOfSurveillanceActivities] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuSummaryOfSurveillanceActivities
          @ProfileVersionId uniqueidentifier
          
        , @SummaryOfSurveillanceActivities text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [Surveillance]
        
      SET
      
        [SummaryOfSurveillanceActivities] = @SummaryOfSurveillanceActivities
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuSummaryOfSurveillanceActivities] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgPotentialUnplannedCostToExchequer
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [PotentialUnplannedCostToExchequer], 
        [PotentialUnplannedCostToExchequerComments]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgPotentialUnplannedCostToExchequer] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuPotentialUnplannedCostToExchequer
          @ProfileVersionId uniqueidentifier
          
        , @PotentialUnplannedCostToExchequer uniqueidentifier
        , @PotentialUnplannedCostToExchequerComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [PotentialUnplannedCostToExchequer] = @PotentialUnplannedCostToExchequer, 
        [PotentialUnplannedCostToExchequerComments] = @PotentialUnplannedCostToExchequerComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuPotentialUnplannedCostToExchequer] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgGlobalEnvironment
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [GlobalEnvironment], 
        [GlobalEnvironmentComments]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgGlobalEnvironment] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuGlobalEnvironment
          @ProfileVersionId uniqueidentifier
          
        , @GlobalEnvironment uniqueidentifier
        , @GlobalEnvironmentComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [GlobalEnvironment] = @GlobalEnvironment, 
        [GlobalEnvironmentComments] = @GlobalEnvironmentComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuGlobalEnvironment] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgLocalEnvironment
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [LocalEnvironment], 
        [LocalEnvironmentComments]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgLocalEnvironment] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuLocalEnvironment
          @ProfileVersionId uniqueidentifier
          
        , @LocalEnvironment uniqueidentifier
        , @LocalEnvironmentComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [LocalEnvironment] = @LocalEnvironment, 
        [LocalEnvironmentComments] = @LocalEnvironmentComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuLocalEnvironment] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgLocalAgriculturalEconomy
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      [SpeciesId],
        [LocalAgriculturalEconomy], 
        [LocalAgriculturalEconomyComments]
      FROM
        
      [WiderSocietySpecies]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgLocalAgriculturalEconomy] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuLocalAgriculturalEconomy
          @ProfileVersionId uniqueidentifier
          , @SpeciesId uniqueidentifier
        , @LocalAgriculturalEconomy uniqueidentifier
        , @LocalAgriculturalEconomyComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSocietySpecies]
        
      SET
      
        [LocalAgriculturalEconomy] = @LocalAgriculturalEconomy, 
        [LocalAgriculturalEconomyComments] = @LocalAgriculturalEconomyComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
            AND
            [SpeciesId] = @SpeciesId
          
      END
      GO

      GRANT EXECUTE ON [dbo].[spuLocalAgriculturalEconomy] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgWiderRuralCommunity
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [WiderRuralCommunity], 
        [WiderRuralCommunityComments]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgWiderRuralCommunity] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuWiderRuralCommunity
          @ProfileVersionId uniqueidentifier
          
        , @WiderRuralCommunity uniqueidentifier
        , @WiderRuralCommunityComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [WiderRuralCommunity] = @WiderRuralCommunity, 
        [WiderRuralCommunityComments] = @WiderRuralCommunityComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuWiderRuralCommunity] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgTotalSurveillanceCosts
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [TotalSurveillanceCosts], 
        [TotalSurveillanceCostsComments]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgTotalSurveillanceCosts] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuTotalSurveillanceCosts
          @ProfileVersionId uniqueidentifier
          
        , @TotalSurveillanceCosts uniqueidentifier
        , @TotalSurveillanceCostsComments text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [TotalSurveillanceCosts] = @TotalSurveillanceCosts, 
        [TotalSurveillanceCostsComments] = @TotalSurveillanceCostsComments
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuTotalSurveillanceCosts] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgImpactOnSocietySummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [ImpactOnSocietySummary]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgImpactOnSocietySummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuImpactOnSocietySummary
          @ProfileVersionId uniqueidentifier
          
        , @ImpactOnSocietySummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [ImpactOnSocietySummary] = @ImpactOnSocietySummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuImpactOnSocietySummary] TO [VLAProfilesUser]
      GO

      

      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
      -- =============================================
      CREATE PROCEDURE spgFFGCostsSummary
      @ProfileVersionId uniqueidentifier
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      SELECT
      
        [FFGCostsSummary]
      FROM
        
      [WiderSociety]
          
      WHERE
      [ProfileVersionId] = @ProfileVersionId
      
      
      END
      GO

      GRANT EXECUTE ON [dbo].[spgFFGCostsSummary] TO [VLAProfilesUser]
      GO


      
      SET ANSI_NULLS ON
      GO
      SET QUOTED_IDENTIFIER ON
      GO
      -- =============================================
      --  This stored procedure was autogenerated by the Profiles
      --  CodeGen application on 13/11/2008 18:47:37 .
    -- =============================================
    CREATE PROCEDURE spuFFGCostsSummary
          @ProfileVersionId uniqueidentifier
          
        , @FFGCostsSummary text
      AS
      BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      UPDATE
      
          [WiderSociety]
        
      SET
      
        [FFGCostsSummary] = @FFGCostsSummary
      WHERE
      
          [ProfileVersionId] = @ProfileVersionId 
      END
      GO

      GRANT EXECUTE ON [dbo].[spuFFGCostsSummary] TO [VLAProfilesUser]
      GO

      