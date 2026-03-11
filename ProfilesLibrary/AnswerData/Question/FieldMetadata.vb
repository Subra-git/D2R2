Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

Public Enum DataFieldType
    BooleanType
    ListType
    DateType
    LongTextType
    MultiValueListType
    TextType
    DecimalType
    ProfileVersionDataType
    FieldGroup
End Enum

''' <summary>
''' This read only object contains metadata for a particular field in the surveillance profile. It is used to build FieldValue objects from -
''' a FieldValue object being an editable representation of a value in a particular profile version. If a field belongs to a question that
''' is repeating or per-species, then there will be multiple FieldValue objects based on the same ProfileVersionField object.
''' </summary>
<Serializable()> _
Public Class FieldMetadata
    Inherits ReadOnlyBase(Of FieldMetadata)

#Region " Business Methods "

    Private mId As Guid = Guid.Empty
    Private mName As String
    Private mShortName As String
    Private mFieldNumber As Integer
    Private mDataType As DataFieldType
    Private mIsMandatory As Boolean
    Private mIsReadOnly As Boolean
    Private mIsReadOnlyByDefault As Boolean
    Private mReferenceTableId As Guid = Guid.Empty
    Private mReferenceTableIsMaintainable As Boolean
    Private mAffectsRelevance As Boolean
    Private mQuestionType As QuestionType
    Private mParentId As Guid
    Private mIncludeInSummary As Boolean    

    ''' <summary>
    ''' The field identifier.
    ''' </summary>
    ''' <returns>The field identifier.</returns>
    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    ''' <summary>
    ''' The field name, used to display to the user.
    ''' </summary>
    ''' <returns>The field name</returns>
    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    ''' <summary>
    ''' The short name of the field, used to name the database column.
    ''' </summary>
    ''' <returns>The field's short name.</returns>
    Public ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

    ''' <summary>
    ''' Number of the field within the profile section.
    ''' </summary>
    ''' <returns>The field number.</returns>
    Public ReadOnly Property FieldNumber() As Integer
        Get
            Return mFieldNumber
        End Get
    End Property

    ''' <summary>
    ''' The data type of the field.
    ''' </summary>
    ''' <returns>Value from the DataFieldType enum indicating what data type this field is.</returns>
    Public ReadOnly Property DataType() As DataFieldType
        Get
            Return mDataType
        End Get
    End Property

    ''' <summary>
    ''' Flag indicating if the field is mandatory.
    ''' </summary>
    ''' <returns>True if the field is mandatory; False otherwise.</returns>
    Public ReadOnly Property IsMandatory() As Boolean
        Get
            Return mIsMandatory
        End Get
    End Property

    ''' <summary>
    ''' Flag indicating if the field is readonly. The field may be readonly because it is assigned as readonly in the profile metadata;
    ''' or it might be readonly because of global readonly requirements (eg. when the profile version is published, or historical, or 
    ''' when the user is a Reviewer)
    ''' </summary>
    ''' <returns>True if the field is readonly; False otherwise.</returns>
    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mIsReadOnly
        End Get
    End Property

    '
    ''' <summary>
    ''' Flag to distinguish between fields that are readonly by default (ie set to be readonly in the profile metadata),
    ''' vs. fields that are set as read only by global readonly requirements (eg. when the profile version is published, 
    ''' or historical, or when the user is a Reviewer)
    ''' </summary>
    ''' <returns>True if the field is readonly by default (ie in the profile metadata); False otherwise.</returns>
    Public ReadOnly Property IsReadOnlyByDefault() As Boolean
        Get
            Return mIsReadOnlyByDefault
        End Get
    End Property

    ''' <summary>
    ''' If the field is a List or MultiValueList, the ID of the reference table that constrains the list.
    ''' </summary>
    ''' <returns>The ID of the reference table, or an empty Guid if the field is not a List or MultiValueList.</returns>
    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            Return mReferenceTableId
        End Get
    End Property

    ''' <summary>
    ''' A flag indicating if the field's values are constrained by the values in a reference table that is maintainable via the
    ''' Maintenance screens available to profile editors
    ''' </summary>
    ''' <returns>True if the field is a List or MultiValueList, and the reference table used for the list is maintainable. False otherwise.</returns>
    Public ReadOnly Property ReferenceTableIsMaintainable() As Boolean
        Get
            Return mReferenceTableIsMaintainable
        End Get
    End Property

    ''' <summary>
    ''' A flag indicating if this field affects the relevance of other questions in the profile section
    ''' </summary>
    ''' <returns>True if the field affects the relevance of other questions; False otherwise.</returns>
    Public ReadOnly Property AffectsRelevance() As Boolean
        Get
            Return mAffectsRelevance
        End Get
    End Property

    ''' <summary>
    ''' A reference to the profile version or species to which this field belongs
    ''' </summary>
    ''' <returns>Guid containing the profile version ID or species ID</returns>
    Public ReadOnly Property ParentId() As Guid
        Get
            Return mParentId
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mShortName
    End Function

    Public ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mQuestionType = QuestionType.PerSpecies
        End Get
    End Property

    Public ReadOnly Property IsRepeating() As Boolean
        Get
            Return mQuestionType = QuestionType.Repeating
        End Get
    End Property

    Public ReadOnly Property QuestionType() As QuestionType
        Get
            Return mQuestionType
        End Get
    End Property

    Public ReadOnly Property IncludeInSummary() As Boolean
        Get
            Return mIncludeInSummary
        End Get
    End Property

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Gets a profile field, based on data from the database
    ''' </summary>
    ''' <param name="reader">the datareader containing the recordset that holds the field data</param>
    ''' <param name="isReadOnly">a flag indicating whether the readonly status of the field should be overridden by global readonly 
    ''' requirements</param>
    ''' <param name="profileVersionId">reference to the profile version to which this profile field belongs</param>
    ''' <returns>a new ProfileVersionField object</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetFieldMetaData(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid) As FieldMetadata

        Dim dataTypeName As String = reader.GetString(5)

        If GlobalCommon.GetDataFieldType(dataTypeName) = DataFieldType.FieldGroup Then
            Return New FieldGroupMetadata(reader, isReadOnly, parentId)
        Else
            Return New FieldMetadata(reader, isReadOnly, parentId)
        End If

    End Function

    ''' <summary>
    ''' Private constructor to disallow direct creation of this object
    ''' </summary>
    Protected Sub New()
        ' require use of factory methods
    End Sub

    ''' <summary>
    ''' Constructor used from the factory method to create a new object based on data in the database
    ''' </summary>
    ''' <param name="reader">the datareader containing the recordset that holds the field data</param>
    ''' <param name="isReadOnly">a flag indicating whether the readonly status of the field should be overridden by global readonly 
    ''' requirements</param>
    ''' <param name="profileVersionId">reference to the profile version to which this profile field belongs</param>
    Private Sub New(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid)
        Fetch(reader, isReadOnly, parentId)
    End Sub

#End Region

#Region " Data Access "
    ''' <summary>
    ''' Load the data for a field from the database
    ''' </summary>
    ''' <param name="reader">the datareader containing the recordset that holds the field data</param>
    ''' <param name="isReadOnly">a flag indicating whether the readonly status of the field should be overridden by global readonly 
    ''' requirements</param>
    ''' <param name="profileVersionId">reference to the profile version to which this profile field belongs</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Protected Sub Fetch(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid)
        mId = reader.GetGuid(1)
        mShortName = reader.GetString(2)
        mFieldNumber = reader.GetInt32(3)
        Dim dataTypeName As String = reader.GetString(5)
        mDataType = GlobalCommon.GetDataFieldType(dataTypeName)
        mIsMandatory = reader.GetBoolean(6)
        mReferenceTableId = reader.GetGuid(7)
        mReferenceTableIsMaintainable = reader.GetBoolean(8)
        mAffectsRelevance = reader.GetBoolean(9)
        mName = reader.GetString(10)
        mIsReadOnlyByDefault = reader.GetBoolean(11)
        If isReadOnly Then
            mIsReadOnly = True
        Else
            mIsReadOnly = mIsReadOnlyByDefault
        End If

        mQuestionType = QuestionType.Standard
        If reader.GetBoolean(12) Then
            mQuestionType = QuestionType.PerSpecies
        End If
        If reader.GetBoolean(13) Then
            mQuestionType = QuestionType.Repeating
        End If
        mIncludeInSummary = reader.GetBoolean(14)

        mParentId = parentId

    End Sub

#End Region

End Class

