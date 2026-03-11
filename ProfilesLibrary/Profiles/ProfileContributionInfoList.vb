Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class ProfileContributionInfoList
    Inherits ReadOnlyListBase(Of ProfileContributionInfoList, ProfileContributionInfo)


#Region " Authorization Rules "

    Public Shared Function CanGetProfileContributionInfoList(ByVal profileVersionId As Guid) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
        Return CanGetProfileContributionInfoList(currentProfileVersionInfo)

    End Function

    Public Shared Function CanGetProfileContributionInfoList(ByVal profileVersionInfo As ProfileVersionInfo) As Boolean

        If Not profileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        Else
            'the profile version must be a draft and you must be a profile editor, 
            'policy profile user or a contributor or a reviewer to get the list
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

            If identity.IsUserManagementSystem Then
                Return False
            End If

            Return (identity.IsProfileContributorOrReviewer(profileVersionInfo.ProfileId) OrElse _
                identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)
        End If

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileContributionInfoList(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As ProfileContributionInfoList

        'Here is where we need to check if the user is allowed to get the contribution info list
        If Not CanGetProfileContributionInfoList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to get the Contribution List for this profile version and profile section.")
        End If
        Return DataPortal.Fetch(Of ProfileContributionInfoList)(New Criteria(profileVersionId, profileSectionId))

    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid

        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public ReadOnly Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService
        Dim profileContributions As List(Of DataContracts.ProfileContributionData) _
                = db.GetContributions(New DataContracts.GetContributionsRequest(criteria.ProfileVersionId, criteria.ProfileSectionId))

        For Each profileContribution As DataContracts.ProfileContributionData In profileContributions
            Me.Add(ProfileContributionInfo.GetProfileContributionInfo(profileContribution))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

