IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgAffectedSpeciesComments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgAffectedSpeciesComments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuAffectedSpeciesComments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuAffectedSpeciesComments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentDraftProfileByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgCurrentDraftProfileByUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionInfoById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionInfoById]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileQuestionBySection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileQuestionBySection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileQuestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileQuestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationRankingRange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuPrioritisationRankingRange]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationCriterion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuPrioritisationCriterion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesTableAuditLogEntries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesTableAuditLogEntries]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesTableAuditLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpeciesTableAuditLog]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppPrioritisationScore]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppPrioritisationScore]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpeciesAuditEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSpeciesAuditEntry]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiErrorLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiErrorLog]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUserAuthorisation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgUserAuthorisation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluProfileUserRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaluProfileUserRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgContributor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgContributor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileContributorsByProfileId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileContributorsByProfileId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileEditor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileEditor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaGlobalUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaGlobalUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileContributor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileContributor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileEditor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileEditor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdGlobalUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdGlobalUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileEditor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileEditor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiGlobalUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiGlobalUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiReviewComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiReviewComment]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReviewCommentByProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgReviewCommentByProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceTableAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgReferenceTableAudit]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSourceOfFurtherInformation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSourceOfFurtherInformation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSourceOfFurtherInformation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSourceOfFurtherInformation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationCriterionValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuPrioritisationCriterionValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaBaseReferenceData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaBaseReferenceData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaPrioritisationVariables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaPrioritisationVariables]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuScientificPaperReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuScientificPaperReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiScientificPaperReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiScientificPaperReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgScientificPaperReferenceByProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgScientificPaperReferenceByProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileFieldValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileFieldValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileFieldByQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileFieldByQuestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgPrioritisationMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceTableName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgReferenceTableName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgMaintainableReferenceTables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgMaintainableReferenceTables]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLegislativeReferenceByProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgLegislativeReferenceByProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuLegislativeReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuLegislativeReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiLegislativeReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiLegislativeReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaCurrentProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileHistory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppProfileVersionCurrency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppProfileVersionCurrency]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReviewComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdReviewComment]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReviewComment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuReviewComment]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluSectionReviewFrequency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaluSectionReviewFrequency]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileContributor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileContributor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesById]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionByTitle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionByTitle]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesValidParents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesValidParents]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdScientificPaperReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdScientificPaperReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdLegislativeReference]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdLegislativeReference]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSourceOfFurtherInformation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdSourceOfFurtherInformation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSourceOfFurtherInformationByProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSourceOfFurtherInformationByProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChildSpecies]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetChildSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsAncestorSpecies]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[IsAncestorSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionById]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionReportByProfileVersionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionReportByProfileVersionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionReportData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionReportData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionReportData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentStaticReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaCurrentStaticReport]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgStaticReportHistory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiStaticReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiStaticReport]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportVersionData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgStaticReportVersionData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdStaticReportVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdStaticReportVersion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionSectionByProfileVersionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionSectionByProfileVersionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisedSpeciesByProfileVersionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgPrioritisedSpeciesByProfileVersionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationCategoryScoreByProfileVersionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgPrioritisationCategoryScoreByProfileVersionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationCriterionScoreByProfileVersionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgPrioritisationCriterionScoreByProfileVersionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionSectionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionSectionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionSectionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionSectionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileSectionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileSectionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileSectionUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileSectionUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpellCustomWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpellCustomWord]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpellCustomWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdSpellCustomWord]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpellCustomWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSpellCustomWord]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpellCustomWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpellCustomWord]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesSequenceNumber]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesSequenceNumber]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesNameById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesNameById]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionNote]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersionNote]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionNoteQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersionNoteQuestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileNoteType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileNoteType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionNoteBySectionAndType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionNoteBySectionAndType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionNote]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionNote]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionNoteQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionNoteQuestion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionNote]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionNote]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLookupValueByTable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgLookupValueByTable]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceValueByTable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgReferenceValueByTable]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgReferenceValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiReferenceValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiReferenceValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReferenceValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuReferenceValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReferenceValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdReferenceValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppReferenceValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppReferenceValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionFieldValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionFieldValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionFieldMultiValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersionFieldMultiValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionFieldMultiValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionFieldMultiValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileSectionMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileSectionMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesSectionMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesSectionMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppPrioritisationCalculation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppPrioritisationCalculation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionSpecies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersionSpecies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionSpeciesTradeData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionSpeciesTradeData]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesPrioritisationVariables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpeciesPrioritisationVariables]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesPrioritisationCriterionValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesPrioritisationCriterionValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppSpeciesPrioritisationScore]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sppSpeciesPrioritisationScore]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileVersionSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileVersionSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesAnswerData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgSpeciesAnswerData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesFieldValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesFieldValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesAnswerData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuSpeciesAnswerData]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpeciesFieldMultiValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSpeciesFieldMultiValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpeciesFieldMultiValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdSpeciesFieldMultiValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionPublicFlag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionPublicFlag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuStaticReportVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuStaticReportVersion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentPublicProfileByParent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgCurrentPublicProfileByParent]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileSectionMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaProfileSectionMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesSectionMetadata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgaSpeciesSectionMetadata]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSsoUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiSsoUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSsoUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdSsoUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdProfileVersionQuestionRow]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spiProfileVersionQuestionRow]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spuProfileVersionQuestionRow]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileQuestionBySectionId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileQuestionBySectionId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReviewCommentsByProfileSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spdReviewCommentsByProfileSection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionNoteByType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileVersionNoteByType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileSectionIdByProfileVersionNoteId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgProfileSectionIdByProfileVersionNoteId]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationCriterionValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Lynne Bentley
-- Create date: 04/06/07
-- Description:	Update criterion score
-- =============================================
CREATE PROCEDURE [dbo].[spuPrioritisationCriterionValue] 
	-- Add the parameters for the stored procedure here
	@CriterionValueId uniqueidentifier, 
	@Score int
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE
		[PrioritisationCriterionValue]
    SET      
        [Score] = @Score
	WHERE
		[Id] = @CriterionValueId


END

' 
END
GO
GRANT EXECUTE ON [dbo].[spuPrioritisationCriterionValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationCriterion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Lynne Bentley
-- Create date: 04/06/07
-- Updated:		Grant Turtle 19/11/2008 - Added @Name parameter
-- Description:	Update criterion weighting
-- =============================================
CREATE PROCEDURE [dbo].[spuPrioritisationCriterion] 
	-- Add the parameters for the stored procedure here
	@CriterionId uniqueidentifier, 
	@Weighting int,
	@Name varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE
		[PrioritisationCriterion]
    SET      
        [Weighting] = @Weighting,
        [Name] = @Name
	WHERE
		[Id] = @CriterionId


END

' 
END
GO
GRANT EXECUTE ON [dbo].[spuPrioritisationCriterion] TO [VLAProfilesUser]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 9 May 2007
-- Description:	Gets information for a profile version
--				section
-- =============================================
-- RJN 18/11/2008: Added recordsets for field value data
-- GPT 19/11/2008: Added NonTechnicalName
-- JE  24/11/2008: Added IncludeInSummary field
-- JE  15/12/2008: Added addition record set to pull back the fields in field groups
CREATE PROCEDURE [dbo].[spgProfileVersionSection] 
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Profiled Species
	SELECT
		[Species].[Id],
		[Species].[Name],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[Species] INNER JOIN [ProfileVersionSpecies] ON [Species].[Id] = [ProfileVersionSpecies].[SpeciesId]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersionSpecies].[ProfileVersionId] = @ProfileVersionId AND
		[luAffectedSpeciesType].[Name] = ''Profiled''

	--Revision Dates and Timestamp
    SELECT
		[ProfileVersionSection].[ProfileSectionId],
		[ProfileVersionSection].[TechnicalReviewFrequency],
		[ProfileVersionSection].[PolicyReviewFrequency],
		[ProfileVersionSection].[NextTechnicalReview],
		[ProfileVersionSection].[NextPolicyReview],
		[ProfileVersionSection].[LastUpdated],
		[Profile].[ParentId]		
	FROM
		[ProfileVersionSection] INNER JOIN [ProfileSection] ON [ProfileVersionSection].[ProfileSectionId] = [ProfileSection].[Id]
		INNER JOIN [ProfileVersion] ON [ProfileVersionSection].[ProfileVersionId] = [ProfileVersion].[Id]
		INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
	WHERE
		[ProfileVersionSection].[ProfileVersionId] = @ProfileVersionId AND
		[ProfileVersionSection].[ProfileSectionId] = @ProfileSectionId

	--Question Names
	SELECT 
		[ProfileQuestion].[Id],
		[ProfileQuestion].[Name],
		[ProfileQuestion].[NonTechnicalName]
	FROM
		[ProfileQuestion] 
	WHERE
		[ProfileQuestion].[ProfileSectionId] = @ProfileSectionId
	ORDER BY
		[ProfileQuestion].[QuestionNumber]

	--Question Rows
	SELECT
		[ProfileVersionQuestionRow].[Id],
		[ProfileVersionQuestionRow].[ProfileQuestionId],
		[ProfileVersionQuestionRow].[SequenceNumber]
	FROM
		[ProfileVersionQuestionRow] INNER JOIN [ProfileQuestion] ON [ProfileVersionQuestionRow].[ProfileQuestionId] = [ProfileQuestion].[Id]
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileQuestion].[ProfileSectionId] = @ProfileSectionId
	ORDER BY
		[SequenceNumber]

	--Field Values
	SELECT 
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[SpeciesId],
		[ProfileVersionFieldValue].[ProfileVersionQuestionRowId],
		[ProfileVersionFieldValue].[BooleanValue],
		[ProfileVersionFieldValue].[ListValue],
		[ProfileVersionFieldValue].[DecimalValue],
		[ProfileVersionFieldValue].[DateValue],
		[ProfileVersionFieldValue].[TextValue],
		[ProfileField].[Id],
		''00000000-0000-0000-0000-000000000000'',
		[ProfileQuestion].[QuestionNumber],
		[ProfileQuestion].[Id] as QuestionId,
		[ProfileField].[FieldNumber]
	FROM
		[ProfileVersionFieldValue] INNER JOIN
		[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN
		[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]	
	WHERE 
		[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId AND
		[ProfileQuestion].[ProfileSectionId] = @ProfileSectionId

	UNION

	SELECT 
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[SpeciesId],
		[ProfileVersionFieldValue].[ProfileVersionQuestionRowId],
		[ProfileVersionFieldValue].[BooleanValue],
		[ProfileVersionFieldValue].[ListValue],
		[ProfileVersionFieldValue].[DecimalValue],
		[ProfileVersionFieldValue].[DateValue],
		[ProfileVersionFieldValue].[TextValue],
		[ProfileField].[Id],		
		[ProfileField].[ProfileFieldGroupId],
		tmpField.[QuestionNumber] as QuestionNumber,
		tmpField.[QuestionId] as QuestionId,
		[ProfileField].[FieldNumber]
	FROM
		[ProfileVersionFieldValue] INNER JOIN
		[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN	
		(
		SELECT
			[ProfileField].[Id],
			[ProfileQuestion].[QuestionNumber],
			[ProfileQuestion].[Id] as QuestionId
		FROM 
			[ProfileField] INNER JOIN 
			[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
		WHERE 
			[ProfileQuestion].[ProfileSectionId] = @ProfileSectionId
		) tmpField ON [ProfileField].[ProfileFieldGroupId] = tmpField.[Id] 
	WHERE
		[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId 

END



' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionSection] TO [VLAProfilesUser]
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 22 May 2007
-- Description:	updates a profile version section
-- =============================================
-- RJN 16/4/08: Added IsValid flag
-- =============================================
CREATE PROCEDURE [dbo].[spuProfileVersionSection]
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier,
	@TechnicalReviewFrequency uniqueidentifier,
	@PolicyReviewFrequency uniqueidentifier,
	@NextTechnicalReview smalldatetime,
	@NextPolicyReview smalldatetime,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF EXISTS (
		SELECT
			[Id]
		FROM
			[ProfileVersion]
		WHERE
			[Id] = @ProfileVersionId AND
			[EffectiveDateTo] IS NOT NULL
	) BEGIN
		RAISERROR(''The profile version cannot be edited because it is not current'',16,1)
		RETURN
	END

	IF EXISTS (
		SELECT
			[ProfileVersion].[Id]
		FROM
			[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		WHERE
			[ProfileVersion].[Id] = @ProfileVersionId AND
			[luProfileVersionState].[Name] != ''Draft''
	) BEGIN
		RAISERROR(''The profile version cannot be edited because it is not a draft version'',16,1)
		RETURN
	END

	IF NOT EXISTS (
		SELECT
			[ProfileVersionId],
			[ProfileSectionId]
		FROM
			[ProfileVersionSection]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[ProfileSectionId] = @ProfileSectionId AND
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The profile version section has been edited by another user'',16,1)
		RETURN
	END

	UPDATE
		[ProfileVersionSection]
	SET
		[TechnicalReviewFrequency] = @TechnicalReviewFrequency,
		[PolicyReviewFrequency] = @PolicyReviewFrequency,
		[NextTechnicalReview] = @NextTechnicalReview,
		[NextPolicyReview] = @NextPolicyReview
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileSectionId] = @ProfileSectionId

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ProfileVersionSection]
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileSectionId] = @ProfileSectionId

END

' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionSection] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileMetadata]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 23/03/2007
-- Description:	gets XML representation of profiles
--				metadata for code-gen
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileMetadata]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- query to list reference tables
SELECT
	[Id],
	REPLACE([Name], '' '', '''') AS [Name],
	[IsMaintainable]
FROM
	[ReferenceTable]
FOR XML AUTO

-- query to list reference values
SELECT
	[ReferenceValue].[Id],
	REPLACE([ReferenceTable].[Name], '' '', '''') AS [TableName],
	ISNULL([ReferenceTable].[IsMaintainable], 0) AS [IsMaintainable],
	[ReferenceValue].[LookupValue],
	[ReferenceValue].[SequenceNumber]
FROM
	[ReferenceValue] INNER JOIN [ReferenceTable] ON [ReferenceValue].[ReferenceTableId] = [ReferenceTable].[Id]
FOR XML AUTO

-- query to list species fields
SELECT
	REPLACE([SpeciesField].[ShortName], '' '', '''') AS [Name],
	REPLACE([ReferenceTable].[Name], '' '', '''') AS [ReferenceTable]
FROM
	[SpeciesField] LEFT JOIN [ReferenceTable] ON [SpeciesField].[ReferenceTableId] = [ReferenceTable].[Id]
FOR XML AUTO

-- query to build profile section/question/field structure
SELECT
	1 AS Tag,
    NULL AS Parent,
	REPLACE([ProfileSection].[ShortName], '' '', '''') AS [Section!1!Name],
	NULL AS [Question!2!Id],
	NULL AS [Question!2!Name],
	NULL AS [Question!2!IsPerSpecies],
	NULL AS [Question!2!IsRepeating],
	NULL AS [Question!2!QuestionNumber],
	NULL AS [Field!3!Id],
	NULL AS [Field!3!Name],
	NULL AS [Field!3!Type],
	NULL AS [Field!3!FieldValueColumn],
	NULL AS [Field!3!IsMultiValue],
	NULL AS [Field!3!ReferenceTable],
	NULL AS [Field!3!FieldNumber],
	NULL AS [Field!3!DefaultValue]
FROM
	[ProfileSection]

UNION ALL

SELECT
	2 AS Tag,
	1 AS Parent,
	REPLACE([ProfileSection].[ShortName], '' '', '''') AS [Section!1!Name],
	[ProfileQuestion].[Id] AS [Question!2!Id],
	REPLACE([ProfileQuestion].[ShortName], '' '', '''') AS [Question!2!Name],
	[ProfileQuestion].[IsPerSpecies] AS [Question!2!IsPerSpecies],
	[ProfileQuestion].[IsRepeating] AS [Question!2!IsRepeating],
	[ProfileQuestion].[QuestionNumber] AS [Question!2!QuestionNumber],
	NULL AS [Field!3!Id],
	NULL AS [Field!3!Name],
	NULL AS [Field!3!Type],
	NULL AS [Field!3!FieldValueColumn],
	NULL AS [Field!3!IsMultiValue],
	NULL AS [Field!3!ReferenceTable],
	NULL AS [Field!3!FieldNumber],
	NULL AS [Field!3!DefaultValue]
FROM
	[ProfileQuestion] INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]

UNION ALL

SELECT
	3 AS Tag,
	2 AS Parent,
	REPLACE([ProfileSection].[ShortName], '' '', '''') AS [Section!1!Name],
	[ProfileQuestion].[Id] AS [Question!2!Id],
	REPLACE([ProfileQuestion].[ShortName], '' '', '''') AS [Question!2!Name],
	NULL AS [Question!2!IsPerSpecies],
	NULL AS [Question!2!IsRepeating],
	[ProfileQuestion].[QuestionNumber] AS [Question!2!QuestionNumber],
	[ProfileField].[Id] AS [Field!3!Id],
	REPLACE([ProfileField].[ShortName], '' '', '''') AS [Field!3!Name],
	luDataFieldType.SqlType AS [Field!3!Type],
	luDataFieldType.FieldValueColumn AS [Field!3!FieldValueColumn],
	CASE WHEN [luDataFieldType].[Name] = ''Multi Value List'' THEN 1 ELSE 0 END AS [Field!3!IsMultiValue],
	REPLACE([ReferenceTable].[Name], '' '', '''') AS [Field!3!ReferenceTable],
	[ProfileField].[FieldNumber] AS [Field!3!FieldNumber],
	[ProfileField].[DefaultValue] AS [Field!3!DefaultValue]
FROM
	[ProfileField] INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
	INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
	INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]
	LEFT JOIN [ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
WHERE
	[luDataFieldType].[SqlType] IS NOT NULL
ORDER BY
	[Section!1!Name],
	[Question!2!QuestionNumber],
	[Question!2!Name],
	[Field!3!FieldNumber],
	[Field!3!Name]

FOR XML EXPLICIT

END












' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileFieldByQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 9 May 2007
-- Description:	gets details of profile fields for
--				a given profile question
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileFieldByQuestion]
	@ProfileQuestionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[ProfileField].[Id],
		[ProfileField].[ShortName],
		[ProfileField].[FieldNumber],
		[ProfileField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[ProfileField].[IsMandatory],
		[ReferenceTable].[Name] AS [ReferenceTableName]
	FROM
		[ProfileField] INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]
		LEFT JOIN [ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
	WHERE
		[ProfileField].[ProfileQuestionId] = @ProfileQuestionId
	ORDER BY
		[ProfileField].[FieldNumber]
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileFieldByQuestion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationMetadata]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 22 June 2007
-- Description:	metadata for code generation of
--				prioritisation calculation
-- =============================================
CREATE PROCEDURE [dbo].[spgPrioritisationMetadata]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT
	[Id],
	[FieldName],
	[DataType],
	[SqlType],
	[QuestionName],
	[IsPerSpecies],
	[IsRepeating],
	[IsMultiValue],
	[SectionName],
	[ReferenceTableName]
FROM
(
    SELECT
	[ProfileField].[Id],
	REPLACE([ProfileField].[ShortName], '' '', '''') AS [FieldName],
	[luDataFieldType].[Name] AS [DataType],
	[luDataFieldType].[SqlType] AS [SqlType],
	REPLACE([ProfileQuestion].[ShortName], '' '', '''') AS [QuestionName],
	[ProfileQuestion].[IsPerSpecies],
	[ProfileQuestion].[IsRepeating],
	CASE WHEN [luDataFieldType].[Name] = ''Multi Value List'' THEN 1 ELSE 0 END AS [IsMultiValue],
	REPLACE([ProfileSection].[ShortName], '' '', '''') AS [SectionName],
	''lu'' + REPLACE([ReferenceTable].[Name], '' '', '''') AS [ReferenceTableName]
FROM
	[ProfileField] INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]
	INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
	INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
	LEFT JOIN [ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
) ProfileField
FOR XML AUTO


SELECT
	1 AS Tag,
    NULL AS Parent,
	[PrioritisationCategory].[Id] AS [Category!1!Id],
	REPLACE([PrioritisationCategory].[Name], '' '', '''') AS [Category!1!Name],
	NULL AS [Irrelevance!2!Id],
	NULL AS [Irrelevance!2!IrrelevanceFieldId],
	NULL AS [Irrelevance!2!IrrelevanceValueId],
	NULL AS [Irrelevance!2!IrrelevanceFlag],
	NULL AS [Criterion!3!Id],
	NULL AS [Criterion!3!Code],
	NULL AS [Criterion!3!Name],
	NULL AS [Criterion!3!MappingFlag],
	NULL AS [Criterion!3!TrueMapping],
	NULL AS [Criterion!3!FalseMapping]
FROM
	[PrioritisationCategory]

UNION ALL

SELECT
	2 AS Tag,
	1 AS Parent,
	[PrioritisationCategoryId] AS [Category!1!Id],
	NULL AS [Category!1!Name],
	[Id] AS [Irrelevance!2!Id],
	[IrrelevanceFieldId] AS [Irrelevance!2!IrrelevanceFieldId],
	[IrrelevanceValueId] AS [Irrelevance!2!IrrelevanceValueId],
	[IrrelevanceFlag] AS [Irrelevance!2!IrrelevanceFlag],
	NULL AS [Criterion!3!Id],
	NULL AS [Criterion!3!Code],
	NULL AS [Criterion!3!Name],
	NULL AS [Criterion!3!MappingFlag],
	NULL AS [Criterion!3!TrueMapping],
	NULL AS [Criterion!3!FalseMapping]
FROM
	[PrioritisationCategoryIrrelevance]

UNION ALL

SELECT
	3 AS Tag,
	1 AS Parent,
	[PrioritisationCategoryId] AS [Category!1!Id],
	NULL AS [Category!1!Name],
	NULL AS [Irrelevance!2!Id],
	NULL AS [Irrelevance!2!IrrelevanceFieldId],
	NULL AS [Irrelevance!2!IrrelevanceValueId],
	NULL AS [Irrelevance!2!IrrelevanceFlag],
	[Id] AS [Criterion!3!Id],
	[Code] AS [Criterion!3!Code],
	[Name] AS [Criterion!3!Name],
	[MappingFlag] AS [Criterion!3!MappingFlag],
	[TrueMapping] AS [Criterion!3!TrueMapping],
	[FalseMapping] AS [Criterion!3!FalseMapping]
FROM
	[PrioritisationCriterion]

ORDER BY
	[Category!1!Id],
	[Irrelevance!2!Id],
	[Criterion!3!Id]
	

FOR XML EXPLICIT


	

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileFieldValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 April 2007
-- Description:	gets a list of profile fields together
-- with their lookup values where applicable
-- =============================================
CREATE PROCEDURE [dbo].[spgaProfileFieldValue]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		REPLACE([ProfileSection].[ShortName], '' '', '''') AS [SectionName],
		REPLACE([ProfileQuestion].[ShortName], '' '', '''') AS [QuestionName],
		[ProfileQuestion].[IsPerSpecies],
		[ProfileQuestion].[IsRepeating],
		REPLACE([ProfileField].[ShortName], '' '', '''') AS [FieldName],
		[luDataFieldType].[Name] AS [DataType],
		[LookupValue]
	FROM
		[ProfileSection] INNER JOIN [ProfileQuestion] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]
		INNER JOIN [ProfileField] ON [ProfileQuestion].[Id] = [ProfileField].[ProfileQuestionId]
		INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldtype].[Id]
		LEFT JOIN [ReferenceValue] ON [ProfileField].[ReferenceTableId] = [ReferenceValue].[ReferenceTableId]
	ORDER BY
		[SectionNumber],
		[QuestionNumber],
		[FieldNumber],
		[SequenceNumber]
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaBaseReferenceData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 13 April 2007
-- Description:	gets XML version of all reference
--				data in the database
-- =============================================
CREATE PROCEDURE [dbo].[spgaBaseReferenceData]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[SqlType]
	FROM
		[luDataFieldType]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[IsContributor]
	FROM
		[luProfileUserRole]
	FOR XML AUTO

	SELECT
		[Id],
		[Name]
	FROM
		[luProfileVersionState]
	FOR XML AUTO
	
	SELECT
		[Id],
		[LookupValue],
		[SequenceNumber]
	FROM
		[luSectionReviewFrequency]
	FOR XML AUTO
	
	SELECT
		[Id],
		[Name]
	FROM
		[PrioritisationCategory]
	FOR XML AUTO

	SELECT
		[Id],
		[PrioritisationCategoryId],
		[IrrelevanceFieldId],
		[IrrelevanceValueId],
		[IrrelevanceFlag]
	FROM
		[PrioritisationCategoryIrrelevance]
	FOR XML AUTO

	SELECT
		[Id],
		[PrioritisationCategoryId],
		[Code],
		[Name],
		[Weighting],
		[MappingFlag],
		[TrueMapping],
		[FalseMapping]
	FROM
		[PrioritisationCriterion]
	FOR XML AUTO

	SELECT
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score],
		[SequenceNumber]
	FROM
		[PrioritisationCriterionValue]
	FOR XML AUTO

	SELECT
		[Id],
		[LowerBound],
		[UpperBound]
	FROM 
		[PrioritisationRankingRange]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[ShortName],
		[ProfileQuestionId],
		[FieldNumber],
		[DataFieldTypeId],
		[IsMandatory],
		[ReferenceTableId],
		[IsReadOnlyCurrentSituation],
		[IsReadOnlyScenario],
		[DefaultValue]
	FROM
		[ProfileField]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[ShortName],
		[ProfileSectionId],
		[QuestionNumber],
		[IsPerSpecies],
		[IsRepeating],
		[UserGuidance],
		[IrrelevanceFieldId],
		[IrrelevanceValueId],
		[IrrelevanceFlag]
	FROM
		[ProfileQuestion]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[ShortName],
		[SectionNumber]
	FROM
		[ProfileSection]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[IsMaintainable]
	FROM
		[ReferenceTable]
	FOR XML AUTO
	
	SELECT
		[Id],
		[ReferenceTableId],
		[LookupValue],
		[SequenceNumber]
	FROM
		[ReferenceValue]
	FOR XML AUTO

	SELECT
		[Id],
		[ParentId],
		[Name]/*,
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
		[ExportMarketValueComments]*/
	FROM
		[Species]
	FOR XML AUTO

	SELECT
		[Id],
		[Name],
		[ShortName],
		[FieldNumber],
		[ReferenceTableId],
		[DataFieldTypeId],
		[IsMandatory]
	FROM
		[SpeciesField]
	FOR XML AUTO

END





' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluProfileUserRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 29/05/2007
-- Description:	Gets all of the Profile User Roles
-- =============================================
CREATE PROCEDURE [dbo].[spgaluProfileUserRole] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     
		[Id], 
		[Name],
		[IsContributor]
	FROM 
		[luProfileUserRole]

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaluProfileUserRole] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgContributor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- =============================================
-- Author:		Robert Bath
-- Create date: 29 May 2007
-- Description:	gets a contributor by a given user Id
--				and return the sections that are accessible.
-- =============================================
CREATE PROCEDURE [dbo].[spgContributor]
	@UserId uniqueidentifier,
	@ProfileId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


If Exists 
		(
		SELECT  
				[UserId]
		FROM    
				[ProfileUser]
		WHERE     
				(
				[UserId] = @UserId
				) 
				AND 
				(
				[ProfileId] = @ProfileId
				)
		)
	BEGIN

		SELECT     
				[User].[Id], 
				[User].[UserName],
				[User].[FullName],
				[User].[Organisation], 
				[ProfileUser].[ProfileUserRoleId], 
				[luProfileUserRole].[Name], 
				[luProfileUserRole].[IsContributor],
				[User].[SsoUserId],
				[User].[LastUpdated]
		FROM     
				[User] INNER JOIN [ProfileUser] ON [User].[Id] = [ProfileUser].[UserId] INNER JOIN
				[luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id]

		WHERE
				[User].[Id] = @UserId AND [ProfileUser].[ProfileId] = @ProfileId


		SELECT
				[ProfileSectionId]
		FROM
				[ProfileSectionUser]
		WHERE
				(
				[UserId] = @UserId
				) 
				AND 
				(
				[ProfileId] = @ProfileId
				)

	END
	
ELSE
	BEGIN
		SELECT     
				[User].[Id], 
				[User].[UserName],
				[User].[FullName],
				[User].[Organisation], 
				Null, 
				Null, 
				Null, 
				[User].[SsoUserId],
				[User].[LastUpdated]
		FROM     
				[User] 

		WHERE
				[User].[Id] = @UserId

	END

END




' 
END
GO
GRANT EXECUTE ON [dbo].[spgContributor] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUserAuthorisation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard Northedge
-- Create date: 09/03/07
-- Description:	Gets authorisation information for logged in user
-- =============================================
-- 17/12/08: added SSO option
--
CREATE PROCEDURE [dbo].[spgUserAuthorisation]
	@UserName varchar(50) = NULL,
	@SsoUserId uniqueidentifier = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UserId uniqueidentifier
 
	IF @UserName IS NOT NULL BEGIN
		SELECT
			@UserId = [Id]
		FROM
			[User]
		WHERE
			[UserName] = @UserName

	END ELSE BEGIN

		SELECT
			@UserId = [Id]
		FROM
			[User]
		WHERE
			[SsoUserId] = @SsoUserId

	END

    SELECT
		[Id],
		[FullName],
		[Organisation],
		[IsProfileEditor],
		[IsPolicyProfileUser],
		[UserName],
		[SsoUserId],
		[IsUserManagementSystem]
	FROM
		[User]
	WHERE
		[Id] = @UserId

	SELECT
		[ProfileId],
		[ProfileUserRoleId],
		[Name],
		[IsContributor]
	FROM
		[ProfileUser] INNER JOIN [luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id]
	WHERE
		[ProfileUser].[UserId] = @UserId
		
	SELECT 
		[ProfileId],
		[ProfileSectionId]
	FROM
		[ProfileSectionUser]
	WHERE
		[ProfileSectionUser].[UserId] = @UserId
		
		
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgUserAuthorisation] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileContributorsByProfileId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Robert Bath
-- Create date: 25/05/2007
-- Description:	Gets all of the Profile Contributors for a given Profile
--				and return the sections that are accessible by each.
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileContributorsByProfileId] 
	-- Add the parameters for the stored procedure here
	@ProfileId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT     
		[User].[Id], 
		[User].[UserName], 
		[User].[FullName], 
		[User].[Organisation], 
		[ProfileUser].[ProfileUserRoleId], 
		[luProfileUserRole].[Name], 
		[luProfileUserRole].[IsContributor],
		[User].[SsoUserId],
		[User].[LastUpdated]
FROM    
		[ProfileUser] INNER JOIN [User] ON [ProfileUser].[UserId] = [User].[Id] 
		INNER JOIN [luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id]
WHERE   
		[ProfileUser].[ProfileId] = @ProfileId


SELECT 
		[UserId],
		[ProfileSectionId]
FROM
		[ProfileSectionUser]
WHERE
		(
			[ProfileId] = @ProfileId
		)


END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileContributorsByProfileId] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaPrioritisationVariables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Lynne Bentley
-- Create date: 30/05/07
-- Description:	Gets prioritisation ranking range, categories, criterion and values
-- =============================================
CREATE PROCEDURE [dbo].[spgaPrioritisationVariables] 

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Get ranking range
	SELECT
		[Id],
		[LowerBound],
		[UpperBound],
		[LastUpdated]
	FROM
		[PrioritisationRankingRange]
	WHERE
		[PrioritisationType]=''Profile''

	-- Get prioritisation categories
	SELECT
		[Id],
		[Name]
	FROM
		[PrioritisationCategory]


	-- Get category criterion
	SELECT
		[Id],
		[PrioritisationCategoryId],
		[Code],
		[Name],
		[Weighting]
	FROM
		[PrioritisationCriterion]
	ORDER BY
		[Code]

	-- Get criterion values
	SELECT
		[Id],
		[PrioritisationCriterionId],
		[CriterionValue],
		[Score]
	FROM
		[PrioritisationCriterionValue]
	ORDER BY
		[SequenceNumber]
		
END





' 
END
GO
GRANT EXECUTE ON [dbo].[spgaPrioritisationVariables] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuPrioritisationRankingRange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Lynne Bentley
-- Create date: 01/06/07
-- Description:	Update prioritisation ranking upper and lower bounds
-- =============================================
CREATE PROCEDURE [dbo].[spuPrioritisationRankingRange] 
	-- Add the parameters for the stored procedure here
	@UpperBound int, 
	@LowerBound int,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT,
	@PrioritisationType varchar(20)
AS
BEGIN

	SET NOCOUNT ON;

	IF NOT EXISTS(
		SELECT 
			[Id]
		FROM
			[PrioritisationRankingRange]
		WHERE
			[LastUpdated] = @LastUpdated

	) BEGIN
		RAISERROR(''Save failed.  The prioritisation variables have been edited by another user'',16,1)	END

	UPDATE
		[PrioritisationRankingRange]
    SET      
        [UpperBound] = @UpperBound,
		[LowerBound] = @LowerBound
	WHERE
		[PrioritisationType] = @PrioritisationType

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[PrioritisationRankingRange]


END

' 
END
GO
GRANT EXECUTE ON [dbo].[spuPrioritisationRankingRange] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceTableName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 12/06/2007
-- Description:	Gets a reference tables name, by given id
-- =============================================
CREATE PROCEDURE [dbo].[spgReferenceTableName] 
	-- Add the parameters for the stored procedure here
	@ReferenceTableId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     
		[Name]
	FROM        
		[ReferenceTable]
	WHERE     
		([Id] = @ReferenceTableId)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgReferenceTableName] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgMaintainableReferenceTables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 05 June 2007
-- Description:	Gets maintainable reference tables
-- =============================================
CREATE PROCEDURE [dbo].[spgMaintainableReferenceTables] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT		
		[Id], 
		[Name]
	FROM         
		[ReferenceTable]
	WHERE     
		(
		[IsMaintainable] = 1
		)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgMaintainableReferenceTables] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 1 May 2007
-- Modified:	Grant P. Turtle 20 Nov 2008 - Added NonTechnicalName
-- Description:	gets metadata for a single profile
--				question, including user guidance
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileQuestion]
	@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[ProfileQuestion].[Id],
		[ProfileQuestion].[Name],
		[ProfileQuestion].[ShortName],
		[ProfileQuestion].[QuestionNumber],
		[ProfileQuestion].[UserGuidance],
		[ProfileQuestion].[LastUpdated],
		[ProfileQuestion].[NonTechnicalName]
	FROM
		[ProfileQuestion]
	WHERE
		[ProfileQuestion].[Id] = @Id
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileQuestion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 1 May 2007
-- Modified:	Grant P. Turtle 13 Nov 2008 - Added @Name
-- Modified:	Grant P. Turtle 20 Nov 2008 - Added @NonTechnicalName
-- Description:	updates the user guidance for a 
--				profile question
-- =============================================
CREATE PROCEDURE [dbo].[spuProfileQuestion]
	@Id uniqueidentifier,
	@UserGuidance text,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT,
	@Name varchar(255),
	@NonTechnicalName varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[ProfileQuestion]
		WHERE
			[Id] = @Id AND
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The user guidance has been edited by another user'',16,1)
		RETURN
	END

    UPDATE
		[ProfileQuestion]
	SET
		[ProfileQuestion].[UserGuidance] = @UserGuidance,
		[ProfileQuestion].[Name]=@Name,
		[ProfileQuestion].[NonTechnicalName]=@NonTechnicalName
	WHERE
		[ProfileQuestion].[Id] = @Id

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ProfileQuestion]
	WHERE
		[ProfileQuestion].[Id] = @Id

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileQuestion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesTableAuditLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath	
-- Create date: 04 July 2007
-- Description:	Gets all of the records in the Species Data Audit Log 
-- =============================================
-- Modified:	Grant P. Turtle - 04 December 2008 - Added OldName, NewName, OldParent, NewParent. Removed SpeciesName.
-- =============================================
CREATE PROCEDURE [dbo].[spgaSpeciesTableAuditLog]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT     
		[SpeciesTableAuditLog].[Id],
		[User].[FullName], 
		[SpeciesTableAuditLog].[EffectiveDate],
		[SpeciesTableAuditLog].[LogDate], 
        [SpeciesTableAuditLog].[Reason],
		[SpeciesTableAuditLog].[OldName],
		[SpeciesTableAuditLog].[NewName],
		[SpeciesTableAuditLog].[OldParent],
		[SpeciesTableAuditLog].[NewParent]
	FROM         
		[SpeciesTableAuditLog] INNER JOIN [User] ON [SpeciesTableAuditLog].[UserId] = [User].[Id]
	
	ORDER BY
		[SpeciesTableAuditLog].[LogDate] DESC	
END




' 
END
GO
GRANT EXECUTE ON [dbo].[spgaSpeciesTableAuditLog] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaGlobalUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 23/04/2008
-- Description:	gets a list of all users with global
--				roles (profile editors and policy
--				profile users)
-- =============================================
CREATE PROCEDURE [dbo].[spgaGlobalUser]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		[Id],
		[UserName],
		[FullName],
		[Organisation],
		[IsProfileEditor],
		[IsPolicyProfileUser],
		[LastUpdated]
	FROM
		[User]
	WHERE
		[IsProfileEditor] = 1 OR [IsPolicyProfileUser] = 1
	ORDER BY
		[FullName]
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgaGlobalUser] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileContributor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Robert Bath
-- Create date: 30 May 2007
-- Description:	sets a user to be a profile contributor
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileContributor]
	@UserId uniqueidentifier,
	@UserName varchar(50),
	@FullName varchar(100),
	@Organisation varchar(100),
	@RoleId uniqueidentifier,
	@ProfileId uniqueidentifier,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Does User exist?
	IF EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[Id] = @UserId
		)
	BEGIN
		-- Throw error if timestamp is different 
		IF NOT EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[Id] = @UserId AND
			[LastUpdated] = @LastUpdated
		)	
			BEGIN
				RAISERROR(''The user information has been edited by another user'', 16, 1)
				RETURN
			END
		
		IF EXISTS --If user exists and is not an SSO user
			(SELECT
				*
			FROM
				[dbo].[User]
			WHERE
				[Id] = @UserId AND
				[SsoUserId] IS NULL)
		BEGIN

			-- Update User
			UPDATE
				[User]
			SET
				[UserName] = @UserName,
				[FullName] = @FullName,
				[Organisation] = @Organisation
			WHERE
				[Id] = @UserId

		END
	
		-- Does Profile User exist?
		IF EXISTS
			(
			SELECT
				[ProfileUserRoleId]
			FROM
				[ProfileUser]
			WHERE
				[UserId] = @UserId 
				AND [ProfileId] = @ProfileId
			)
				BEGIN
					
					-- Update Profile User
					UPDATE
						[ProfileUser]
					SET
						[ProfileUserRoleId] = @RoleId
					WHERE
						[UserId] = @UserId 
						AND [ProfileId] = @ProfileId
					
			END	ELSE BEGIN

					-- Insert Profile User
					INSERT INTO [ProfileUser]
						(
						[UserId],
						[ProfileId],
						[ProfileUserRoleId]
						)
					VALUES
						(
						@UserId,
						@ProfileId,
						@RoleId
						)
				END
	END ELSE BEGIN
	
	IF EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[UserName] = @UserName
		)	
			BEGIN
				RAISERROR(''There is already a user with the specified username'', 16, 1)
				RETURN
			END

		-- Insert User
		INSERT INTO [User]
			(
			[Id],
			[UserName],
			[FullName],
			[Organisation],
			[IsProfileEditor],
			[IsPolicyProfileUser]
			)
		VALUES
			(
			@UserId,
			@UserName,
			@FullName,
			@Organisation,
			0,
			0
			)
		
		-- Insert Profile User
		INSERT INTO [ProfileUser]
			(
			[UserId],
			[ProfileId],
			[ProfileUserRoleId]
			)
		VALUES
			(
			@UserId,
			@ProfileId,
			@RoleId
			)
	END

	-- Select Timestamp
	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileContributor] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiGlobalUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 23 April 2008
-- Description:	grants a user global rights - ie.
--				to be either a profile editor or
--				policy profile user
-- =============================================
CREATE PROCEDURE [dbo].[spiGlobalUser]
	@UserId uniqueidentifier,
	@UserName varchar(50),
	@FullName varchar(100),
	@Organisation varchar(100),
	@IsProfileEditor bit,
	@IsPolicyProfileUser bit,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @IsProfileEditor = @IsPolicyProfileUser BEGIN
		RAISERROR(''You cannot set the Profile Editor flag and the Policy Profile User flag to the same setting'', 16, 1)
		RETURN
	END

	IF EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[Id] = @UserId
		)
	BEGIN
		
		IF NOT EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[Id] = @UserId AND
			[LastUpdated] = @LastUpdated
		) BEGIN
			RAISERROR(''The User information has been edited by another user'', 16, 1)
			RETURN
		END

		UPDATE
			[User]
		SET
			[UserName] = @UserName,
			[FullName] = @FullName,
			[Organisation] = @Organisation,
			[IsProfileEditor] = @IsProfileEditor,
			[IsPolicyProfileUser] = @IsPolicyProfileUser
		WHERE
			[Id] = @UserId

	END ELSE BEGIN
	
	IF EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[UserName] = @UserName
		)	
			BEGIN
				RAISERROR(''There is already a user with the specified username'', 16, 1)
				RETURN
			END
	
	

		INSERT INTO [User]
			(
			[Id],
			[UserName],
			[FullName],
			[Organisation],
			[IsProfileEditor],
			[IsPolicyProfileUser]
			)
		VALUES
			(
			@UserId,
			@UserName,
			@FullName,
			@Organisation,
			@IsProfileEditor,
			@IsPolicyProfileUser
			)
	END

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiGlobalUser] TO [VLAProfilesUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spgUser]
GO
/****** Object:  StoredProcedure [dbo].[spgUser]    Script Date: 04/23/2008 14:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 17 May 2007
-- Description:	gets a user given a user Id
-- =============================================
CREATE PROCEDURE [dbo].[spgUser]
	@UserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[Id],
		[UserName],
		[FullName],
		[Organisation],
		[IsProfileEditor],
		[IsPolicyProfileUser],
		[SsoUserId],
		[LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spgUser] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdGlobalUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 23 April 2008
-- Description:	revokes global user rights, so
--				a user is not a profile editor or
--				policy profile user
-- =============================================
CREATE PROCEDURE [dbo].[spdGlobalUser]
	@UserId uniqueidentifier,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS
		(
		SELECT
			[Id]
		FROM
			[User]
		WHERE
			[Id] = @UserId AND
			[LastUpdated] = @LastUpdated
		) BEGIN
			RAISERROR(''The User information has been edited by another user'', 16, 1)
			RETURN
		END

	UPDATE
		[User]
	SET
		[IsProfileEditor] = 0,
		[IsPolicyProfileUser] = 0
	WHERE
		[Id] = @UserId

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[User]
	WHERE
		[Id] = @UserId
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spdGlobalUser] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiReviewComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 21/03/2007
-- Description:	insert a review comment
-- =============================================
-- RJN 14/4/08: Changed to allow threaded review comments
-- =============================================
CREATE PROCEDURE [dbo].[spiReviewComment] 
	@Id uniqueidentifier,
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier,
	@CommentDate datetime,
	@Subject varchar(255),
	@CommentReference varchar(255),
	@Comment text,
	@UserName varchar(50),
	@ParentId uniqueidentifier,
    @NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UserId uniqueidentifier

	SELECT
		@UserId = [Id]
	FROM
		[User]
	WHERE
		[UserName] = @UserName

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
	VALUES
		(
		@Id,
		@ProfileVersionId,
		@ProfileSectionId,
		@CommentDate,
		@Subject,
		@CommentReference,
		@Comment,
		@UserId,
		@ParentId
		)

    SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ReviewComment]
    WHERE
		[Id] = @Id

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spiReviewComment] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReviewCommentByProfileVersionSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 21/03/2007
-- Description:	get review comments for a section of a profile version
-- =============================================
-- RJN 14/4/08: Changed to allow threaded review comments
-- =============================================
CREATE PROCEDURE [dbo].[spgReviewCommentByProfileVersionSection]
	-- Add the parameters for the stored procedure here
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	WITH [ReviewCommentList] (
			[Id],
			[CommentDate],
			[Subject],
			[CommentReference],
			[Comment],
			[UserName],
			[FullName],
			[ProfileVersionId],
			[LastUpdated],
			[ParentId],
			[Level],
			[RowCode]
			) AS
	(

	SELECT
		[ReviewComment].[Id],
		[ReviewComment].[CommentDate],
		[ReviewComment].[Subject],
		[ReviewComment].[CommentReference],
		[ReviewComment].[Comment],
		[User].[UserName],
		[User].[FullName],
		@ProfileVersionId as ProfileVersionId,
		[ReviewComment].[LastUpdated],
		[ReviewComment].[ParentId],
		1 AS [Level],
		CONVERT(VARCHAR(1000), RIGHT(SPACE(10) + CONVERT(VARCHAR(10),ROW_NUMBER() OVER (ORDER BY [ReviewComment].[CommentDate] DESC)),10)) AS RowCode
	FROM
		[ReviewComment] INNER JOIN [User] ON [ReviewComment].[UserId] = [User].[Id]
	WHERE
		[ReviewComment].[ProfileVersionId] = @ProfileVersionId AND
		[ReviewComment].[ProfileSectionId] = @ProfileSectionId AND
		[ReviewComment].[ParentId] IS NULL

	UNION ALL

	SELECT
		[ReviewComment].[Id],
		[ReviewComment].[CommentDate],
		[ReviewComment].[Subject],
		[ReviewComment].[CommentReference],
		[ReviewComment].[Comment],
		[User].[UserName],
		[User].[FullName],
		@ProfileVersionId as ProfileVersionId,
		[ReviewComment].[LastUpdated],
		[ReviewComment].[ParentId],
		[ReviewCommentList].[Level] + 1 AS [Level],
		CONVERT(VARCHAR(1000), [ReviewCommentList].[RowCode] + RIGHT(SPACE(10) + CONVERT(VARCHAR(10),ROW_NUMBER() OVER (ORDER BY [ReviewComment].[CommentDate])),10)) AS RowCode
	FROM
		[ReviewComment] INNER JOIN [User] ON [ReviewComment].[UserId] = [User].[Id]
		INNER JOIN [ReviewCommentList] ON [ReviewComment].[ParentId] = [ReviewCommentList].[Id]
	WHERE
		[ReviewComment].[ProfileVersionId] = @ProfileVersionId AND
		[ReviewComment].[ProfileSectionId] = @ProfileSectionId

	)SELECT 
		[ReviewCommentList].[Id],
		[ReviewCommentList].[CommentDate],
		[ReviewCommentList].[Subject],
		[ReviewCommentList].[CommentReference],
		[ReviewCommentList].[Comment],
		[ReviewCommentList].[UserName],
		[ReviewCommentList].[FullName],
		[ReviewCommentList].[ProfileVersionId],
		[ReviewCommentList].[LastUpdated],
		[ReviewCommentList].[ParentId],
		[ReviewCommentList].[Level],
		[ReviewCommentList].[RowCode],
		ISNULL([ReviewCommentChildCount].[ChildCount], 0) AS [ChildCount]
	FROM
		[ReviewCommentList] LEFT JOIN
			(
			SELECT
				[ParentId],
				COUNT([ParentId]) AS [ChildCount]
			FROM
				[ReviewComment]
			WHERE
				[ReviewComment].[ProfileVersionId] = @ProfileVersionId AND
				[ReviewComment].[ProfileSectionId] = @ProfileSectionId
			GROUP BY
				[ParentId]
			) [ReviewCommentChildCount] ON [ReviewCommentList].[Id] = [ReviewCommentChildCount].[ParentId]
	ORDER BY
		[RowCode]

END

' 
END
GO
GRANT EXECUTE ON [dbo].[spgReviewCommentByProfileVersionSection] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceTableAudit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 11/06/2007
-- Description:	Gets the audit log for a given Reference Table
-- =============================================
CREATE PROCEDURE [dbo].[spgReferenceTableAudit] 
	-- Add the parameters for the stored procedure here
	@ReferenceTableId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     
		[ReferenceTableAuditLog].[Id], 
		[ReferenceTableAuditLog].[OldLookupValue], 
		[ReferenceTableAuditLog].[NewLookupValue], 
		[User].[FullName], 
        [ReferenceTableAuditLog].[EffectiveDate], 
		[ReferenceTableAuditLog].[LogDate], 
		[ReferenceTableAuditLog].[Reason]

	FROM    
		[ReferenceTableAuditLog] INNER JOIN [User] ON [ReferenceTableAuditLog].[UserId] = [User].[Id] 

	WHERE   
		(  
		[ReferenceTableAuditLog].[ReferenceTableId] = @ReferenceTableId
		)
	ORDER BY [ReferenceTableAuditLog].[LogDate] DESC

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgReferenceTableAudit] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileContributor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 30 May 2007
-- Description:	deletes a profile contributor
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileContributor]
	@ProfileUserId uniqueidentifier,
	@ProfileId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM
		[ProfileSectionUser]
	WHERE
		[UserId] = @ProfileUserId AND
		[ProfileId] = @ProfileId

	DELETE FROM 
		[ProfileUser]
	WHERE 
		[UserId] = @ProfileUserId
		AND [ProfileId] = @ProfileId
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileContributor] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionInfoById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Lisa Lungley
-- Create date: 15 June 2007
-- Description:	gets information for a single profile version by Id
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	26 October 2007
-- Reason:		Removed LastUpdated
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	08 August 2008
-- Reason:		Added ScenarioTitle and Parent Profile Id
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	26 August 2008
-- Reason:		Added affected species type and active flag
--
-- Edited By:	Grant P. Turtle
-- Edit Date:	16 December 2008
-- Reason:		Added IsPublic flag
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileVersionInfoById]
		@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 
    
	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempVersion.VersionMinor THEN 1 ELSE 0 END AS bit) AS IsLatestVersion,
		[ProfileVersion].[ScenarioTitle],
		[Profile].[ParentId],
		[ProfileVersion].[IsPublic]
	FROM
		[ProfileVersion] INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [EffectiveDateTo] IS NULL GROUP BY [ProfileId]
		) tempVersion ON [ProfileVersion].[ProfileId] = tempVersion.ProfileId
		INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
	WHERE
		[ProfileVersion].[Id] = @Id

	SELECT
		[Species].[Id],
		[Species].[Name],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersionSpecies] INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersionSpecies].[ProfileVersionId] = @Id
	ORDER BY
		[Species].[Name]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionInfoById] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 4 December 2008
-- Description:	Inserts a new species and audits the change
-- =============================================
CREATE PROCEDURE [dbo].[spiSpecies]
	@SpeciesId uniqueidentifier,
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@ParentId uniqueidentifier,
	@Name varchar(50)
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
		[Species]
	WHERE
		[Name] = @Name 
	) BEGIN
		RAISERROR(''Save failed: there is already a species with this name'', 16, 1)
		RETURN
	END

	DECLARE @NextSequenceNumber int
	IF @ParentId IS NULL
	BEGIN
		SELECT 
			@NextSequenceNumber = max(isnull([SequenceNumber], 0)) + 1
		FROM 
			[Species]
		WHERE 
			[ParentId] IS NULL
	END 
	ELSE
	BEGIN
		SELECT 
			@NextSequenceNumber = max(isnull([SequenceNumber], 0)) + 1
		FROM 
			[Species]
		WHERE 
			[ParentId] = @ParentId
	END

	DECLARE @ParentName varchar(50)
	IF @ParentId IS NULL
	BEGIN
		SET @ParentName = ''- root species -''
	END 
	ELSE
	BEGIN
		SELECT
			@ParentName = [Name]
		FROM
			[dbo].[Species]
		WHERE
			[Id]=@ParentId
	END

    INSERT INTO [Species]
		(
		[Id],
		[ParentId],
		[Name],
		[EffectiveDateFrom],
		[EffectiveDateTo],
		[SequenceNumber]
		)
	VALUES
		(
		@SpeciesId,
		@ParentId,
		@Name,
		@EffectiveDate,
		Null,
		isnull(@NextSequenceNumber, 1)
		) 


    INSERT INTO [SpeciesTableAuditLog]
		(
		[Id],
		[OldName],
		[NewName],
		[OldParent],
		[NewParent],
		[UserId],
		[EffectiveDate],
		[LogDate],
		[Reason]
		)
	VALUES
		(
		newid(),
		''- new entry -'',
		@Name,
		''- new entry -'',
		@ParentName,
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		) 


END












' 
END
GO
GRANT EXECUTE ON [dbo].[spiSpecies] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 14 March 2007
-- Description:	gets current profiles
--
-- Edited By:	Robert Bath
-- Edit Date:	02 May 2007
-- Reason:		Remove Deleted Flag and passed VersionState as Parameter
--
-- Edited By:	Lisa Lungley
-- Edit Date:	27 June 2007
-- Reason:		Added IsLatestVersion
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	15 August 2008
-- Reason:		Added scenario information
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	26 August 2008
-- Reason:		Added affected species type and active flag
--
-- Edited By:	Grant P. Turtle
-- Edit Date:	16 December 2008
-- Reason:		Added IsPublic flag
-- =============================================
CREATE PROCEDURE [dbo].[spgaCurrentProfile]

@ProfileVersionState varchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 

    SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempVersion.VersionMinor THEN 1 ELSE 0 END AS bit) AS IsLatestVersion,
		[ProfileVersion].[ScenarioTitle],
		[Profile].[ParentId],
		[ProfileVersion].[IsPublic]
	FROM
		[ProfileVersion]  INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [EffectiveDateTo] IS NULL GROUP BY [ProfileId]
		) tempVersion ON [ProfileVersion].[ProfileId] = tempVersion.ProfileId
		INNER JOIN [luProfileVersionState] 
		ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = @ProfileVersionState
	ORDER BY
		[ProfileVersion].[Title]

	SELECT
		[ProfileVersion].[Id],
		[Species].[Name],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [Species].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId]
		INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = @ProfileVersionState
	ORDER BY
		[Species].[Name]
END








' 
END
GO
GRANT EXECUTE ON [dbo].[spgaCurrentProfile] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 15 March 2007
-- Description:	gets history of published profile
--
-- Edited By:	Lisa Lungley
-- Edit Date:	27 June 2007
-- Reason:		Added IsLatestVersion
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	15 August 2008
-- Reason:		Added scenario information
--
-- Edited By:	Richard J. Northedge
-- Edit Date:	26 August 2008
-- Reason:		Added affected species type and active flag
--
-- Edited By:	Grant P. Turtle
-- Edit Date:	16 December 2008
-- Reason:		Added IsPublic flag
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileHistory]
	@ProfileId uniqueidentifier,
	@StateName varchar(50),
	@PublicOnly bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF ((@StateName = ''Draft'') AND (@PublicOnly = 1)) 
	BEGIN
		RAISERROR(''No draft profiles that are public'',16,1)
		RETURN
	END

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 

    SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempVersion.VersionMinor THEN 1 ELSE 0 END AS bit) AS IsLatestVersion,
		[ProfileVersion].[ScenarioTitle],
		[Profile].[ParentId],
		[ProfileVersion].[IsPublic]
	FROM
		[ProfileVersion] INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [EffectiveDateTo] IS NULL GROUP BY [ProfileId]
		) tempVersion ON [ProfileVersion].[ProfileId] = tempVersion.ProfileId
		INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
	WHERE
		[ProfileVersion].[ProfileId] = @ProfileId AND
		[luProfileVersionState].[Name] = @StateName AND
		[ProfileVersion].[IsPublic] = (CASE @PublicOnly WHEN 1 THEN 1 ELSE [ProfileVersion].[IsPublic] END)
	ORDER BY
		[ProfileVersion].[VersionMajor] DESC,
		[ProfileVersion].[VersionMinor] DESC

	SELECT
		[ProfileVersion].[Id],
		[Species].[Name],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [Species].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId]
		INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersion].[ProfileId] = @ProfileId AND
		[luProfileVersionState].[Name] = @StateName AND
		[ProfileVersion].[IsPublic] = (CASE @PublicOnly WHEN 1 THEN 1 ELSE [ProfileVersion].[IsPublic] END)
	ORDER BY
		[Species].[Name]
END






' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileHistory] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChildSpecies]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 22 June 2007
-- Description:	Gets a list of descendent species for
--				a given species Id
-- =============================================
CREATE FUNCTION [dbo].[GetChildSpecies]
(
	@SpeciesId uniqueidentifier
)
RETURNS 
@tmpChildSpecies TABLE
(
	Id uniqueidentifier,
	ChildCount int,
	PassNumber int
)
AS
BEGIN
		
DECLARE @tmpSpecies TABLE
	(
	Id uniqueidentifier,
	ChildCount int
	)

INSERT INTO @tmpSpecies
SELECT
	[ParentSpecies].[Id],
	COUNT([ChildSpecies].[Id])
FROM
	[Species] ParentSpecies LEFT JOIN [Species] ChildSpecies ON ParentSpecies.Id = ChildSpecies.ParentId
GROUP BY
	[ParentSpecies].[Id]

DECLARE
	@Pass int,
	@RowCount int

SET @Pass = 1
SET @RowCount = 0

INSERT INTO @tmpChildSpecies
	(
	Id,
	ChildCount,
	PassNumber
	)
SELECT
	[Species].[Id],
	[ChildCount],
	@Pass 
FROM
	@tmpSpecies tmpSpecies INNER JOIN [Species] ON tmpSpecies.Id = [Species].[Id]
WHERE
	[Species].[Id] = @SpeciesId

SELECT
	@RowCount = @@RowCount,
	@Pass = @Pass + 1

WHILE (@RowCount != 0) BEGIN

    INSERT INTO @tmpChildSpecies 
		(
		Id,
		ChildCount,
		PassNumber
		)
    SELECT
        tmpSpecies.Id,
        tmpSpecies.ChildCount,
        @Pass
    FROM
		@tmpSpecies tmpSpecies INNER JOIN [Species] ON tmpSpecies.[Id] = [Species].[Id]
		INNER JOIN @tmpChildSpecies tmpChildSpecies on tmpChildSpecies.Id = Species.ParentID
    WHERE
		tmpChildSpecies.PassNumber = @Pass - 1

    SELECT @RowCount = @@RowCount, @Pass = @Pass + 1

END
	
	RETURN 
END


' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 22/03/2007
-- Description:	gets a list of all species
-- =============================================
CREATE PROCEDURE [dbo].[spgaSpecies]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DateNow As SmallDateTime
	SET @DateNow = DateAdd(mi, 1, GETDATE()) 


	SELECT
		[Species].[Id],
		[Species].[ParentId],
		[Species].[Name],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive],
		CAST(CASE WHEN [tmpProfileVersionSpecies].[SpeciesId]IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse]
	FROM
		[Species] LEFT JOIN 
		(	SELECT [SpeciesId] 
			FROM [ProfileVersionSpecies] 
			GROUP BY [SpeciesId]
		) AS tmpProfileVersionSpecies ON [tmpProfileVersionSpecies].[SpeciesId] = [Species].[Id]
	ORDER BY
		ISNULL([Species].[SequenceNumber], 999),
		[Species].[EffectiveDateFrom]


END



' 
END
GO
GRANT EXECUTE ON [dbo].[spgaSpecies] TO [VLAProfilesUser]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- -- =============================================
-- Author:		Grant P. Turtle
-- Create date: 25 July 2007
-- Description:	Deletes a species and audits the change
-- =============================================
CREATE PROCEDURE [dbo].[spdSpecies]
	-- Add the parameters for the stored procedure here
	@SpeciesId uniqueidentifier,
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

	-- Check timestamp is valid
	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[Species]
		WHERE
			[Id] = @SpeciesId 
			AND [LastUpdated] = @LastUpdated
		) 
			BEGIN
				RAISERROR(''The species cannot be deleted because it has been edited by another user'',16,1)
				RETURN
			END

	DECLARE @OldName varchar(50)
	DECLARE @ParentId uniqueidentifier
	DECLARE @SequenceNumber int
	SELECT
		@OldName = [Name],
		@ParentId = [ParentId],
		@SequenceNumber = [SequenceNumber]
	FROM
		[dbo].[Species]
	WHERE
		[Id]=@SpeciesId


	DECLARE @OldParent varchar(50)
	IF @ParentId IS NULL
	BEGIN
		SET @OldParent = ''- root species -''
	END
	ELSE
	BEGIN
		SELECT
			@OldParent = [Name]
		FROM
			[dbo].[Species]
		WHERE
			[Id]=@ParentId
	END

	--Insert Audit (parent)
    INSERT INTO [SpeciesTableAuditLog]
		(
		[Id],
		[UserId],
		[EffectiveDate],
		[LogDate],
		[Reason],
		[OldName],
		[NewName],
		[OldParent],
		[NewParent]
		)
	VALUES
		(
		newid(),
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason,
		@OldName,
		''- to be deleted -'',
		@OldParent,
		''- to be deleted -''
		) 


	DECLARE @EmptyGuid uniqueidentifier
	SET @EmptyGuid = ''00000000-0000-0000-0000-000000000000''
	
	UPDATE 
		[Species]
	SET
		[SequenceNumber] = [SequenceNumber] - 1
	WHERE
		ISNULL([ParentId], @EmptyGuid) = ISNULL(@ParentId, @EmptyGuid) AND
		[SequenceNumber] > @SequenceNumber
			
	-- Delete Species
	DELETE FROM
		[SpeciesFieldValue]
	WHERE
		[SpeciesId] = @SpeciesId

	DELETE FROM
		[SpeciesPrioritisationScore]
	WHERE
		[SpeciesId] = @SpeciesId

    DELETE FROM
		[Species]
	WHERE
		[Id] = @SpeciesId


END





' 
END
GO
GRANT EXECUTE ON [dbo].[spdSpecies] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Robert Bath
-- Create date: 25 July 2007
-- Description:	Updates a species and audits the change
-- =============================================
-- RJN 22/11/07: Added Supporting Comments fields
-- RJN 06/02/08: Removed the update of the EffectiveDateFrom field (UATD23)
-- JE 11/08/08:	 Added GBHoldingCount & GBPopulation
-- GPT 03/12/08: Removed hardcoded column updates and structure of AduitLog
-- JE 11/03/09: Fixed sequence number bug
-- RJN 23/03/09: Fixed sequence number bug
CREATE PROCEDURE [dbo].[spuSpecies]
	-- Add the parameters for the stored procedure here
	@SpeciesId uniqueidentifier,
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@ParentId uniqueidentifier,
	@Name varchar(50),
	@LastUpdated timestamp
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EffectiveDate smalldatetime
	SET @EffectiveDate = GETDATE()
	
	IF EXISTS
	(
	SELECT
		[Id]
	FROM
		[Species]
	WHERE
		[Name] = @Name 
		AND [Id] <> @SpeciesId
	) BEGIN
		RAISERROR(''Save failed: there is already a species with this name'', 16, 1)
		RETURN
	END

	-- Check timestamp is valid
	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[Species]
		WHERE
			[Id] = @SpeciesId 
			AND [LastUpdated] = @LastUpdated
		) 
			BEGIN
				RAISERROR(''The species cannot be updated because it has been edited by another user'',16,1)
				RETURN
			END

	DECLARE @OldName varchar(50)
	DECLARE @OldParentId uniqueidentifier
	SELECT
		@OldName = [Name],
		@OldParentId = [ParentId]
	FROM
		[dbo].[Species]
	WHERE
		[Id]=@SpeciesId


	DECLARE @OldParent varchar(50)
	IF @OldParentId IS NULL
	BEGIN
		SET @OldParent = ''- root species -''
	END
	ELSE
	BEGIN
	SELECT
		@OldParent = [Name]
	FROM
		[dbo].[Species]
	WHERE
		[Id]=@OldParentId
	END

	DECLARE @NewParent varchar(50)
	IF @ParentId IS NULL
	BEGIN
		SET @NewParent = ''- root species -''
	END
	ELSE
	BEGIN
		SELECT
			@NewParent = [Name]
		FROM
			[dbo].[Species]
		WHERE
			[Id]=@ParentId
	END

	DECLARE @NextSequenceNumber int
	IF isnull(@ParentId, ''00000000-0000-0000-0000-000000000000'') <> isnull(@OldParentId, ''00000000-0000-0000-0000-000000000000'')
	BEGIN	

		IF @ParentId IS NULL		
		BEGIN
					
			IF Exists
			(
			SELECT 
				[SequenceNumber]
			FROM 
				[Species]
			WHERE 
				[ParentId] IS NULL
			)
				BEGIN
					SELECT 
						@NextSequenceNumber = max(isnull([SequenceNumber], 0)) + 1
					FROM 
						[Species]
					WHERE 
						[ParentId] IS NULL
				END
				ELSE
				BEGIN
					SET @NextSequenceNumber = 1
				END
		END
		ELSE
		BEGIN

			IF Exists
			(
			SELECT 
				[SequenceNumber]
			FROM 
				[Species]
			WHERE 
				[ParentId] = @ParentId
			)
				BEGIN
					SELECT 
						@NextSequenceNumber = max(isnull([SequenceNumber], 0)) + 1
					FROM 
						[Species]
					WHERE 
						[ParentId] = @ParentId
				END
				ELSE
				BEGIN
					SET @NextSequenceNumber = 1
				END			
		END
	END
	ELSE
	BEGIN
	
		SELECT 
			@NextSequenceNumber = [SequenceNumber]
		FROM 
			[Species]
		WHERE 
			[Id] = @SpeciesId
	END 

	-- Update Species
    UPDATE 
		[Species]
	SET
		[ParentId] = @ParentId,
		[Name] = @Name,
		[SequenceNumber] = @NextSequenceNumber
	WHERE
		[Id] = @SpeciesId

	--Insert Audit (parent)
    INSERT INTO [SpeciesTableAuditLog]
		(
		[Id],
		[UserId],
		[EffectiveDate],
		[LogDate],
		[Reason],
		[OldName],
		[NewName],
		[OldParent],
		[NewParent]
		)
	VALUES
		(
		newid(),
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason,
		@OldName,
		@Name,
		@OldParent,
		@NewParent
		) 

END










' 
END
GO
GRANT EXECUTE ON [dbo].[spuSpecies] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Robert Bath
-- Create date: 25 July 2007
-- Description:	Inactivates a species and audits the change
-- =============================================
-- GPT 04/12/2008: Changed structure of audit table and changed parameters
-- =============================================
CREATE PROCEDURE [dbo].[sppSpecies]
	-- Add the parameters for the stored procedure here
	@SpeciesId uniqueidentifier,
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

	-- Check timestamp is valid
	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[Species]
		WHERE
			[Id] = @SpeciesId 
			AND [LastUpdated] = @LastUpdated
		) 
			BEGIN
				RAISERROR(''The species cannot be inactivated because it has been edited by another user'',16,1)
				RETURN
			END

	DECLARE @OldParentId uniqueidentifier
	DECLARE @OldName varchar(50)
	SELECT
		@OldParentId = [ParentId],
		@OldName = [Name]
	FROM
		[dbo].[Species]
	WHERE
		[Id]=@SpeciesId

	DECLARE @OldParent varchar(50)
	IF @OldParentId IS NULL
	BEGIN
		SET @OldParent = ''- root species -''
	END
	ELSE
	BEGIN
		SELECT
			@OldParent = [Name]
		FROM
			[dbo].[Species]
		WHERE
			[Id]=@OldParentId
	END


	--Insert Audit (parent)
    INSERT INTO [SpeciesTableAuditLog]
		(
		[Id],
		[UserId],
		[EffectiveDate],
		[LogDate],
		[Reason],
		[OldName],
		[NewName],
		[OldParent],
		[NewParent]
		)
	VALUES
		(
		newid(),
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason,
		@OldName,
		''- to be inactivated -'',
		@OldParent,
		''- to be inactivated -''
		) 

	-- Update Species
    UPDATE 
		[Species]
	SET
		[EffectiveDateTo] = @EffectiveDate
	WHERE
		[Id] = @SpeciesId

END


' 
END
GO
GRANT EXECUTE ON [dbo].[sppSpecies] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsAncestorSpecies]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 22 May 2007
-- Description:	determines if a given species is
--				an ancestor of another species in 
--				the species tree
-- =============================================
CREATE FUNCTION [dbo].[IsAncestorSpecies]
(
	@SpeciesId uniqueidentifier,
	@ParentSpeciesId uniqueidentifier
)
RETURNS bit
AS
BEGIN
	DECLARE @ParentId uniqueidentifier

	SELECT
		@ParentId = [ParentId]
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId

	IF @ParentId IS NULL BEGIN
		RETURN 0
	END

	IF @ParentId = @ParentSpeciesId BEGIN
		RETURN 1
	END

	RETURN dbo.IsAncestorSpecies(@ParentId, @ParentSpeciesId)

END

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReviewComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 21/03/2007
-- Description:	deletes a review comment
-- =============================================
CREATE PROCEDURE [dbo].[spdReviewComment]
	@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE
		[ReviewComment]
	WHERE
		[Id] = @Id
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdReviewComment] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReviewComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 21/03/2007
-- Description:	updates a review comment
-- =============================================
-- RJN 14/4/08: Changed to add subject field
-- =============================================
CREATE PROCEDURE [dbo].[spuReviewComment]
	@Id uniqueidentifier,
	@Subject varchar(255),
	@CommentReference varchar(255),
	@Comment text,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[ReviewComment]
		WHERE
			[Id] = @Id AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The Review Comment has been edited by another user'',16,1)
		RETURN
	END

    UPDATE
		[ReviewComment]
	SET
		[Subject] = @Subject,
		[CommentReference] = @CommentReference,
		[Comment] = @Comment
	WHERE
		[Id] = @Id

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ReviewComment]
	WHERE
		[Id] = @Id

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuReviewComment] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiErrorLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath	
-- Create date: 14 August 2007
-- Description:	Inserts information about an error into the Error Log table
-- =============================================
-- RJN 19/01/08: altered in line with changes to structure of the ErrorLog table
--
CREATE PROCEDURE [dbo].[spiErrorLog]
	@Id uniqueidentifier, 
	@ErrorType varchar(255),
	@Exception varchar(MAX), 
	@StackTrace varchar(MAX), 
	@ApplicationName varchar(100),
	@VersionName varchar(100),
	@Request varchar(255),
	@Username varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [ErrorLog]
		(
		[Id],
		[ErrorType],
		[Exception],
		[StackTrace],
		[LogDate],
		[Username],
		[ApplicationName],
		[VersionName],
		[Request]
		)
	VALUES
		(
		@Id,
		@ErrorType,
		@Exception,
		@StackTrace,
		GETDATE(),
		@Username,
		@ApplicationName,
		@VersionName,
		@Request
		) 
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiErrorLog] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 16/03/2007
-- Description:	gets a list of profile sections
-- =============================================
-- RJN 25/06/08: Added Note column
-- =============================================
CREATE PROCEDURE [dbo].[spgaProfileSection]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[ProfileSection].[Id],
		[ProfileSection].[Name],
		[ProfileSection].[ShortName],
		[ProfileSection].[SectionNumber],
		[ProfileSection].[Note]
	FROM
		[ProfileSection]
	ORDER BY
		[ProfileSection].[SectionNumber]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaProfileSection] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppProfileVersionCurrency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 June 2007
-- Description:	Updates the EffectiveDateTo of profile
--					versions to make them non-current.
-- Edited By:	Richard J. Northedge
-- Edit Date:	12 August 2008
-- Reason:		Changes because of the profile scenario req.
-- =============================================
CREATE PROCEDURE [dbo].[sppProfileVersionCurrency]
	@ProfileVersionId uniqueidentifier,
	@State varchar(50),
	@EffectiveDateTo smalldatetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ProfileId uniqueidentifier

	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[ProfileVersion]
		WHERE
			[Id] = @ProfileVersionId AND
			[EffectiveDateTo] IS NULL
	) BEGIN
		RAISERROR(''The specified profile version is not the latest version of this profile. The profile may have been altered by another user.'',16,1)
		RETURN	
	END

	UPDATE
		[ProfileVersion]
	SET
		[EffectiveDateTo] = @EffectiveDateTo
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	WHERE
		[ProfileVersion].[Id] = @ProfileVersionId AND
		[luProfileVersionState].[Name] = ''Draft''
   
	IF @State = ''Published'' BEGIN

		SELECT
			@ProfileId = [ProfileId]
		FROM
			[ProfileVersion]
		WHERE
			[Id] = @ProfileVersionId

		UPDATE
			[ProfileVersion]
		SET
			[EffectiveDateTo] = @EffectiveDateTo
		FROM
			[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		WHERE
			[ProfileVersion].[ProfileId] = @ProfileId AND
			[luProfileVersionState].[Name] = ''Published'' AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[ProfileVersion].[Id] != @ProfileVersionId

	END 

END

' 
END
GO
GRANT EXECUTE ON [dbo].[sppProfileVersionCurrency] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 8 May 2007
-- Description:	creates a new profile row
-- Edited By:	Richard J. Northedge
-- Edit Date:	8 August 2008
-- Reason:		Changes because of the profile scenario req.
-- =============================================
CREATE PROCEDURE [dbo].[spiProfile]
	@ProfileId uniqueidentifier,
	@ParentId uniqueidentifier = NULL,
	@Title varchar(255) = NULL,
	@ScenarioTitle varchar(255) = NULL,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @Title IS NOT NULL BEGIN

		IF @ParentId IS NOT NULL BEGIN
			RAISERROR(''The profile title of a "what-if" scenario cannot be set'',16,1)
			RETURN
		END

		IF EXISTS (
			SELECT 
				[Id]
			FROM	
				[Profile] 
			WHERE
				[Title] = @Title AND
				[Id] != @ProfileId
		) BEGIN
			RAISERROR(''The profile title is already in use for a different profile'',16,1)
			RETURN
		END
	END

	IF @ScenarioTitle IS NOT NULL BEGIN

		IF @ParentId IS NULL BEGIN
			RAISERROR(''The scenario title of a "current situation" profile cannot be set'',16,1)
			RETURN
		END

		IF EXISTS (
			SELECT 
				[Id]
			FROM	
				[Profile] 
			WHERE
				[ScenarioTitle] = @ScenarioTitle AND
				[ParentId] = @ParentId AND
				[Id] != @ProfileId
		) BEGIN
			RAISERROR(''The scenario title is already in use for a different scenario belonging to the same profile'',16,1)
			RETURN
		END
	END

    INSERT INTO [Profile]
		(
		[Id],
		[ParentId],
		[Title],
		[ScenarioTitle]
		)
	VALUES
		(
		@ProfileId,
		@ParentId,
		@Title,
		@ScenarioTitle
		)

	SELECT
		@NewLastUpdated = [LastUpdated]
    FROM
		[Profile]
    WHERE
		[Id] = @ProfileId

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfile] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaluSectionReviewFrequency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Lisa Lungley
-- Create date: 31/05/2007
-- Description:	Gets all of the look-up values from look-up table SectionReviewFrequency
-- =============================================
CREATE PROCEDURE [dbo].[spgaluSectionReviewFrequency]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     
		[Id], 
		[LookupValue],
		[SequenceNumber]

	FROM 
		[luSectionReviewFrequency]
	ORDER BY
		[SequenceNumber]

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaluSectionReviewFrequency] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath		
-- Create date: 11 July 2007
-- Description:	Gets a species by speciesId
-- =============================================
-- JE: Added retrieval of GBHoldingCount & GBPopulation
-- GPT: 04 December 2008 - Changed CurrentDate so it no longer adds a minute to GetDate()
--						 - Removed and changed resultsets as per 3736
CREATE PROCEDURE [dbo].[spgSpeciesById]
	@SpeciesId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @ChildCount int, @ActiveChildCount int

    DECLARE @CurrentDate smalldatetime
    SET @CurrentDate = GetDate()

	-- Get child count
	SELECT
		@ChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId

	-- Get active child count
	SELECT
		@ActiveChildCount = COUNT(tmpChildSpecies.[Id])
	FROM
		dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies INNER JOIN [Species] ON tmpChildSpecies.[Id] = [Species].[Id]
	WHERE
		tmpChildSpecies.[Id] != @SpeciesId AND
		([Species].[EffectiveDateTo] IS NULL OR @CurrentDate BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo])

	SELECT     
		[Species].[Name], 
		[Species].[ParentId],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @CurrentDate BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive],
		CAST(CASE WHEN [tmpProfileVersionSpecies].[SpeciesId]IS NULL AND [tmpPrioritisationScore].[SpeciesId] IS NULL THEN 0 ELSE 1 END AS bit) AS [IsInUse],
		@ChildCount AS ChildCount,
		@ActiveChildCount AS ActiveChildCount,
		[Species].[LastUpdated]
	FROM [dbo].[Species] LEFT JOIN 
		(	SELECT [SpeciesId] 
			FROM [ProfileVersionSpecies] 
			GROUP BY [SpeciesId]
		) AS tmpProfileVersionSpecies ON [tmpProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		LEFT JOIN
		(	SELECT [SpeciesId] 
			FROM [PrioritisationScore] 
			GROUP BY [SpeciesId]
		) AS tmpPrioritisationScore ON [tmpPrioritisationScore].[SpeciesId] = [Species].[Id]

	WHERE     
		[Species].[Id] = @SpeciesId
		
END






' 
END
GO
GRANT EXECUTE ON [dbo].[spgSpeciesById] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesValidParents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Robert Bath
-- Create date: 23 July 2007
-- Description:	Gets list of species that are possible valid parents for edited species
-- =============================================
CREATE PROCEDURE [dbo].[spgSpeciesValidParents]
	-- Add the parameters for the stored procedure here
	@SpeciesID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT 
	[Species].[Id], 
	[Species].[Name] 
FROM
	[Species] LEFT JOIN dbo.GetChildSpecies(@SpeciesID) tmpChildSpecies ON [Species].[Id] = tmpChildSpecies.Id
WHERE 
	([Species].[EffectiveDateTo] IS NULL OR GETDATE() BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo]) AND
	tmpChildSpecies.Id IS NULL
ORDER BY
	[Species].[Name] 
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgSpeciesValidParents] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppPrioritisationScore]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 14 August 2007
-- Description:	recalculates the values for the derived
--				PrioritisationScore table
-- =============================================
-- 30/04/08 RJN: modified to support draft prioritisation
-- 20/08/08 RJN: modified to support multiple irrelevance checks
-- 28/11/08 GPT: added where clause to first select
CREATE PROCEDURE [dbo].[sppPrioritisationScore]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- read in the upper and lower bounds from the ranking range table
    DECLARE
		@UpperBound as decimal(25,10),
		@LowerBound decimal(25,10),
		@Range decimal(25,10)

	SELECT
		@UpperBound = [UpperBound],
		@LowerBound = [LowerBound],
		@Range = [UpperBound] - [LowerBound]
	FROM
		[PrioritisationRankingRange]
	WHERE
		[PrioritisationType]=''Profile''

	-- update the PrioritisationCategory table with derived minimum score,
	-- maximum score and modifier figures, based on the values in 
	-- PrioritisationCriterion and PrioritisationCriterionValue
	-- (these may have been changed via the Maintain Prioritisation
	-- Variables page)
	UPDATE
		[PrioritisationCategory]
	SET
		[MinimumScore] = CASE WHEN tmpIrrelevance.[IrrelevanceCount] IS NULL THEN tmpCategory.[MinimumScore] ELSE 0 END,
		[MaximumScore] = tmpCategory.[MaximumScore],
		[Modifier] = (tmpCategory.[MaximumScore] - CASE WHEN tmpIrrelevance.[IrrelevanceCount] IS NULL THEN tmpCategory.[MinimumScore] ELSE 0 END) / @Range
	FROM
		[PrioritisationCategory] INNER JOIN
			(
			SELECT
				[PrioritisationCategory].[Id],	
				SUM(tmpScore.[MinScore] * [PrioritisationCriterion].[Weighting]) AS [MinimumScore],
				SUM(tmpScore.[MaxScore] * [PrioritisationCriterion].[Weighting]) AS [MaximumScore]
			FROM
				[PrioritisationCriterion] INNER JOIN [PrioritisationCategory] ON [PrioritisationCriterion].[PrioritisationCategoryId] = [PrioritisationCategory].[Id]
				INNER JOIN
					(SELECT
						[PrioritisationCriterionId],
						MIN([Score]) AS [MinScore],
						MAX([Score]) AS [MaxScore]
					FROM
						[PrioritisationCriterionValue]
					GROUP BY
						[PrioritisationCriterionId]) tmpScore ON [PrioritisationCriterion].[Id] = tmpScore.[PrioritisationCriterionId]
			GROUP BY
				[PrioritisationCategory].[Id]	
			) tmpCategory ON [PrioritisationCategory].[Id] = tmpCategory.[Id]
		LEFT JOIN
			(
			SELECT
				[PrioritisationCategoryId],
				COUNT([Id]) AS [IrrelevanceCount]
			FROM
				[PrioritisationCategoryIrrelevance]
			GROUP BY
				[PrioritisationCategoryId]
			) AS tmpIrrelevance ON [PrioritisationCategory].[Id] = tmpIrrelevance.[PrioritisationCategoryId]

	-- rebuild the data in the PrioritisationScore table
	DELETE FROM [PrioritisationScore]

	-- insert the per-category data for categories that have values in
	-- [ProfileVersionSpeciesPrioritisation]
	INSERT INTO [PrioritisationScore]
		(
		[ProfileVersionId],
		[SpeciesId],
		[PrioritisationCategoryId],
		[Score],
		[Rank]
		)
	SELECT
		[ProfileVersionId],
		[SpeciesId],
		[PrioritisationCategoryId],
		CASE WHEN [DataIncomplete] = 1 THEN NULL ELSE [Score] END AS [Score],
		CASE WHEN [DataIncomplete] = 1 THEN NULL ELSE ROUND(@LowerBound + (CAST([Score] AS decimal(25,10)) - CAST([MinimumScore] AS decimal(25,10))) / [Modifier], 0) END AS [Rank]
	FROM
		(
		SELECT
			[ProfileVersionSpeciesPrioritisation].[ProfileVersionId],
			[ProfileVersionSpeciesPrioritisation].[SpeciesId],
			[PrioritisationCriterion].[PrioritisationCategoryId],
			ISNULL(SUM([PrioritisationCriterionValue].[Score] * [PrioritisationCriterion].[Weighting]), 0) AS [Score],
			MAX(CAST([ProfileVersionSpeciesPrioritisation].[IsMissing] AS integer)) AS [DataIncomplete]
		FROM
			[ProfileVersionSpeciesPrioritisation] INNER JOIN [PrioritisationCriterion] ON [ProfileVersionSpeciesPrioritisation].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
			LEFT JOIN [PrioritisationCriterionValue] ON [ProfileVersionSpeciesPrioritisation].[PrioritisationCriterionValueId] = [PrioritisationCriterionValue].[Id]
		GROUP BY
			[ProfileVersionSpeciesPrioritisation].[ProfileVersionId],
			[ProfileVersionSpeciesPrioritisation].[SpeciesId],
			[PrioritisationCriterion].[PrioritisationCategoryId]
		) tmpTotal
		INNER JOIN [PrioritisationCategory] ON tmpTotal.[PrioritisationCategoryId] = [PrioritisationCategory].[Id]

	

END

' 
END
GO
GRANT EXECUTE ON [dbo].[sppPrioritisationScore] TO [VLAProfilesUser]
GO


/****** Object:  StoredProcedure [dbo].[spgProfileVersionReportByProfileVersionId]    Script Date: 08/14/2008 16:01:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionReportByProfileVersionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 29 November 2007
-- Description:	Gets a list of profile reports, indicating
--				if there is PDF data available for each report
--				for a given profile version
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileVersionReportByProfileVersionId]
	-- Add the parameters for the stored procedure here
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IsWhatIfScenario bit

	IF EXISTS
		(
		SELECT
			[Profile].[Id]
		FROM
			[ProfileVersion] INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
		WHERE
			[ProfileVersion].[Id] = @ProfileVersionId AND
			[Profile].[ParentId] IS NOT NULL
		) BEGIN
		SET @IsWhatIfScenario = 1
	END

	SELECT
		[Id],
		[ReportName],
		[DisplayName],
		CAST(CASE WHEN [ProfileVersionId] IS NULL THEN 0 ELSE 1 END AS bit) AS [HasPdfData],
		[FileSize]
	FROM
		[luProfileReport] LEFT JOIN
		(
		SELECT
			[ProfileVersionId],
			[ProfileReportId],
			DATALENGTH([PdfData]) AS [FileSize]
		FROM
			[ProfileVersionReport]
		WHERE
			[ProfileVersionId] = @ProfileVersionId
		) tmpProfileVersionReport ON [luProfileReport].[Id] = tmpProfileVersionReport.[ProfileReportId]
	WHERE
		[IncludeInScenarios] = ISNULL(@IsWhatIfScenario, [IncludeInScenarios])
	ORDER BY
		[SequenceNumber]

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionReportByProfileVersionId] TO [VLAProfilesUser]
GO


/****** Object:  StoredProcedure [dbo].[spiProfileVersionReportData]    Script Date: 08/14/2008 16:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionReportData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 29 November 2007
-- Description:	Inserts PDF data for a given profile
--				report
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionReportData]
	@ProfileVersionId uniqueidentifier,
	@ProfileReportId uniqueidentifier,
	@PdfData image
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- check that this profile version is allowed to have a profile report of this type
	IF EXISTS
		(
		SELECT
			[Profile].[Id]
		FROM
			[ProfileVersion] INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
		WHERE
			[ProfileVersion].[Id] = @ProfileVersionId AND
			[Profile].[ParentId] IS NOT NULL
		) BEGIN
		
		-- profile version belongs to a "what-if" scenario; check it is allowed this report type
		IF NOT EXISTS
			(
			SELECT
				[Id]
			FROM
				[luProfileReport]
			WHERE
				[Id] = @ProfileReportId AND
				[IncludeInScenarios] = 1
			) BEGIN
				RAISERROR(''This report type is not allowed for profile versions that belong to a "what-if" scenario.'',16,1)
				RETURN
			END
	END

	-- save the PDF data into the database
    IF EXISTS (
		SELECT
			[ProfileVersionId],
			[ProfileReportId]
		FROM
			[ProfileVersionReport]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[ProfileReportId] = @ProfileReportId
		) BEGIN

		UPDATE
			[ProfileVersionReport]
		SET
			[PdfData] = @PdfData
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[ProfileReportId] = @ProfileReportId

	END ELSE BEGIN

		INSERT INTO [ProfileVersionReport]
			(
			[ProfileVersionId],
			[ProfileReportId],
			[PdfData]
			)
		VALUES
			(
			@ProfileVersionId,
			@ProfileReportId,
			@PdfData
			)
	END
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionReportData] TO [VLAProfilesUser]
GO


/****** Object:  StoredProcedure [dbo].[spgProfileVersionReportData]    Script Date: 11/29/2007 16:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionReportData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 29 November 2007
-- Description:	Gets the PDF data for a particular
--				profile version report
-- =============================================
CREATE PROCEDURE [spgProfileVersionReportData]
	@ProfileVersionId uniqueidentifier,
	@ProfileReportId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		[PdfData]
	FROM
		[ProfileVersionReport]
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileReportId] = @ProfileReportId
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionReportData] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaCurrentStaticReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11th February 2008
-- Description:	gets a list of all the current static reports
-- =============================================
-- RJN 09/05/08: added IsUserManual flag
-- GPT 18/12/08: added IsPublic flag
-- RJN 15/01/09: added IsPublic parameter
CREATE PROCEDURE [dbo].[spgaCurrentStaticReport]
	@IsUserManual bit,
	@PublicOnly bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @IsUserManual = 1 AND @PublicOnly = 1 BEGIN
		RAISERROR(''User manuals cannot be public - this combination of flags is not allowed'', 16, 1)
		RETURN
	END
	
	IF @PublicOnly = 0 BEGIN

		SELECT
			[StaticReportVersion].[Id],
			[StaticReportVersion].[StaticReportId],
			[StaticReportVersion].[Title],
			[StaticReportVersion].[VersionMajor],
			[StaticReportVersion].[EffectiveDateFrom],
			[StaticReportVersion].[EffectiveDateTo],
			[StaticReport].[IsUserManual],
			[StaticReportVersion].[IsPublic],
			DATALENGTH([StaticReportVersion].[PdfData])
		FROM
			[StaticReportVersion]INNER JOIN [StaticReport] ON [StaticReportVersion].[StaticReportId] = [StaticReport].[Id]
		WHERE
			[StaticReportVersion].[EffectiveDateTo] IS NULL AND
			[StaticReport].[IsUserManual] = @IsUserManual
		ORDER BY
			[StaticReportVersion].[Title]

	END ELSE BEGIN

		WITH [LatestPublic] ([StaticReportId], [VersionMajor]) AS
		(
		SELECT
			[StaticReportId],
			MAX([VersionMajor]) AS [VersionMajor]
		FROM
			[StaticReportVersion] INNER JOIN [StaticReport] ON [StaticReportVersion].[StaticReportId] = [StaticReport].[Id]
		WHERE
			[StaticReport].[IsUserManual] = @IsUserManual AND
			[IsPublic] = 1
		GROUP BY
			[StaticReportId]
		)
		SELECT
			[StaticReportVersion].[Id],
			[StaticReportVersion].[StaticReportId],
			[StaticReportVersion].[Title],
			[StaticReportVersion].[VersionMajor],
			[StaticReportVersion].[EffectiveDateFrom],
			[StaticReportVersion].[EffectiveDateTo],
			[StaticReport].[IsUserManual],
			[StaticReportVersion].[IsPublic],
			DATALENGTH([StaticReportVersion].[PdfData])
		FROM
			[StaticReportVersion]INNER JOIN [StaticReport] ON [StaticReportVersion].[StaticReportId] = [StaticReport].[Id]
			INNER JOIN [LatestPublic] ON ([StaticReportVersion].[StaticReportId] = [LatestPublic].[StaticReportId] AND [StaticReportVersion].[VersionMajor] = [LatestPublic].[VersionMajor])
		WHERE
			[StaticReport].[IsUserManual] = @IsUserManual
		ORDER BY
			[StaticReportVersion].[Title]

	END

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaCurrentStaticReport] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	lists the static report versions for a
--				given static report ID
-- =============================================
-- GPT 18/12/08: Added IsPublic flag
CREATE PROCEDURE [dbo].[spgStaticReportHistory]
	@StaticReportId uniqueidentifier,
	@PublicOnly bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[StaticReportVersion].[Id],
		[StaticReportVersion].[StaticReportId],
		[StaticReportVersion].[Title],
		[StaticReportVersion].[VersionMajor],
		[StaticReportVersion].[EffectiveDateFrom],
		[StaticReportVersion].[EffectiveDateTo],
		[StaticReport].[IsUserManual],
		[StaticReportVersion].[IsPublic],
		DATALENGTH([StaticReportVersion].[PdfData])
	FROM
		[StaticReportVersion] INNER JOIN [StaticReport] ON [StaticReportVersion].[StaticReportId] = [StaticReport].[Id]
	WHERE
		[StaticReportVersion].[StaticReportId] = @StaticReportId AND
		[StaticReportVersion].[IsPublic] = CASE @PublicOnly WHEN 1 THEN 1 ELSE [StaticReportVersion].[IsPublic] END
	ORDER BY
		[StaticReportVersion].[VersionMajor] DESC
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgStaticReportHistory] TO [VLAProfilesUser]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiStaticReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	adds a new static report to the database, determining
--				based on the title whether it is a new report or a new
--				version of an existing report
--
-- Edited by:	Grant P. Turtle
-- Edit date:	18 December 2008
-- Reason:		Allow setting of the IsPublic flag
-- =============================================
CREATE PROCEDURE [dbo].[spiStaticReport]
	@Title varchar(255),
	@PdfData image,
	@IsUserManual bit,
	@IsPublic bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @StaticReportId uniqueidentifier
	DECLARE @VersionMajor tinyint
	DECLARE @EffectiveDate smalldatetime
	DECLARE @OldVersionIsUserManual bit

	SET @StaticReportId = NULL
	SET @VersionMajor = 1
	SET @EffectiveDate = GETDATE()
	SET @OldVersionIsUserManual = @IsUserManual

	SELECT
		@StaticReportId = [StaticReportId],
		@VersionMajor = [VersionMajor] + 1,
		@OldVersionIsUserManual = [IsUserManual]
	FROM
		[StaticReportVersion] INNER JOIN [StaticReport] ON [StaticReportVersion].[StaticReportId] = [StaticReport].[Id]
	WHERE
		[Title] = @Title AND
		[EffectiveDateTo] IS NULL

	IF @OldVersionIsUserManual != @IsUserManual BEGIN
		IF @IsUserManual = 1 BEGIN
			RAISERROR(''You cannot upload a user manual with the same title as an existing static report'',16,1)
			RETURN
		END ELSE BEGIN
			RAISERROR(''You cannot upload a static report with the same title as an existing user manual'',16,1)
			RETURN
		END
	END

	IF @StaticReportId IS NULL BEGIN
		SET @StaticReportId = NEWID()

		INSERT INTO [StaticReport]
			(
			[Id],
			[IsUserManual]
			)
		VALUES
			(
			@StaticReportId,
			@IsUserManual
			)

	END ELSE BEGIN

		UPDATE
			[StaticReportVersion]
		SET
			[EffectiveDateTo] = @EffectiveDate
		WHERE
			[StaticReportId] = @StaticReportId AND
			[EffectiveDateTo] IS NULL

	END

	INSERT INTO [StaticReportVersion]
		(
		[Id],
		[StaticReportId],
		[Title],
		[VersionMajor],
		[EffectiveDateFrom],
		[PdfData],
		[IsPublic]
		)
	VALUES
		(
		NEWID(),
		@StaticReportId,
		@Title,
		@VersionMajor,
		@EffectiveDate,
		@PdfData,
		@IsPublic
		)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiStaticReport] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgStaticReportVersionData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	Gets the PDF data for a particular
--				static report version
-- =============================================
CREATE PROCEDURE [dbo].[spgStaticReportVersionData]
	@StaticReportVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[PdfData],
		[IsPublic],
		[Title]
	FROM
		[StaticReportVersion]
	WHERE
		[Id] = @StaticReportVersionId 
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgStaticReportVersionData] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdStaticReportVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 11 February 2008
-- Description:	deletes a version of a static report
-- =============================================
CREATE PROCEDURE [dbo].[spdStaticReportVersion]
	@StaticReportVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @StaticReportId uniqueidentifier
	DECLARE @EffectiveDateTo smalldatetime
	DECLARE @NextLatestStaticReportVersionId uniqueidentifier

    SELECT
		@StaticReportId = [StaticReportId],
		@EffectiveDateTo = [EffectiveDateTo]
	FROM
		[StaticReportVersion]
	WHERE
		[Id] = @StaticReportVersionId

	IF @EffectiveDateTo IS NOT NULL BEGIN
		RAISERROR(''You cannot delete this static report version because it is not current'', 16, 1)
		RETURN
    END

	-- remove the selected static report version
    DELETE FROM
		[StaticReportVersion]
    WHERE
		[Id] = @StaticReportVersionId

	SELECT
		@NextLatestStaticReportVersionId = [Id]
    FROM
		[StaticReportVersion]
    WHERE
		[StaticReportId] = @StaticReportId AND
		[VersionMajor] = (
			SELECT
				MAX([VersionMajor])
			FROM
				[StaticReportVersion]    
			WHERE
				[StaticReportId] = @StaticReportId
			)

	-- set the previous static report version to be current
    IF @NextLatestStaticReportVersionId IS NOT NULL BEGIN
		UPDATE
			[StaticReportVersion]
		SET
			[EffectiveDateTo] = NULL
		WHERE
			[Id] = @NextLatestStaticReportVersionId
    END

	-- if there are no versions left for this static report,
	-- remove the entry from the StaticReport table
    IF NOT EXISTS (SELECT * FROM [StaticReportVersion] WHERE [StaticReportId] = @StaticReportId) BEGIN
    
		DELETE FROM
			[StaticReport]
		WHERE
			[Id] = @StaticReportId
	END
    
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdStaticReportVersion] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisedSpeciesByProfileVersionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 2 May 2008
-- Description:	Gets a list of species that were prioritised
--				for a given profile version
-- =============================================
CREATE PROCEDURE spgPrioritisedSpeciesByProfileVersionId
	-- Add the parameters for the stored procedure here
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[SpeciesId],
		[Name]
	FROM
		[ProfileVersionPrioritisedSpecies] INNER JOIN [Species] ON [ProfileVersionPrioritisedSpecies].[SpeciesId] = [Species].[Id]
	WHERE
		[ProfileVersionPrioritisedSpecies].[ProfileVersionId] = @ProfileVersionId
	ORDER BY
		[Name]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgPrioritisedSpeciesByProfileVersionId] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationCategoryScoreByProfileVersionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 6 May 2008
-- Description:	Get prioritisation scores at the category
--				level for a given profile version
-- =============================================
-- JAE: 29 Oct 2008: Additional retrieval of IsProfiledSpecies flag
 
CREATE PROCEDURE [dbo].[spgPrioritisationCategoryScoreByProfileVersionId]
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    	SELECT
		[PrioritisationCategory].[Id],
		[PrioritisationCategory].[Name],
		[Species].[Id],
		[Species].[Name],
		CAST(CASE WHEN [PrioritisationScore].[Score] IS NULL THEN 1 ELSE 0 END AS bit) AS [DataIncomplete],
		[PrioritisationScore].[Score],
		[PrioritisationScore].[Rank],
		ISNULL([pvs].[IsProfiledSpecies], 0) As IsProfiledSpecies				
	FROM
		[PrioritisationCategory] INNER JOIN [PrioritisationScore] ON [PrioritisationScore].[PrioritisationCategoryId] = [PrioritisationCategory].[Id]
		INNER JOIN [Species] ON [PrioritisationScore].[SpeciesId] = [Species].[Id]
		LEFT JOIN 
		(
		SELECT			
			[ProfileVersionSpecies].[SpeciesId],
			CAST(CASE WHEN [luAffectedSpeciesType].[Name] = ''Profiled'' THEN 1 ELSE 0 END as bit) as [IsProfiledSpecies]
		FROM
			[ProfileVersionSpecies] 
			INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
		WHERE 
			[ProfileVersionSpecies].[ProfileVersionId] = @ProfileVersionId
		) [pvs]		
		ON [Species].[Id] = [pvs].[SpeciesId]
	WHERE
		[PrioritisationScore].[ProfileVersionId] = @ProfileVersionId AND
		[PrioritisationCategory].[IsVisibleOnSPR] = 1
	ORDER BY
		[PrioritisationCategory].[Id],
		[Species].[Name]


END

' 
END
GO
GRANT EXECUTE ON [dbo].[spgPrioritisationCategoryScoreByProfileVersionId] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgPrioritisationCriterionScoreByProfileVersionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 6 May 2008
-- Description:	Get prioritisation scores at the criterion
--				level for a given profile version
-- =============================================
CREATE PROCEDURE [dbo].[spgPrioritisationCriterionScoreByProfileVersionId]
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		[PrioritisationCategory].[Id],
		[PrioritisationCategory].[Name],
		[PrioritisationCriterion].[Id],
		[PrioritisationCriterion].[Code],
		[PrioritisationCriterion].[Name],
		[Species].[Id],
		[Species].[Name],
		[ProfileVersionSpeciesPrioritisation].[IsMissing],
		CAST(CASE WHEN [PrioritisationCriterionValue].[CriterionValue] IS NULL THEN 1 ELSE 0 END AS bit) AS [IrrelevantCategory],
		ISNULL([PrioritisationCriterionValue].[CriterionValue], CASE WHEN [IsMissing] = 1 THEN ''Data incomplete'' ELSE ''Irrelevant category'' END) AS [Value],
		CASE WHEN [IsMissing] = 1 THEN NULL ELSE ISNULL([PrioritisationCriterionValue].[Score], 0) END AS [Score],
		[PrioritisationCategory].[DisplayName]
	FROM
		[PrioritisationCriterion] INNER JOIN [PrioritisationCategory] ON [PrioritisationCriterion].[PrioritisationCategoryId] = [PrioritisationCategory].[Id]
		INNER JOIN [ProfileVersionSpeciesPrioritisation] ON [ProfileVersionSpeciesPrioritisation].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
		INNER JOIN [Species] ON [ProfileVersionSpeciesPrioritisation].[SpeciesId] = [Species].[Id]
		LEFT JOIN [PrioritisationCriterionValue] ON [ProfileVersionSpeciesPrioritisation].[PrioritisationCriterionValueId] = [PrioritisationCriterionValue].[Id]
	WHERE
		[ProfileVersionSpeciesPrioritisation].[ProfileVersionId] = @ProfileVersionId AND
		[PrioritisationCategory].[IsVisibleOnSPR] = 1
	ORDER BY
		[PrioritisationCategory].[SequenceNumber],
		[PrioritisationCriterion].[Code],
		[Species].[Name]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgPrioritisationCriterionScoreByProfileVersionId] TO [VLAProfilesUser]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionSectionUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <02/07/2008>
-- Description:	<Inserts a row into the ProfileVersionSectionUser table>
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionSectionUser]
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier,
	@UserId uniqueidentifier,
	@LastContributionDate datetime
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS
		(
		SELECT
			[ProfileVersionId]
		FROM
			[ProfileVersionSectionUser]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[ProfileSectionId] = @ProfileSectionId AND
			[UserId] = @UserId
		)
	BEGIN
		UPDATE 
			[ProfileVersionSectionUser]
		SET
			[LastContributionDate] = @LastContributionDate
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[ProfileSectionId] = @ProfileSectionId AND
			[UserId] = @UserId
	END
	ELSE
	BEGIN
		INSERT INTO	[ProfileVersionSectionUser]
			(
			[ProfileVersionId],
			[ProfileSectionId],
			[UserId], 
			[LastContributionDate]
			)
		VALUES
			(
			@ProfileVersionId,
			@ProfileSectionId,
			@UserId,
			@LastContributionDate
			)
	END
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionSectionUser] TO [VLAProfilesUser]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionSectionUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <02/07/2008>
-- Description:	<Retrieves author info for a specific
--		ProfileVersion and ProfileSection>
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileVersionSectionUser]
	-- Add the parameters for the stored procedure here
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT 
		[ProfileVersionSectionUser].[ProfileVersionId],
		[ProfileVersionSectionUser].[UserId],
		[ProfileVersionSectionUser].[ProfileSectionId],
		[User].[UserName],
		[User].[Organisation],
		[User].[FullName],
		[ProfileVersionSectionUser].[LastContributionDate]
	FROM 
		[ProfileVersionSectionUser] INNER JOIN
		[User] ON [ProfileVersionSectionUser].[UserId] = [User].[Id]
	WHERE
		[ProfileVersionSectionUser].[ProfileVersionId] = @ProfileVersionId AND
		[ProfileVersionSectionUser].[ProfileSectionId] = @ProfileSectionId
	ORDER BY 
		[ProfileVersionSectionUser].[LastContributionDate] DESC


END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionSectionUser] TO [VLAProfilesUser]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileSectionUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		James Etherington
-- Create date: 16/07/2008
-- Description:	Give user contribution rights to a 
--				particular profile section
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileSectionUser]
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier,
	@ProfileId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	IF NOT EXISTS 
	(
		SELECT
			[UserId],
			[ProfileId],
			[ProfileSectionId]
		FROM
			[ProfileSectionUser]
		WHERE
			[UserId] = @UserId AND
			[ProfileId] = @ProfileId AND
			[ProfileSectionId] = @ProfileSectionId
	)
	BEGIN

		INSERT 
			[ProfileSectionUser]
		(
			[UserId],
			[ProfileId],
			[ProfileSectionId]
		)
		VALUES
		(
			@UserId,
			@ProfileId,
			@ProfileSectionId
		)
	
	END

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileSectionUser] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileSectionUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		James Etherington
-- Create date: 16/07/2008
-- Description:	Removes a user''s right to contribute to 
--				a particular profile section.
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileSectionUser]
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier,
	@ProfileId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM 
		[ProfileSectionUser] 
	WHERE
		[UserId] = @UserId AND
		[ProfileId] = @ProfileId AND
		[ProfileSectionId] = @ProfileSectionId
	
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileSectionUser] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpellCustomWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <04/08/08>
-- Description:	<gets all the custom words>
-- =============================================
CREATE PROCEDURE [dbo].[spgaSpellCustomWord]
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		[Id],
		[Word],
		[LastUpdated]
	FROM
		[dbo].[SpellCustomWord]

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaSpellCustomWord] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpellCustomWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <04/08/08>
-- Description:	<Delete a custom word from the table for the spell checker>
-- =============================================
CREATE PROCEDURE [dbo].[spdSpellCustomWord]
	@Id uniqueidentifier,
	@Word varchar(255)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM 
		[dbo].[SpellCustomWord]	
	WHERE	
		[Id] = @Id	

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdSpellCustomWord] TO [VLAProfilesUser]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpellCustomWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <04/08/08>
-- Description:	<Inserts a custom word into the table for the spell checker>
-- =============================================
CREATE PROCEDURE [dbo].[spiSpellCustomWord]
	@Id uniqueidentifier,
	@Word varchar(255),
	@LastUpdated timestamp output
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[SpellCustomWord]
	(
		[Id],
		[Word]
	)
	VALUES
	(
		@Id,
		@Word
	)
	
	SELECT 
		@LastUpdated = LastUpdated 
	FROM 
		[dbo].[SpellCustomWord]
	WHERE
		[Id] = @Id

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiSpellCustomWord] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpellCustomWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <04/08/08>
-- Description:	<Updates a custom word in the table for the spell checker>
-- =============================================
CREATE PROCEDURE [dbo].[spuSpellCustomWord]
	@Id uniqueidentifier,
	@Word varchar(255),
	@LastUpdated timestamp,
	@NewLastUpdated timestamp output
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS
	(
	SELECT
		[Id]
	FROM
		[dbo].[SpellCustomWord]
	WHERE
		[Id] = @Id AND
		[LastUpdated] = @LastUpdated
	)	
	BEGIN
		RAISERROR(''This word has been amended by another user'', 16, 1)
		RETURN
	END
    

	UPDATE [dbo].[SpellCustomWord]
	SET
		[Word] = @Word
	WHERE	
		[Id] = @Id

	SELECT 
		@NewLastUpdated = [LastUpdated] 
	FROM 
		[dbo].[SpellCustomWord]
	WHERE
		[Id] = @Id

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuSpellCustomWord] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 21 July 2008
-- Description:	Gets a list of all profiles
-- =============================================
CREATE PROCEDURE [dbo].[spgaProfile]
	@UserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE()) 

    SELECT
		[Profile].[Id],
		[Profile].[Title]
	FROM
		[Profile]
	WHERE
		[Profile].[ParentId] IS NULL
	ORDER BY
		[Profile].[Title]

	SELECT
		[Profile].[Id] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		ISNULL([Profile].[ScenarioTitle], ''Current situation'') AS [ScenarioTitle],
		[luProfileUserRole].[Name] AS [UserRole]
	FROM
		[Profile] LEFT JOIN [ProfileUser] ON ([Profile].[Id] = [ProfileUser].[ProfileId] AND [ProfileUser].[UserId] = @UserId)
		LEFT JOIN [luProfileUserRole] ON [ProfileUser].[ProfileUserRoleId] = [luProfileUserRole].[Id]
	ORDER BY
		[Profile].[ScenarioTitle]

	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		[ProfileVersion].[IsPublic]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
	ORDER BY
		[ProfileVersion].[VersionMajor] DESC,
		[ProfileVersion].[VersionMinor] DESC

	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId] AS [ScenarioId],
		ISNULL([Profile].[ParentId], [Profile].[Id]) AS [ProfileId],
		[Species].[Name],
		[Species].[Id],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [Species].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersion] INNER JOIN [ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId]
		INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
	ORDER BY
		[Species].[Name]
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgaProfile] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 6 August 2008
-- Description:	Gets basic information about a profile
--
-- Edited By:	Grant P. Turtle
-- Edit Date:	16 December 2008
-- Reason:		Added HasPublicVersion and HasPublicScenarios flag
-- =============================================
CREATE PROCEDURE [dbo].[spgProfile]
	@ProfileId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @CurrentDraftVersionId uniqueidentifier
	DECLARE @CurrentPublishedVersionId uniqueidentifier
	DECLARE @CurrentPublicVersionId uniqueidentifier
	DECLARE @HasPublicScenarios bit
	DECLARE @DateNow smalldatetime

	SET @DateNow = DATEADD(mi, 1, GETDATE()) 

	SELECT
		@CurrentDraftVersionId = [ProfileVersion].[Id]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	WHERE
		[ProfileVersion].[ProfileId] = @ProfileId AND
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = ''Draft''
	
	SELECT
		@CurrentPublishedVersionId = [ProfileVersion].[Id]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
	WHERE
		[ProfileVersion].[ProfileId] = @ProfileId AND
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = ''Published''

	SELECT
		@CurrentPublicVersionId = [ProfileVersion].[Id]
	FROM
		[dbo].[ProfileVersion]
	WHERE
		[ProfileVersion].[ProfileId] = @ProfileId AND
		([ProfileVersion].[EffectiveDateTo] IS NULL OR
		 [ProfileVersion].[VersionMajor] = (
				SELECT max([VersionMajor]) 
				FROM [dbo].[ProfileVersion]
				WHERE [ProfileId] = @ProfileId AND [IsPublic] = 1)) AND
		[ProfileVersion].[IsPublic] = 1

		
	IF EXISTS 
	(
		SELECT top 1 [IsPublic] FROM [dbo].[ProfileVersion]
		JOIN [dbo].[Profile] ON [ProfileVersion].[ProfileId]=[Profile].[Id]
		WHERE [Profile].[ParentId]=@ProfileId AND 
		[IsPublic]=1
	)
		SET @HasPublicScenarios=1
	ELSE
		SET @HasPublicScenarios=0

	SELECT
		[Profile].[Id],
		[Profile].[Title],
		[Profile].[ScenarioTitle],
		[Profile].[ParentId],
		[ParentProfile].[Title] AS [ParentTitle],
		@CurrentDraftVersionId AS [CurrentDraftProfileVersionId],
		@CurrentPublishedVersionId AS [CurrentPublishedProfileVersionId],
		@CurrentPublicVersionId AS [CurrentPublicVersionId],
		@HasPublicScenarios AS [HasPublicScenarios],
		[Profile].[LastUpdated]
	FROM
		[Profile] LEFT JOIN [Profile] AS [ParentProfile] ON [Profile].[ParentId] = [ParentProfile].[Id]
	WHERE
		[Profile].[Id] = @ProfileId

	IF @CurrentDraftVersionId IS NOT NULL BEGIN

		SELECT
			[Species].[Id],
			[Species].[Name],
			[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
			CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
		FROM
			[ProfileVersionSpecies] INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
			INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
		WHERE
			[ProfileVersionSpecies].[ProfileVersionId] = @CurrentDraftVersionId

	END
END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfile] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 6 August 2008
-- Description:	Updates a profile 
-- =============================================
CREATE PROCEDURE [dbo].[spuProfile]
	@ProfileId uniqueidentifier,
	@Title varchar(255),
	@ScenarioTitle varchar(255),
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- check that the timestamp is OK
	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[Profile]
		WHERE
			[Id] = @ProfileId AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The profile has been edited by another user'',16,1)
		RETURN
	END

	DECLARE @ParentId uniqueidentifier

	SELECT
		@ParentId = [ParentId]
	FROM
		[Profile]
	WHERE
		[Id] = @ProfileId

	IF @Title IS NOT NULL BEGIN

		IF @ParentId IS NOT NULL BEGIN
			RAISERROR(''The profile title of a "what-if" scenario cannot be edited'',16,1)
			RETURN
		END

		IF EXISTS (
			SELECT 
				[Id]
			FROM	
				[Profile] 
			WHERE
				[Title] = @Title AND
				[Id] != @ProfileId
		) BEGIN
			RAISERROR(''The profile title is already in use for a different profile'',16,1)
			RETURN
		END
	END

	IF @ScenarioTitle IS NOT NULL BEGIN

		IF @ParentId IS NULL BEGIN
			RAISERROR(''The scenario title of a "current situation" profile cannot be edited'',16,1)
			RETURN
		END

		IF EXISTS (
			SELECT 
				[Id]
			FROM	
				[Profile] 
			WHERE
				[ScenarioTitle] = @ScenarioTitle AND
				[ParentId] = @ParentId AND
				[Id] != @ProfileId
		) BEGIN
			RAISERROR(''The scenario title is already in use for a different scenario belonging to the same profile'',16,1)
			RETURN
		END
	END

	DECLARE @DraftStateId uniqueidentifier

	SELECT
		@DraftStateId = [Id]
	FROM
		[luProfileVersionState]
	WHERE
		[Name] = ''Draft''

	UPDATE
		[Profile]
	SET
		[Title] = @Title,
		[ScenarioTitle] = @ScenarioTitle
	WHERE
		[Id] = @ProfileId

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[Profile]
	WHERE
		[Id] = @ProfileId

	IF @Title IS NOT NULL BEGIN

		-- update the profile title of the current draft version of this profile, if there is one
		UPDATE
			[ProfileVersion]
		SET
			[Title] = @Title
		WHERE
			[ProfileId] = @ProfileId AND
			[EffectiveDateTo] IS NULL AND
			[ProfileVersionStateId] = @DraftStateId

		-- update the profile title of the current draft versions of any what-if scenarios belonging to this profile
		UPDATE
			[ProfileVersion]
		SET
			[Title] = @Title
		FROM
			[ProfileVersion] INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
			INNER JOIN [Profile] AS [ParentProfile] ON [Profile].[ParentId] = [ParentProfile].[Id]
		WHERE
			[ParentProfile].[Id] = @ProfileId AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[ProfileVersionStateId] = @DraftStateId

	END

	IF @ScenarioTitle IS NOT NULL BEGIN

		-- update the scenario title of the current draft version of this profile, if there is one
		UPDATE
			[ProfileVersion]
		SET
			[ScenarioTitle] = @ScenarioTitle
		WHERE
			[ProfileId] = @ProfileId AND
			[EffectiveDateTo] IS NULL AND
			[ProfileVersionStateId] = @DraftStateId
	
	END

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfile] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesSequenceNumber]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <12/08/08>
-- Description:	<Updates the species sequence number>
-- =============================================
CREATE PROCEDURE [dbo].[spuSpeciesSequenceNumber]
	@SpeciesId uniqueidentifier,
	@IsMovingUp bit
AS
BEGIN
	DECLARE @MaxSequenceNumber int
	DECLARE @OldSequenceNumber int
	DECLARE @NewSequenceNumber int
	DECLARE @ParentId uniqueidentifier
	DECLARE @EmptyGuid uniqueidentifier

	SET @EmptyGuid = ''00000000-0000-0000-0000-000000000000''
	
	SELECT 
		@ParentId = [ParentId] 
	FROM 
		[Species] 
	WHERE 
		[Species].[Id] = @SpeciesId

	SELECT 
		@OldSequenceNumber = [SequenceNumber]
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId 	

	IF @IsMovingUp = 1
	BEGIN
		SET @NewSequenceNumber = @OldSequenceNumber - 1
	END
	ELSE
	BEGIN
		SET @NewSequenceNumber = @OldSequenceNumber + 1
	END

	IF NOT Exists
	(		
		SELECT
			[Id]
		FROM 
			[Species]
		WHERE
			ISNULL([ParentId], @EmptyGuid) = ISNULL(@ParentId, @EmptyGuid) AND
			[SequenceNumber] = @NewSequenceNumber
	)
	BEGIN
		RAISERROR(''Sequence change failed: There is no species above/below this one'', 16, 1)
		RETURN
	END	
	
	DECLARE @NextSpeciesId uniqueidentifier
		
	SELECT
		@NextSpeciesId = [Id]
	FROM
		[Species]
	WHERE
		ISNULL([ParentId], @EmptyGuid) = ISNULL(@ParentId, @EmptyGuid) AND
		[SequenceNumber] = @NewSequenceNumber

	UPDATE 
		[Species]
	SET
		[SequenceNumber] = @NewSequenceNumber
	WHERE
		[Id] = @SpeciesId	
	
	UPDATE
		[Species]
	SET
		[SequenceNumber] = @OldSequenceNumber
	WHERE
		[Id] = @NextSpeciesId
END	
	' 
END
GO
GRANT EXECUTE ON [dbo].[spuSpeciesSequenceNumber] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesNameById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 28 August 2008
-- Description:	Gets Name and IsActive flag from a species in the
--					species table
-- =============================================
-- Modified:	Grant P. Turtle - 04 December 2008 - Removed code that adds 1 minute to the DateNow variable
-- =============================================
CREATE PROCEDURE spgSpeciesNameById
	@SpeciesId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @DateNow smalldatetime
	SET @DateNow = GETDATE() 

    SELECT
		[Id],
		[Name],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [EffectiveDateFrom] AND [EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgSpeciesNameById] TO [VLAProfilesUser]
GO

-- P2R3

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionNote]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Removes a ProfileVersionNote and the question references>
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileVersionNote]
	-- Add the parameters for the stored procedure here
	@Id uniqueidentifier,
	@LastUpdated timestamp
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[ProfileVersionNote]
		WHERE
			[Id] = @Id AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The reference has been edited by another user'',16,1)
		RETURN
	END

	DELETE FROM
		[ProfileVersionNoteQuestion]
	WHERE
		[ProfileVersionNoteId] = @Id 
	
	DELETE FROM 
		[ProfileVersionNote]
	WHERE
		[Id] = @Id AND
		[LastUpdated] = @LastUpdated
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersionNote] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionNoteQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Remove links between references and questions>
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileVersionNoteQuestion]
	-- Add the parameters for the stored procedure here
	@ProfileVersionNoteId uniqueidentifier,
	@ProfileQuestionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	DELETE FROM 
		[ProfileVersionNoteQuestion]
	WHERE
		[ProfileVersionNoteQuestion].[ProfileVersionNoteId] = @ProfileVersionNoteId AND
		[ProfileVersionNoteQuestion].[ProfileQuestionId] = @ProfileQuestionId AND
		[ProfileVersionNoteQuestion].[ProfileSectionId] = @ProfileSectionId
	
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersionNoteQuestion] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileNoteType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Gets all the Profile Note types>
-- =============================================
CREATE PROCEDURE [dbo].[spgaProfileNoteType]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		[Id],
		[Name],
		[PluralName],
		[SequenceNumber] 
	FROM
		[luProfileNoteType]


END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgaProfileNoteType] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionNoteBySectionAndType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Returns notes for a given ProfileVersionSection 
--				 and ProfileNoteType>
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileVersionNoteBySectionAndType]
	-- Add the parameters for the stored procedure here
	@ProfileNoteTypeId uniqueidentifier,
	@ProfileSectionId uniqueidentifier,
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT
		[ProfileVersionNote].[Id],
		[ProfileVersionNote].[NoteText],
		[ProfileVersionNote].[LastUpdated]
	FROM
		[ProfileVersionNote] INNER JOIN ProfileVersionNoteQuestion ON
		[ProfileVersionNote].[Id] = [ProfileVersionNoteQuestion].[ProfileVersionNoteId]
	WHERE
		[ProfileVersionNote].[ProfileNoteTypeId] = @ProfileNoteTypeId AND		
		[ProfileVersionNote].[ProfileVersionId] = @ProfileVersionId AND
		[ProfileVersionNoteQuestion].[ProfileSectionId] = @ProfileSectionId
	ORDER BY
		[ProfileVersionNote].[NoteText]
		
	SELECT 
		[ProfileVersionNoteQuestion].[ProfileVersionNoteId],
		[ProfileVersionNoteQuestion].[ProfileQuestionId]		
	FROM
		[ProfileVersionNoteQuestion] INNER JOIN 
		[ProfileVersionNote] ON	[ProfileVersionNoteQuestion].[ProfileVersionNoteId] = [ProfileVersionNote].[Id]
	WHERE
		[ProfileVersionNote].[ProfileNoteTypeId] = @ProfileNoteTypeId AND
		[ProfileVersionNoteQuestion].[ProfileSectionId] = @ProfileSectionId AND
		[ProfileVersionNote].[ProfileVersionId] = @ProfileVersionId 
			


END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionNoteBySectionAndType] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionNote]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Adds a  ProfileVersionNote>
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionNote]
	-- Add the parameters for the stored procedure here
	@Id uniqueidentifier,
	@ProfileVersionId uniqueidentifier,	
	@ProfileNoteTypeId uniqueidentifier,
	@NoteText varchar(max),
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [ProfileVersionNote]
	(
		[Id],
		[ProfileVersionId],		
		[ProfileNoteTypeId],
		[NoteText]
	)
	VALUES
	(
		@Id,
		@ProfileVersionId,	
		@ProfileNoteTypeId,
		@NoteText
	)


	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ProfileVersionNote]
    WHERE
		[Id] = @Id

END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionNote] TO [VLAProfilesUser]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionNoteQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Adds links between references and questions>
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionNoteQuestion]
	-- Add the parameters for the stored procedure here
	@ProfileVersionNoteId uniqueidentifier,
	@ProfileQuestionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS 
	(
		SELECT
			[ProfileVersionNoteId],
			[ProfileQuestionId],
			[ProfileSectionId]
		FROM
			[ProfileVersionNoteQuestion]
		WHERE
			[ProfileVersionNoteId] = @ProfileVersionNoteId AND
			[ProfileQuestionId] = @ProfileQuestionId AND
			[ProfileSectionId] = @ProfileSectionId
	)
	BEGIN
		INSERT INTO [ProfileVersionNoteQuestion]
		(
			[ProfileVersionNoteId],
			[ProfileQuestionId],
			[ProfileSectionId]
		)
		VALUES
		(
			@ProfileVersionNoteId,
			@ProfileQuestionId,
			@ProfileSectionId
		)
	END

END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionNoteQuestion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionNote]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		<James Etherington>
-- Create date: <24/10/2008>
-- Description:	<Updates a ProfileVersionNote>
-- =============================================
CREATE PROCEDURE [dbo].[spuProfileVersionNote]
	-- Add the parameters for the stored procedure here
	@Id uniqueidentifier,
	@NoteText varchar(max),
	@LastUpdated timestamp OUTPUT,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[ProfileVersionNote]
		WHERE
			[Id] = @Id AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The reference has been edited by another user'',16,1)
		RETURN
	END

	UPDATE 
		[ProfileVersionNote]
	SET
		[NoteText] = @NoteText
	WHERE
		[Id] = @Id

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[ProfileVersionNote]
    WHERE
		[Id] = @Id

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionNote] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgLookupValueByTable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	28th October 2008
-- Description:		Get lookup values for a given reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE spgLookupValueByTable
	@ReferenceTableId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		[ReferenceValue].[Id],
		[ReferenceValue].[LookupValue]
	FROM
		[ReferenceValue]
	WHERE
		[ReferenceValue].[ReferenceTableId] = @ReferenceTableId
	ORDER BY
		[SequenceNumber]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgLookupValueByTable] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceValueByTable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	28th October 2008
-- Description:		Get lookup values for a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spgReferenceValueByTable]
	@ReferenceTableId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(
		SELECT
			[Id]	
		FROM
			[ReferenceTable]
		WHERE
			[Id] = @ReferenceTableId AND
			[IsMaintainable] = 1
	) BEGIN
		RAISERROR(''The specified reference table does not exist or is not maintainable'', 16, 1)
		RETURN
	END

    SELECT
		[ReferenceValue].[Id],
        [ReferenceValue].[LookupValue],
        [ReferenceValue].[EffectiveDateFrom],
        [ReferenceValue].[EffectiveDateTo],
		CAST(CASE WHEN ISNULL([ListValueCount], 0) > 0 THEN 1 ELSE 0 END AS bit) AS [IsInUse],
		CAST(CASE WHEN [ReferenceValue].[EffectiveDateTo] IS NULL THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ReferenceValue]
		LEFT JOIN
			(
			SELECT
				[ListValue] AS [Id],
				COUNT([ListValue]) AS [ListValueCount]
			FROM
				[ProfileVersionFieldValue]
			GROUP BY
				[ListValue]
			) [ListValue] ON [ReferenceValue].[Id] = [ListValue].[Id]
	WHERE
		[ReferenceValue].[ReferenceTableId] = @ReferenceTableId
	ORDER BY
		ISNULL([SequenceNumber], 255),
		[EffectiveDateFrom]

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgReferenceValueByTable] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReferenceValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	28th October 2008
-- Description:		Delete a value from a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spdReferenceValue]
	@ValueId uniqueidentifier,
	@OldLookupValue varchar(255),
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@LastUpdated timestamp
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EffectiveDate datetime
    SET @EffectiveDate = GETDATE()

	DECLARE @ReferenceTableId uniqueidentifier

	SELECT
		@ReferenceTableId = [ReferenceTable].[Id]
	FROM
		[ReferenceTable] INNER JOIN [ReferenceValue] ON [ReferenceTable].[Id] = [ReferenceValue].[ReferenceTableId]
	WHERE
		[ReferenceValue].[Id] = @ValueId AND
		[ReferenceTable].[IsMaintainable] = 1

	IF @ReferenceTableId IS NULL BEGIN
		RAISERROR(''The specified reference value does not belong to a maintainable reference table'', 16, 1)
		RETURN
	END

	IF NOT EXISTS (
		SELECT
			[Id]
		FROM
			[ReferenceValue]
		WHERE
			[Id] = @ValueId AND
			[LastUpdated] = @LastUpdated
		) BEGIN
		RAISERROR(''The reference value cannot be deleted because it has been edited by another user'',16,1)
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
		NEWID(),
		@ReferenceTableId,
		@ValueId,
		@OldLookupValue,
		''- to be deleted -'',
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		)

	DELETE FROM
		[ReferenceValue]
    WHERE
		[Id] = @ValueId
 
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdReferenceValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgReferenceValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	28th October 2008
-- Description:		Get a single lookup value from a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spgReferenceValue]
	@ValueId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @ReferenceTableId uniqueidentifier

	SELECT
		@ReferenceTableId = [ReferenceTable].[Id]
	FROM
		[ReferenceTable] INNER JOIN [ReferenceValue] ON [ReferenceTable].[Id] = [ReferenceValue].[ReferenceTableId]
	WHERE
		[ReferenceValue].[Id] = @ValueId AND
		[ReferenceTable].[IsMaintainable] = 1

	IF @ReferenceTableId IS NULL BEGIN
		RAISERROR(''The specified reference value does not belong to a maintainable reference table'', 16, 1)
		RETURN
	END
		
	SELECT
        [ReferenceValue].[LookupValue],
		CAST(CASE WHEN ISNULL([ListValueCount], 0) > 0 THEN 1 ELSE 0 END AS bit) AS [IsInUse],
        [ReferenceValue].[EffectiveDateFrom],
        [ReferenceValue].[EffectiveDateTo],
		[ReferenceValue].[LastUpdated]
	FROM
		[ReferenceValue]
		LEFT JOIN
			(
			SELECT
				[ListValue] AS [Id],
				COUNT([ListValue]) AS [ListValueCount]
			FROM
				[ProfileVersionFieldValue]
			WHERE
				[ListValue] = @ValueId
			GROUP BY
				[ListValue]
			) [ListValue] ON [ReferenceValue].[Id] = [ListValue].[Id]
	WHERE
		[ReferenceValue].[Id] = @ValueId

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgReferenceValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiReferenceValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	28th October 2008
-- Description:		Insert a new value into a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spiReferenceValue]
	@ReferenceTableId uniqueidentifier,
	@ValueId uniqueidentifier,
    @NewLookupValue varchar(255),
    @UserId uniqueidentifier,
    @Reason varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @EffectiveDate datetime
    SET @EffectiveDate = GETDATE()

	IF NOT EXISTS
	(
		SELECT
			[Id]	
		FROM
			[ReferenceTable]
		WHERE
			[Id] = @ReferenceTableId AND
			[IsMaintainable] = 1
	) BEGIN
		RAISERROR(''The specified reference table does not exist or is not maintainable'', 16, 1)
		RETURN
	END

    IF EXISTS
	(
		SELECT
			[Id]
		FROM
			[ReferenceValue]
		WHERE
			[LookupValue] = @NewLookupValue AND
			[ReferenceTableId] = @ReferenceTableId
	) BEGIN
		RAISERROR(''There is already a reference value with this name'', 16, 1)
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
		NEWID(),
		@ReferenceTableId,
		@ValueId,
		''- new entry -'',
		@NewLookupValue,
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		)

	INSERT INTO [ReferenceValue]
		(
		[Id],
		[ReferenceTableId],
		[LookupValue],
		[EffectiveDateFrom],
		[EffectiveDateTo]
		)
    VALUES
		(
		@ValueId,
		@ReferenceTableId,
		@NewLookupValue,
		@EffectiveDate,
		NULL
		)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiReferenceValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppReferenceValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	29th October 2008
-- Description:		Inactivate a value in a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE sppReferenceValue
	@ValueId uniqueidentifier,
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@LastUpdated timestamp
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @EffectiveDate datetime
    SET @EffectiveDate = GETDATE()

	DECLARE @ReferenceTableId uniqueidentifier

	SELECT
		@ReferenceTableId = [ReferenceTable].[Id]
	FROM
		[ReferenceTable] INNER JOIN [ReferenceValue] ON [ReferenceTable].[Id] = [ReferenceValue].[ReferenceTableId]
	WHERE
		[ReferenceValue].[Id] = @ValueId AND
		[ReferenceTable].[IsMaintainable] = 1

	IF @ReferenceTableId IS NULL BEGIN
		RAISERROR(''The specified reference value does not belong to a maintainable reference table'', 16, 1)
		RETURN
	END

	IF NOT EXISTS
		(
		SELECT
			[Id]
		FROM
			[ReferenceValue]
		WHERE
			[Id] = @ValueId AND
			[LastUpdated] = @LastUpdated
		) BEGIN
		RAISERROR(''The reference value cannot be inactivated because it has been edited by another user'',16,1)
		RETURN
	END

	--Get the current Value
	DECLARE @OldLookupValue varchar(255)

	SELECT
		@OldLookupValue = [LookupValue]
	FROM
		[ReferenceValue]
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
		NEWID(),
		@ReferenceTableId,
		@ValueId,
		@OldLookupValue,
		''- to be inactivated -'',
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		)

	UPDATE
		[ReferenceValue]
    SET
		[EffectiveDateTo] = @EffectiveDate
    WHERE
		[Id] = @ValueId

END
' 
END
GO
GRANT EXECUTE ON [dbo].[sppReferenceValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuReferenceValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:			Richard J. Northedge
-- Create date:	29th October 2008
-- Description:		Update a value in a maintainable reference table. 
--						A replacement for codegen stored procedures.
-- =============================================
CREATE PROCEDURE spuReferenceValue
	@ValueId uniqueidentifier,
	@NewLookupValue varchar(255),
	@UserId uniqueidentifier,
	@Reason varchar(255),
	@LastUpdated timestamp
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @EffectiveDate datetime
    SET @EffectiveDate = GETDATE()

	DECLARE @ReferenceTableId uniqueidentifier

	SELECT
		@ReferenceTableId = [ReferenceTable].[Id]
	FROM
		[ReferenceTable] INNER JOIN [ReferenceValue] ON [ReferenceTable].[Id] = [ReferenceValue].[ReferenceTableId]
	WHERE
		[ReferenceValue].[Id] = @ValueId AND
		[ReferenceTable].[IsMaintainable] = 1

	IF @ReferenceTableId IS NULL BEGIN
		RAISERROR(''The specified reference value does not belong to a maintainable reference table'', 16, 1)
		RETURN
	END

	IF EXISTS
		(
		SELECT
			[Id]
		FROM
			[ReferenceValue]
		WHERE
			[LookupValue] = @NewLookupValue AND
			[ReferenceTableId] = @ReferenceTableId
		) BEGIN
		RAISERROR(''There is already a reference value with this name'', 16, 1)
	END

	IF NOT EXISTS
		(
		SELECT
			[Id]
		FROM
			[ReferenceValue]
		WHERE
			[Id] = @ValueId AND
			[LastUpdated] = @LastUpdated
		) BEGIN
		RAISERROR(''The reference value cannot be updated because it has been edited by another user'',16,1)
		RETURN
	END

	--Get the current Value
	DECLARE @OldLookupValue varchar(255)

	SELECT
		@OldLookupValue = [LookupValue]
	FROM
		[ReferenceValue]
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
		NEWID(),
		@ReferenceTableId,
		@ValueId,
		@OldLookupValue,
		@NewLookupValue,
		@UserId,
		@EffectiveDate,
		@EffectiveDate,
		@Reason
		)

	UPDATE
		[ReferenceValue]
	SET
		[LookupValue] = @NewLookupValue
	WHERE
		[Id] = @ValueId

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuReferenceValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionFieldValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 18 November 2008
-- Description:	Updates a field value within a profile. Replaces codegen
--					stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spuProfileVersionFieldValue]
	@ProfileVersionId uniqueidentifier,
	@ProfileFieldId uniqueidentifier,
	@SpeciesId uniqueidentifier = NULL,
	@ProfileVersionQuestionRowId uniqueidentifier = NULL,
	@BooleanValue bit = NULL,
	@ListValue uniqueidentifier = NULL,
	@DecimalValue money = NULL,
	@DateValue datetime = NULL,
	@TextValue varchar(max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EmptyGuid uniqueidentifier
	SET @EmptyGuid = ''00000000-0000-0000-0000-000000000000''

    DECLARE @ProfileVersionFieldValueId uniqueidentifier

	SELECT
		@ProfileVersionFieldValueId = [Id]
	FROM
		[ProfileVersionFieldValue]
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileFieldId] = @ProfileFieldId AND
		ISNULL([SpeciesId], @EmptyGuid) = ISNULL(@SpeciesId, @EmptyGuid) AND
		ISNULL([ProfileVersionQuestionRowId], @EmptyGuid) = ISNULL(@ProfileVersionQuestionRowId, @EmptyGuid)

	IF @ProfileVersionFieldValueId IS NOT NULL BEGIN

		IF @BooleanValue IS NULL AND 
					@ListValue IS NULL AND 
					@DecimalValue IS NULL AND 
					@DateValue IS NULL AND
					@TextValue IS NULL BEGIN

			DELETE
			FROM
				[ProfileVersionFieldValue]
			WHERE
				[Id] = @ProfileVersionFieldValueId

		END ELSE BEGIN

			UPDATE
				[ProfileVersionFieldValue]
			SET
				[BooleanValue] = @BooleanValue,
				[ListValue] = @ListValue,
				[DecimalValue] = @DecimalValue,
				[DateValue] = @DateValue,
				[TextValue] = @TextValue
			WHERE
				[Id] = @ProfileVersionFieldValueId

		END

	END ELSE BEGIN

		INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
			)
		VALUES
			(
			NEWID(),
			@ProfileVersionId,
			@ProfileFieldId,
			@SpeciesId,
			@ProfileVersionQuestionRowId,
			@BooleanValue,
			@ListValue,
			@DecimalValue,
			@DateValue,
			@TextValue
			)

	END

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionFieldValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionFieldMultiValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 18 November 2008
-- Description:	Removes multi-values for a given field. Replaces 
--					codegen stored procedures.
-- =============================================
CREATE PROCEDURE spdProfileVersionFieldMultiValue
	@ProfileVersionId uniqueidentifier,
	@ProfileFieldId uniqueidentifier,
	@SpeciesId uniqueidentifier = NULL,
	@ProfileVersionQuestionRowId uniqueidentifier = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EmptyGuid uniqueidentifier
	SET @EmptyGuid = ''00000000-0000-0000-0000-000000000000''

    DELETE
	FROM
		[ProfileVersionFieldValue]
	WHERE
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileFieldId] = @ProfileFieldId AND
		ISNULL([SpeciesId], @EmptyGuid) = ISNULL(@SpeciesId, @EmptyGuid) AND
		ISNULL([ProfileVersionQuestionRowId], @EmptyGuid) = ISNULL(@ProfileVersionQuestionRowId, @EmptyGuid)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersionFieldMultiValue] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionFieldMultiValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 18 November 2008
-- Description:	Inserts a multi-value for a given field. Replaces 
--					codegen stored procedures.
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionFieldMultiValue] 
	@ProfileVersionId uniqueidentifier,
	@ProfileFieldId uniqueidentifier,
	@SpeciesId uniqueidentifier = NULL,
	@ProfileVersionQuestionRowId uniqueidentifier = NULL,
	@ListValue uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [ProfileVersionFieldValue]
	(
		[Id],
		[ProfileVersionId],
		[ProfileFieldId],
		[SpeciesId],
		[ProfileVersionQuestionRowId],
		[ListValue]
	)
	VALUES
	(
		NEWID(),
		@ProfileVersionId,
		@ProfileFieldId,
		@SpeciesId,
		@ProfileVersionQuestionRowId,
		@ListValue
	)
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionFieldMultiValue] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesPrioritisationVariables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 24/11/2008
-- Description:	Gets species prioritisation ranking range, categories, criterion and values
-- =============================================
CREATE PROCEDURE [dbo].[spgaSpeciesPrioritisationVariables] 

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		[LastUpdated]
	FROM
		[dbo].[PrioritisationRankingRange]
	WHERE
		[PrioritisationType]=''Species''

	--Get Prioritisation Categories
	SELECT
		[Id],
		[Name]
	FROM
		[dbo].[SpeciesPrioritisationCategory]
	ORDER BY
		[SequenceNumber]

	--Get Prioritisation Criteria
	SELECT
		[Id],
		[SpeciesPrioritisationCategoryId],
		[SpeciesFieldId],
		[Name]
		
	FROM
		[dbo].[SpeciesPrioritisationCriterion]
	ORDER BY
		[SpeciesPrioritisationCategoryid],
		[SequenceNumber]

	--Get Prioritisation Criteria Values
	SELECT
		[SpeciesPrioritisationCriterionValue].[Id],
		[SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId],
		[ReferenceValue].[LookupValue],	
		[SpeciesPrioritisationCriterionValue].[Score]
	FROM
		[dbo].[SpeciesPrioritisationCriterionValue]
	JOIN
		[dbo].[ReferenceValue]
	ON
		[SpeciesPrioritisationCriterionValue].[ReferenceValueId]=[ReferenceValue].[Id]
	ORDER BY
		[SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId],
		[ReferenceValue].[SequenceNumber]
		
END





' 
END
GO
GRANT EXECUTE ON [dbo].[spgaSpeciesPrioritisationVariables] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesPrioritisationCriterionValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 25 November 2008
-- Description:	Updates the prioritisation criterion score for a 
--				species
-- =============================================
CREATE PROCEDURE [dbo].[spuSpeciesPrioritisationCriterionValue]
	@Id uniqueidentifier,
	@Score int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

	UPDATE 
		[dbo].[SpeciesPrioritisationCriterionValue]
	SET 
		[SpeciesPrioritisationCriterionValue].[Score]=@Score
	WHERE 
		[SpeciesPrioritisationCriterionValue].[Id]=@Id


END
'
END
GO
GRANT EXEC ON spuSpeciesPrioritisationCriterionValue TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppPrioritisationCalculation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 November 2008
-- Description:	Calculates prioritisation (replaces codegen)
-- =============================================
CREATE PROCEDURE sppPrioritisationCalculation
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SpeciesId uniqueidentifier

	DELETE
		[ProfileVersionSpeciesPrioritisation]
	WHERE
		[ProfileVersionId] = @ProfileVersionId

	DELETE
		[ProfileVersionPrioritisedSpecies]
	WHERE
		[ProfileVersionId] = @ProfileVersionId
	  
	DECLARE @SpeciesList TABLE
		(
		SpeciesId uniqueidentifier
		)

	DECLARE csrProfileSpecies CURSOR FOR
		SELECT
			[SpeciesId]
		FROM
			[ProfileVersionSpecies] INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[luAffectedSpeciesType].[Name] = ''Profiled''
	FOR READ ONLY

	OPEN csrProfileSpecies

	FETCH NEXT FROM csrProfileSpecies INTO @SpeciesId

	WHILE @@FETCH_STATUS = 0 BEGIN

		INSERT INTO @SpeciesList
		SELECT
			[Id]
		FROM
			dbo.GetChildSpecies(@SpeciesId)

		INSERT INTO [ProfileVersionPrioritisedSpecies]
		SELECT
			@ProfileVersionId,
			SpeciesId,
			@SpeciesId
		FROM
			@SpeciesList
		;

		WITH ProfileSpeciesData (ProfileFieldId, BooleanValue, ListValue)
		AS
		(
		SELECT
			[ProfileFieldId],
			[BooleanValue],
			[ReferenceValue].[LookupValue] AS [ListValue]
		FROM
			[ProfileVersionFieldValue] LEFT JOIN [ReferenceValue] ON [ProfileVersionFieldValue].[ListValue] = [ReferenceValue].[Id]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			ISNULL([SpeciesId], @SpeciesId) = @SpeciesId
		),
		IrrelevanceData (PrioritisationCategoryId, IsIrrelevant, IsMissing)
		AS
		(
		SELECT
			[PrioritisationCategoryIrrelevance].[PrioritisationCategoryId],
			MAX(
			CASE WHEN [PrioritisationCategoryIrrelevance].[IrrelevanceValueId] IS NOT NULL THEN 
				CASE WHEN [PrioritisationCategoryIrrelevance].[IrrelevanceValueId] = [ProfileVersionFieldValue].[ListValue] THEN 1 ELSE 0 END
			ELSE
				CASE WHEN [PrioritisationCategoryIrrelevance].[IrrelevanceFlag] = [ProfileVersionFieldValue].[BooleanValue] THEN 1 ELSE 0 END
			END
			)
			AS [IsIrrelevant],
			MAX(
			CASE WHEN [PrioritisationCategoryIrrelevance].[IrrelevanceValueId] IS NOT NULL THEN 
				CASE WHEN [ProfileVersionFieldValue].[ListValue] IS NULL THEN 1 ELSE 0 END
			ELSE
				CASE WHEN [ProfileVersionFieldValue].[BooleanValue] IS NULL THEN 1 ELSE 0 END
			END
			)
			AS [IsMissing]
		FROM
			[PrioritisationCategoryIrrelevance] LEFT JOIN [ProfileVersionFieldValue] ON 
				(
				[PrioritisationCategoryIrrelevance].[IrrelevanceFieldId] = [ProfileVersionFieldValue].[ProfileFieldId] AND
				[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId AND
				ISNULL([ProfileVersionFieldValue].[SpeciesId], @SpeciesId) = @SpeciesId
				)
		GROUP BY
			[PrioritisationCategoryIrrelevance].[PrioritisationCategoryId]
		)
		INSERT INTO [ProfileVersionSpeciesPrioritisation]
			(
			[ProfileVersionId],
			[SpeciesId],
			[PrioritisationCriterionId],
			[PrioritisationCriterionValueId],
			[IsMissing]
			)
		SELECT
			@ProfileVersionId,
			speciesList.[SpeciesId],
			[PrioritisationCriterion].[Id] AS PrioritisationCriterionId,
			CASE WHEN ISNULL(IrrelevanceData.IsIrrelevant, 0) = 1 THEN NULL WHEN ISNULL(MappingData.BooleanValue, 1) = 1 THEN TrueValue.Id ELSE FalseValue.Id END AS PrioritisationCriterionValueId,
			CASE WHEN (CASE WHEN ISNULL(MappingData.BooleanValue, 1) = 1 THEN TrueValue.Id ELSE FalseValue.Id END IS NULL OR ISNULL(IrrelevanceData.IsMissing, 0) = 1) AND ISNULL(IrrelevanceData.IsIrrelevant, 0) = 0 THEN 1 ELSE 0 END AS IsMissing
		FROM
			[PrioritisationCriterion] LEFT JOIN IrrelevanceData ON [PrioritisationCriterion].[PrioritisationCategoryId] = IrrelevanceData.PrioritisationCategoryId
			LEFT JOIN ProfileSpeciesData MappingData ON [PrioritisationCriterion].[MappingFlag] = MappingData.ProfileFieldId
			LEFT JOIN ProfileSpeciesData TrueData ON [PrioritisationCriterion].[TrueMapping] = TrueData.ProfileFieldId
			LEFT JOIN ProfileSpeciesData FalseData ON [PrioritisationCriterion].[FalseMapping] = FalseData.ProfileFieldId
			LEFT JOIN [PrioritisationCriterionValue] TrueValue ON ([PrioritisationCriterion].[Id] = TrueValue.[PrioritisationCriterionId] AND TrueData.ListValue = LEFT(TrueValue.CriterionValue, LEN(TrueData.ListValue)))
			LEFT JOIN [PrioritisationCriterionValue] FalseValue ON ([PrioritisationCriterion].[Id] = FalseValue.[PrioritisationCriterionId] AND FalseData.ListValue = LEFT(FalseValue.CriterionValue, LEN(FalseData.ListValue)))
			, @SpeciesList speciesList


		DELETE FROM @SpeciesList
    
		FETCH NEXT FROM csrProfileSpecies INTO @SpeciesId

	END

    CLOSE csrProfileSpecies
    DEALLOCATE csrProfileSpecies

END
' 
END
GO
GRANT EXECUTE ON [dbo].[sppPrioritisationCalculation] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 November 2008
-- Description:	Creates a new profile version (replaces codegen)
--
-- Edited By:	Grant P. Turtle
-- Edit Date:	16 December 2008
-- Reason:		Added IsPublic flag
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersion]
	@ProfileVersionId uniqueidentifier,
	@ProfileId uniqueidentifier,
	@Title varchar(255),
	@ScenarioTitle varchar(255) = NULL,
	@VersionMajor tinyint,
	@VersionMinor tinyint,
	@State varchar(50),
	@EffectiveDateFrom smalldatetime,
	@CloneProfileVersionId uniqueidentifier = NULL,
	@IsPublic bit
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
		RAISERROR(''There is already a profile version for this profile with the specified version number. The profile may have been altered by another user.'',16,1)
		RETURN
	END

	IF @IsPublic=1 AND @State=''Draft''
		BEGIN
			RAISERROR(''You cannot make a draft profile public.'',16,1)
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
		[EffectiveDateFrom],
		[IsPublic]
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
		@EffectiveDateFrom,
		@IsPublic
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

		-- insert default field values
		INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[TextValue]
			)
		SELECT
			NEWID(),
			@ProfileVersionId,
			[Id],
			NULL,
			NULL,
			[DefaultValue]
		FROM
			[ProfileField]
		WHERE
			[DefaultValue] IS NOT NULL
	
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

		DECLARE @NoteIdTable TABLE
			(
			[Id] uniqueidentifier,
			[NewId] uniqueidentifier
			)

		INSERT INTO @NoteIdTable
			(
			[Id],
			[NewId]
			)
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
			[ProfileNoteTypeId],
			[NoteText]
			)
		SELECT
			idt.[NewId],
			@ProfileVersionId,			
			[ProfileVersionNote].[ProfileNoteTypeId],
			[ProfileVersionNote].[NoteText]
		FROM
			[ProfileVersionNote] INNER JOIN @NoteIdTable idt ON [ProfileVersionNote].[Id] = idt.[Id]
		WHERE
			[ProfileVersionNote].[ProfileVersionId] = @CloneProfileVersionId

		INSERT INTO [ProfileVersionNoteQuestion]
			(
			[ProfileVersionNoteId],
			[ProfileQuestionId],
			[ProfileSectionId]
			)
		SELECT
			idt.[NewId],
			[ProfileVersionNoteQuestion].[ProfileQuestionId],
			[ProfileVersionNoteQuestion].[ProfileSectionId]
		FROM
			[ProfileVersionNote] INNER JOIN [ProfileVersionNoteQuestion] ON [ProfileVersionNote].[Id] = [ProfileVersionNoteQuestion].[ProfileVersionNoteId]
			INNER JOIN @NoteIdTable idt ON [ProfileVersionNote].[Id] = idt.[Id]
		WHERE
			[ProfileVersionNote].[ProfileVersionId] = @CloneProfileVersionId;

		WITH [ReviewCommentList]
			(
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
			)
		AS
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

		DECLARE @RowIdTable TABLE
			(
			[Id] uniqueidentifier,
			[NewId] uniqueidentifier
			)

		INSERT INTO @RowIdTable
			(
			[Id],
			[NewId]
			)
		SELECT
			[Id],
			NEWID()
		FROM
			[ProfileVersionQuestionRow]
		WHERE
			[ProfileVersionId] = @CloneProfileVersionId

		INSERT INTO [ProfileVersionQuestionRow]
			(
			[Id],
			[ProfileVersionId],
			[ProfileQuestionId],
			[SequenceNumber]
			)
		SELECT
			rit.[NewId],
			@ProfileVersionId,
			[ProfileVersionQuestionRow].[ProfileQuestionId],
			[ProfileVersionQuestionRow].[SequenceNumber]
		FROM
			[ProfileVersionQuestionRow] INNER JOIN @RowIdTable rit ON [ProfileVersionQuestionRow].[Id] = rit.[Id]
		WHERE
			[ProfileVersionQuestionRow].[ProfileVersionId] = @CloneProfileVersionId

		INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
			)
		SELECT
			NEWID(),
			@ProfileVersionId,
			[ProfileFieldId],
			NULL,
			rit.[NewId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
		FROM
			[ProfileVersionFieldValue] LEFT JOIN @RowIdTable rit ON [ProfileVersionFieldValue].[ProfileVersionQuestionRowId] = rit.[Id]
		WHERE
			[ProfileVersionFieldValue].[ProfileVersionId] = @CloneProfileVersionId AND
			[ProfileVersionFieldValue].[SpeciesId] IS NULL
	END    

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 November 2008
-- Description:	Adds an affected species to a profile version (replaces codegen)
-- =============================================
CREATE PROCEDURE [dbo].[spiProfileVersionSpecies]
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
	
    -- if this species doesn''t exist (or isn''t profiled) in the profile being cloned, treat as if we are not cloning
    IF NOT EXISTS
    (
    SELECT
		[ProfileVersionId] 
	FROM
		[ProfileVersionSpecies] INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
	WHERE
		[ProfileVersionId] = @CloneProfileVersionId AND 
		[SpeciesId] = @SpeciesId AND
		[luAffectedSpeciesType].[Name] = ''Profiled''
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
		RAISERROR(''You cannot add this species to the profile version because it is an ancestor of an existing affected species'', 16, 1)
		RETURN
    END

    IF @ChildSpeciesCount > 0 BEGIN
		RAISERROR(''You cannot add this species to the profile version because it is a descendant of an existing affected species'', 16, 1)
		RETURN
    END

    SELECT
		@SpeciesIsActive = CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 ELSE 0 END AS bit)
    FROM
		[Species]
    WHERE
		[Id] = @SpeciesId

    IF @SpeciesIsActive = 0 BEGIN
		RAISERROR(''You cannot add an inactive species to a profile version'', 16, 1)
		RETURN
    END

	SELECT
		@AffectedSpeciesTypeId = [Id]
	FROM
		[luAffectedSpeciesType]
	WHERE
		[Name] = @AffectedSpeciesTypeName
	
	IF @AffectedSpeciesTypeId IS NULL BEGIN
		RAISERROR(''The specified affected species type name does not exist in the database.'', 16, 1)
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

	IF @AffectedSpeciesTypeName = ''Profiled'' AND @CloneProfileVersionId IS NOT NULL BEGIN
	
		INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
			)
		SELECT
			NEWID(),
			@ProfileVersionId,
			[ProfileFieldId],
			[SpeciesId],
			NULL,
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
		FROM
			[ProfileVersionFieldValue]
		WHERE
			[ProfileVersionFieldValue].[ProfileVersionId] = @CloneProfileVersionId AND
			[ProfileVersionFieldValue].[SpeciesId] = @SpeciesId AND
			[ProfileVersionFieldValue].[ProfileVersionQuestionRowId] IS NULL

INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
			)
		SELECT
			NEWID(),
			@ProfileVersionId,			
			[ProfileVersionFieldValue].[ProfileFieldId],
			[ProfileVersionFieldValue].[SpeciesId],
			pvqr2.[Id],
			[ProfileVersionFieldValue].[BooleanValue],
			[ProfileVersionFieldValue].[ListValue],
			[ProfileVersionFieldValue].[DecimalValue],
			[ProfileVersionFieldValue].[DateValue],
			[ProfileVersionFieldValue].[TextValue]	
		FROM 
			[ProfileVersionQuestionRow] pvqr1 INNER JOIN 
			[ProfileVersionQuestionRow] pvqr2 ON pvqr1.[ProfileQuestionId] = pvqr2.[ProfileQuestionId] AND 
			pvqr1.[SequenceNumber] = [pvqr2].[SequenceNumber] INNER JOIN
			[ProfileVersionFieldValue] ON pvqr1.[Id] = [ProfileVersionFieldValue].[ProfileVersionQuestionRowId]
		WHERE
			pvqr1.[ProfileVersionId] = @CloneProfileVersionId AND
			pvqr2.[ProfileVersionId] = @ProfileVersionId AND
			[ProfileVersionFieldValue].[SpeciesId] = @SpeciesId

	END
		
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionSpecies] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionSpecies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'	-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 November 2008
-- Description:	Removes an affected species from a profile version (replaces codegen)
-- =============================================
	CREATE PROCEDURE [dbo].[spdProfileVersionSpecies]
	@ProfileVersionId uniqueidentifier,
	@SpeciesId uniqueidentifier
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		-- delete per-species field values
		DELETE
			[ProfileVersionFieldValue]
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

		DELETE
			[ProfileVersionPrioritisedSpecies]
		WHERE
			[ProfileVersionPrioritisedSpecies].[ProfileVersionId] = @ProfileVersionId AND
			[ProfileVersionPrioritisedSpecies].[AffectedSpeciesId] = @SpeciesId
	  
		--delete the row in the link table to indicate that this species is affected for this profile version
		DELETE 
			[ProfileVersionSpecies]
		WHERE
			[ProfileVersionId] = @ProfileVersionId AND
			[SpeciesId] = @SpeciesId

	  END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersionSpecies] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 20 November 2008
-- Description:	Deletes a profile version (replaces codegen)
-- =============================================
	CREATE PROCEDURE [dbo].[spdProfileVersion]
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
			RAISERROR(''You cannot delete this profile version because it is not current'', 16, 1)
			RETURN
		END

		IF @StateName != ''Draft'' BEGIN
			RAISERROR(''You cannot delete this profile version because it is not draft'', 16, 1)
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
			RAISERROR(''You cannot delete this profile because it has associated "what-if" scenarios. Delete them before deleting this profile.'', 16, 1)
			RETURN
		END

		-- Get the ID of the next latest profile version
		SELECT
			@NextLatestProfileVersionId = [ProfileVersion].[Id]
		FROM
			[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		WHERE
			[luProfileVersionState].[Name] = ''Draft'' AND
			[ProfileVersion].[ProfileId] = @ProfileId AND
			[ProfileVersion].[VersionMajor] = @VersionMajor AND
			[ProfileVersion].[VersionMinor] = (
				SELECT
					MAX([VersionMinor])
				FROM
					[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
				WHERE
					[luProfileVersionState].[Name] = ''Draft'' AND
					[ProfileId] = @ProfileId AND
					[VersionMajor] = @VersionMajor AND
					[EffectiveDateTo] IS NOT NULL
				)

		DELETE
			[ProfileVersionFieldValue]
		WHERE
			[ProfileVersionId] = @ProfileVersionId   

		DELETE
			[ProfileVersionQuestionRow]
		WHERE
			[ProfileVersionId] = @ProfileVersionId

		DELETE
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

		DELETE
			[ProfileVersionNote]
		WHERE
			[ProfileVersionId] = @ProfileVersionId

		DELETE
			[ReviewComment]
		WHERE
			[ProfileVersionId] = @ProfileVersionId

		DELETE
			[ProfileVersionSectionUser]
		WHERE
			[ProfileVersionId] = @ProfileVersionId

		DELETE
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

		  DELETE
			[ProfileSectionUser]
		  WHERE
			[ProfileId] = @ProfileId

		  DELETE
			[ProfileUser]
		  WHERE
			[ProfileId] = @ProfileId

		  DELETE
			[Profile]
		  WHERE
			[Id] = @ProfileId

		  SET @ProfileDeleted = 1

		END

	END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersion] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionSpeciesTradeData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 24 November 2008
-- Description:	Updates a profile version with data copied from the
--					Species table (replaces codegen)
-- =============================================
	CREATE PROCEDURE [dbo].[spuProfileVersionSpeciesTradeData]
	@ProfileVersionId uniqueidentifier,
	@SpeciesId uniqueidentifier

	AS
		BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		-- remove any existing data held against the profile version that should
		-- be copied from the Species table	
		DELETE
			[ProfileVersionFieldValue]
		FROM
			[ProfileVersionFieldValue] INNER JOIN [ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id]
			INNER JOIN [SpeciesField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [SpeciesField].[ProfileFieldId]
		WHERE
			[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId AND
			[ProfileVersionFieldValue].[SpeciesId] = @SpeciesId

		-- add new rows to the profile version with the values copied from the
		-- Species table for this species
		INSERT INTO [ProfileVersionFieldValue]
			(
			[Id],
			[ProfileVersionId],
			[ProfileFieldId],
			[SpeciesId],
			[ProfileVersionQuestionRowId],
			[BooleanValue],
			[ListValue],
			[DecimalValue],
			[DateValue],
			[TextValue]
			)
		SELECT
			NEWID(),
			@ProfileVersionId,
			[SpeciesField].[ProfileFieldId],
			@SpeciesId ,
			NULL,
			[SpeciesFieldValue].[BooleanValue],
			[SpeciesFieldValue].[ListValue],
			NULL,
			NULL,
			[SpeciesFieldValue].[TextValue]
		FROM
			[SpeciesFieldValue] INNER JOIN [SpeciesField] ON [SpeciesFieldValue].[SpeciesFieldId] = [SpeciesField].[Id]
		WHERE
			[SpeciesField].[ProfileFieldId] IS NOT NULL AND
			[SpeciesFieldValue].[SpeciesId] = @SpeciesId
			  
	  END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionSpeciesTradeData] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sppSpeciesPrioritisationScore]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 25 November 2008
-- Description:	recalculates the values for the derived
--				SpeciesPrioritisationScore table
-- =============================================
-- RJN 3/3/09: fix to calculation logic
--
CREATE PROCEDURE [dbo].[sppSpeciesPrioritisationScore]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [SpeciesPrioritisationScore]

	INSERT INTO [SpeciesPrioritisationScore] 
		(
		[SpeciesId], 
		[SpeciesPrioritisationCategoryId], 
		[Score]
		)
	SELECT
		[Species].[Id],
		[SpeciesPrioritisationCategory].[Id],
		ISNULL([Score], 0)
	FROM
		[Species] CROSS JOIN [SpeciesPrioritisationCategory] LEFT JOIN
		(
			SELECT
				[SpeciesFieldValue].[SpeciesId],
				[SpeciesPrioritisationCriterion].[SpeciesPrioritisationCategoryId],
				SUM([SpeciesPrioritisationCriterionValue].[Score]) AS [Score]
			FROM
				[SpeciesPrioritisationCriterion] INNER JOIN [SpeciesFieldValue] ON [SpeciesPrioritisationCriterion].[SpeciesFieldId] = [SpeciesFieldValue].[SpeciesFieldId]
				INNER JOIN [SpeciesPrioritisationCriterionValue] ON ([SpeciesPrioritisationCriterion].[Id] = [SpeciesPrioritisationCriterionValue].[SpeciesPrioritisationCriterionId] AND [SpeciesFieldValue].[ListValue] = [SpeciesPrioritisationCriterionValue].[ReferenceValueId])
			GROUP BY
				[SpeciesFieldValue].[SpeciesId],
				[SpeciesPrioritisationCriterion].[SpeciesPrioritisationCategoryId]
		) tmpScore ON [Species].[Id] = tmpScore.[SpeciesId] AND [SpeciesPrioritisationCategory].[Id] = tmpScore.[SpeciesPrioritisationCategoryId]

END

' 
END
GO
GRANT EXECUTE ON [dbo].[sppSpeciesPrioritisationScore] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileVersionSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 2 December 2008
-- Description:	gets answer data for all sections of a profile version
-- =============================================
-- JE 15/12/2008: Added additional record set to pull back the fields in field groups
-- JE 19/01/2009: Removed metadata record sets
CREATE PROCEDURE [dbo].[spgaProfileVersionSection]
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @IsWhatIfScenario bit

	SELECT
		@IsWhatIfScenario = CASE WHEN [ParentId] IS NULL THEN 0 ELSE 1 END
	FROM
		[ProfileVersion] INNER JOIN [Profile] ON [ProfileVersion].[ProfileId] = [Profile].[Id]
	WHERE
		[ProfileVersion].[Id] = @ProfileVersionId

	--Profiled Species
	SELECT
		[Species].[Id],
		[Species].[Name],
		CAST(CASE WHEN [EffectiveDateTo] IS NULL THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[Species] INNER JOIN [ProfileVersionSpecies] ON [Species].[Id] = [ProfileVersionSpecies].[SpeciesId]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]	
	WHERE
		[ProfileVersionSpecies].[ProfileVersionId] = @ProfileVersionId AND
		[luAffectedSpeciesType].[Name] = ''Profiled''

	--Revision Dates and Timestamp
    SELECT
		[ProfileVersionSection].[ProfileSectionId],
		[ProfileVersionSection].[TechnicalReviewFrequency],
		[ProfileVersionSection].[PolicyReviewFrequency],
		[ProfileVersionSection].[NextTechnicalReview],
		[ProfileVersionSection].[NextPolicyReview],
		[ProfileVersionSection].[LastUpdated]
	FROM
		[ProfileVersionSection] INNER JOIN [ProfileSection] ON [ProfileVersionSection].[ProfileSectionId] = [ProfileSection].[Id]
	WHERE
		[ProfileVersionSection].[ProfileVersionId] = @ProfileVersionId
	ORDER BY
		[ProfileSection].[SectionNumber]
	
	--Question Names
	SELECT 
		[ProfileQuestion].[ProfileSectionId],
		[ProfileQuestion].[Id],
		[ProfileQuestion].[Name],
		[ProfileQuestion].[NonTechnicalName]
	FROM
		[ProfileQuestion] INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]
	ORDER BY
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber]
	
	--Question Rows
	SELECT
		[ProfileQuestion].[ProfileSectionId],
		[ProfileVersionQuestionRow].[Id],
		[ProfileVersionQuestionRow].[ProfileQuestionId],
		[ProfileVersionQuestionRow].[SequenceNumber]		
	FROM
		[ProfileVersionQuestionRow] INNER JOIN [ProfileQuestion] ON [ProfileVersionQuestionRow].[ProfileQuestionId] = [ProfileQuestion].[Id]
	WHERE
		[ProfileVersionId] = @ProfileVersionId
	ORDER BY
		[SequenceNumber]

	--Field Values
	SELECT 
		[ProfileQuestion].[ProfileSectionId],		
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[SpeciesId],
		[ProfileVersionFieldValue].[ProfileVersionQuestionRowId],
		[ProfileVersionFieldValue].[BooleanValue],
		[ProfileVersionFieldValue].[ListValue],
		[ProfileVersionFieldValue].[DecimalValue],
		[ProfileVersionFieldValue].[DateValue],
		[ProfileVersionFieldValue].[TextValue],
		[ProfileField].[Id],
		''00000000-0000-0000-0000-000000000000'',
		[ProfileQuestion].[Id],
		[ProfileQuestion].[QuestionNumber],
		[ProfileField].[FieldNumber]
	FROM
		[ProfileVersionFieldValue] INNER JOIN
		[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN
		[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]	
	WHERE 
		[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId 	

	UNION

	SELECT 
		tmpField.[ProfileSectionId],
		[ProfileVersionFieldValue].[Id],
		[ProfileVersionFieldValue].[SpeciesId],
		[ProfileVersionFieldValue].[ProfileVersionQuestionRowId],
		[ProfileVersionFieldValue].[BooleanValue],
		[ProfileVersionFieldValue].[ListValue],
		[ProfileVersionFieldValue].[DecimalValue],
		[ProfileVersionFieldValue].[DateValue],
		[ProfileVersionFieldValue].[TextValue],
		[ProfileField].[Id],
		[ProfileField].[ProfileFieldGroupId],
		tmpField.[QuestionId],
		tmpField.[QuestionNumber],
		[ProfileField].[FieldNumber]
	FROM
		[ProfileVersionFieldValue] INNER JOIN
		[ProfileField] ON [ProfileVersionFieldValue].[ProfileFieldId] = [ProfileField].[Id] INNER JOIN	
		(
		SELECT	
			[ProfileField].[Id],
			[ProfileQuestion].[Id] As QuestionId,
			[ProfileQuestion].[QuestionNumber],
			[ProfileQuestion].[ProfileSectionId]
		FROM 
			[ProfileField] INNER JOIN 
			[ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]		
		) tmpField ON [ProfileField].[ProfileFieldGroupId] = tmpField.[Id] 
	WHERE
		[ProfileVersionFieldValue].[ProfileVersionId] = @ProfileVersionId 


		
END








' 
END
GO
GRANT EXECUTE ON [dbo].[spgaProfileVersionSection] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgSpeciesAnswerData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 3 December 2008
-- Description:	gets answer data for a given species
-- =============================================
-- JDE: Removed metadata record sets
CREATE PROCEDURE [dbo].[spgSpeciesAnswerData]
	@SpeciesId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Timestamp
	SELECT
		[LastUpdated],
		[Name],
		@SpeciesId
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId

	--Species Section Id
	SELECT 
		[SpeciesSection].[Id]
	FROM
		[SpeciesSection]
	ORDER BY
		[SectionNumber]		

	--Field Values
	SELECT
		[SpeciesQuestion].[SpeciesSectionId],	
		[SpeciesFieldValue].[Id],
		[SpeciesFieldValue].[BooleanValue],
		[SpeciesFieldValue].[ListValue],
		[SpeciesFieldValue].[TextValue],
		[SpeciesQuestion].[Id],
		[SpeciesField].[FieldNumber]
	FROM
		[SpeciesFieldValue] INNER JOIN [SpeciesField] ON [SpeciesFieldValue].[SpeciesFieldId] = [SpeciesField].[Id]
		INNER JOIN [SpeciesQuestion] ON [SpeciesField].[SpeciesQuestionId] = [SpeciesQuestion].[Id]
	WHERE
		[SpeciesFieldValue].[SpeciesId] = @SpeciesId 

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spgSpeciesAnswerData] TO [VLAProfilesUser] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesFieldValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 4 December 2008
-- Description:	Updates a field value within a species
-- =============================================
CREATE PROCEDURE spuSpeciesFieldValue 
	@SpeciesId uniqueidentifier,
	@SpeciesFieldId uniqueidentifier,
	@BooleanValue bit = NULL,
	@ListValue uniqueidentifier = NULL,
	@TextValue varchar(max) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SpeciesFieldValueId uniqueidentifier

	SELECT
		@SpeciesFieldValueId = [Id]
	FROM
		[SpeciesFieldValue]
	WHERE
		[SpeciesId] = @SpeciesId AND
		[SpeciesFieldId] = @SpeciesFieldId 

	IF @SpeciesFieldValueId IS NOT NULL BEGIN

		IF @BooleanValue IS NULL AND 
					@ListValue IS NULL AND 
					@TextValue IS NULL BEGIN

			DELETE
			FROM
				[SpeciesFieldValue]
			WHERE
				[Id] = @SpeciesFieldValueId

		END ELSE BEGIN

			UPDATE
				[SpeciesFieldValue]
			SET
				[BooleanValue] = @BooleanValue,
				[ListValue] = @ListValue,
				[TextValue] = @TextValue
			WHERE
				[Id] = @SpeciesFieldValueId

		END

	END ELSE BEGIN

		INSERT INTO [SpeciesFieldValue]
			(
			[Id],
			[SpeciesId],
			[SpeciesFieldId],
			[BooleanValue],
			[ListValue],
			[TextValue]
			)
		VALUES
			(
			NEWID(),
			@SpeciesId,
			@SpeciesFieldId,
			@BooleanValue,
			@ListValue,
			@TextValue
			)

	END
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuSpeciesFieldValue] TO [VLAProfilesUser]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuSpeciesAnswerData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 9 December 2008
-- Description:	Updates a species 
-- =============================================
CREATE PROCEDURE [dbo].[spuSpeciesAnswerData]
	@SpeciesId uniqueidentifier,
	@LastUpdated timestamp,
	@NewLastUpdated timestamp OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- check that the timestamp is OK
	IF NOT EXISTS (
		SELECT
			[Id] 
		FROM
			[dbo].[Species]
		WHERE
			[Id] = @SpeciesId AND 
			[LastUpdated] = @LastUpdated
	) BEGIN
		RAISERROR(''The species has been edited by another user'',16,1)
		RETURN
	END

	UPDATE
		[dbo].[Species]
	SET
		[Id]=[Id]
	WHERE
		[Id]=@SpeciesId
	

	SELECT
		@NewLastUpdated = [LastUpdated]
	FROM
		[Species]
	WHERE
		[Id] = @SpeciesId

END

'

END
GO
GRANT EXECUTE ON [dbo].[spuSpeciesAnswerData] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSpeciesFieldMultiValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 09 December 2008
-- Description:	Inserts a multi-value for a given field.
-- =============================================
CREATE PROCEDURE [dbo].[spiSpeciesFieldMultiValue] 
	@SpeciesId uniqueidentifier,
	@SpeciesFieldId uniqueidentifier,
	@ListValue uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [SpeciesFieldValue]
	(
		[Id],
		[SpeciesId],
		[SpeciesFieldId],
		[ListValue]
	)
	VALUES
	(
		NEWID(),
		@SpeciesId,
		@SpeciesFieldId,
		@ListValue
	)
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiSpeciesFieldMultiValue] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSpeciesFieldMultiValue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 09 December 2008
-- Description:	Removes multi-values for a given field.
-- =============================================
CREATE PROCEDURE [dbo].[spdSpeciesFieldMultiValue]
	@SpeciesId uniqueidentifier,
	@SpeciesFieldId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE
	FROM
		[SpeciesFieldValue]
	WHERE
		[SpeciesId] = @SpeciesId AND
		[SpeciesFieldId] = @SpeciesFieldId
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spdSpeciesFieldMultiValue] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionPublicFlag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 16 December 2008
-- Description:	Updates the public flag of a profile version
-- =============================================
CREATE PROCEDURE [dbo].[spuProfileVersionPublicFlag] 
	@ProfileVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @IsAlreadyPublic bit

	SELECT
		@IsAlreadyPublic = [IsPublic]
	FROM
		[dbo].[ProfileVersion]
	WHERE
		[Id]=@ProfileVersionId

	IF @IsAlreadyPublic=1
	BEGIN
		RAISERROR(''This profile version is already public'',16,1)
		RETURN
	END
	
	IF NOT EXISTS
	(
		SELECT 
			*
		FROM 
			[dbo].[ProfileVersion] INNER JOIN [dbo].[luProfileVersionState] 
				ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id] 
		WHERE 
			[ProfileVersion].[Id] = @ProfileVersionId AND
			[ProfileVersion].[EffectiveDateTo] IS NULL AND
			[luProfileVersionState].[Name] = ''Published''
	)
	BEGIN
		RAISERROR(''You can only modify the public status of current, published profiles.'',16,1)
		RETURN
	END

	UPDATE
		[dbo].[ProfileVersion]
	SET
		[IsPublic]=1
	WHERE
		[Id]=@ProfileVersionId

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionPublicFlag] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuStaticReportVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 18 December 2008
-- Description:	Update the IsPublic flag of a static report
-- =============================================
CREATE PROCEDURE [dbo].[spuStaticReportVersion] 
	@StaticReportVersionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IsUserManual bit
	DECLARE @IsAlreadyPublic bit
	
	SELECT 
		@IsUserManual = [IsUserManual],
		@IsAlreadyPublic = [IsPublic]
	FROM
		[dbo].[StaticReportVersion]
	JOIN [dbo].[StaticReport] ON [StaticReportVersion].[StaticReportId]=[StaticReport].[Id]
	WHERE
		[StaticReportVersion].[Id]=@StaticReportVersionId
	

	IF @IsUserManual=1
	BEGIN
		RAISERROR (''You cannot make a user manual public'',16,1)
		RETURN
	END

	IF @IsAlreadyPublic=1
	BEGIN
		RAISERROR (''This report is already public'',16,1)
		RETURN
	END
	

    UPDATE
		[dbo].[StaticReportVersion]
	SET
		[IsPublic]=1
	WHERE
		[Id]=@StaticReportVersionId
	
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spuStaticReportVersion] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgCurrentPublicProfileByParent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 14 January 2009
-- Description:	Gets the current public profile version for a parent
-- =============================================
CREATE PROCEDURE [dbo].[spgCurrentPublicProfileByParent] 
	@ParentProfileId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @EmptyGuid As uniqueidentifier
	SET @EmptyGuid = ''00000000-0000-0000-0000-000000000000''

	DECLARE @DateNow smalldatetime
	SET @DateNow = DATEADD(mi, 1, GETDATE());

	WITH [RelevantScenarioCounts] ([ParentId]) AS
	(
	SELECT
		[Profile].[ParentId]
	FROM
		[dbo].[Profile]
		INNER JOIN [dbo].[ProfileVersion] ON [Profile].[Id]=[ProfileVersion].[ProfileId]
	WHERE
		[IsPublic]=1 AND
		[ParentId] IS NOT NULL
	GROUP BY
		[Profile].[ParentId]
	)

	SELECT
		[ProfileVersion].[Id],
		[ProfileVersion].[ProfileId],
		[ProfileVersion].[Title],
		[ProfileVersion].[VersionMajor],
		[ProfileVersion].[VersionMinor],
		[luProfileVersionState].[Name],
		[ProfileVersion].[EffectiveDateFrom],
		[ProfileVersion].[EffectiveDateTo],
		CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempVersion.VersionMinor THEN 1 ELSE 0 END AS bit) AS IsLatestVersion,
		[ProfileVersion].[ScenarioTitle],
		[Profile].[ParentId],
		[ProfileVersion].[IsPublic],
		CAST(CASE WHEN [RelevantScenarioCounts].[ParentId] IS NULL THEN 0 ELSE 1 END AS bit) AS [HasRelevantPublicScenarios]
	FROM
		[ProfileVersion]  INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [EffectiveDateTo] IS NULL GROUP BY [ProfileId]
		) tempVersion ON [ProfileVersion].[ProfileId] = tempVersion.ProfileId
		INNER JOIN
		(SELECT ProfileId, MAX(VersionMajor) AS VersionMajor, MAX(VersionMinor) AS VersionMinor FROM [ProfileVersion] WHERE [IsPublic]=1 GROUP BY [ProfileId]
		) tempPublicVersion ON [ProfileVersion].[ProfileId] = tempPublicVersion.ProfileId
		INNER JOIN [luProfileVersionState] 
		ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
		LEFT JOIN [RelevantScenarioCounts] ON [RelevantScenarioCounts].[ParentId] = [Profile].[Id]
	WHERE
		([ProfileVersion].[EffectiveDateTo] IS NULL OR CAST(CASE WHEN [ProfileVersion].[VersionMajor] = tempPublicVersion.VersionMajor AND [ProfileVersion].[VersionMinor] = tempPublicVersion.VersionMinor THEN 1 ELSE 0 END AS bit)=1) AND
		[luProfileVersionState].[Name] = ''Published'' AND
		[IsPublic] = 1 AND
		ISNULL([Profile].[ParentId],@EmptyGuid) = ISNULL(@ParentProfileId,@EmptyGuid)
	ORDER BY
		[ProfileVersion].[Title]

	SELECT
		[ProfileVersion].[Id],
		[Species].[Name],
		[luAffectedSpeciesType].[Name] AS [AffectedSpeciesType],
		CAST(CASE WHEN [Species].[EffectiveDateTo] IS NULL THEN 1 WHEN @DateNow BETWEEN [Species].[EffectiveDateFrom] AND [Species].[EffectiveDateTo] THEN 1 ELSE 0 END AS bit) AS [IsActive]
	FROM
		[ProfileVersion] INNER JOIN [luProfileVersionState] ON [ProfileVersion].[ProfileVersionStateId] = [luProfileVersionState].[Id]
		INNER JOIN [ProfileVersionSpecies] ON [ProfileVersion].[Id] = [ProfileVersionSpecies].[ProfileVersionId]
		INNER JOIN [Species] ON [ProfileVersionSpecies].[SpeciesId] = [Species].[Id]
		INNER JOIN [luAffectedSpeciesType] ON [ProfileVersionSpecies].[AffectedSpeciesTypeId] = [luAffectedSpeciesType].[Id]
		INNER JOIN [Profile] ON [Profile].[Id] = [ProfileVersion].[ProfileId]
	WHERE
		[ProfileVersion].[EffectiveDateTo] IS NULL AND
		[luProfileVersionState].[Name] = ''Published'' AND
		[IsPublic] = 1 AND
		[Profile].[ParentId] = @ParentProfileId
	ORDER BY
		[Species].[Name]

END

' 
END
GO
GRANT EXECUTE ON [dbo].[spgCurrentPublicProfileByParent] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaProfileSectionMetadata]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		James Etherington
-- Create date: 25 Nov 2008
-- Description:	Gets profile section metadata for all sections
-- =============================================
CREATE PROCEDURE [dbo].[spgaProfileSectionMetadata] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--ProfileSection
    SELECT
		[ProfileSection].[Id],
		[ProfileSection].[Name],
		[ProfileSection].[ShortName],
		[ProfileSection].[SectionNumber],
		[ProfileSection].[Note]
	FROM
		[ProfileSection]
	ORDER BY 
		[ProfileSection].[SectionNumber] 
	
	--ProfileQuestion
	SELECT
		[ProfileQuestion].[ProfileSectionId],
		[ProfileQuestion].[Id],
		[ProfileQuestion].[ShortName],
		[ProfileQuestion].[QuestionNumber],
		[ProfileQuestion].[IsPerSpecies],
		[ProfileQuestion].[IsRepeating],		
		[ProfileQuestion].[IrrelevanceFieldId],
		[ProfileQuestion].[IrrelevanceValueId],
		[ProfileQuestion].[IrrelevanceFlag]
	FROM
		[ProfileQuestion] 
		INNER JOIN [ProfileSection] ON [ProfileQuestion].[ProfileSectionId] = [ProfileSection].[Id]	
	ORDER BY
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber]

	--ProfileField
	SELECT
		[ProfileQuestion].[ProfileSectionId],
		[ProfileQuestion].[Id],
		[ProfileField].[Id],
		[ProfileField].[ShortName],
		[ProfileField].[FieldNumber],
		[ProfileField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[ProfileField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable],
		CAST(CASE WHEN tmpIrrelevance.[IrrelevanceFieldId] IS NULL THEN 0 ELSE 1 END AS bit) AS [AffectsRelevancy],
		[ProfileField].[Name],
		[ProfileField].[IsReadOnlyCurrentSituation] AS [IsReadOnlyCurrentSituation],		
		[ProfileField].[IsReadOnlyScenario] AS [IsReadOnlyScenario],		
		[ProfileQuestion].[IsPerSpecies],
		[ProfileQuestion].[IsRepeating],
		[ProfileField].[IncludeInSummary]
	FROM
		[ProfileField] INNER JOIN [luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id]
		INNER JOIN [ProfileQuestion] ON [ProfileField].[ProfileQuestionId] = [ProfileQuestion].[Id]
		INNER JOIN [ProfileSection] ON [ProfileSection].[Id] = [ProfileQuestion].[ProfileSectionId]
		LEFT JOIN [ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
		LEFT JOIN
			(
			SELECT
				[IrrelevanceFieldId]
			FROM
				[ProfileQuestion]
			GROUP BY
				[IrrelevanceFieldId]
			) tmpIrrelevance ON [ProfileField].[Id] = tmpIrrelevance.[IrrelevanceFieldId]
	ORDER BY
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber],
		[ProfileField].[FieldNumber]

	--Profile Field Metadata of the field group fields
	SELECT 
		tmpFieldGroups.[ProfileSectionId],
		tmpFieldGroups.[ProfileQuestionId],
		[ProfileField].[Id],
		[ProfileField].[ShortName],
		[ProfileField].[FieldNumber],
		[ProfileField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[ProfileField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable],
		CAST(0 AS bit) AS [AffectsRelevancy],
		[ProfileField].[Name],
		[ProfileField].[IsReadOnlyCurrentSituation] AS [IsReadOnlyCurrentSituation],		
		[ProfileField].[IsReadOnlyScenario] AS [IsReadOnlyScenario],		
		tmpFieldGroups.[IsPerSpecies],
		tmpFieldGroups.[IsRepeating],
		[ProfileField].[IncludeInSummary],
		tmpFieldGroups.[Id] As [ProfileFieldGroupId]		
	FROM
		[ProfileField] INNER JOIN
		(		
		SELECT  -- returns all the field groups
			[ProfileField].[Id],
			[ProfileField].[ProfileQuestionId],
			[ProfileQuestion].[QuestionNumber],
			[ProfileQuestion].[IsPerSpecies],
			[ProfileQuestion].[IsRepeating],
			[ProfileQuestion].[ProfileSectionId]
		FROM 
			[ProfileField] INNER JOIN
			[luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id] INNER JOIN
			[ProfileQuestion] ON [ProfileQuestion].[Id] = [ProfileField].[ProfileQuestionId]
		WHERE	
			[luDataFieldType].[Name] = ''Field Group''
		) tmpFieldGroups ON [ProfileField].[ProfileFieldGroupId] = tmpFieldGroups.[Id] INNER JOIN 
		[luDataFieldType] ON [ProfileField].[DataFieldTypeId] = [luDataFieldType].[Id] LEFT JOIN 
		[ReferenceTable] ON [ProfileField].[ReferenceTableId] = [ReferenceTable].[Id]
	ORDER BY
		tmpFieldGroups.[QuestionNumber],
		[ProfileField].[FieldNumber]
		
	--Question numbers made irrelevant by profile field change
	SELECT
		[ProfileField].[Id],
		CAST([ProfileSection].[SectionNumber] AS VARCHAR)+''.''+CAST([ProfileQuestion].[QuestionNumber] AS VARCHAR)
	FROM
		[ProfileField]
		INNER JOIN [ProfileQuestion] ON [ProfileQuestion].[IrrelevanceFieldId]=[ProfileField].[Id]
		INNER JOIN [ProfileSection] ON [ProfileSection].[Id]=[ProfileQuestion].[ProfileSectionId]
	ORDER BY
		[ProfileField].[Id],
		[ProfileSection].[SectionNumber],
		[ProfileQuestion].[QuestionNumber]


		
END




' 
END
GO
GRANT EXECUTE ON [dbo].[spgaProfileSectionMetadata] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgaSpeciesSectionMetadata]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		James Etherington
-- Create date: 06 Jan 2009
-- Description:	Gets species section metadata for all sections
-- =============================================
CREATE PROCEDURE [dbo].[spgaSpeciesSectionMetadata] 
AS
BEGIN

	--SpeciesSection
    SELECT
		[SpeciesSection].[Id],
		[SpeciesSection].[Name],
		[SpeciesSection].[ShortName],
		[SpeciesSection].[SectionNumber]
	FROM
		[SpeciesSection] 
	ORDER BY
		[SpeciesSection].[SectionNumber]
	
	--SpeciesQuestion
	SELECT
		[SpeciesQuestion].[SpeciesSectionId],
		[SpeciesQuestion].[Id],
		[SpeciesQuestion].[Name],
		[SpeciesQuestion].[QuestionNumber],
		[SpeciesQuestion].[ShortName]
	FROM
		[SpeciesQuestion] INNER JOIN 
		[SpeciesSection] ON [SpeciesQuestion].[SpeciesSectionId] = [SpeciesSection].[Id]
	ORDER BY
		[SpeciesSection].[SectionNumber], [SpeciesQuestion].[QuestionNumber]

	--SpeciesField
	SELECT
		[SpeciesQuestion].[SpeciesSectionId],
		[SpeciesQuestion].[Id],
		[SpeciesField].[Id],
		[SpeciesField].[Name], 
		[SpeciesField].[ShortName],
		[SpeciesField].[FieldNumber],
		[SpeciesField].[DataFieldTypeId],
		[luDataFieldType].[Name] AS [DataTypeName],
		[SpeciesField].[IsMandatory],
		[ReferenceTable].[Id] AS [ReferenceTableId],
		[ReferenceTable].[IsMaintainable] AS [ReferenceTableIsMaintainable]				
	FROM
		[SpeciesField] INNER JOIN [luDataFieldType] ON [SpeciesField].[DataFieldTypeId] = [luDataFieldType].[Id]
		INNER JOIN [SpeciesQuestion] ON [SpeciesField].[SpeciesQuestionId] = [SpeciesQuestion].[Id]
		LEFT JOIN [ReferenceTable] ON [SpeciesField].[ReferenceTableId] = [ReferenceTable].[Id] 
		INNER JOIN [SpeciesSection] ON [SpeciesSection].[Id] = [SpeciesQuestion].[SpeciesSectionId]
	ORDER BY
		[SpeciesSection].[SectionNumber],
		[SpeciesQuestion].[QuestionNumber],
		[SpeciesField].[FieldNumber]

END



' 
END
GO
GRANT EXECUTE ON [dbo].[spgaSpeciesSectionMetadata] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiSsoUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant Turtle
-- Create date: 27 January 2009
-- Description:	Inserts or updates an SSO user
-- =============================================
CREATE PROCEDURE [spiSsoUser]
	(
		@UserName varchar(50),
		@FullName varchar(100),
		@Organisation varchar(100),
		@SsoUserId uniqueidentifier
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Exists Int
	SELECT
		@Exists = COUNT([Id])
	FROM
		[User]
	WHERE
		[SsoUserId] = @SsoUserId
	
	IF @Exists=0
	BEGIN
		INSERT INTO [dbo].[User]
			(
			[UserName],
			[FullName],
			[Organisation],
			[IsProfileEditor],
			[IsPolicyProfileUser],
			[SsoUserId],
			[IsUserManagementSystem]
			)
     VALUES
           (
			@UserName,
			@FullName,
			@Organisation,
			0,
			0,
			@SsoUserId,
			0
			)	
	END 
	ELSE 
	BEGIN
		IF @Exists=1
		BEGIN
			UPDATE [dbo].[User]
			SET
				UserName=@UserName,
				FullName=@FullName,
				Organisation=@Organisation	
			WHERE
				[SsoUserId]=@SsoUserId
		END 
		ELSE 
		BEGIN
			RAISERROR(''This user exists multiple times'', 16, 1)
		END
	END
END

' 
END
GO
GRANT EXECUTE ON [dbo].[spiSsoUser] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdSsoUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Grant P. Turtle
-- Create date: 27 January 2009
-- Description:	Deletes an SSO user
-- =============================================
CREATE PROCEDURE [dbo].[spdSsoUser]
	@SsoUserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF EXISTS
		(
			SELECT [UserId] 
			FROM [dbo].[ProfileVersionSectionUser] 
				INNER JOIN [dbo].[User] ON [User].[Id] = [ProfileVersionSectionUser].[UserId]
			WHERE [User].[SsoUserId] = @SsoUserId
		)
	BEGIN
		RETURN
	END

		IF EXISTS
		(
			SELECT [UserId] 
			FROM [dbo].[ReviewComment] 
				INNER JOIN [dbo].[User] ON [User].[Id] = [ReviewComment].[UserId]
			WHERE [User].[SsoUserId] = @SsoUserId
		)
	BEGIN
		RETURN
	END
		
	IF EXISTS
		(
			SELECT [UserId] 
			FROM [dbo].[ReferenceTableAuditLog] 
				INNER JOIN [dbo].[User] ON [User].[Id] = [ReferenceTableAuditLog].[UserId]
			WHERE [User].[SsoUserId] = @SsoUserId
		)
	BEGIN
		RETURN
	END
		
	IF EXISTS
		(
			SELECT [UserId] 
			FROM [dbo].[SpeciesTableAuditLog] 
				INNER JOIN [dbo].[User] ON [User].[Id] = [SpeciesTableAuditLog].[UserId]
			WHERE [User].[SsoUserId] = @SsoUserId
		)
	BEGIN
		RETURN
	END



	BEGIN TRANSACTION

		DELETE [dbo].[ProfileSectionUser] FROM 
			[dbo].[ProfileSectionUser]
			INNER JOIN [dbo].[User] ON [User].[Id] = [ProfileSectionUser].[UserId]
		WHERE
			[User].[SsoUserId] = @SsoUserId

		DELETE [dbo].[ProfileUser] FROM 
			[dbo].[ProfileUser] 
			INNER JOIN [dbo].[User] ON [User].[Id] = [ProfileUser].[UserId]
		WHERE
			[User].[SsoUserId] = @SsoUserId

		DELETE FROM 
			[dbo].[User] 
		WHERE 
			[SsoUserId] = @SsoUserId
	
	IF @@ERROR <> 0
	BEGIN
		-- Rollback the transaction
		ROLLBACK TRANSACTION

		-- Raise an error and return
		RAISERROR (''Error deleting user.'', 16, 1)
		RETURN
	END
	
	COMMIT TRANSACTION


END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdSsoUser] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 26 November 2008
-- Description:	deletes an answer row for a repeating question
-- =============================================
CREATE PROCEDURE spdProfileVersionQuestionRow
	@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- first remove the field values from inside the row
    DELETE
		[ProfileVersionFieldValue]
	WHERE
		[ProfileVersionQuestionRowId] = @Id

	-- then remove the row
	DELETE
		[ProfileVersionQuestionRow]
	WHERE
		[Id] = @Id

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spdProfileVersionQuestionRow] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spiProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 26 November 2008
-- Description:	inserts a new answer row for a repeating question
-- =============================================
CREATE PROCEDURE spiProfileVersionQuestionRow
	@Id uniqueidentifier,
	@ProfileVersionId uniqueidentifier,
	@ProfileQuestionId uniqueidentifier,
	@SequenceNumber int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [ProfileVersionQuestionRow]
		(
		[Id],
		[ProfileVersionId],
		[ProfileQuestionId],
		[SequenceNumber]
		)
	VALUES
		(
		@Id,
		@ProfileVersionId,
		@ProfileQuestionId,
		@SequenceNumber
		)

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spiProfileVersionQuestionRow] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spuProfileVersionQuestionRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Richard J. Northedge
-- Create date: 26 November 2008
-- Description:	updates the sequence number of a row for a repeating question
-- =============================================
CREATE PROCEDURE spuProfileVersionQuestionRow
	@Id uniqueidentifier,
	@SequenceNumber int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE
		[ProfileVersionQuestionRow]
	SET
		[SequenceNumber] = @SequenceNumber
	WHERE
		[Id] = @Id

END
' 
END
GO
GRANT EXECUTE ON [dbo].[spuProfileVersionQuestionRow] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileQuestionBySectionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<JDE>
-- Create date: <17/02/09>
-- Description:	<retrieves profile question info>
-- =============================================
CREATE PROCEDURE [dbo].[spgProfileQuestionBySectionId]
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		[Id],
		[Name],
		[QuestionNumber]
	FROM
		[ProfileQuestion]
	WHERE
		[ProfileQuestion].[ProfileSectionId] = @ProfileSectionId
	ORDER BY
		[QuestionNumber]
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileQuestionBySectionId] TO [VLAProfilesUser] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spdReviewCommentsByProfileSection]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		    Grant P. Turtle
-- Create date: 	16/02/2009
-- Description:	    deletes all review comments
-- =============================================
CREATE PROCEDURE [dbo].[spdReviewCommentsByProfileSection]
	@ProfileVersionId uniqueidentifier,
	@ProfileSectionId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @currentId uniqueidentifier

	BEGIN TRANSACTION

	DECLARE DeleteCursor CURSOR FOR
	WITH ReviewCommentHierarchy (Id, HierarchyLevel) AS
	(
	   SELECT 
		[Id],
		1 as [HierarchyLevel]
	   FROM 
		[dbo].[ReviewComment]
	   WHERE 
		[ParentId] IS NULL AND
		[ProfileVersionId] = @ProfileVersionId AND
		[ProfileSectionId] = @ProfileSectionId
			 
	   UNION ALL

	   SELECT
		  rc.[Id],
		  rch.[HierarchyLevel] + 1 AS [HierarchyLevel]
	   FROM [ReviewComment] rc
		  INNER JOIN [ReviewCommentHierarchy] rch ON
			 rc.[ParentId] = rch.[Id]
	)

	SELECT [Id]
	FROM [ReviewCommentHierarchy]
	ORDER BY [HierarchyLevel] DESC

	OPEN DeleteCursor

	FETCH NEXT FROM DeleteCursor
	INTO @currentId

	WHILE @@FETCH_STATUS = 0
	BEGIN

	DELETE FROM 
		[dbo].[ReviewComment]
	WHERE
		[Id]=@currentId


	FETCH NEXT FROM DeleteCursor
	INTO @currentId

	END

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
    ROLLBACK

    -- Raise an error and return
    RAISERROR (''Error deleting review comments.'', 16, 1)
    RETURN
 END

	COMMIT TRANSACTION

	CLOSE DeleteCursor
	DEALLOCATE DeleteCursor

END


' 
END
GO
GRANT EXECUTE ON [dbo].[spdReviewCommentsByProfileSection] TO [VLAProfilesUser]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileVersionNoteByType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <28 jan 2010>
-- Description:	<return a list of notes filtered by profile version and note type>
-- =============================================
CREATE PROCEDURE spgProfileVersionNoteByType
	@ProfileNoteTypeId uniqueidentifier,
	@ProfileVersionId uniqueidentifier	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	SELECT 
		[ProfileVersionNote].[Id],
		[ProfileVersionNote].[NoteText],
		[ProfileVersionNote].[LastUpdated]
	FROM
		[ProfileVersionNote]
	WHERE
		[ProfileVersionNote].[ProfileNoteTypeId] = @ProfileNoteTypeId AND		
		[ProfileVersionNote].[ProfileVersionId] = @ProfileVersionId 
	ORDER BY 
		[ProfileVersionNote].[NoteText]
	
	SELECT 
		[ProfileVersionNoteQuestion].[ProfileVersionNoteId],
		[ProfileVersionNoteQuestion].[ProfileSectionId],		
		[ProfileVersionNoteQuestion].[ProfileQuestionId]		
	FROM
		[ProfileVersionNoteQuestion] INNER JOIN 
		[ProfileVersionNote] ON	[ProfileVersionNoteQuestion].[ProfileVersionNoteId] = [ProfileVersionNote].[Id]
	WHERE
		[ProfileVersionNote].[ProfileNoteTypeId] = @ProfileNoteTypeId AND		
		[ProfileVersionNote].[ProfileVersionId] = @ProfileVersionId 	
	
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileVersionNoteByType] TO [VLAProfilesUser]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spgProfileSectionIdByProfileVersionNoteId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<James Etherington>
-- Create date: <28 jan 2010>
-- Description:	<returns the profile sections associated with a note>
-- =============================================
CREATE PROCEDURE spgProfileSectionIdByProfileVersionNoteId
	@ProfileVersionNoteId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	SELECT 
		ProfileVersionNoteQuestion.ProfileSectionId,
		ProfileVersionNote.NoteText
	FROM 
		ProfileVersionNoteQuestion INNER JOIN ProfileVersionNote ON
		ProfileVersionNoteQuestion.ProfileVersionNoteId = ProfileVersionNote.Id
	WHERE 
		ProfileVersionNoteQuestion.ProfileVersionNoteId = @ProfileVersionNoteId
	
END
' 
END
GO
GRANT EXECUTE ON [dbo].[spgProfileSectionIdByProfileVersionNoteId] TO [VLAProfilesUser]
GO
