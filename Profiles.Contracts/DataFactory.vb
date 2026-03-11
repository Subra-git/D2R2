Imports Profiles.Contracts.ServiceContracts
Imports StructureMap

Public Module DataFactory

    Private mProfileSectionMetadataList As List(Of DataContracts.ProfileSectionMetadata)
    Private mSpeciesSectionMetadataList As List(Of DataContracts.SpeciesSectionMetadata)
    Private mProfileDiseaseReviewsMetadataList As List(Of DataContracts.DiseaseReviewsData)

    Public Function GetStaticReportService() As IStaticReportService

        Return ObjectFactory.GetInstance(Of IStaticReportService)

    End Function

    Public Function GetProfileReportService() As IProfileReportService

        Return ObjectFactory.GetInstance(Of IProfileReportService)()

    End Function

    Public Function GetUserAuthenticationService() As IUserAuthenticationService

        Return ObjectFactory.GetInstance(Of IUserAuthenticationService)()

    End Function

    Public Function GetProfileNoteService() As IProfileNoteService

        Return ObjectFactory.GetInstance(Of IProfileNoteService)()

    End Function

    Public Function GetProfileSearchService() As IProfileSearchService

        Return ObjectFactory.GetInstance(Of IProfileSearchService)()

    End Function

    Public Function GetErrorLogService() As IErrorLogService

        Return ObjectFactory.GetInstance(Of IErrorLogService)()

    End Function

    Public Function GetSpellCheckService() As ISpellCheckService

        Return ObjectFactory.GetInstance(Of ISpellCheckService)()

    End Function

	Public Function GetProfileVersionDataService() As IProfileVersionDataService

		Return ObjectFactory.GetInstance(Of IProfileVersionDataService)()

	End Function

	Public Function GetBespokeReportTemplateService() As IBespokeReportTemplateService

		Return ObjectFactory.GetInstance(Of IBespokeReportTemplateService)()

	End Function

	Public Function GetSpeciesDataService() As ISpeciesDataService

		Return ObjectFactory.GetInstance(Of ISpeciesDataService)()

	End Function

	Public Function GetProfileMetadata() As List(Of DataContracts.ProfileSectionMetadata)

        If mProfileSectionMetadataList Is Nothing Then
            Dim service As IProfileVersionDataService = GetProfileVersionDataService()
            mProfileSectionMetadataList = service.GetProfileMetadata()
        End If

        Return mProfileSectionMetadataList

    End Function

    Public Function GetSpeciesMetadata() As List(Of DataContracts.SpeciesSectionMetadata)

        If mSpeciesSectionMetadataList Is Nothing Then
            Dim service As ISpeciesDataService = GetSpeciesDataService()
            mSpeciesSectionMetadataList = service.GetSpeciesMetadata()
        End If

        Return mSpeciesSectionMetadataList

    End Function

    Public Function GetReviewCommentService() As IReviewCommentService

        Return ObjectFactory.GetInstance(Of IReviewCommentService)()

    End Function

    Public Function GetReferenceValueService() As IReferenceValueService

        Return ObjectFactory.GetInstance(Of IReferenceValueService)()

    End Function

    Public Function GetProfileQuestionService() As IProfileQuestionService

        Return ObjectFactory.GetInstance(Of IProfileQuestionService)()

    End Function

    Public Function GetUserMaintenanceService() As IUserMaintenanceService

        Return ObjectFactory.GetInstance(Of IUserMaintenanceService)()

    End Function

    Public Function GetSpeciesMaintenanceService() As ISpeciesMaintenanceService

        Return ObjectFactory.GetInstance(Of ISpeciesMaintenanceService)()

    End Function

    Public Function GetProfileManagementService() As IProfileManagementService

        Return ObjectFactory.GetInstance(Of IProfileManagementService)()

    End Function

    Public Function GetPrioritisationService() As IPrioritisationService

        Return ObjectFactory.GetInstance(Of IPrioritisationService)()

    End Function

    Public Function GetDiseaseRankingService() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function GetFilterNumberService() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function GetDiseaseReferenceValueService() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function DeleteFilterNumberService() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function GetSpeciesDataServiceForSelectedDiseases() As ISpeciesDataService

        Return ObjectFactory.GetInstance(Of ISpeciesDataService)()

    End Function

    Public Function DeleteFilterNumberFromFilterService() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function GetDiseaseReviewsForSelectedDates() As IDiseaseRankingService

        Return ObjectFactory.GetInstance(Of IDiseaseRankingService)()

    End Function

    Public Function GetReviewEmailService() As IReviewEmailService
        Return ObjectFactory.GetInstance(Of IReviewEmailService)()
    End Function
End Module
