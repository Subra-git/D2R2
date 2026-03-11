Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class RepeatingQuestion
    Inherits QuestionBase

#Region " Business Methods "

    Private mRowList As QuestionRowList

    Public ReadOnly Property RowList() As QuestionRowList
        Get
            Return mRowList
        End Get
    End Property

    Public Overrides Sub Clear()
        mRowList.Clear()
    End Sub

    Public Overrides Function Validate() As List(Of InvalidReason)

        Dim questionInvalidReasons As New List(Of InvalidReason)

        For Each row As QuestionRow In mRowList
            questionInvalidReasons.AddRange(row.Validate(Me))
        Next

        Return questionInvalidReasons

    End Function

    Public Overrides Function ValuesEqual(ByVal otherQuestion As QuestionBase) As Boolean

        If Not TypeOf otherQuestion Is RepeatingQuestion Then
            Return False
        End If

        Return mRowList.ValuesEqual(DirectCast(otherQuestion, RepeatingQuestion).RowList)

    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mRowList.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mRowList.IsDirty
        End Get
    End Property

    Public ReadOnly Property HasFieldGroup() As Boolean
        Get
            Return mRowList.HasFieldGroup()
        End Get
    End Property

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new ProfileVersionQuestion object, with metadata from the passed in datareader
    ''' </summary>
    ''' <param name="reader">datareader containing metadata for the question</param>
    ''' <returns>ProfileVersionQuestion representing the question within a profile section</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetRepeatingQuestion(ByVal questionMetadata As QuestionMetadataWrapper) As RepeatingQuestion
        Return New RepeatingQuestion(questionMetadata)
    End Function

    ''' <summary>
    ''' Private constructor to prevent direct instantiation
    ''' </summary>
    Private Sub New()
        MarkAsChild()
    End Sub

    ''' <summary>
    ''' Constructor called from the factory method to create a new ProfileVersionQuestion object, with metadata
    ''' from the passed in datareader
    ''' </summary>
    ''' <param name="reader">datareader containing metadata for the question</param>
    Private Sub New(ByVal questionMetadata As QuestionMetadataWrapper)
        MarkAsChild()
        Fetch(questionMetadata)
    End Sub

#End Region

#Region " Data access "

    Friend Sub FetchRow(ByVal dtoQuestionRow As DataContracts.QuestionRow)
        mRowList.FetchRow(dtoQuestionRow)
    End Sub

    Friend Overrides Sub InitializeFieldValueList()
        mRowList = QuestionRowList.NewQuestionRowList(mQuestionMetadata.FieldMetadataList, Me)
    End Sub

    Protected Overrides Function GetFieldValueListForFetch(ByVal dtoFieldValue As DataContracts.FieldValue) As FieldValueList

        Dim dtoProfileFieldValue As DataContracts.ProfileFieldValue = DirectCast(dtoFieldValue, DataContracts.ProfileFieldValue)

        Dim rowId As Guid = dtoProfileFieldValue.ProfileVersionQuestionRowId
        Dim speciesId As Guid = dtoProfileFieldValue.SpeciesId

        If rowId <> Guid.Empty And speciesId <> Guid.Empty Then
            Dim fieldGroupId As Guid = dtoProfileFieldValue.FieldGroupId
            Dim row As QuestionRow = mRowList.GetById(rowId)
            Dim currentFieldGroupFieldValue As FieldGroupFieldValue = DirectCast(row.FieldValues.GetByFieldId(fieldGroupId), FieldGroupFieldValue)
            Return currentFieldGroupFieldValue.QuesSpecies.GetById(speciesId).FieldValues
        Else
            'repeating question
            Dim row As QuestionRow = mRowList.GetById(rowId)
            Return row.FieldValues
        End If

    End Function

    Protected Overrides Sub DoUpdate()

        mRowList.Update()

    End Sub

#End Region

    Protected Overrides Sub DoGetUpdate(ByVal changeset As DataContracts.AnswerDataChangeSet)

        Me.RowList.GetUpdate(Me, changeset)

    End Sub
End Class

