Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileManagementService

        Function CreateProfile(ByVal request As CreateProfileRequest) As CreateProfileResponse

        Function GetProfileAttributes(ByVal request As GetProfileAttributesRequest) As ProfileAttributes

        Function UpdateProfileAttributes(ByVal request As UpdateProfileAttributesRequest) As UpdateProfileAttributesResponse

        Function GetNewProfileDefaults(ByVal request As GetNewProfileDefaultsRequest) As NewProfileDefaults

        Function GetAffectedSpecies(ByVal request As GetAffectedSpeciesRequest) As AffectedSpecies

        Sub SetProfileVersionPublicAccess(ByVal request As SetProfileVersionPublicAccessRequest)

        Function CreateNewProfileVersion(ByVal request As NewProfileVersionRequest) As NewProfileVersionResponse

        Function DeleteProfileVersion(ByVal request As DeleteProfileVersionRequest) As DeleteProfileVersionResponse

        Function GetProfileStatusTypes() As List(Of DataContracts.ProfileStatusType)

        Sub UpdateProfileStatus(ByVal request As UpdateProfileStatusRequest)

    End Interface

End Namespace

