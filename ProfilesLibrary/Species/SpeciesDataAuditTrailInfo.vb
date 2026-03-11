Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesDataAuditTrailInfo
    Inherits ReadOnlyBase(Of SpeciesDataAuditTrailInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mOldName As String = String.Empty
    Private mNewName As String = String.Empty
    Private mOldParent As String = String.Empty
    Private mNewParent As String = String.Empty
    Private mUser As String = String.Empty
    Private mEffectiveDate As SmartDate
    Private mLogDate As SmartDate
    Private mReason As String = String.Empty

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property OldName() As String
        Get
            Return mOldName
        End Get
    End Property

    Public ReadOnly Property OldNamePlainText As String
        Get
            Return mOldName.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property NewName() As String
        Get
            Return mNewName
        End Get
    End Property

    Public ReadOnly Property NewNamePlainText As String

        Get
            Return mNewName.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property OldParent() As String
        Get
            Return mOldParent
        End Get
    End Property

    Public ReadOnly Property NewParent() As String
        Get
            Return mNewParent
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

    Public ReadOnly Property LogDate() As Date
        Get
            Return mLogDate.Date
        End Get
    End Property

    Public ReadOnly Property Reason() As String
        Get
            Return mReason
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function



#End Region

#Region " Factory Methods "

    Friend Shared Function GetReadOnlyChild(ByVal entry As DataContracts.SpeciesAuditTrailEntry) As SpeciesDataAuditTrailInfo

        Return New SpeciesDataAuditTrailInfo(entry)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal entry As DataContracts.SpeciesAuditTrailEntry)
        Fetch(entry)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal entry As DataContracts.SpeciesAuditTrailEntry)
        ' load values
        With entry
            mId = .Id
            mUser = .User
            mEffectiveDate = New SmartDate(.EffectiveDate)
            mLogDate = New SmartDate(.LogDate)
            mReason = .ReasonForChange
            mOldName = .OldName
            mNewName = .NewName
            mOldParent = .OldParent
            mNewParent = .NewParent
        End With

    End Sub

#End Region

End Class
