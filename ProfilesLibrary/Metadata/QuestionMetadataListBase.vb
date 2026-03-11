Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public MustInherit Class QuestionMetadataListBase
    Inherits ReadOnlyListBase(Of QuestionMetadataListBase, QuestionMetadataBase)

    Protected mQuestionInfoList As New Dictionary(Of Guid, QuestionMetadataBase)

#Region " Factory Methods "

    Public Function GetQuestionMetadataById(ByVal questionId As Guid) As QuestionMetadataBase
        If mQuestionInfoList.ContainsKey(questionId) Then
            Return mQuestionInfoList(questionId)
        Else
            Return Nothing
        End If
    End Function

#End Region

End Class


