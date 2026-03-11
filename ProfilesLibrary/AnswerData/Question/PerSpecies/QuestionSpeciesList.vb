Imports Csla
Imports Profiles.Contracts

''' <summary>
''' An object representing a list of affected species within a per-species question.
''' </summary>
<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class QuestionSpeciesList
    Inherits BusinessListBase(Of QuestionSpeciesList, QuestionSpecies)

    Private mSpeciesDictionary As New Dictionary(Of Guid, QuestionSpecies)

    ''' <summary>
    ''' Gets a species within this list of species, based on the unique identifier of the species.
    ''' </summary>
    ''' <param name="speciesId">Species identifier</param>
    ''' <returns>A QuestionSpecies object.</returns>
    Public Function GetById(ByVal speciesId As Guid) As QuestionSpecies

        If mSpeciesDictionary.ContainsKey(speciesId) Then
            Return mSpeciesDictionary(speciesId)
        Else
            Return Nothing
        End If

    End Function

    Public Function ValuesEqual(ByVal otherSpeciesList As QuestionSpeciesList) As Boolean

        If Me.Count <> otherSpeciesList.Count Then
            Return False
        End If

        For Each currentSpecies As QuestionSpecies In Me

            Dim otherSpecies As QuestionSpecies = otherSpeciesList.GetById(currentSpecies.Id)

            If otherSpecies Is Nothing Then
                Return False
            End If

            If Not currentSpecies.ValuesEqual(otherSpecies) Then
                Return False
            End If            
        Next

        Return True

    End Function


#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new list of species within a question.
    ''' </summary>
    ''' <returns>A new QuestionSpeciesList object.</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewQuestionSpeciesList() As QuestionSpeciesList
        Return New QuestionSpeciesList
    End Function

    ''' <summary>
    ''' Constructor called from the factory method to create a new list of species within a question.
    ''' </summary>
    Private Sub New()

        AllowNew = False
        AllowRemove = False        

        MarkAsChild()

    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Adds a species to the list based on data from the database.
    ''' </summary>
    ''' <param name="id">Identifier for the species</param>
    ''' <param name="name">Name of the species</param>
    ''' <param name="fieldList">list of fields in this question</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub FetchSpecies(ByVal currentProfiledSpecies As ProfiledSpecies, ByVal fieldList As FieldMetadataListWrapper)

        RaiseListChangedEvents = False

        Dim species As QuestionSpecies = QuestionSpecies.GetQuestionSpecies(currentProfiledSpecies, fieldList)
        Add(species)
        mSpeciesDictionary.Add(currentProfiledSpecies.Id, species)

        RaiseListChangedEvents = True

    End Sub

    ''' <summary>
    ''' Saves the data for each species in this list to the database.
    ''' </summary>
    ''' <param name="question">The ProfileVersionQuestion to which this list belongs</param>
    Friend Sub GetUpdate(ByVal question As PerSpeciesQuestion, ByVal changeset As DataContracts.AnswerDataChangeSet)

        RaiseListChangedEvents = False

        For Each item As QuestionSpecies In Me
            If item.IsDirty Then
                item.GetUpdate(question, changeset)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal fieldGroup As FieldGroupFieldValue, ByVal changeset As DataContracts.AnswerDataChangeSet)

        RaiseListChangedEvents = False

        For Each item As QuestionSpecies In Me
            If item.IsDirty Then
                item.GetUpdate(question, row, fieldGroup, changeset)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

    Friend Sub Update()
        RaiseListChangedEvents = False

        For Each item As QuestionSpecies In Me
            item.Update()
        Next
        RaiseListChangedEvents = True
    End Sub

#End Region

End Class

