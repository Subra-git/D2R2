Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class ProfileVersionInfoList
    Inherits ReadOnlyListBase(Of ProfileVersionInfoList, ProfileVersionInfo)

#Region " Authorization Rules "

    Public Shared Function CanGetPublished() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsAuthenticated AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanGetDraft() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return identity.IsProfileEditor OrElse identity.IsPolicyProfileUser OrElse identity.IsContributorOrReviewer
    End Function

    Public Shared Function CanGetDraft(ByVal profileId As Guid) As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return identity.IsProfileEditor OrElse identity.IsPolicyProfileUser OrElse identity.IsProfileContributorOrReviewer(profileId)
    End Function

    Public Shared Function CanGetPublic() As Boolean

        Return True

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetPublishedHistory(ByVal profileId As Guid) As ProfileVersionInfoList

        If Not CanGetPublished() Then
            Throw New System.Security.SecurityException("You do not have permission to view a history of published profile versions for this profile.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionInfoList)(New Criteria(profileId, True))

    End Function

    Public Shared Function GetDraftHistory(ByVal profileId As Guid) As ProfileVersionInfoList

        If Not CanGetDraft(profileId) Then
            Throw New System.Security.SecurityException("You do not have permission to view a history of draft profile versions for this profile.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionInfoList)(New Criteria(profileId, False))

    End Function

    Public Shared Function GetPublicHistory(ByVal profileId As Guid) As ProfileVersionInfoList
        If Not CanGetPublic() Then
            Throw New System.Security.SecurityException("You do not have permission to view a public profile versions for this profile.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionInfoList)(New Criteria(profileId, True, True))
    End Function

    Public Shared Function GetCurrentPublicCurrentSituation() As ProfileVersionInfoList
        If Not CanGetPublic() Then
            Throw New System.Security.SecurityException("You do not have permission to view this list.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionInfoList)(New Criteria(Guid.Empty))
    End Function

    Public Shared Function GetCurrentPublicWhatIfScenario(ByVal parentProfileId As Guid) As ProfileVersionInfoList
        If Not CanGetPublic() Then
            Throw New System.Security.SecurityException("You do not have permission to view this list.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionInfoList)(New Criteria(parentProfileId))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mIsPublished As Boolean
        Private mProfileId As Guid
        Private mPublicOnly As Boolean
        Private mParentProfileId As Guid

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property IsPublished() As Boolean
            Get
                Return mIsPublished
            End Get
        End Property

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
        End Property

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property PublicOnly() As Boolean
            Get
                Return mPublicOnly
            End Get
        End Property

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property ParentProfileId() As Guid
            Get
                Return mParentProfileId
            End Get
        End Property

        Public Sub New(ByVal profileId As Guid, ByVal isPublished As Boolean)
            mProfileId = profileId
            mIsPublished = isPublished
            mPublicOnly = False
            mParentProfileId = Nothing
        End Sub

        Public Sub New(ByVal profileId As Guid, ByVal isPublished As Boolean, ByVal publicOnly As Boolean)
            If publicOnly AndAlso Not isPublished Then
                Throw New InvalidOperationException("You cannot have draft profiles that are public")
            End If
            mProfileId = profileId
            mIsPublished = isPublished
            mPublicOnly = publicOnly
            mParentProfileId = Nothing
        End Sub

        Public Sub New(ByVal parentProfileId As Guid)
            mParentProfileId = parentProfileId
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileSearchService = DataFactory.GetProfileSearchService()
        Dim profileVersions As List(Of DataContracts.ProfileSearchProfileVersionInfo)

        If criteria.ParentProfileId.Equals(Guid.Empty) AndAlso criteria.ProfileId.Equals(Guid.Empty) Then
            profileVersions = db.GetCurrentPublicCurrentSituation()
        ElseIf Not criteria.ParentProfileId.Equals(Guid.Empty) AndAlso IsValidGuid(criteria.ParentProfileId.ToString()) Then
            profileVersions = db.GetCurrentPublicWhatIfScenario(New DataContracts.GetCurrentPublicWhatIfScenarioRequest(criteria.ParentProfileId))
        ElseIf criteria.PublicOnly Then
            profileVersions = db.GetPublicProfileHistory(New DataContracts.GetPublicProfileHistoryRequest(criteria.ProfileId))
        ElseIf criteria.IsPublished Then
            profileVersions = db.GetPublishedProfileHistory(New DataContracts.GetPublishedProfileHistoryRequest(criteria.ProfileId))
        Else
            profileVersions = db.GetDraftProfileHistory(New DataContracts.GetDraftProfileHistoryRequest(criteria.ProfileId))
        End If

        For Each profileVersion As DataContracts.ProfileSearchProfileVersionInfo In profileVersions
            Add(ProfileVersionInfo.GetProfileVersionInfo(profileVersion))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

