Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileContributor
    Inherits BusinessBase(Of ProfileContributor)

#Region " Business Methods "

    Private mId As Guid
    Private mUserName As String = String.Empty
    Private mFullName As String = String.Empty
    Private mOrganisation As String = String.Empty
    Private mRoleId As Guid
    Private mRole As String = String.Empty
    Private mIsContributor As Boolean
    Private mIsSsoUser As Boolean
    Private mLastUpdated(7) As Byte
    Private mSectionPermissions As New Dictionary(Of Guid, Guid)
    Private mPermissionsAddList As New Dictionary(Of Guid, Guid)
    Private mPermissionsDeleteList As New Dictionary(Of Guid, Guid)

    Public ReadOnly Property Id() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public Property UserName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mUserName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mUserName <> value Then
                mUserName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property FullName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFullName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mFullName <> value Then
                mFullName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Organisation() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mOrganisation
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mOrganisation <> value Then
                mOrganisation = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property RoleId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mRoleId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mRoleId <> value Then
                mRoleId = value
                PropertyHasChanged()
                mIsContributor = ProfileUserRoleList.GetProfileUserRole(mRoleId).IsContributor
                PropertyHasChanged("IsContributor")
            End If
        End Set
    End Property

    Public ReadOnly Property Role() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mRole
        End Get
    End Property

    Public ReadOnly Property IsContributor() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mIsContributor
        End Get
    End Property

    Public ReadOnly Property IsSsoUser() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mIsSsoUser
        End Get
    End Property

    Public ReadOnly Property SectionPermissions() As List(Of Guid)
        Get
            CanReadProperty(True)
            Return New List(Of Guid)(mSectionPermissions.Values)
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function


    Public Sub AddSectionPermission(ByVal profileSectionId As Guid)

        CanWriteProperty("SectionPermissions", True)
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

        CanWriteProperty("SectionPermissions", True)
        If mSectionPermissions.ContainsKey(profileSectionId) Then
            mSectionPermissions.Remove(profileSectionId)
            mPermissionsDeleteList.Add(profileSectionId, profileSectionId)
            If mPermissionsAddList.ContainsKey(profileSectionId) Then
                mPermissionsAddList.Remove(profileSectionId)
            End If
            PropertyHasChanged("SectionPermissions")
        End If

    End Sub

    Public Function HasSectionPermission(ByVal profileSectionId As Guid) As Boolean
        Return mSectionPermissions.ContainsKey(profileSectionId)
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()


        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "UserName")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("UserName", 50))
        ValidationRules.AddRule(AddressOf UserNameParse, "UserNameParse")

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "FullName")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("FullName", 100))

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "Organisation")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("Organisation", 100))

        ValidationRules.AddRule(AddressOf SectionPermissionRequired, "SectionPermissions")
        ValidationRules.AddRule(AddressOf GlobalCommon.GuidRequired, "RoleId")



    End Sub

    Private Shared Function UserNameParse(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim contributor As ProfileContributor = DirectCast(target, ProfileContributor)

        If contributor.IsSsoUser Then
            Return True
        ElseIf System.Text.RegularExpressions.Regex.IsMatch(contributor.UserName, RegexPatterns.Username) Then
            Return True
        Else
            e.Description = "Username must be in the following format: Domain\UserId"
            Return False
        End If

    End Function

    Private Shared Function SectionPermissionRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim contributor As ProfileContributor = DirectCast(target, ProfileContributor)

        Dim sectionCount As Integer = contributor.mSectionPermissions.Count

        If contributor.mIsContributor Then
            If sectionCount > 0 Then
                Return True
            Else
                e.Description = String.Format("A contributor must have at least one profile section permission granted", e.PropertyName)
                Return False
            End If
        Else
            If sectionCount = 0 Then
                Return True
            Else
                e.Description = String.Format("A reviewer must not have any profile section permissions granted", e.PropertyName)
                Return False
            End If
        End If
    End Function


#End Region

#Region " Authorisation Rules "

    Public Overrides Function CanWriteProperty(ByVal propertyName As String) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        If IsSsoUser Then
            Dim falseOnSsoProperties(2) As String
            falseOnSsoProperties(0) = "UserName"
            falseOnSsoProperties(1) = "FullName"
            falseOnSsoProperties(2) = "Organisation"
            If falseOnSsoProperties.Contains(propertyName) Then
                Return False
            End If
        End If

        Return MyBase.CanWriteProperty(propertyName)

    End Function

#End Region


#Region " Factory Methods "

    Friend Shared Function NewProfileContributor(ByVal id As Guid, ByVal profileId As Guid) As ProfileContributor
        Return DataPortal.Create(Of ProfileContributor)(New Criteria(id, profileId))
    End Function

    Friend Shared Function NewProfileContributor(ByVal userName As String) As ProfileContributor
        Return New ProfileContributor(userName)
    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetProfileContributor(ByVal contributor As DataContracts.ProfileContributor) As ProfileContributor
        Return New ProfileContributor(contributor)
    End Function

    Private Sub New(ByVal userName As String)
        mId = Guid.NewGuid()
        mUserName = userName
        MarkAsChild()
        ValidationRules.CheckRules()
    End Sub

    Private Sub New()
        mId = Guid.NewGuid()
        MarkAsChild()
        ValidationRules.CheckRules()
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub New(ByVal contributor As DataContracts.ProfileContributor)
        MarkAsChild()
        Fetch(contributor)
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mId As Guid
        Private mProfileId As Guid

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property
        Public ReadOnly Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
        End Property

        Public Sub New(ByVal id As Guid, ByVal profileId As Guid)
            mId = id
            mProfileId = profileId
        End Sub
    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Create(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim result As DataContracts.ProfileContributor = db.GetProfileContributor( _
            New DataContracts.GetProfileContributorRequest(criteria.Id, criteria.ProfileId))

        CopyValuesFromDataObject(result)
        ValidationRules.CheckRules()

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal contributor As DataContracts.ProfileContributor)

        CopyValuesFromDataObject(contributor)
        MarkOld()

    End Sub

    Private Sub CopyValuesFromDataObject(ByVal contributor As DataContracts.ProfileContributor)

        With contributor
            mId = .Id
            mUserName = .UserName
            mFullName = .FullName
            mOrganisation = .Organisation
            mRoleId = .RoleId
            mRole = .Role
            mIsContributor = .IsContributor
            mIsSsoUser = .IsSsoUser
            mLastUpdated = .LastUpdated
            For Each profileSectionId As Guid In .SectionPermissions
                mSectionPermissions.Add(profileSectionId, profileSectionId)
            Next
        End With

    End Sub

    Friend Function GetDelete() As DataContracts.ProfileContributorDelete

        Return New DataContracts.ProfileContributorDelete With {.Id = mId, .LastUpdated = mLastUpdated}

    End Function

    Friend Function GetInsert() As DataContracts.ProfileContributorInsert

        Dim sectionAddList As List(Of Guid)
        Dim sectionRemoveList As List(Of Guid)

        If Not mIsContributor Then
            sectionAddList = New List(Of Guid)
            sectionRemoveList = mSectionPermissions.Values.ToList()
        Else
            sectionAddList = mPermissionsAddList.Values.ToList()
            sectionRemoveList = mPermissionsDeleteList.Values.ToList()
        End If

        Return New DataContracts.ProfileContributorInsert With { _
            .Id = mId, _
            .UserName = mUserName, _
            .FullName = mFullName, _
            .Organisation = mOrganisation, _
            .RoleId = mRoleId, _
            .SectionAddList = sectionAddList, _
            .SectionRemoveList = sectionRemoveList, _
            .LastUpdated = mLastUpdated _
        }

    End Function

    Friend Sub InsertUpdate(ByVal newId As Guid, ByVal newLastUpdated As Byte())
        mId = newId
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

    Friend Sub DeleteSelf()
        MarkNew()
    End Sub

#End Region

End Class

