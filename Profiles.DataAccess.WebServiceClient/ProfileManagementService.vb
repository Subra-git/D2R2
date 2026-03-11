Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ProfileManagementService
    Implements IProfileManagementService

    Public Sub SetProfileVersionPublicAccess(ByVal request As SetProfileVersionPublicAccessRequest) Implements IProfileManagementService.SetProfileVersionPublicAccess
        Throw New InvalidOperationException("You cannot set the public access flag of a profile version via the web service.")
    End Sub

    Public Function DeleteProfileVersion(ByVal request As DeleteProfileVersionRequest) As DeleteProfileVersionResponse Implements IProfileManagementService.DeleteProfileVersion
        Throw New InvalidOperationException("You cannot delete a profile version via the web service.")
    End Function

    Public Function CreateNewProfileVersion(ByVal request As NewProfileVersionRequest) As NewProfileVersionResponse Implements IProfileManagementService.CreateNewProfileVersion
        Throw New InvalidOperationException("You cannot create a new profile version via the web service.")
    End Function

    Public Function GetProfileAttributes(ByVal request As GetProfileAttributesRequest) As ProfileAttributes Implements IProfileManagementService.GetProfileAttributes
        Throw New InvalidOperationException("You cannot get profile attributes via the web service.")
    End Function

    Public Function GetNewProfileDefaults(ByVal request As GetNewProfileDefaultsRequest) As NewProfileDefaults Implements IProfileManagementService.GetNewProfileDefaults
        Throw New InvalidOperationException("You cannot get new profile cloned attributes via the web service.")
    End Function

    Public Function CreateProfile(ByVal request As CreateProfileRequest) As CreateProfileResponse Implements IProfileManagementService.CreateProfile
        Throw New InvalidOperationException("You cannot create a new profile via the web service.")
    End Function

    Public Function UpdateProfileAttributes(ByVal request As UpdateProfileAttributesRequest) As UpdateProfileAttributesResponse Implements IProfileManagementService.UpdateProfileAttributes
        Throw New InvalidOperationException("You cannot update profile attributes via the web service.")
    End Function

    Public Function GetAffectedSpecies(ByVal request As GetAffectedSpeciesRequest) As AffectedSpecies Implements IProfileManagementService.GetAffectedSpecies
        Throw New InvalidOperationException("You cannot get affected species details via the web service.")
    End Function

    Public Function GetProfileStatusTypes() As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileStatusType) Implements Contracts.ServiceContracts.IProfileManagementService.GetProfileStatusTypes
        Throw New InvalidOperationException("You cannot get the profile status types via the web service.")
    End Function

    Public Sub UpdateProfileStatus(ByVal request As Contracts.DataContracts.UpdateProfileStatusRequest) Implements Contracts.ServiceContracts.IProfileManagementService.UpdateProfileStatus
        Throw New InvalidOperationException("You cannot update the profile status via the web service.")
    End Sub
End Class
