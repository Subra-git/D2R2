Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReferenceDataAuditTrailInfo
    Inherits ReadOnlyBase(Of ReferenceDataAuditTrailInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mOldValue As String = String.Empty
    Private mNewValue As String = String.Empty
    Private mUser As String = String.Empty
    Private mDateOfChange As SmartDate
    Private mEffectiveDate As SmartDate
    Private mReasonForChange As String = String.Empty

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property OldValue() As String
        Get
            Return mOldValue.SanitizeHtml()
        End Get
    End Property

    Public ReadOnly Property NewValue() As String
        Get
            Return mNewValue.SanitizeHtml()
        End Get
    End Property

    Public ReadOnly Property OldValuePlainText As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mOldValue.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property NewValuePlainText As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mNewValue.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property User() As String
        Get
            Return mUser
        End Get
    End Property

    Public ReadOnly Property EffectiveDate() As Date
        Get
            Return mEffectiveDate.Date
        End Get
    End Property

    Public ReadOnly Property DateOfChange() As Date
        Get
            Return mDateOfChange.Date
        End Get
    End Property

    Public ReadOnly Property ReasonForChange() As String
        Get
            Return mReasonForChange
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetReferenceDataAuditTrailInfo(ByVal entry As DataContracts.ReferenceTableAuditTrailEntry) As ReferenceDataAuditTrailInfo

        Return New ReferenceDataAuditTrailInfo(entry)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal entry As DataContracts.ReferenceTableAuditTrailEntry)
        Fetch(entry)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal entry As DataContracts.ReferenceTableAuditTrailEntry)

        With entry
            mId = .Id
            mOldValue = .OldValue
            mNewValue = .NewValue
            mUser = .User
            mEffectiveDate = New SmartDate(.EffectiveDate)
            mDateOfChange = New SmartDate(.DateOfChange)
            mReasonForChange = .ReasonForChange
        End With

    End Sub

#End Region

End Class
