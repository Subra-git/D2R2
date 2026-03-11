Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileVersionDataService

        <OperationContract()> _
        Function GetProfileMetadata() As List(Of ProfileSectionMetadata)

        <OperationContract()> _
        Function GetContributions(ByVal request As GetContributionsRequest) As List(Of ProfileContributionData)

        <OperationContract()> _
        Function GetSectionReviewFrequencies() As List(Of SectionReviewFrequency)

        <OperationContract()> _
        Function GetSectionReviewStatusTypes() As List(Of SectionReviewStatusType)

        <OperationContract()> _
        Function GetProfileVersionAnswerData(ByVal request As GetProfilesAnswerDataRequest) As ProfileAnswerData

        <OperationContract()> _
        Function GetProfileVersionAnswerDataSingleSection(ByVal request As GetProfilesAnswerDataSingleSectionRequest) As ProfileAnswerDataSingleSection

        <OperationContract()> _
        Function UpdateProfileVersionAnswerData(ByVal request As DataContracts.ProfileAnswerDataChangeSet) As ProfileAnswerDataChangeResult

    End Interface

End Namespace


