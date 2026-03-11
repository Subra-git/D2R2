Imports Profiles.Contracts
Imports Csla

<Serializable()> _
Public Class ProfilesIdentity
    Inherits Csla.ReadOnlyBase(Of ProfilesIdentity)
    Implements System.Security.Principal.IIdentity

    Private mSsoTokenId As Guid = Guid.Empty
    Private mIsAuthenticated As Boolean
    Private mUserId As Guid = Guid.Empty
    Private mUserName As String = String.Empty
    Private mFullName As String = String.Empty
    Private mOrganisation As String = String.Empty
    Private mIsProfileEditor As Boolean
    Private mIsPolicyProfileUser As Boolean
    Private mIsUserManagementSystem As Boolean
    Private mIsSsoUser As Boolean
    Private mGlobalUserRole As String
    Private mContributorList As New Dictionary(Of Guid, ContributorInfo)
    Private mReviewerList As New Dictionary(Of Guid, ProfileRoleInfo)

#Region " Business methods "

    Protected Overrides Function GetIdValue() As Object
        Return mUserName
    End Function

    Public ReadOnly Property ContributorRoles() As ContributorInfo()
        Get
            Return mContributorList.Values.ToArray()
        End Get
    End Property

    Public ReadOnly Property ReviewerRoles() As ProfileRoleInfo()
        Get
            Return mReviewerList.Values.ToArray()
        End Get
    End Property

    Public ReadOnly Property AuthenticationType() As String Implements System.Security.Principal.IIdentity.AuthenticationType
        Get
            Return "Csla"
        End Get
    End Property

    Public ReadOnly Property IsAuthenticated() As Boolean Implements System.Security.Principal.IIdentity.IsAuthenticated
        Get
            Return mIsAuthenticated
        End Get
    End Property

    Public ReadOnly Property DisplayName() As String
        Get
            If mIsAuthenticated Then
                Return mFullName & " (" & mUserName & ")"
            Else
                Return "Anonymous user"
            End If
        End Get
    End Property

    Public ReadOnly Property Name() As String Implements System.Security.Principal.IIdentity.Name
        Get
            If mSsoTokenId.Equals(Guid.Empty) Then
                Return mUserName
            Else
                Return mSsoTokenId.ToString()
            End If
        End Get
    End Property

    Public ReadOnly Property UserId() As Guid
        Get
            Return mUserId
        End Get
    End Property

    Public ReadOnly Property UserName() As String
        Get
            Return mUserName
        End Get
    End Property

    Public ReadOnly Property FullName() As String
        Get
            Return mFullName
        End Get
    End Property

    Public ReadOnly Property Organisation() As String
        Get
            Return mOrganisation
        End Get
    End Property

    Public ReadOnly Property IsProfileEditor() As Boolean
        Get
            Return mIsProfileEditor
        End Get
    End Property

    Public ReadOnly Property IsPolicyProfileUser() As Boolean
        Get
            Return mIsPolicyProfileUser
        End Get
    End Property

    Public ReadOnly Property IsSsoUser() As Boolean
        Get
            Return mIsSsoUser
        End Get
    End Property

    Public ReadOnly Property IsUserManagementSystem() As Boolean
        Get
            Return mIsUserManagementSystem
        End Get
    End Property

    Public ReadOnly Property GlobalUserRole() As String
        Get
            Return mGlobalUserRole
        End Get
    End Property

    Public ReadOnly Property IsContributorOrReviewer() As Boolean
        Get
            Return IsContributor Or IsReviewer
        End Get
    End Property

    Public Function IsProfileContributorOrReviewer(ByVal profileId As Guid) As Boolean

        Return IsProfileContributor(profileId) Or IsProfileReviewer(profileId)

    End Function

    Public ReadOnly Property IsContributor() As Boolean
        Get
            Return mContributorList.Count > 0
        End Get
    End Property

    Public Function IsProfileContributor(ByVal profileId As Guid) As Boolean

        Return mContributorList.ContainsKey(profileId)

    End Function

    Public ReadOnly Property IsReviewer() As Boolean
        Get
            Return mReviewerList.Count > 0
        End Get
    End Property

    Public Function IsProfileReviewer(ByVal profileId As Guid) As Boolean

        Return mReviewerList.ContainsKey(profileId)

    End Function

    Public Function IsProfileSectionContributor(ByVal profileId As Guid, ByVal profileSectionId As Guid) As Boolean
        If mContributorList.ContainsKey(profileId) Then
            Return mContributorList(profileId).CanAccessSection(profileSectionId)
        Else
            Return False
        End If
    End Function

#End Region

    Private Sub New(ByVal ssoTokenId As Guid)
        mSsoTokenId = ssoTokenId
    End Sub

    Private Sub New()
        '
    End Sub

#Region " Authorization Rules "

    Private Function CanBeUserManagementSystem() As Boolean
        Return _
            Not mIsProfileEditor AndAlso _
            Not mIsPolicyProfileUser AndAlso _
            mIsAuthenticated AndAlso _
            mContributorList.Count = 0 AndAlso _
            mReviewerList.Count = 0
    End Function

#End Region

#Region " Data access "

    <Serializable()> _
    Private Class Criteria
        Private mUserName As String
        Private mAuthenticationType As String
        Private mSsoTokenId As Guid

        Public Sub New(ByVal userName As String, ByVal authenticationType As String)
            mUserName = userName
            mAuthenticationType = authenticationType
            mSsoTokenId = Guid.NewGuid()
        End Sub

        Public Sub New(ByVal userName As String, ByVal authenticationType As String, ByVal ssoTokenId As Guid)
            mUserName = userName
            mAuthenticationType = authenticationType
            mSsoTokenId = ssoTokenId
        End Sub

        Public ReadOnly Property UserName() As String
            Get
                Return mUserName
            End Get
        End Property

        Public ReadOnly Property AuthenticationType() As String
            Get
                Return mAuthenticationType
            End Get
        End Property

        Public ReadOnly Property SsoTokenId() As Guid
            Get
                Return mSsoTokenId
            End Get
        End Property

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IUserAuthenticationService = DataFactory.GetUserAuthenticationService()
        Dim userIdentity As DataContracts.UserIdentityData = _
            db.GetUserIdentity(New DataContracts.GetUserIdentityRequest(criteria.UserName, criteria.AuthenticationType))

        mSsoTokenId = criteria.SsoTokenId
        mUserId = userIdentity.UserId
        mUserName = userIdentity.UserName
        mFullName = userIdentity.FullName
        mOrganisation = userIdentity.Organisation
        mIsProfileEditor = userIdentity.IsProfileEditor
        mIsPolicyProfileUser = userIdentity.IsPolicyProfileUser
        mIsSsoUser = userIdentity.IsSsoUser
        mGlobalUserRole = GetGlobalUserRole()
        mIsAuthenticated = userIdentity.IsAuthenticated
        mIsUserManagementSystem = userIdentity.IsUserManagementSystem

        For Each contributorRole As DataContracts.ProfileRoleData In userIdentity.ContributorRoles
            mContributorList.Add(contributorRole.ProfileId, New ContributorInfo(contributorRole))
        Next

        For Each reviewerRole As DataContracts.ProfileRoleData In userIdentity.ReviewerRoles
            mReviewerList.Add(reviewerRole.ProfileId, New ProfileRoleInfo(reviewerRole))
        Next

        If mIsUserManagementSystem AndAlso Not CanBeUserManagementSystem() Then
            Throw New System.Security.SecurityException("This user cannot act as the user management system")
        End If

    End Sub

    Private Function GetGlobalUserRole() As String

        Dim role As String = "("
        If mIsProfileEditor Then
            role &= "Profile editor"
            If mIsPolicyProfileUser Then
                role &= ", "
            End If
        End If
        If mIsPolicyProfileUser Then
            role &= "Policy profile user"
        End If
        role &= ")"
        If role.Length > 2 Then
            Return role
        Else
            Return String.Empty
        End If

    End Function

#End Region

#Region " Factory methods "

    Friend Shared Function UnauthenticatedIdentity() As ProfilesIdentity
        Return New ProfilesIdentity()
    End Function

    Friend Shared Function UnauthenticatedIdentity(ByVal ssoTokenId As Guid) As ProfilesIdentity
        Return New ProfilesIdentity(ssoTokenId)
    End Function

    Friend Shared Function GetIdentity(ByVal userId As String, ByVal authenticationType As String) As ProfilesIdentity
        Return Csla.DataPortal.Fetch(Of ProfilesIdentity)(New Criteria(userId, authenticationType))
    End Function

    Friend Shared Function GetIdentity(ByVal userId As String, ByVal authenticationType As String, ByVal ssoTokenId As Guid) As ProfilesIdentity
        Return Csla.DataPortal.Fetch(Of ProfilesIdentity)(New Criteria(userId, authenticationType, ssoTokenId))
    End Function

#End Region

End Class

