Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileQuestionInfo
    Inherits ReadOnlyBase(Of ProfileQuestionInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mName As String = String.Empty
    Private mQuestionNumber As Integer

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName.StripPTags.SanitizeHtml
        End Get
    End Property

    Public ReadOnly Property QuestionNumber() As Integer
        Get
            Return mQuestionNumber
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return Name
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileQuestionInfo( _
      ByVal dtoQuestionInfo As DataContracts.ProfileQuestionInfo) As ProfileQuestionInfo

        Return New ProfileQuestionInfo(dtoQuestionInfo)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal dtoQuestionInfo As DataContracts.ProfileQuestionInfo)
        Fetch(dtoQuestionInfo)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoQuestionInfo As DataContracts.ProfileQuestionInfo)

        mId = dtoQuestionInfo.Id
        mName = dtoQuestionInfo.Name
        mQuestionNumber = dtoQuestionInfo.QuestionNumber

    End Sub

#End Region

End Class

