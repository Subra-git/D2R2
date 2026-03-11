Imports Csla
Imports Profiles.Contracts

Public Class FieldGroupFieldValue
    Inherits FieldValueBase

    Private mQuestionSpeciesList As QuestionSpeciesList = QuestionSpeciesList.NewQuestionSpeciesList()

    Public ReadOnly Property QuesSpecies() As QuestionSpeciesList
        Get
            Return mQuestionSpeciesList
        End Get
    End Property

    Protected Overrides Sub DoClear()
        'This doesn't need to be implemented. 
        'Clearing a repeating question wipes out all of the rows. 
    End Sub

    Public Overrides Sub SetValue(value As Object)
        Throw New NotImplementedException("Cannot set value of a field group.")
    End Sub

    Public Overrides Function GetValue() As Object
        Throw New NotImplementedException("Cannot get value of a field group.")
    End Function

    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Throw New System.NotImplementedException("The IsEmpty property is not implemented on the FieldGroupFieldValue class")
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            For Each species As QuestionSpecies In mQuestionSpeciesList
                If species.IsDirty Then
                    Return True
                End If
            Next

            Return False
        End Get
    End Property

    Friend Function Validate() As List(Of InvalidReason)
        Dim invalidReasonList As New List(Of InvalidReason)

        For Each quesSpecies As QuestionSpecies In mQuestionSpeciesList
            invalidReasonList.AddRange(quesSpecies.Validate())
        Next

        Return invalidReasonList
    End Function

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        Dim otherFieldGroupValue As FieldGroupFieldValue = DirectCast(otherFieldValue, FieldGroupFieldValue)

        If otherFieldGroupValue.QuesSpecies.Count <> Me.QuesSpecies.Count Then
            Return False
        End If

        Return mQuestionSpeciesList.ValuesEqual(otherFieldGroupValue.QuesSpecies)

    End Function

#Region " Factory Methods "

    Friend Sub New(ByVal fieldGroup As ProfileFieldGroupMetadataWrapper, ByVal speciesId As Guid)
        MarkAsChild()
        Fetch(fieldGroup, speciesId)
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal fieldGroup As ProfileFieldGroupMetadataWrapper, ByVal speciesId As Guid)

        MyBase.Fetch(fieldGroup, speciesId)

        For Each currentProfiledSpecies As ProfiledSpecies In fieldGroup.ProfiledSpeciesList
            mQuestionSpeciesList.FetchSpecies(currentProfiledSpecies, fieldGroup.FieldList)
        Next

        MarkOld()

    End Sub

    Friend Overrides Sub Update()

        MyBase.Update()
        mQuestionSpeciesList.Update()

    End Sub

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As Profiles.Contracts.DataContracts.FieldValueUpdate)

        dtoFieldValueUpdate.FieldId = MyBase.Id
        Me.QuesSpecies.GetUpdate(question, row, Me, changeset)

    End Sub

#End Region


End Class
