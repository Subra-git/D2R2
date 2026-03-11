Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoUserProfile
    Inherits BusinessBase(Of SsoUserProfile)

    Private mId As Guid  'ProfileId
    Private mTitle As String
    Private mRoleId As Guid
    Private mRoleName As String
    Private mIsContributor As Boolean
    Private mReviewEmail As Boolean
    Private mSectionPermissions As Dictionary(Of Guid, Guid)
    Private mPermissionsAddList As Dictionary(Of Guid, Guid)
    Private mPermissionsDeleteList As Dictionary(Of Guid, Guid)

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mId
        End Get
    End Property

    Public Property Title() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mTitle
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            If mTitle <> value Then
                mTitle = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property RoleId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mRoleId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            If mRoleId <> value Then
                mRoleId = value
                PropertyHasChanged()
                mIsContributor = ProfileUserRoleList.GetProfileUserRole(mRoleId).IsContributor
                PropertyHasChanged("IsContributor")
                If Not mIsContributor Then
                    RemoveAllSectionPermissions()
                End If
            End If
        End Set
    End Property

    Public Property RoleName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mRoleName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            If mRoleName <> value Then
                mRoleName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property IsContributor() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mIsContributor
        End Get        
    End Property

    Public ReadOnly Property SectionPermissions() As List(Of Guid)
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mSectionPermissions.Values.ToList()
        End Get
    End Property

    Public Property ReviewEmail() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return mReviewEmail
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Boolean)
            If mReviewEmail <> value Then
                mReviewEmail = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Sub AddSectionPermission(ByVal profileSectionId As Guid)

        If Not mSectionPermissions.ContainsKey(profileSectionId) Then
            mSectionPermissions.Add(profileSectionId, profileSectionId)
            mPermissionsAddList.Add(profileSectionId, profileSectionId)
            If mPermissionsDeleteList.ContainsKey(profileSectionId) Then
                mPermissionsDeleteList.Remove(profileSectionId)
            End If
            PropertyHasChanged("SectionPermissions")
        End If

    End Sub

    Public Sub RemoveSectionPermission(ByVal profileSectionId As Guid)

        If mSectionPermissions.ContainsKey(profileSectionId) Then
            mSectionPermissions.Remove(profileSectionId)
            mPermissionsDeleteList.Add(profileSectionId, profileSectionId)
            If mPermissionsAddList.ContainsKey(profileSectionId) Then
                mPermissionsAddList.Remove(profileSectionId)
            End If
            PropertyHasChanged("SectionPermissions")
        End If

    End Sub

    Private Sub RemoveAllSectionPermissions()

        Dim permissionsList As New List(Of Guid)(mSectionPermissions.Values.ToList())

        For Each sectionId As Guid In permissionsList
            RemoveSectionPermission(sectionId)
        Next

        mSectionPermissions = New Dictionary(Of Guid, Guid)
        mPermissionsAddList = New Dictionary(Of Guid, Guid)
    End Sub

    Public Function HasSectionPermission(ByVal sectionId As Guid) As Boolean

        If mSectionPermissions.ContainsKey(sectionId) Then
            Return True
        Else
            Return False
        End If

    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf SectionPermissionRequired, "SectionPermissions")
        ValidationRules.AddRule(AddressOf GlobalCommon.GuidRequired, "RoleId")

    End Sub

    Private Shared Function SectionPermissionRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim userProfile As SsoUserProfile = DirectCast(target, SsoUserProfile)

        Dim sectionCount As Integer = userProfile.mSectionPermissions.Count

        If userProfile.mIsContributor Then
            If sectionCount > 0 Then
                Return True
            Else
                e.Description = String.Format("A contributor must have at least one profile section permission granted. ", e.PropertyName)
                Return False
            End If
        Else
            If sectionCount = 0 Then
                Return True
            Else
                e.Description = String.Format("A reviewer must not have any profile section permissions granted. ", e.PropertyName)
                Return False
            End If
        End If
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewSsoUserProfile(ByVal id As Guid) As SsoUserProfile
        Return New SsoUserProfile(id)
    End Function

    Friend Shared Function GetSsoUserProfile(ByVal dtoSsoUserProfile As DataContracts.SsoUserProfile) As SsoUserProfile
        Return New SsoUserProfile(dtoSsoUserProfile)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoSsoUserProfile As DataContracts.SsoUserProfile)
        Fetch(dtoSsoUserProfile)
        MarkAsChild()
        MarkOld()
        ValidationRules.CheckRules()
    End Sub

    Private Sub New(ByVal id As Guid)
        mId = id
        mSectionPermissions = New Dictionary(Of Guid, Guid)
        mPermissionsAddList = New Dictionary(Of Guid, Guid)
        mPermissionsDeleteList = New Dictionary(Of Guid, Guid)
        MarkAsChild()
        ValidationRules.CheckRules()
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoUserProfile As DataContracts.SsoUserProfile)

        mId = dtoSsoUserProfile.ProfileId
        mTitle = dtoSsoUserProfile.Title
        mRoleId = dtoSsoUserProfile.RoleId
        mRoleName = dtoSsoUserProfile.RoleName
        mIsContributor = dtoSsoUserProfile.IsContributor
        mSectionPermissions = New Dictionary(Of Guid, Guid)
        mPermissionsAddList = New Dictionary(Of Guid, Guid)
        mPermissionsDeleteList = New Dictionary(Of Guid, Guid)
        mReviewEmail = dtoSsoUserProfile.ReviewEmail

        For Each sectionId As Guid In dtoSsoUserProfile.SectionPermissions
            If Not mSectionPermissions.ContainsKey(sectionId) Then
                mSectionPermissions.Add(sectionId, sectionId)
            End If
        Next

    End Sub

    Friend Function GetDelete() As DataContracts.SsoUserProfileDelete

        Dim dtoUserProfileDelete As New DataContracts.SsoUserProfileDelete()
        dtoUserProfileDelete.ProfileId = mId
        Return dtoUserProfileDelete

    End Function

    Friend Function GetInsert() As DataContracts.SsoUserProfileInsert

        Dim dtoUserProfileInsert As New DataContracts.SsoUserProfileInsert()
        dtoUserProfileInsert.ProfileId = mId
        dtoUserProfileInsert.RoleId = mRoleId
        dtoUserProfileInsert.ReviewEmail = mReviewEmail

        For Each id As Guid In mPermissionsAddList.Values
            dtoUserProfileInsert.SectionAddList.Add(id)
        Next

        Return dtoUserProfileInsert
    End Function

    Friend Function GetUpdate() As DataContracts.SsoUserProfileUpdate

        Dim dtoUserProfileUpdate As New DataContracts.SsoUserProfileUpdate()
        dtoUserProfileUpdate.ProfileId = mId
        dtoUserProfileUpdate.RoleId = mRoleId
        dtoUserProfileUpdate.ReviewEmail = mReviewEmail

        For Each id As Guid In mPermissionsAddList.Values
            dtoUserProfileUpdate.SectionAddList.Add(id)
        Next

        For Each id As Guid In mPermissionsDeleteList.Values
            dtoUserProfileUpdate.SectionRemoveList.Add(id)
        Next

        Return dtoUserProfileUpdate
    End Function

    Friend Sub DoDelete()
        ResetLists()
        MarkOld()
    End Sub

    Friend Sub DoInsertUpdate()
        ResetLists()
        MarkOld()
    End Sub

    Private Sub ResetLists()
        mPermissionsAddList = New Dictionary(Of Guid, Guid)
        mPermissionsDeleteList = New Dictionary(Of Guid, Guid)
    End Sub

#End Region


End Class
