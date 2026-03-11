Imports Csla
Imports Profiles.Contracts

''' <summary>
''' This object represents a row of field values in a repeating profile question.
''' </summary>
<Serializable()> _
Public Class QuestionRow
    Inherits BusinessBase(Of QuestionRow)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileQuestionId As Guid
    Private mSequenceNumber As Integer
    Private mFieldValueList As FieldValueList

    ''' <summary>
    ''' Unique identifier for the row.
    ''' </summary>
    ''' <returns>Unique identifier for the row.</returns>
    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    ''' <summary>
    ''' Unique identifier for the question to which this row belongs.
    ''' </summary>
    ''' <returns>Question identifier</returns>
    Public ReadOnly Property ProfileQuestionId() As Guid
        Get
            Return mProfileQuestionId
        End Get
    End Property

    Public Property SequenceNumber() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mSequenceNumber
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Integer)
            CanWriteProperty(True)
            If mSequenceNumber <> value Then
                mSequenceNumber = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    ''' <summary>
    ''' The list of field values for this row.
    ''' </summary>
    ''' <returns>FieldValueList object containing FieldValue objects for this row.</returns>
    Public ReadOnly Property FieldValues() As FieldValueList
        Get
            Return mFieldValueList
        End Get
    End Property

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mFieldValueList.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mFieldValueList.IsDirty
        End Get
    End Property

    Public Function ValuesEqual(ByVal otherQuestionRow As QuestionRow) As Boolean

        Return mFieldValueList.ValuesEqual(otherQuestionRow.FieldValues)

    End Function

    ''' <summary>
    ''' Validate all fields for this question row
    ''' </summary>
    ''' <returns>List of InvalidReason objects that define all failed validation for the fields for this row</returns>
    ''' <remarks></remarks>
    Friend Function Validate(ByVal question As RepeatingQuestion) As List(Of InvalidReason)

        Dim questionInvalidReasons As New List(Of InvalidReason)

        For Each field As FieldValueBase In mFieldValueList

            'handle field group validation
            If TypeOf (field) Is FieldGroupFieldValue Then
                Dim fieldGroupInvalidReasons As New List(Of InvalidReason)
                Dim fieldGroup As FieldGroupFieldValue = DirectCast(field, FieldGroupFieldValue)
                fieldGroupInvalidReasons = fieldGroup.Validate()

                For Each reason As InvalidReason In fieldGroupInvalidReasons
                    reason.RowNumber = mSequenceNumber + 1
                    reason.QuestionNumber = question.QuestionNumber
                    reason.QuestionShortName = question.ShortName
                    reason.QuestionFullName = question.Name
                Next
                questionInvalidReasons.AddRange(fieldGroupInvalidReasons)
            Else
                Dim reason As InvalidReason = ValidateFieldValue(field, question.IsRelevant)
                If reason IsNot Nothing Then
                    reason.QuestionNumber = question.QuestionNumber
                    reason.QuestionShortName = question.ShortName
                    reason.QuestionFullName = question.Name
                    questionInvalidReasons.Add(reason)
                End If
            End If
        Next

        Return questionInvalidReasons

    End Function

    ''' <summary>
    ''' Perform mandatory and relevance validation on specified field within repeating question
    ''' </summary>
    ''' <param name="field">Field to be validated</param>
    ''' <returns>An InvalidReason object containing information concerning failed validation</returns>
    ''' <remarks></remarks>
    Private Function ValidateFieldValue(ByVal field As FieldValueBase, ByVal isRelevant As Boolean) As InvalidReason
        Dim invalid As InvalidReason = Nothing
        Dim reasonDescription As String = Nothing
        Dim reason As InvalidReason.ReasonType = Nothing
        Dim isInvalid As Boolean = False

        'relevant check
        If isRelevant Then

            'mandatory check
            If field.IsVisible AndAlso field.IsMandatory AndAlso field.IsEmpty Then
                reason = InvalidReason.ReasonType.Mandatory
                isInvalid = True
            End If

            'inactive reference data check
            If field.ReferenceTableIsMaintainable AndAlso (Not field.IsEmpty) Then
                Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(field.ReferenceTableId)
                For Each referenceItem As ReferenceValueInfo In referenceList
                    If Not referenceItem.IsActive Then
                        If (TypeOf field Is ListFieldValue AndAlso referenceItem.Id.Equals(DirectCast(field, ListFieldValue).FieldValue)) OrElse _
                                (TypeOf field Is MultiValueListFieldValue AndAlso DirectCast(field, MultiValueListFieldValue).ContainsValue(referenceItem.Id)) Then
                            reason = InvalidReason.ReasonType.ReferenceInactive
                            isInvalid = True
                            Exit For
                        End If
                    End If
                Next
            End If

        Else 'not relevant (mark as not relevant if not relevant but field contains value and field is not the affecting field and is not readonly)
            'RJN 18/4/08: note that we check IsReadOnlyByDefault here, not IsReadOnly, because we want this validation rule to fire
            'even if the profile version is globally readonly due to considerations such as it is published, or historical, or the user
            'does not have edit rights
            If (Not field.IsEmpty) AndAlso (Not field.AffectsRelevance) AndAlso (Not field.IsReadOnlyByDefault) AndAlso field.IsVisible Then
                reason = InvalidReason.ReasonType.Irrelevant
                isInvalid = True
            End If
        End If

        If isInvalid Then
            invalid = New InvalidReason
            invalid.FieldName = field.Name
            invalid.Reason = reason
            invalid.RowNumber = mSequenceNumber + 1
            If invalid.Reason = InvalidReason.ReasonType.Custom Then
                invalid.ReasonDescription = reasonDescription
            End If
        End If

        Return invalid

    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()
        ' TODO: add validation rules
        'ValidationRules.AddRule(Nothing, "")
    End Sub

#End Region

#Region " Authorization Rules "

    Protected Overrides Sub AddAuthorizationRules()
        ' TODO: add authorization rules
        'AuthorizationRules.AllowWrite("", "")
    End Sub

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new, blank row.
    ''' </summary>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in this row.</param>
    ''' <param name="sequenceNumber">The sequence number for the row.</param>
    ''' <returns>A new QuestionRow object.</returns>
    Friend Shared Function NewQuestionRow(ByVal fieldList As FieldMetadataListWrapper, ByVal sequenceNumber As Integer, ByVal questionId As Guid) As QuestionRow
        Return New QuestionRow(fieldList, sequenceNumber, questionId)
    End Function

    ''' <summary>
    ''' Factory method to create a row from the existing data in the database. The constructor actually creates the row
    ''' blank, and the values are filled in from the FetchValues() method in ProfileVersionQuestion.
    ''' </summary>
    ''' <param name="id">Unique identifier for the row</param>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in this row.</param>
    ''' <param name="sequenceNumber">The sequence number for the row.</param>
    ''' <returns>A new QuestionRow object.</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetQuestionRow(ByVal dtoQuestionRow As DataContracts.QuestionRow, ByVal fieldList As FieldMetadataListWrapper) As QuestionRow
        Return New QuestionRow(dtoQuestionRow, fieldList)
    End Function

    ''' <summary>
    ''' Constructor called from the NewQuestionRow factory method, to create a new blank row. The row Id is generated at
    ''' this point.
    ''' </summary>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in this row.</param>
    ''' <param name="sequenceNumber">The sequence number for the row.</param>
    Private Sub New(ByVal fieldList As FieldMetadataListWrapper, ByVal sequenceNumber As Integer, ByVal questionId As Guid)
        mId = Guid.NewGuid()
        mFieldValueList = FieldValueList.GetFieldValueList(fieldList)
        mSequenceNumber = sequenceNumber
        mProfileQuestionId = questionId
        MarkAsChild()
    End Sub

    ''' <summary>
    ''' Constructor called from the GetQuestionRow factory method.
    ''' </summary>
    ''' <param name="id">The identifier for the row.</param>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in this row.</param>
    ''' <param name="sequenceNumber">The sequence number for the row.</param>
    Private Sub New(ByVal dtoQuestionRow As DataContracts.QuestionRow, ByVal fieldList As FieldMetadataListWrapper)
        Fetch(dtoQuestionRow, fieldList)
        MarkAsChild()
    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Method called indirectly from the GetQuestionRow factory method to create a row based on database data.
    ''' </summary>
    ''' <param name="id">The identifier for the row.</param>
    ''' <param name="fieldList">The ProfileVersionFieldList to act as a template for the field values in this row.</param>
    ''' <param name="sequenceNumber">The sequence number for the row.</param>
    ''' <remarks></remarks>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal dtoQuestionRow As DataContracts.QuestionRow, ByVal fieldList As FieldMetadataListWrapper)

        mId = dtoQuestionRow.Id
        mSequenceNumber = dtoQuestionRow.SequenceNumber
        mProfileQuestionId = dtoQuestionRow.ProfileQuestionId
        mFieldValueList = FieldValueList.GetFieldValueList(fieldList)
        MarkOld()

    End Sub

    Friend Sub Insert()

        If mFieldValueList IsNot Nothing Then
            mFieldValueList.Update()
        End If

        MarkOld()

    End Sub

    Friend Sub Insert(ByVal newId As Guid)

        mId = newId

        MarkOld()

    End Sub

    ''' <summary>
    ''' Saves the data for this row back to the database.
    ''' </summary>
    ''' <param name="question">The ProfileVersionQuestion to which this row belongs</param>
    ''' <param name="connection">connection to the database</param>
    ''' <remarks></remarks>
    Friend Sub Update()

        If mFieldValueList IsNot Nothing Then
            mFieldValueList.Update()
        End If

        MarkOld()

    End Sub

    Friend Sub DeleteSelf()

        MarkNew()

    End Sub
    Friend Sub GetDelete(ByVal changeset As DataContracts.AnswerDataChangeSet)

        Dim profileChangeset As DataContracts.ProfileAnswerDataChangeSet = DirectCast(changeset, DataContracts.ProfileAnswerDataChangeSet)

        profileChangeset.QuestionRowDeleteList.Add(New DataContracts.QuestionRowDelete With {.Id = mId, .QuestionId = mProfileQuestionId})

        'The store procedure to delete a question row also deletes all of the fields within that row
        'hence there is no need to work out which fields are to be deleted.

    End Sub

    Friend Sub GetInsert(ByVal question As QuestionBase, ByVal changeset As DataContracts.AnswerDataChangeSet)

        Dim profileChangeset As DataContracts.ProfileAnswerDataChangeSet = DirectCast(changeset, DataContracts.ProfileAnswerDataChangeSet)

        profileChangeset.QuestionRowInsertList.Add(New DataContracts.QuestionRow With { _
            .Id = mId, _
            .ProfileQuestionId = mProfileQuestionId, _
            .SequenceNumber = mSequenceNumber _
            })

        Me.FieldValues.GetUpdate(question, Me, changeset)

    End Sub

    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal changeset As DataContracts.AnswerDataChangeSet)

        Dim profileChangeset As DataContracts.ProfileAnswerDataChangeSet = DirectCast(changeset, DataContracts.ProfileAnswerDataChangeSet)

        profileChangeset.QuestionRowUpdateList.Add(New DataContracts.QuestionRow With { _
            .Id = mId, _
            .ProfileQuestionId = mProfileQuestionId, _
            .SequenceNumber = mSequenceNumber _
            })

        Me.FieldValues.GetUpdate(question, Me, changeset)

    End Sub

    
#End Region

End Class


