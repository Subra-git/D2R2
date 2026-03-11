Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class CommonAnswerData
    Inherits ReadOnlyBase(Of CommonAnswerData)

    Private mId As Guid
    Private mAnswer As String

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Answer() As String
        Get
            Return mAnswer
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetCommonAnswerData(ByVal dtoCommonAnswerData As DataContracts.CommonAnswerData) As CommonAnswerData
        Return New CommonAnswerData(dtoCommonAnswerData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoCommonAnswerData As DataContracts.CommonAnswerData)
        Fetch(dtoCommonAnswerData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCommonAnswerData As DataContracts.CommonAnswerData)
        mId = dtoCommonAnswerData.Id
        mAnswer = dtoCommonAnswerData.Answer
    End Sub

#End Region

End Class
