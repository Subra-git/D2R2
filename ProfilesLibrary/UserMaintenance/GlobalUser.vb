Imports Csla
Imports Profiles.Contracts

Public Enum GlobalUserRole
    None
    ProfileEditor
    PolicyProfileUser
End Enum

<Serializable()> _
Public Class GlobalUser
    Inherits BusinessBase(Of GlobalUser)

#Region " Business Methods "

    Private mId As Guid
    Private mUserName As String = String.Empty
    Private mFullName As String = String.Empty
    Private mOrganisation As String = String.Empty
    Private mSubscribedToReviewEmails As Boolean
    Private mUserRole As GlobalUserRole = GlobalUserRole.None
    Private mLastUpdated(7) As Byte

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

    Public Property SubscribedToReviewEmails() As Boolean
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mSubscribedToReviewEmails
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Boolean)
            CanWriteProperty(True)
            If mSubscribedToReviewEmails <> value Then
                mSubscribedToReviewEmails = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property UserRole() As GlobalUserRole
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mUserRole
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As GlobalUserRole)
            CanWriteProperty(True)
            If mUserRole <> value Then
                mUserRole = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property UserRoleName() As String
        Get
            Select Case mUserRole
                Case GlobalUserRole.PolicyProfileUser
                    Return "Policy profile user"
                Case GlobalUserRole.ProfileEditor
                    Return "Profile editor"
            End Select
            Return String.Empty
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddInstanceBusinessRules()

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "UserName")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("UserName", 50))
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.RegExMatch, New Validation.CommonRules.RegExRuleArgs("UserName", RegexPatterns.Username))

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "FullName")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("FullName", 100))

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "Organisation")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("Organisation", 100))

        ValidationRules.AddRule(AddressOf UserRoleRequired, "UserRole")
        ValidationRules.AddRule(AddressOf CannotRemoveOwnRights, "UserRole")
    End Sub

    Private Shared Function UserRoleRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim user As GlobalUser = DirectCast(target, GlobalUser)
        If user.mUserRole = GlobalUserRole.None Then
            e.Description = "UserRole is required"
            Return False
        End If
        Return True
    End Function

    Private Shared Function CannotRemoveOwnRights(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim user As GlobalUser = DirectCast(target, GlobalUser)
        If identity.UserId.Equals(user.Id) AndAlso (Not user.UserRole = GlobalUserRole.ProfileEditor) Then
            e.Description = "Cannot remove your own Profile editor rights"
            Return False
        End If
        Return True
    End Function

#End Region

#Region " Authorization Rules "

    Protected Overrides Sub AddAuthorizationRules()
        ' 
    End Sub

#End Region

#Region " Factory Methods "

    Friend Shared Function NewGlobalUser(ByVal id As Guid) As GlobalUser
        Return DataPortal.Create(Of GlobalUser)(New Criteria(id))
    End Function

    Friend Shared Function NewGlobalUser() As GlobalUser
        Return New GlobalUser
    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetGlobalUser(ByVal user As DataContracts.GlobalUser) As GlobalUser
        Return New GlobalUser(user)
    End Function

    Private Sub New()
        mId = Guid.NewGuid()
        MarkAsChild()
        ValidationRules.CheckRules()
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub New(ByVal user As DataContracts.GlobalUser)
        MarkAsChild()
        Fetch(user)
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mId As Guid

        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property
        Public Sub New(ByVal id As Guid)
            mId = id
        End Sub
    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Create(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim result As DataContracts.GlobalUser = db.GetGlobalUser( _
            New DataContracts.GetGlobalUserRequest(criteria.Id))

        CopyValuesFromDataObject(result)
        ValidationRules.CheckRules()

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal user As DataContracts.GlobalUser)

        CopyValuesFromDataObject(user)
        MarkOld()

    End Sub

    Private Sub CopyValuesFromDataObject(ByVal user As DataContracts.GlobalUser)

        With user
            mId = .Id
            mUserName = .UserName
            mFullName = .FullName
            mOrganisation = .Organisation
            mSubscribedToReviewEmails = .SubscribedToReviewEmails
            If .IsPolicyProfileUser Then
                mUserRole = GlobalUserRole.PolicyProfileUser
            End If
            If .IsProfileEditor Then
                mUserRole = GlobalUserRole.ProfileEditor
            End If
            mLastUpdated = .LastUpdated
        End With

    End Sub

    Friend Function GetUpdate() As DataContracts.GlobalUserUpdate

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.UserId = mId Then
            Throw New InvalidOperationException("You cannot revoke your own Profile Editor status")
        End If

        Return New DataContracts.GlobalUserUpdate With {.Id = mId, .LastUpdated = mLastUpdated}

    End Function

    Friend Function GetInsert() As DataContracts.GlobalUserInsert

        Return New DataContracts.GlobalUserInsert With { _
            .Id = mId, _
            .UserName = mUserName, _
            .FullName = mFullName, _
            .Organisation = mOrganisation, _
            .SubscribedToReviewEmails = mSubscribedToReviewEmails, _
            .IsProfileEditor = (mUserRole = GlobalUserRole.ProfileEditor), _
            .IsPolicyProfileUser = (mUserRole = GlobalUserRole.PolicyProfileUser), _
            .LastUpdated = mLastUpdated _
        }

    End Function

    Friend Sub InsertUpdate(ByVal newId As Guid, ByVal newLastUpdated As Byte())
        mId = newId
        mLastUpdated = newLastUpdated
        MarkOld()
    End Sub

    Friend Sub DeleteSelf(ByVal newLastUpdated As Byte())

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.UserId = mId Then
            Throw New InvalidOperationException("You cannot revoke your own Profile Editor status")
        End If

        mLastUpdated = newLastUpdated
        MarkNew()

    End Sub

#End Region

End Class

