Imports Csla
Imports Profiles.Contracts

Public Enum QuestionType
    Standard
    PerSpecies
    Repeating
End Enum

<Serializable()> _
Public MustInherit Class QuestionBase
    Inherits BusinessBase(Of QuestionBase)

#Region " Business Methods "

    Protected mIrrelevanceFieldId As Guid
    Protected mIrrelevanceValueId As Guid
    Protected mIrrelevanceFlag As Boolean
    Protected mIsRelevant As Boolean
    Protected mIsReadOnly As Boolean
    Protected mQuestionMetadata As QuestionMetadataWrapper
    Protected mParentId As Guid  'the parent object for which this question is holding answer data
    Private mName As String
    Private mNonTechnicalName As String

    Protected Friend ReadOnly Property ParentId() As Guid
        Get
            Return mQuestionMetadata.ParentId
        End Get
    End Property

    Protected Friend ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mQuestionMetadata.IsReadOnly
        End Get
    End Property

    Protected Friend ReadOnly Property IsProfileVersionQuestion() As Boolean
        Get
            Return mQuestionMetadata.IsProfileVersionQuestion
        End Get
    End Property

    ''' <summary>
    ''' Question metadata: the unique identifier for the question.
    ''' </summary>
    ''' <returns>Unique identifier for the question.</returns>
    Public ReadOnly Property Id() As Guid
        Get
            Return mQuestionMetadata.Id
        End Get
    End Property

    ''' <summary>
    ''' Question metadata: the question name as it is used to display to the user.
    ''' </summary>
    ''' <returns>The question name.</returns>
    Public ReadOnly Property Name() As String
        Get
            Return mName.StripPTags.SanitizeHtml
        End Get
    End Property

    ''' <summary>
    ''' Question metadata: the question short name used to identify fields / table names in the database.
    ''' </summary>
    ''' <returns>Question short name.</returns>
    Public ReadOnly Property ShortName() As String
        Get
            Return mQuestionMetadata.ShortName
        End Get
    End Property

    ''' <summary>
    ''' Question metadata: the question non-technical name used in the Question and Answer sheet report.
    ''' </summary>
    ''' <returns>Question non-technical name.</returns>
    Public ReadOnly Property NonTechnicalName() As String
        Get
            Return mNonTechnicalName
        End Get
    End Property

    ''' <summary>
    ''' Question metadata: the ordinal position of the question within the section.
    ''' </summary>
    ''' <returns>The question number.</returns>
    Public ReadOnly Property QuestionNumber() As Integer
        Get
            Return mQuestionMetadata.QuestionNumber
        End Get
    End Property

    ''' <summary>
    ''' Flag indicating whether this question is relevant (ie., whether answers to other fields within the section have rendered
    ''' this question irrelevant because of question dependency business rules).
    ''' </summary>
    ''' <returns>True if the question is relevant and should be answered; False if the question should not be answered because
    ''' the answer to other fields have rendered it irrelevant.</returns>
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
    ''' Unique identifier for a field within the profile that affects the relevance of this question.
    ''' </summary>
    ''' <returns>If this question's relevance is affected by another field within the profile, the unique identifier of that field; otherwise,
    ''' an empty Guid.</returns>
    Friend ReadOnly Property IrrelevanceFieldId() As Guid
        Get
            Return mQuestionMetadata.IrrelevanceFieldId
        End Get
    End Property

    ''' <summary>
    ''' If the field identified by the IrrelevanceFieldId property is a List field, then this property contains the unique identifier of the
    ''' value which, if that field is set to this value, renders this question irrevelant.
    ''' </summary>
    ''' <returns>If this question's relevance is affected by another field within the profile and that field is of datatype List, then
    ''' the unique identifier of the List value that will render this question irrelevant; otherwise, an empty Guid.</returns>
    Friend ReadOnly Property IrrelevanceValueId() As Guid
        Get
            Return mQuestionMetadata.IrrelevanceValueId
        End Get
    End Property

    ''' <summary>
    '''  If the field identified by the IrrelevanceFieldId property is a Boolean field, then this property contains the True / False value
    ''' that would render this question irrevelant.
    ''' </summary>
    ''' <returns>True if the field identified by the IrrelevanceFieldId property is a Boolean field, and that field being set to True would
    ''' render this question irrelevant; otherwise, False.</returns>
    Friend ReadOnly Property IrrelevanceFlag() As Boolean
        Get
            Return mQuestionMetadata.IrrelevanceFlag
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mQuestionMetadata.Id
    End Function

    ''' <summary>
    ''' A list of ProfileVersionField objects, which contain the metadata for the fields in this question.
    ''' </summary>
    ''' <returns>ProfileVersionFieldList object, containing a ProfileVersionField object for each field in this question.</returns>
    Public ReadOnly Property FieldList() As FieldMetadataListWrapper
        Get
            Return mQuestionMetadata.FieldMetadataList
        End Get
    End Property

    Public MustOverride Sub Clear()

    Public MustOverride Function Validate() As List(Of InvalidReason)

    Public MustOverride Function ValuesEqual(ByVal otherQuestion As QuestionBase) As Boolean

#End Region

#Region " Data Access "
    ''' <summary>
    ''' Reads in the metadata for this question. The other information for this question (field values etc.) are initialized
    ''' separately depending on the question type, using the FetchField, FetchSpecies and FetchValues methods.
    ''' </summary>
    ''' <param name="reader">The datareader containing metadata for the question</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Sub Fetch(ByVal questionMetadata As QuestionMetadataWrapper)
        mQuestionMetadata = questionMetadata
        mIsRelevant = True
        mName = questionMetadata.Name
        mNonTechnicalName = questionMetadata.NonTechnicalName


        MarkOld()
    End Sub

    Friend Overridable Sub InitializeFieldValueList()
        'do nothing by default
    End Sub

    ''' <summary>
    ''' Initializes a single FieldValue object within this question. If the question is per-species or repeating or both, assigns the FieldValue
    ''' objects to the relevant QuestionSpecies or QuestionRow objects; otherwise, assigns them to this question's FieldValueList
    ''' </summary>
    ''' <summary>
    ''' Initializes a single FieldValue object within this question. If the question is per-species or repeating or both, assigns the FieldValue
    ''' objects to the relevant QuestionSpecies or QuestionRow objects; otherwise, assigns them to this question's FieldValueList
    ''' </summary>
    Friend Sub FetchValue(ByVal dtoFieldValue As DataContracts.FieldValue)

        'the current value list is used to keep track of which value list we are adding values to as we loop through
        'the recordset returned from the stored procedure
        Dim currentValueList As FieldValueList
        'the current field index is used to keep track of the column from the current row in the recordset
        Dim currentFieldIndex As Integer
        Dim value As Object = Nothing

        currentValueList = GetFieldValueListForFetch(dtoFieldValue)
        currentFieldIndex = dtoFieldValue.FieldNumber - 1

        If TypeOf currentValueList(currentFieldIndex) Is BooleanFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), BooleanFieldValue).InitializeValue(dtoFieldValue.BooleanValue)
        ElseIf TypeOf currentValueList(currentFieldIndex) Is ListFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), ListFieldValue).InitializeValue(dtoFieldValue.ListValue)
        ElseIf TypeOf currentValueList(currentFieldIndex) Is DecimalFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), DecimalFieldValue).InitializeValue(DirectCast(dtoFieldValue, DataContracts.ProfileFieldValue).DecimalValue)
        ElseIf TypeOf currentValueList(currentFieldIndex) Is DateFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), DateFieldValue).InitializeValue(DirectCast(dtoFieldValue, DataContracts.ProfileFieldValue).DateValue)
        ElseIf TypeOf currentValueList(currentFieldIndex) Is LongTextFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), LongTextFieldValue).InitializeValue(dtoFieldValue.TextValue)
        ElseIf TypeOf currentValueList(currentFieldIndex) Is MultiValueListFieldValue Then
            DirectCast(currentValueList(currentFieldIndex), MultiValueListFieldValue).AddInitialValue(dtoFieldValue.ListValue)
        Else
            'do nothing
        End If

    End Sub

    Protected MustOverride Function GetFieldValueListForFetch(ByVal dtoFieldValue As DataContracts.FieldValue) As FieldValueList

    '''' <summary>
    '''' Saves changes within the FieldValue objects associated with this question back to the database. This is done by delegating
    '''' to the relevant child objects, depending on whether the question is per-species, repeating, or neither.
    '''' </summary>
    '''' <param name="connection">Connection to the database</param>
    '''' <remarks></remarks>
    Friend Sub Update()

        DoUpdate()

        MarkOld()

    End Sub

    Protected MustOverride Sub DoUpdate()

    Friend Sub GetUpdate(ByVal changeset As DataContracts.AnswerDataChangeSet)
        DoGetUpdate(changeset)
    End Sub

    Protected MustOverride Sub DoGetUpdate(ByVal changeset As DataContracts.AnswerDataChangeSet)

#End Region

End Class


