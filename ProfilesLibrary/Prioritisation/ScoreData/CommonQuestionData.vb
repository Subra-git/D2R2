Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class CommonQuestionData
    Inherits ReadOnlyBase(Of CommonQuestionData)

    Private mId As Guid
    Private mSectionNumber As Integer
    Private mQuestionNumber As Integer
    Private mName As String

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property DisplayQuestionNumber() As String
        Get
            Return mSectionNumber.ToString() & "." & mQuestionNumber.ToString()
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetCommonQuestionData(ByVal dtoCommonQuestionData As DataContracts.CommonQuestionData) As CommonQuestionData
        Return New CommonQuestionData(dtoCommonQuestionData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoCommonQuestionData As DataContracts.CommonQuestionData)
        Fetch(dtoCommonQuestionData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCommonQuestionData As DataContracts.CommonQuestionData)
        mId = dtoCommonQuestionData.Id
        mSectionNumber = dtoCommonQuestionData.SectionNumber
        mQuestionNumber = dtoCommonQuestionData.QuestionNumber
        mName = dtoCommonQuestionData.Name
    End Sub

#End Region

End Class
