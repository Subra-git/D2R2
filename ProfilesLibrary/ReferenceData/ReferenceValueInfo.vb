Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReferenceValueInfo
    Inherits ReadOnlyBase(Of ReferenceValueInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mValue As String = String.Empty
    Private mEffectiveDateTo As SmartDate
    Private mEffectiveDateFrom As SmartDate
    Private mIsInUse As Boolean
    Private mIsActive As Boolean

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Value() As String
        Get
            Return mValue
        End Get
    End Property

    Public ReadOnly Property EffectiveDates() As String
        Get
            Return mEffectiveDateFrom.ToString() & " - " & mEffectiveDateTo.ToString()
        End Get
    End Property

    Public ReadOnly Property EffectiveDateFrom() As Date
        Get
            Return mEffectiveDateFrom.Date
        End Get
    End Property

    Public ReadOnly Property EffectiveDateTo() As Date
        Get
            Return mEffectiveDateTo.Date
        End Get
    End Property

    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mIsActive
        End Get
    End Property

    Public ReadOnly Property IsInUse() As Boolean
        Get
            Return mIsInUse
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mValue
    End Function

    Public ReadOnly Property ValuePlainText As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mValue.StripHtmlTags()
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetReferenceValueInfo(ByVal refVal As DataContracts.ReferenceValue) As ReferenceValueInfo

        Return New ReferenceValueInfo(refVal)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal refVal As DataContracts.ReferenceValue)
        Fetch(refVal)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal refVal As DataContracts.ReferenceValue)
        mId = refVal.Id
        mValue = refVal.Value
        mEffectiveDateFrom = New Csla.SmartDate(refVal.EffectiveDateFrom)
        mEffectiveDateTo = New Csla.SmartDate(refVal.EffectiveDateTo)
        mIsInUse = refVal.IsInUse
        mIsActive = refVal.IsActive
    End Sub

#End Region

End Class
