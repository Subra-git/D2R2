Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SetProfileVersionPublicAccessCommand
    Inherits CommandBase

#Region " Authorisation Rules "

    Public Shared Function CanChangePublicAccess(ByVal profileId As Guid) As Boolean

        Dim profile As Profile = profile.GetProfile(profileId)
        Dim profileVersion As ProfileVersionInfo

        If Not profile.HasCurrentPublishedVersion Then
            Return False
        Else
            profileVersion = ProfileVersionInfo.GetProfileVersionInfo(profile.CurrentPublishedVersion.Id)
        End If

        If profileVersion.IsPublic Then
            Return False
        End If

        If profileVersion.IsWhatIfScenario AndAlso Not profile.ParentProfile.HasPublicVersion Then
            Return False
        End If

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mProfileVersionId As Guid

    Friend ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Function SetProfileVersionPublic(ByVal profileVersionId As Guid) As Boolean
        Dim cmd As New SetProfileVersionPublicAccessCommand
        cmd.mProfileVersionId = profileVersionId
        cmd = DataPortal.Execute(Of SetProfileVersionPublicAccessCommand)(cmd)
        Return True
    End Function

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionId)
        If Not profileVersion.IsCurrent OrElse profileVersion.Status <> ProfileVersionStatus.Published Then
            Throw New InvalidOperationException("You cannot change the public status of a profile that is not current and published.")
        End If

        Dim profile As Profile = profile.GetProfile(profileVersion.ProfileId)
        If profileVersion.IsWhatIfScenario AndAlso Not profile.ParentProfile.HasPublicVersion Then
            Throw New InvalidOperationException("You cannot make this scenario public because there is no public version of this profile.")
        End If

        If profileVersion.IsPublic Then
            Throw New InvalidOperationException("This profile version is already public")
        End If

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        db.SetProfileVersionPublicAccess(New DataContracts.SetProfileVersionPublicAccessRequest(mProfileVersionId))
        
    End Sub

#End Region

End Class
