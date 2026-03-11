Imports Csla

<Serializable()> _
Public Class QuestionMetadataListWrapper
    Inherits ReadOnlyListBase(Of QuestionMetadataListWrapper, QuestionMetadataWrapper)

    Private mQuestionDictionary As Dictionary(Of Guid, QuestionMetadataWrapper)

#Region " Business Methods "

    Public Function GetById(ByVal id As Guid) As QuestionMetadataWrapper

        If mQuestionDictionary.ContainsKey(id) Then
            Return mQuestionDictionary(id)
        Else
            Return Nothing
        End If

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetQuestionMetadataListWrapper(ByVal questionMetadataList As QuestionMetadataListBase) As QuestionMetadataListWrapper
        Return New QuestionMetadataListWrapper(questionMetadataList)
    End Function

    Private Sub New(ByVal questionMetadataList As QuestionMetadataListBase)

        RaiseListChangedEvents = False
        IsReadOnly = False

        mQuestionDictionary = New Dictionary(Of Guid, QuestionMetadataWrapper)

        For Each questionMetadata As QuestionMetadataBase In questionMetadataList

            Dim currentQuestionMetadataWrapper As QuestionMetadataWrapper
            currentQuestionMetadataWrapper = QuestionMetadataWrapper.GetQuestionMetadataWrapper(questionMetadata)

            Me.Add(currentQuestionMetadataWrapper)
            mQuestionDictionary.Add(currentQuestionMetadataWrapper.Id, currentQuestionMetadataWrapper)
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

    Private Sub New()
        ' requires use of factory methods
    End Sub

#End Region




End Class
