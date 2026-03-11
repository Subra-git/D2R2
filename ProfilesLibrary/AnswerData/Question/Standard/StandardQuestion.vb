Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class StandardQuestion
    Inherits QuestionBase

#Region " Business Methods "

    Private mFieldValueList As FieldValueList

    Public ReadOnly Property FieldValues() As FieldValueList
        Get
            Return mFieldValueList
        End Get
    End Property

    ''' <summary>
    ''' Removes all the data from this question.
    ''' </summary>
    ''' <remarks>Called from Section object to implement the Clear Section functionality.</remarks>
    Public Overrides Sub Clear()

        For Each field As FieldValueBase In mFieldValueList
            field.Clear()
        Next

    End Sub

    Public Overrides Function Validate() As List(Of InvalidReason)

        Dim questionInvalidReasons As New List(Of InvalidReason)

        For Each field As FieldValueBase In mFieldValueList
            Dim reason As InvalidReason = ValidateFieldValue(field)
            If reason IsNot Nothing Then
                questionInvalidReasons.Add(reason)
            End If
        Next

        Return questionInvalidReasons

    End Function

    ''' <summary>
    ''' Perform mandatory and relevance validation on specified field within this question
    ''' </summary>
    ''' <param name="field">Field to be validated</param>
    ''' <returns>An InvalidReason object containing information concerning failed validation</returns>
    ''' <remarks></remarks>
    Private Function ValidateFieldValue(ByVal field As FieldValueBase) As InvalidReason

        Dim invalid As InvalidReason = Nothing
        Dim reasonDescription As String = Nothing
        Dim reason As InvalidReason.ReasonType = Nothing
        Dim isInvalid As Boolean = False

        'relevant check
        If IsRelevant Then

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
                        If (TypeOf field Is ListFieldValue AndAlso referenceItem.Id.Equals(DirectCast(field, ListFieldValue).FieldValue)) OrElse
                                (TypeOf field Is MultiValueListFieldValue AndAlso DirectCast(field, MultiValueListFieldValue).ContainsValue(referenceItem.Id)) Then
                            reason = InvalidReason.ReasonType.ReferenceInactive
                            isInvalid = True
                            Exit For
                        End If
                    End If
                Next
            End If

            'question 2.3 date validation - cannot be a future date
            If (field.ShortName = "Date Of Most Recent Occurrence In GB" AndAlso Not field.IsEmpty) Then

                If DirectCast(field, DateFieldValue).FieldValue > DateTime.Now Then
                    reason = InvalidReason.ReasonType.Custom
                    reasonDescription = "cannot be a future date"
                    isInvalid = True
                End If
            End If

            'question 1.2 and 1.3 species validation - cannot contain inactive species
            If (field.ShortName = "Profiled Species" OrElse field.ShortName = "Other Affected Species") Then
                'just check if the profile version data contains the word "inactive"
                'this could potentially give the wrong result if there were a species whose name contained the word "inactive", 
                'but that would be absurd
                If field.ToString().IndexOf("(inactive)") > -1 Then
                    reason = InvalidReason.ReasonType.Custom
                    reasonDescription = "contains inactive species"
                    isInvalid = True
                End If
            End If

        Else 'not relevant (mark as not relevant if not relevant but field contains value and field is not the affecting field and is not readonly)
            'RJN 18/4/08: note that we check IsReadOnlyByDefault here, not IsReadOnly, because we want this validation rule to fire
            'even if the profile version is globally readonly due to considerations such as it is published, or historical, or the user
            'does not have edit rights
            If (Not field.IsEmpty) AndAlso (Not field.AffectsRelevance) AndAlso (Not field.IsReadOnlyByDefault) AndAlso (field.IsVisible) Then
                reason = InvalidReason.ReasonType.Irrelevant
                isInvalid = True
            End If
        End If

        If isInvalid Then
            invalid = New InvalidReason
            invalid.FieldName = field.Name
            invalid.Reason = reason
            invalid.QuestionNumber = mQuestionMetadata.QuestionNumber
            invalid.QuestionShortName = mQuestionMetadata.ShortName
            invalid.QuestionFullName = mQuestionMetadata.Name
            If invalid.Reason = InvalidReason.ReasonType.Custom Then
                invalid.ReasonDescription = reasonDescription
            End If
        End If

        Return invalid
    End Function

    Public Overrides Function ValuesEqual(ByVal otherQuestion As QuestionBase) As Boolean

        If Not TypeOf otherQuestion Is StandardQuestion Then
            Return False
        End If

        Return mFieldValueList.ValuesEqual(DirectCast(otherQuestion, StandardQuestion).FieldValues)

    End Function

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

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetStandardQuestion(ByVal questionMetadata As QuestionMetadataWrapper) As StandardQuestion
        Return New StandardQuestion(questionMetadata)
    End Function

    ''' <summary>
    ''' Private constructor to prevent direct instantiation
    ''' </summary>
    Private Sub New()
        MarkAsChild()
    End Sub

    ''' <summary>
    ''' Constructor called from the factory method to create a new question object, with metadata
    ''' from the passed in datareader
    ''' </summary>
    ''' <param name="reader">datareader containing metadata for the question</param>
    Private Sub New(ByVal questionMetadata As QuestionMetadataWrapper)
        MarkAsChild()
        Fetch(questionMetadata)
    End Sub

#End Region

#Region " Data access "

    Friend Overrides Sub InitializeFieldValueList()
        mFieldValueList = FieldValueList.GetFieldValueList(mQuestionMetadata.FieldMetadataList)
    End Sub

    Protected Overrides Function GetFieldValueListForFetch(ByVal dtoFieldValue As DataContracts.FieldValue) As FieldValueList
        Return mFieldValueList
    End Function

    Protected Overrides Sub DoUpdate()
        mFieldValueList.Update()
    End Sub

    Protected Overrides Sub DoGetUpdate(ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet)

        Me.FieldValues.GetUpdate(Me, changeset)

    End Sub

#End Region



End Class

