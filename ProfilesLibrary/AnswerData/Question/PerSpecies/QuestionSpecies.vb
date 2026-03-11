Imports Csla
Imports Profiles.Contracts

''' <summary>
''' An object representing an affected species within a per-species question. It has a child list of field values. 
''' Although this object has no editable properties, it is editable because of the child objects.
''' </summary>
<Serializable()> _
Public Class QuestionSpecies
    Inherits BusinessBase(Of QuestionSpecies)

#Region " Business Methods "

    Private mId As Guid
    Private mName As String = String.Empty
    Private mIsActive As Boolean
   
    Private mProfileQuestionId As Guid
    Private mFieldValueList As FieldValueList
    Private mIsRelevant As Boolean

    ''' <summary>
    ''' Unique identifier for the species.
    ''' </summary>
    ''' <returns>Species unique identifier</returns>
    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    ''' <summary>
    ''' Species name.
    ''' </summary>
    ''' <returns>Species name</returns>
    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    ''' <summary>
    ''' Species active property.
    ''' </summary>
    ''' <returns>Species status</returns>
    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mIsActive
        End Get
    End Property


    ''' <summary>
    ''' Unique identifier for the question to which this QuestionSpecies object belongs.
    ''' </summary>
    ''' <returns>Question identifier</returns>
    Public ReadOnly Property ProfileQuestionId() As Guid
        Get
            Return mProfileQuestionId
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    ''' <summary>
    ''' The field values for this species, within the question to which this object belongs.
    ''' </summary>
    ''' <returns>FieldValueList object containing a FieldValue for each field in the question.</returns>
    Public ReadOnly Property FieldValues() As FieldValueList
        Get
            Return mFieldValueList
        End Get
    End Property

    ''' <summary>
    ''' Flag indicating whether the species for the question is relevant (ie., whether answers to other fields within the section have rendered
    ''' this question irrelevant for this species)
    ''' </summary>
    ''' <returns>True if the question is relevant and should be answered; False if the question should not be answered</returns>
    ''' <remarks>The relevance of each question in a section is calculated by the ProfileVersionSection object (a) when the
    ''' section data is first loaded from the database (b) whenever an answer is changed that may affect the relevance of other
    ''' questions in the section. See the "Relevance Handling" code block in the ProfileVersionSection class.</remarks>
    Public Property IsRelevant() As Boolean
        Get
            Return mIsRelevant
        End Get
        Friend Set(ByVal value As Boolean)
            mIsRelevant = value
        End Set
    End Property

    ''' <summary>
    ''' Clears the data from this QuestionSpecies object and its children.
    ''' </summary>
    Public Sub Clear()

        For Each field As FieldValueBase In mFieldValueList
            field.Clear()
        Next

    End Sub

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

    Public Function ValuesEqual(ByVal otherQuestionSpecies As QuestionSpecies) As Boolean

        Return mFieldValueList.ValuesEqual(otherQuestionSpecies.FieldValues)

    End Function

    ''' <summary>
    ''' Perform mandatory and relevance validation on specified field within species question
    ''' </summary>
    ''' <param name="field">Field to be validated</param>
    ''' <returns>An InvalidReason object containing information concerning failed validation</returns>
    ''' <remarks></remarks>
    Private Function ValidateFieldValue(ByVal field As FieldValueBase) As InvalidReason
        Dim invalid As InvalidReason = Nothing
        Dim reasonDescription As String = Nothing
        Dim reason As InvalidReason.ReasonType = Nothing
        Dim isInvalid As Boolean = False


        'inactive species data check
        If Not mIsActive Then
            reason = InvalidReason.ReasonType.SpeciesInactive
            isInvalid = True
        Else

            'relevant check
            If IsRelevant Then

                'mandatory check
                If field.IsMandatory AndAlso field.IsEmpty Then
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

            'Minimum Incubation Period must be <= Typical Incubation Period Lower
                If (field.ShortName = "Incubation Period Minimum") AndAlso (Not field.IsEmpty) Then
                    If DirectCast(field, DecimalFieldValue).FieldValue > DirectCast(FieldValues.GetByShortName("Incubation Period Typical Lower"), DecimalFieldValue).FieldValue Then
                        reason = InvalidReason.ReasonType.Custom
                        reasonDescription = "must be less than or equal to Typical incubation period range (lower value)"
                        isInvalid = True
                    End If
                End If

            'Typical Incubation Period Lower must be <= Typical Incubation Period Upper
                If (field.ShortName = "Incubation Period Typical Lower") AndAlso (Not field.IsEmpty) Then
                    If DirectCast(field, DecimalFieldValue).FieldValue > DirectCast(FieldValues.GetByShortName("Incubation Period Typical Upper"), DecimalFieldValue).FieldValue Then
                        reason = InvalidReason.ReasonType.Custom
                        reasonDescription = "must be less than or equal to Typical incubation period range (upper value)"
                        isInvalid = True
                    End If
                End If

            'Typical Incubation Period Upper must be <= Maximum Incubation Period
                If (field.ShortName = "Incubation Period Typical Upper") AndAlso (Not field.IsEmpty) Then
                    If DirectCast(field, DecimalFieldValue).FieldValue > DirectCast(FieldValues.GetByShortName("Incubation Period Maximum"), DecimalFieldValue).FieldValue Then
                        reason = InvalidReason.ReasonType.Custom
                        reasonDescription = "must be less than or equal to Maximum incubation period (in days)"
                        isInvalid = True
                    End If
                End If

            Else 'not relevant (mark as not relevant if not relevant but field contains value and field is not the affecting field and is not readonly)
            'RJN 18/4/08: note that we check IsReadOnlyByDefault here, not IsReadOnly, because we want this validation rule to fire
            'even if the profile version is globally readonly due to considerations such as it is published, or historical, or the user
                'does not have edit rights
                If (Not field.IsEmpty) AndAlso (Not field.AffectsRelevance) AndAlso (Not field.IsReadOnlyByDefault) Then
                    reason = InvalidReason.ReasonType.Irrelevant
                    isInvalid = True
                End If
            End If
        End If

        If isInvalid Then
            invalid = New InvalidReason
            invalid.FieldName = field.Name
            invalid.Reason = reason
            invalid.SpeciesName = mName
            If invalid.Reason = InvalidReason.ReasonType.Custom Then
                invalid.ReasonDescription = reasonDescription
            End If
            invalid.SpeciesName = mName
        End If

        Return invalid
    End Function

    ''' <summary>
    ''' Validate all fields for this question species
    ''' </summary>
    ''' <returns>List of InvalidReason objects that define all failed validation for the fields for this species</returns>
    ''' <remarks></remarks>
    Friend Function Validate() As Generic.List(Of InvalidReason)

        Dim questionInvalidReasons As New Generic.List(Of InvalidReason)

        For Each field As FieldValueBase In mFieldValueList
            Dim reason As InvalidReason = ValidateFieldValue(field)
            If reason IsNot Nothing Then
                questionInvalidReasons.Add(reason)
            End If
        Next

        Return questionInvalidReasons

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
    ''' Factory method to create a new QuestionSpecies object
    ''' </summary>
    ''' <param name="id">Identifier for the species</param>
    ''' <param name="name">Name of the species</param>
    ''' <param name="isActive">Status of species</param>
    ''' <param name="fieldList">list of fields in this question</param>
    ''' <returns>a new QuestionSpecies object</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetQuestionSpecies(ByVal currentProfiledSpecies As ProfiledSpecies, ByVal fieldList As FieldMetadataListWrapper) As QuestionSpecies
        Return New QuestionSpecies(currentProfiledSpecies, fieldList)
    End Function

    ''' <summary>
    ''' Constructor to build a QuestionSpecies object for the question
    ''' </summary>
    ''' <param name="id">Identifier for the species</param>
    ''' <param name="name">Name of the species</param>
    ''' <param name="isActive">Status of species</param>
    ''' <param name="isRepeating">True if the question is repeating; False otherwise.</param>
    ''' <param name="fieldList">list of fields in this question</param>
    Private Sub New(ByVal currentProfiledSpecies As ProfiledSpecies, ByVal fieldList As FieldMetadataListWrapper)

        MarkAsChild()

        mId = currentProfiledSpecies.Id
        mName = currentProfiledSpecies.Name
        mIsActive = currentProfiledSpecies.IsActive

        mFieldValueList = FieldValueList.GetFieldValueList(fieldList, mId)
        mIsRelevant = True

        MarkOld()

    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Saves data to the database
    ''' </summary>
    ''' <param name="question">the ProfileVersionQuestion to which this QuestionSpecies object belongs</param>
    Friend Sub GetUpdate(ByVal question As PerSpeciesQuestion, ByVal changeset As DataContracts.AnswerDataChangeSet)

        mFieldValueList.GetUpdate(question, Me, changeset)

    End Sub

    Friend Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal fieldGroup As FieldGroupFieldValue, ByVal changeset As DataContracts.AnswerDataChangeSet)

        mFieldValueList.GetUpdate(question, row, Me, fieldGroup, changeset)

    End Sub

    Friend Sub Update()

        mFieldValueList.Update()
        MarkOld()

    End Sub

#End Region

End Class

