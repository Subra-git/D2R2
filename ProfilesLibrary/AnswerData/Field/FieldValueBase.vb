Imports Csla
Imports Profiles.Contracts

''' <summary>
''' This editable object represents a field value in the surveillance profile. If the field belongs to a question that repeats or is per-species,
''' then there will be more than one FieldValue object for that field, for a given profile version section.
''' </summary>
<Serializable()> _
Public MustInherit Class FieldValueBase
    Inherits BusinessBase(Of FieldValueBase)

#Region " Business Methods "

    Private mSpeciesId As Guid
    Protected mFieldMetadata As FieldMetadataWrapper

    ''' <summary>
    ''' Identifier for the profile field to which this value belongs.
    ''' </summary>
    Public ReadOnly Property Id() As Guid
        Get
            Return mFieldMetadata.Id
        End Get
    End Property

    ''' <summary>
    ''' Name of the profile field to which this value belongs
    ''' </summary>
    Public ReadOnly Property Name() As String
        Get
            Return mFieldMetadata.Name
        End Get
    End Property

    ''' <summary>
    ''' Short name of the profile field to which this value belongs
    ''' </summary>
    Public ReadOnly Property ShortName() As String
        Get
            Return mFieldMetadata.ShortName
        End Get
    End Property

    ''' <summary>
    ''' Number of the profile field to which this value belongs
    ''' </summary>
    Public ReadOnly Property FieldNumber() As Integer
        Get
            Return mFieldMetadata.FieldNumber
        End Get
    End Property

    ''' <summary>
    ''' Indicates if the profile field to which this value belongs is mandatory
    ''' </summary>
    Public ReadOnly Property IsMandatory() As Boolean
        Get
            Return mFieldMetadata.IsMandatory
        End Get
    End Property

    ''' <summary>
    ''' Indicates if the profile field to which this value belongs is readonly
    ''' </summary>
    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mFieldMetadata.IsReadOnly
        End Get
    End Property

    ''' <summary>
    ''' Indicates if the profile field to which this value belongs is readonly by default
    ''' </summary>
    Public ReadOnly Property IsReadOnlyByDefault() As Boolean
        Get
            Return mFieldMetadata.IsReadOnlyByDefault
        End Get
    End Property

    ''' <summary>
    ''' The ID of the reference table from which lookup values are taken for this field.
    ''' This is only relevant if the profile field is a List or MultiValueList.
    ''' </summary>
    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            Return mFieldMetadata.ReferenceTableId
        End Get
    End Property

    ''' <summary>
    ''' A flag indicating if the field's values are constrained by the values in a reference table that is maintainable via the
    ''' Maintenance screens available to profile editors
    ''' </summary>
    ''' <returns>True if the field is a List or MultiValueList, and the reference table used for the list is maintainable. False otherwise.</returns>
    Public ReadOnly Property ReferenceTableIsMaintainable() As Boolean
        Get
            Return mFieldMetadata.ReferenceTableIsMaintainable
        End Get
    End Property

    ''' <summary>
    ''' Indicates if the profile field to which this value belongs affects the relevance of other questions
    ''' in this section of the profile.
    ''' </summary>
    Public ReadOnly Property AffectsRelevance() As Boolean
        Get
            Return mFieldMetadata.AffectsRelevance
        End Get
    End Property

    ''' <summary>
    ''' A comma sepearted list of questions that may have their relevance affected by a change to this field
    ''' </summary>
    Public ReadOnly Property AffecteRelevanceOf() As String
        Get
            Return mFieldMetadata.AffectsRelevanceOf
        End Get
    End Property

    Public ReadOnly Property RelevanceFieldId As Guid
        Get
            Return mFieldMetadata.RelevanceFieldId
        End Get
    End Property

    Public ReadOnly Property RelevanceValueId As Guid
        Get
            Return mFieldMetadata.RelevanceValueId
        End Get
    End Property

    Public ReadOnly Property AffectsVisibility As Boolean
        Get
            Return mFieldMetadata.AffectsVisibility
        End Get
    End Property

    Public ReadOnly Property SourceOfDataReplication As Boolean
        Get
            Return mFieldMetadata.SourceOfDataReplication
        End Get
    End Property

    Public ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mFieldMetadata.QuestionType = QuestionType.PerSpecies
        End Get
    End Property

    Public ReadOnly Property IsRepeating() As Boolean
        Get
            Return mFieldMetadata.QuestionType = QuestionType.Repeating
        End Get
    End Property

    Public ReadOnly Property QuestionType() As QuestionType
        Get
            Return mFieldMetadata.QuestionType
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property IncludeInSummary() As Boolean
        Get
            Return mFieldMetadata.IncludeInSummary
        End Get
    End Property

    ''' <summary>
    ''' Indicates if the profile field to which this value belongs is readonly
    ''' </summary>
    Public ReadOnly Property IsVisible() As Boolean
        Get
            Return mFieldMetadata.IsVisible
        End Get
    End Property

    Public ReadOnly Property TargetFieldList As List(Of Guid)
        Get
            Return mFieldMetadata.TargetFieldList
        End Get
    End Property

    Public ReadOnly Property DataType As DataFieldType
        Get
            Return mFieldMetadata.DataType
        End Get
    End Property

    Public Overridable Function ContainsGuid(ByVal fieldValue As Guid) As Boolean
        Return False
    End Function

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Friend Sub Clear()

        If Not mFieldMetadata.IsReadOnly Then
            DoClear()
        End If

    End Sub

    Public MustOverride ReadOnly Property IsEmpty() As Boolean

    Protected MustOverride Sub DoClear()

    Public MustOverride Sub SetValue(value As Object)

    Public MustOverride Function GetValue() As Object

    Public MustOverride Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

    Protected Overrides Function GetIdValue() As Object
        Return mFieldMetadata.Id
    End Function

    Public Overloads Function ToString(ByVal maxLength As Integer) As String

        Dim output As String = Me.ToString()
        If output.Length > 50 Then
            output = output.Substring(0, 50) & "..."
        End If

        Return output

    End Function
#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Creates a new FieldValue object, based on a field
    ''' </summary>
    ''' <param name="field">the field object to base this value on</param>
    ''' <returns>A new FieldValue object</returns>
    Friend Shared Function NewFieldValue(ByVal field As FieldMetadataWrapper, ByVal speciesId As Guid) As FieldValueBase

        Select Case field.DataType
            Case DataFieldType.BooleanType
                Return New BooleanFieldValue(field, speciesId)
            Case DataFieldType.ListType
                Return New ListFieldValue(field, speciesId)
            Case DataFieldType.DecimalType
                Return New DecimalFieldValue(field, speciesId)
            Case DataFieldType.DateType
                Return New DateFieldValue(field, speciesId)
            Case DataFieldType.TextType
                Return New TextFieldValue(field, speciesId)
            Case DataFieldType.MultiValueListType
                Return New MultiValueListFieldValue(field, speciesId)
            Case DataFieldType.ProfileVersionDataType
                Return New ProfileVersionDataFieldValue(field, speciesId)
            Case DataFieldType.FieldGroup
                Return New FieldGroupFieldValue(DirectCast(field, ProfileFieldGroupMetadataWrapper), speciesId)
            Case Else
                Return New LongTextFieldValue(field, speciesId)

        End Select
    End Function

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Called by the constructor to create a FieldValue object populated with data from the associated ProfileVersionField
    ''' </summary>
    ''' <param name="field">the ProfileVersionField on which this FieldValue is based</param>
    Protected Sub Fetch(ByVal field As FieldMetadataWrapper, ByVal speciesId As Guid)

        mSpeciesId = speciesId
        mFieldMetadata = field
        MarkOld()

    End Sub

    Friend MustOverride Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As DataContracts.FieldValueUpdate)

    Friend Overridable Sub Update()
        MarkOld()
    End Sub

#End Region

End Class

