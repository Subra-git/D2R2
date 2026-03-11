Imports Csla
Imports Profiles.Contracts

''' <summary>
''' A list of field values.
''' In a per-profile question, this list will belong directly to the ProfileVersionQuestion object.
''' In a per-species question, the list will belong to a particular QuestionSpecies object. 
''' In a repeating or per-species repeating question, the list will belong to a particular QuestionRow object.
''' </summary>
<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class FieldValueList
    Inherits BusinessListBase(Of FieldValueList, FieldValueBase)

    Private mFieldValueDictionary As New Dictionary(Of Guid, FieldValueBase)

    ''' <summary>
    ''' Retrieves the nth multi-value fieldvalue from this list.
    ''' </summary>
    ''' <param name="fieldIndex">"n"</param>
    ''' <returns>The nth multi-value fieldvalue, or if there are fewer than n fieldvalues in this list that are multi-value, returns Nothing</returns>
    Public Function GetMultiValueField(ByVal fieldIndex As Integer) As FieldValueBase

        Dim multiValueFieldCount As Integer
        For Each currentField As FieldValueBase In Me
            If TypeOf currentField Is MultiValueListFieldValue Then
                If multiValueFieldCount = fieldIndex Then
                    Return currentField
                End If
                multiValueFieldCount += 1
            End If
        Next

        Return Nothing

    End Function

    Public ReadOnly Property HasFieldGroup() As Boolean
        Get
            Dim hasGroup As Boolean = False
            For Each field As FieldValueBase In Me
                If TypeOf (field) Is FieldGroupFieldValue Then
                    hasGroup = True
                    Exit For
                End If
            Next
            Return hasGroup
        End Get
    End Property

    Public Function GetByFieldId(ByVal fieldId As Guid) As FieldValueBase
        If mFieldValueDictionary.ContainsKey(fieldId) Then
            Return mFieldValueDictionary(fieldId)
        Else
            Return Nothing
        End If
    End Function

    ''' <summary>
    ''' Indicates if the fields in this list are all readonly
    ''' </summary>
    ''' <returns>True if all the fields are readonly; False otherwise</returns>
    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            For Each currentField As FieldValueBase In Me
                If Not currentField.IsReadOnly Then
                    Return False
                End If
            Next
            Return True
        End Get
    End Property

    ''' <summary>
    ''' Return field value matching short name
    ''' </summary>
    ''' <param name="name">Short name of field</param>
    ''' <returns>The fieldvalue object that has a shortname matching the name submitted</returns>    
    Friend Function GetByShortName(ByVal name As String) As FieldValueBase
        For Each field As FieldValueBase In Me
            If name.ToLower((System.Globalization.CultureInfo.InvariantCulture)) = field.ShortName.ToLower((System.Globalization.CultureInfo.InvariantCulture)) Then
                Return field
            End If
        Next
        Return Nothing
    End Function

    Public Function ValuesEqual(ByVal otherFieldValueList As FieldValueList) As Boolean

        If otherFieldValueList.Count <> Me.Count Then
            Return False
        End If

        Dim fieldValueIndex As Integer = 0
        For Each currentFieldValue As FieldValueBase In Me
            If Not currentFieldValue.ValuesEqual(otherFieldValueList(fieldValueIndex)) Then
                Return False
            End If
            fieldValueIndex = fieldValueIndex + 1
        Next

        Return True

    End Function


#Region " Factory Methods "

    ''' <summary>
    ''' Create a new list of fieldvalues, based on a ProfileVersionFieldList
    ''' </summary>
    ''' <param name="fieldList">the ProfileVersionFieldList on which to base this list of fieldvalues</param>
    ''' <returns>the new FieldValueList</returns>
    Friend Shared Function GetFieldValueList(ByVal fieldList As FieldMetadataListWrapper) As FieldValueList

        Return New FieldValueList(fieldList, Guid.Empty)

    End Function

    ''' <summary>
    ''' Create a new list of fieldvalues, based on a ProfileVersionFieldList
    ''' </summary>
    ''' <param name="fieldList">the ProfileVersionFieldList on which to base this list of fieldvalues</param>
    ''' <param name="speciesId">The species id for the related question</param>
    ''' <returns>the new FieldValueList</returns>
    Friend Shared Function GetFieldValueList(ByVal fieldList As FieldMetadataListWrapper, ByVal speciesId As Guid) As FieldValueList

        Return New FieldValueList(fieldList, speciesId)

    End Function

    Private Sub New(ByVal fieldList As FieldMetadataListWrapper, ByVal speciesId As Guid)

        AllowNew = False
        AllowRemove = False

        MarkAsChild()
        Fetch(fieldList, speciesId)

    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Used by the constructor to create a list of fieldvalues based on a ProfileVersionFieldList
    ''' </summary>
    ''' <param name="fieldList">the FieldMetadataListBase on which to base this list of fieldvalues</param>
    Private Sub Fetch(ByVal fieldList As FieldMetadataListWrapper, ByVal speciesId As Guid)

        RaiseListChangedEvents = False

        For Each field As FieldMetadataWrapper In fieldList
            If TypeOf (field) Is ProfileFieldGroupMetadataWrapper Then
                Dim fieldGroup As ProfileFieldGroupMetadataWrapper = DirectCast(field, ProfileFieldGroupMetadataWrapper)
                Dim currentFieldValueBase As FieldValueBase = FieldGroupFieldValue.NewFieldValue(fieldGroup, speciesId)
                mFieldValueDictionary.Add(currentFieldValueBase.Id, currentFieldValueBase)
                Add(currentFieldValueBase)
            Else
                Dim currentFieldValueBase As FieldValueBase = FieldValueBase.NewFieldValue(field, speciesId)
                mFieldValueDictionary.Add(currentFieldValueBase.Id, currentFieldValueBase)
                Add(currentFieldValueBase)
            End If
        Next

        RaiseListChangedEvents = True

    End Sub

    ''' <summary>
    ''' Save changes to this fieldvalue list back to the database.
    ''' </summary>
    ''' <param name="question">the question to which this fieldvalue list belongs</param>
    ''' <param name="row">the QuestionRow to which this fieldvalue list belongs (Nothing if the question is not repeating)</param>
    ''' <param name="species">the QuestionSpecies to which this fieldvalue list belongs (Nothing if the question is not per-species)</param>
    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal fieldGroup As FieldGroupFieldValue, ByVal changeset As DataContracts.AnswerDataChangeSet)

        RaiseListChangedEvents = False

        For Each field As FieldValueBase In Me
            If field.IsDirty Then

                Dim dtoFieldValueUpdate As DataContracts.FieldValueUpdate

                If TypeOf (changeset) Is DataContracts.ProfileAnswerDataChangeSet Then
                    Dim dtoProfileFieldValueUpdate As DataContracts.ProfileFieldValueUpdate = New DataContracts.ProfileFieldValueUpdate

                    If row IsNot Nothing Then
                        dtoProfileFieldValueUpdate.ProfileVersionQuestionRowId = row.Id
                    End If

                    If species IsNot Nothing Then
                        dtoProfileFieldValueUpdate.SpeciesId = species.Id
                    End If

                    If fieldGroup IsNot Nothing Then
                        dtoProfileFieldValueUpdate.FieldGroupId = fieldGroup.Id
                    End If

                    dtoFieldValueUpdate = dtoProfileFieldValueUpdate
                Else
                    Dim dtoSpeciesFieldValueUpdate As DataContracts.SpeciesFieldValueUpdate = New DataContracts.SpeciesFieldValueUpdate

                    dtoFieldValueUpdate = dtoSpeciesFieldValueUpdate
                End If

                dtoFieldValueUpdate.QuestionId = question.Id

                changeset.FieldValueUpdateList.Add(dtoFieldValueUpdate)

                field.GetUpdate(question, row, species, changeset, dtoFieldValueUpdate)
            End If
        Next

        RaiseListChangedEvents = True

    End Sub

    ''' <summary>
    ''' Save changes to this fieldvalue list back to the database.
    ''' </summary>
    ''' <param name="question">the question to which this fieldvalue list belongs</param>
    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal changeset As DataContracts.AnswerDataChangeSet)

        GetUpdate(question, Nothing, Nothing, Nothing, changeset)

    End Sub

    ''' <summary>
    ''' Save changes to this fieldvalue list back to the database.
    ''' </summary>
    ''' <param name="question">the question to which this fieldvalue list belongs</param>
    ''' <param name="species">the QuestionSpecies to which this fieldvalue list belongs (Nothing if the question is not per-species)</param>
    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal species As QuestionSpecies, ByVal changeset As DataContracts.AnswerDataChangeSet)

        GetUpdate(question, Nothing, species, Nothing, changeset)

    End Sub

    ''' <summary>
    ''' Save changes to this fieldvalue list back to the database.
    ''' </summary>
    ''' <param name="question">the question to which this fieldvalue list belongs</param>
    ''' <param name="species">the QuestionSpecies to which this fieldvalue list belongs (Nothing if the question is not per-species)</param>
    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal changeset As DataContracts.AnswerDataChangeSet)

        GetUpdate(question, row, Nothing, Nothing, changeset)

    End Sub

    Friend Sub Update()

        For Each field As FieldValueBase In Me
            If field.IsDirty Then
                field.Update()
            End If
        Next

    End Sub

#End Region

End Class

