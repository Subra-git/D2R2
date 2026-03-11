Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReferenceValueChange
    Inherits BusinessBase(Of ReferenceValueChange)

#Region " Business Methods "

    Private mValueId As Guid
    Private mAction As DataContracts.ChangeActionType
    Private mOldValue As String = String.Empty
    Private mNewValue As String = String.Empty
    Private mEffectiveDateTo As SmartDate
    Private mEffectiveDateFrom As SmartDate
    Private mReasonForChange As String = String.Empty
    Private mIsInUse As Boolean
    Private mReferenceTableId As Guid = Guid.Empty
    Private mLastUpdated(7) As Byte

    Public ReadOnly Property ValueId() As Guid
        Get
            CanReadProperty(True)
            Return mValueId
        End Get
    End Property

    Public ReadOnly Property Action() As DataContracts.ChangeActionType
        Get
            CanReadProperty(True)
            Return mAction
        End Get
    End Property

    Public ReadOnly Property OldValue() As String
        Get
            CanReadProperty(True)
            Return mOldValue
        End Get

    End Property


    Public Property NewValue() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mNewValue
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mNewValue <> value Then
                mNewValue = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property EffectiveDateTo() As SmartDate
        Get
            CanReadProperty(True)
            Return mEffectiveDateTo
        End Get

    End Property

    Public ReadOnly Property EffectiveDateFrom() As SmartDate
        Get
            CanReadProperty(True)
            Return mEffectiveDateFrom
        End Get

    End Property

    Public Property ReasonForChange() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mReasonForChange
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mReasonForChange <> value Then
                mReasonForChange = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property IsInUse() As Boolean
        Get
            CanReadProperty(True)
            Return mIsInUse
        End Get
    End Property

    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            CanReadProperty(True)
            Return mReferenceTableId
        End Get

    End Property

    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mEffectiveDateFrom < Now() AndAlso (mEffectiveDateTo.IsEmpty OrElse mEffectiveDateTo > Now())
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mValueId
    End Function

    Public Overrides Sub Delete()
        Throw New InvalidOperationException("You cannot delete a reference data change")
    End Sub

    Public Overrides Function Save() As ReferenceValueChange

        If Not CanAddReferenceValueChange() Then
            Throw New System.Security.SecurityException("You do not have permission to save a reference data change")
        End If

        Return MyBase.Save()

    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "NewValue")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("NewValue", 255))

        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringRequired, "ReasonForChange")
        ValidationRules.AddRule(AddressOf Csla.Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("ReasonForChange", 255))

    End Sub


#End Region

#Region " Authorization Rules "

    Public Overrides Function CanWriteProperty(ByVal propertyName As String) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        If propertyName = "NewValue" Then
            Return CanEditNewValue()
        End If

        If propertyName = "ReasonForChange" Then
            Return True
        End If

        Return False

    End Function

    Public Shared Function CanAddReferenceValueChange() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Function CanEditNewValue() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return mAction = DataContracts.ChangeActionType.Edit OrElse mAction = DataContracts.ChangeActionType.Add

    End Function


#End Region

#Region " Factory Methods "

    Public Shared Function NewReferenceValueChange(ByVal referenceTableId As Guid) As ReferenceValueChange

        If Not CanAddReferenceValueChange() Then
            Throw New System.Security.SecurityException("You do not have permission to add a new reference value change.")
        End If

        Return DataPortal.Create(Of ReferenceValueChange)(New Criteria(referenceTableId))
    End Function

    Public Shared Function NewReferenceValueChange(ByVal id As Guid, ByVal referenceTableId As Guid, ByVal action As DataContracts.ChangeActionType) As ReferenceValueChange

        If Not CanAddReferenceValueChange() Then
            Throw New System.Security.SecurityException("You do not have permission to add a new reference value change.")
        End If

        If action = DataContracts.ChangeActionType.Add Then
            Throw New InvalidOperationException("You cannot provide an existing Id for an Add action")
        End If

        Return DataPortal.Create(Of ReferenceValueChange)(New Criteria(id, referenceTableId, action))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mValueId As Guid
        Private mReferenceTableId As Guid
        Private mAction As DataContracts.ChangeActionType

        Public ReadOnly Property ValueId() As Guid
            Get
                Return mValueId
            End Get
        End Property

        Public ReadOnly Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
        End Property

        Public ReadOnly Property Action() As DataContracts.ChangeActionType
            Get
                Return mAction
            End Get
        End Property

        Public Sub New(ByVal id As Guid, ByVal referenceTableId As Guid, ByVal action As DataContracts.ChangeActionType)
            mValueId = id
            mReferenceTableId = referenceTableId
            mAction = action
        End Sub

        Public Sub New(ByVal referenceTableId As Guid)
            mValueId = Guid.NewGuid
            mReferenceTableId = referenceTableId
            mAction = DataContracts.ChangeActionType.Add
        End Sub

    End Class

    Private Overloads Sub DataPortal_Create(ByVal criteria As Criteria)

        mValueId = criteria.ValueId
        mReferenceTableId = criteria.ReferenceTableId
        mAction = criteria.Action

        If mAction <> DataContracts.ChangeActionType.Add Then

            'get old value from data layer for this reference value

            Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService
            Dim detail As DataContracts.ReferenceValueDetail = db.GetReferenceValueDetail( _
                New DataContracts.GetReferenceValueDetailRequest(mValueId) _
            )

            mOldValue = detail.Value
            mIsInUse = detail.IsInUse
            mEffectiveDateFrom = New SmartDate(detail.EffectiveDateFrom)
            mEffectiveDateTo = New SmartDate(detail.EffectiveDateTo)
            mLastUpdated = detail.LastUpdated

            If Not IsActive Then
                Throw New InvalidOperationException("You cannot edit a reference value that has been inactivated")
            End If

            If mAction = DataContracts.ChangeActionType.Delete Then
                mNewValue = "- to be deleted -"
            ElseIf mAction = DataContracts.ChangeActionType.Inactivate Then
                mNewValue = "- to be inactivated -"
            End If
        Else
            mOldValue = "- new entry -"
        End If

        ValidationRules.CheckRules()

    End Sub

    Protected Overrides Sub DataPortal_Insert()
        ' insert values

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService()
        Dim change As New DataContracts.ReferenceValueChange() With { _
            .Id = mValueId, _
            .Action = mAction, _
            .ReferenceTableId = mReferenceTableId, _
            .UserId = identity.UserId, _
            .OldValue = mOldValue, _
            .NewValue = mNewValue, _
            .ReasonForChange = mReasonForChange, _
            .LastUpdated = mLastUpdated _
        }

        db.UpdateReferenceValue(change)

    End Sub

#End Region

End Class