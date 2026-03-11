Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesDataNoChangeException
    Inherits Exception

    Public Sub New()
        MyBase.New()
    End Sub

    Public Sub New(ByVal message As String)
        MyBase.New(message)
    End Sub

    Public Sub New(ByVal message As String, ByVal innerException As Exception)
        MyBase.New(message, innerException)
    End Sub

    Protected Sub New(ByVal info As System.Runtime.Serialization.SerializationInfo, ByVal context As System.Runtime.Serialization.StreamingContext)
        MyBase.New(info, context)
    End Sub

End Class

<Serializable()> _
Public Class SpeciesDataChange
    Inherits BusinessBase(Of SpeciesDataChange)

#Region " Business Methods "

    Private mSpeciesId As Guid
    Private mAction As DataContracts.ChangeActionType
    Private mOldName As String = String.Empty
    Private mNewName As String = String.Empty
    Private mOldParent As String = String.Empty
    Private mNewParent As String = String.Empty
    Private mReason As String = String.Empty
    Private mParentId As Guid = Guid.Empty
    Private mLastUpdated(7) As Byte


    Public Property SpeciesId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mSpeciesId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mSpeciesId <> value Then
                mSpeciesId = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property Action() As DataContracts.ChangeActionType
        Get
            CanReadProperty(True)
            Return mAction
        End Get
    End Property

    Public Property Reason() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mReason
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mReason <> value Then
                mReason = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property OldName() As String
        Get
            CanReadProperty(True)
            Return mOldName
        End Get

    End Property

    Public Property NewName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mNewName
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mNewName <> value Then
                mNewName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property OldParent() As String
        Get
            CanReadProperty(True)
            Return mOldParent
        End Get

    End Property

    Public ReadOnly Property NewParent() As String
        Get
            CanReadProperty(True)
            Return mNewParent
        End Get
    End Property

    Public Property ParentId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mParentId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mParentId <> value Then
                mParentId = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mSpeciesId
    End Function

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty
        End Get
    End Property

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "Reason")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("Reason", 255))

    End Sub

#End Region

#Region " Authorization Rules "

    Public Shared Function CanAddSpeciesDataChange() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function NewSpeciesDataChange(ByVal action As DataContracts.ChangeActionType) As SpeciesDataChange

        If Not CanAddSpeciesDataChange() Then
            Throw New System.Security.SecurityException("You do not have permission to add new species data.")
        End If

        Return DataPortal.Create(Of SpeciesDataChange)(New Criteria(action))
    End Function

    Public Shared Function NewSpeciesDataChange(ByVal id As Guid, ByVal action As DataContracts.ChangeActionType) As SpeciesDataChange

        If Not CanAddSpeciesDataChange() Then
            Throw New System.Security.SecurityException("You do not have permission to add new species data.")
        End If

        If action = DataContracts.ChangeActionType.Add Then
            Throw New InvalidOperationException("You cannot provide an existing Id for an Add action")
        End If

        Return DataPortal.Create(Of SpeciesDataChange)(New Criteria(id, action))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="ProfilesLibrary.SpeciesDataNoChangeException.#ctor(System.String)")> _
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Security.SecurityException.#ctor(System.String)")> _
    Public Overrides Function Save() As SpeciesDataChange

        If Not CanAddSpeciesDataChange() Then
            Throw New System.Security.SecurityException("You do not have permission to save a species data change.")
        End If
        Return MyBase.Save()

    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mSpeciesId As Guid
        Private mAction As DataContracts.ChangeActionType
        Public ReadOnly Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
        End Property
        Public ReadOnly Property Action() As DataContracts.ChangeActionType
            Get
                Return mAction
            End Get
        End Property
        Public Sub New(ByVal speciesId As Guid, ByVal action As DataContracts.ChangeActionType)
            mSpeciesId = speciesId
            mAction = action
        End Sub
        Public Sub New(ByVal action As DataContracts.ChangeActionType)
            mSpeciesId = Guid.NewGuid
            mAction = action
        End Sub
    End Class

    Private Overloads Sub DataPortal_Create(ByVal criteria As Criteria)

        Dim isActive As Boolean
        Dim isInUse As Boolean
        Dim childCount As Integer
        Dim activeChildCount As Integer

        mSpeciesId = criteria.SpeciesId
        mAction = criteria.Action

        If Not mAction = DataContracts.ChangeActionType.Add Then

            Dim db As ServiceContracts.ISpeciesMaintenanceService = DataFactory.GetSpeciesMaintenanceService()
            Dim detail As DataContracts.SpeciesDetail = db.GetSpeciesDetail(New DataContracts.GetSpeciesDetailRequest(mSpeciesId))

            With detail
                mOldName = .Name
                mParentId = .ParentId
                isActive = .IsActive
                isInUse = .IsInUse
                childCount = .ChildCount
                activeChildCount = .ActiveChildCount
                mLastUpdated = .LastUpdated
				mOldParent = .ParentName
            End With

            'Prevents the deletion of a species that has children, or is currently being used by an existing profile
            If mAction = DataContracts.ChangeActionType.Delete Then
                If Not isActive Then
                    Throw New InvalidOperationException("You cannot delete a species that is inactive")
                End If
                If isInUse Then
                    Throw New InvalidOperationException("You cannot delete a species that is used within a current profile")
                End If
                If childCount > 0 Then
                    Throw New InvalidOperationException("You cannot delete a species that has children")
                End If
            End If

            'Prevents the inactivation of a species that could legitimately be deleted, or that has any active children
            If mAction = DataContracts.ChangeActionType.Inactivate Then
                If Not isActive Then
                    Throw New InvalidOperationException("You cannot inactivate a species that is already inactive")
                End If
                If activeChildCount > 0 Then
                    Throw New InvalidOperationException("You cannot inactivate a species that has active children")
                End If
                If childCount = 0 AndAlso Not isInUse Then
                    Throw New InvalidOperationException("You cannot inactivate a species that doesn't have children and is not used within a current profile")
                End If
            End If
        Else
            mOldName = "- new entry -"
            mOldParent = "- new entry -"
        End If

        ValidationRules.CheckRules()

    End Sub

    Protected Overrides Sub DataPortal_Insert()

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        Dim db As ServiceContracts.ISpeciesMaintenanceService = DataFactory.GetSpeciesMaintenanceService()
        db.UpdateSpecies(New DataContracts.SpeciesChange With { _
                        .Id = mSpeciesId, _
                        .UserId = identity.UserId, _
                        .Action = mAction, _
                        .Name = mNewName, _
                        .ParentId = mParentId, _
                        .ReasonForChange = mReason, _
                        .LastUpdated = mLastUpdated _
        })

    End Sub



#End Region

End Class
