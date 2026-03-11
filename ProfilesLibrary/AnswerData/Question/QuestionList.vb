Imports Csla
Imports Profiles.Contracts

''' <summary>
''' A list of questions within a section. Editable because it indirectly contains FieldValue objects that hold the answers to
''' fields within each question. Questions cannot be added or removed from this list.
''' </summary>
<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class QuestionList
    Inherits BusinessListBase(Of QuestionList, QuestionBase)

    Private mQuestionDictionary As New Dictionary(Of Guid, QuestionBase)

    ''' <summary>
    ''' Checks to see if the values in the object equal that of the object passed in
    ''' </summary>
    ''' <param name="otherQuestionList">the instance for comparison</param>
    ''' <returns>Boolean</returns>
    Public Function ValuesEqual(ByVal otherQuestionList As QuestionList) As Boolean

        If otherQuestionList.Count <> Me.Count Then
            Return False
        End If

        Dim questionIndex As Integer = 0
        For Each question As QuestionBase In Me
            If Not question.ValuesEqual(otherQuestionList(questionIndex)) Then
                Return False
            End If
            questionIndex = questionIndex + 1
        Next
        Return True

    End Function

    ''' <summary>
    ''' Gets a question within the list, identified by its unique Id
    ''' </summary>
    ''' <param name="questionId">the unique identifier for the question</param>
    ''' <returns>The ProfileVersionQuestion object for the question</returns>
    Public Function GetById(ByVal questionId As Guid) As QuestionBase
        Return mQuestionDictionary(questionId)
    End Function

#Region " Factory Methods "

    Friend Shared Function NewQuestionList() As QuestionList
        Return New QuestionList()
    End Function

    Private Sub New()

        Me.AllowNew = False
        Me.AllowRemove = False

        MarkAsChild()

    End Sub

#End Region

#Region " Data Access "

    Friend Sub FetchQuestion(ByVal questionMetadata As QuestionMetadataWrapper)

        RaiseListChangedEvents = False

        Dim question As QuestionBase

        If questionMetadata.IsRepeating Then
            question = RepeatingQuestion.GetRepeatingQuestion(questionMetadata)
        ElseIf questionMetadata.IsPerSpecies And Not questionMetadata.IsRepeating Then
            question = PerSpeciesQuestion.GetPerSpeciesQuestion(questionMetadata)
        Else
            question = StandardQuestion.GetStandardQuestion(questionMetadata)
        End If

        Add(question)
        mQuestionDictionary.Add(question.Id, question)

        RaiseListChangedEvents = True

    End Sub

    Friend Sub InitializeFieldValueLists()

        RaiseListChangedEvents = False

        For Each question As QuestionBase In Me
            question.InitializeFieldValueList()
        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub FetchSpecies(ByVal profiledSpecies As DataContracts.ProfiledSpecies)

        For Each question As QuestionBase In Me
            If TypeOf question Is PerSpeciesQuestion Then
                DirectCast(question, PerSpeciesQuestion).FetchSpecies(profiledSpecies)
            End If
        Next

    End Sub

    ''' <summary>
    ''' Saves the data for the questions in the list.
    ''' </summary>
    
    Friend Sub Update()

        RaiseListChangedEvents = False

        For Each item As QuestionBase In Me
            item.Update()
        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.AnswerDataChangeSet)

        For Each item As QuestionBase In Me
            item.GetUpdate(changeset)
        Next

    End Sub

#End Region

End Class

