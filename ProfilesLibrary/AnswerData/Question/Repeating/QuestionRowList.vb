Imports Csla
Imports Profiles.Contracts

''' <summary>
''' List of rows in a repeating question.
''' </summary>
<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class QuestionRowList
    Inherits BusinessListBase(Of QuestionRowList, QuestionRow)

    Private mFieldList As FieldMetadataListWrapper
    Private mQuestionId As Guid

    ''' <summary>
    ''' List of ProfileVersionField objects for this question, containing metadata for the fields in this question.
    ''' </summary>
    ''' <returns>ProfileVersionFieldList object</returns>
    Public ReadOnly Property FieldList() As FieldMetadataListWrapper
        Get
            Return mFieldList
        End Get
    End Property

    Public ReadOnly Property HasFieldGroup() As Boolean
        Get
            Return mFieldList.HasFieldGroup
        End Get
    End Property

    Public ReadOnly Property QuestionId() As Guid
        Get
            Return mQuestionId
        End Get
    End Property

    ''' <summary>
    ''' Gets a row within this list of rows, based on the unique identifier of the row.
    ''' </summary>
    ''' <param name="id">Unique identifier of the required row</param>
    ''' <returns>QuestionRow object, or Nothing if there is no row with the specified identifier</returns>
    Public Function GetById(ByVal id As Guid) As QuestionRow

        For Each row As QuestionRow In Me
            If row.Id.Equals(id) Then
                Return row
            End If
        Next

        Return Nothing

    End Function

    Public Function ValuesEqual(ByVal otherRowList As QuestionRowList) As Boolean

        If Me.Count <> otherRowList.Count Then
            Return False
        End If

        Dim rowIndex As Integer = 0
        For Each row As QuestionRow In Me
            If Not row.ValuesEqual(otherRowList(rowIndex)) Then
                Return False
            End If
            rowIndex = rowIndex + 1
        Next

        Return True

    End Function

    ''' <summary>
    ''' An override of a base CSLA method to allow transparent addition of blank rows to the QuestionRowList
    ''' </summary>
    ''' <returns>the row that is added</returns>
    ''' <remarks>see p. 452 of Expert VB 2005 Business Objects</remarks>
    Protected Overrides Function AddNewCore() As Object

        Dim newRow As QuestionRow = QuestionRow.NewQuestionRow(mFieldList, Me.Count, mQuestionId)
        Add(newRow)
        Return newRow

    End Function

    ''' <summary>
    ''' When a row is deleted, update the sequence numbers of all the subsequent rows
    ''' </summary>
    Protected Overrides Sub RemoveItem(ByVal index As Integer)

        MyBase.RemoveItem(index)
        For remainingItem As Integer = index To Me.Count - 1
            Me(remainingItem).SequenceNumber = remainingItem
        Next

    End Sub

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new row list for a non species related question.
    ''' </summary>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in each row.</param>    
    ''' <returns>A new QuestionRowList object.</returns>
    Friend Shared Function NewQuestionRowList(ByVal fieldList As FieldMetadataListWrapper, ByVal question As QuestionBase) As QuestionRowList
        Return New QuestionRowList(fieldList, question)
    End Function

    ''' <summary>
    ''' Constructor called from NewQuestionRowList factory method to create a new row list.
    ''' </summary>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in each row.</param>
    ''' <param name="speciesId">The species id for the species referred to by this question</param>
    Private Sub New(ByVal fieldList As FieldMetadataListWrapper, ByVal question As QuestionBase)
        mFieldList = fieldList
        mQuestionId = question.Id
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Method called from ProfileVersionQuestion to add a row to this list based on existing data in the database.
    ''' </summary>
    ''' <param name="id">the row identifier</param>
    ''' <returns>A new QuestionRow object</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Function FetchRow(ByVal dtoQuestionRow As DataContracts.QuestionRow) As QuestionRow

        RaiseListChangedEvents = False

        Dim currentRow As QuestionRow = QuestionRow.GetQuestionRow(dtoQuestionRow, mFieldList)
        Add(currentRow)
        RaiseListChangedEvents = True

        Return currentRow

    End Function

    Friend Sub Update()

        RaiseListChangedEvents = False

        For Each item As QuestionRow In DeletedList
            item.DeleteSelf()
        Next
        DeletedList.Clear()

        For Each item As QuestionRow In Me
            If item.IsDirty Then
                If item.IsNew Then
                    item.Insert()
                Else
                    item.Update()
                End If
            End If

        Next

        RaiseListChangedEvents = True

    End Sub

    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal changeset As DataContracts.AnswerDataChangeSet)

        For Each item As ProfilesLibrary.QuestionRow In DeletedList
            item.GetDelete(changeset)
        Next

        For Each item As ProfilesLibrary.QuestionRow In Me
            If item.IsDirty Then
                If item.IsNew Then
                    item.GetInsert(question, changeset)
                Else
                    item.GetUpdate(question, changeset)
                End If
            End If
        Next

    End Sub

#End Region

End Class


