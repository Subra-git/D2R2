Imports Csla
Imports Profiles.Contracts

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

<Serializable()> _
Public MustInherit Class FieldMetadataBase
    Inherits ReadOnlyBase(Of FieldMetadataBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mShortName As String = String.Empty
    Protected mEditorFieldType As EditorFieldType
    Protected mFieldNumber As Integer
    Protected mDataFieldTypeId As Guid
    Protected mDataTypeName As String
    Protected mDataType As DataFieldType
    Protected mIsMandatory As Boolean
    Protected mReferenceTableId As Guid
    Protected mReferenceTableIsMaintainable As Boolean
    Protected mIncludeInSummary As Boolean = True
    Protected mRelevanceFieldId As Guid
    Protected mRelevanceValueId As Guid
    Protected mAffectsVisibility As Boolean
    Protected mSourceOfDataReplication As Boolean
    Protected mTargetFieldList As List(Of Guid)

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

    Public ReadOnly Property EditorFieldType() As EditorFieldType
        Get
            Return mEditorFieldType
        End Get
    End Property

    Public ReadOnly Property FieldNumber() As Integer
        Get
            Return mFieldNumber
        End Get
    End Property

    Public ReadOnly Property DataFieldTypeId() As Guid
        Get
            Return mDataFieldTypeId
        End Get
    End Property

    Public ReadOnly Property DataTypeName() As String
        Get
            Return mDataTypeName
        End Get
    End Property

    Public ReadOnly Property DataType() As DataFieldType
        Get
            Return mDataType
        End Get
    End Property

    Public ReadOnly Property IsMandatory() As Boolean
        Get
            Return mIsMandatory
        End Get
    End Property

    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            Return mReferenceTableId
        End Get
    End Property

    Public ReadOnly Property ReferenceTableIsMaintainable() As Boolean
        Get
            Return mReferenceTableIsMaintainable
        End Get
    End Property

    Public ReadOnly Property IncludeInSummary() As Boolean
        Get
            Return mIncludeInSummary
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public ReadOnly Property RelevanceFieldId As Guid
        Get
            Return mRelevanceFieldId
        End Get
    End Property

    Public ReadOnly Property RelevanceValueId As Guid
        Get
            Return mRelevanceValueId
        End Get
    End Property

    Public ReadOnly Property AffectsVisibility As Boolean
        Get
            Return mAffectsVisibility
        End Get
    End Property

    Public ReadOnly Property SourceOfDataReplication As Boolean
        Get
            Return mSourceOfDataReplication
        End Get
    End Property

    Public ReadOnly Property TargetFieldList As List(Of Guid)
        Get
            Return mTargetFieldList
        End Get
    End Property
#End Region

#Region " Data Access "

    Private Function GetEnumValue(Of TEnum)(value As Integer) As TEnum
        If [Enum].IsDefined(GetType(TEnum), value) = False Then
            Throw New ArgumentException("Invalid enum value")
        End If

        Return CType(CType(value, Object), TEnum)
    End Function

    Protected Overridable Sub Fetch(ByVal dtoFieldMetadata As DataContracts.FieldMetadata)
        mId = dtoFieldMetadata.Id
        mShortName = dtoFieldMetadata.ShortName
        mFieldNumber = dtoFieldMetadata.FieldNumber
        mDataFieldTypeId = dtoFieldMetadata.DataFieldTypeId
        mDataTypeName = dtoFieldMetadata.DataTypeName
        mIsMandatory = dtoFieldMetadata.IsMandatory
        mReferenceTableId = dtoFieldMetadata.ReferenceTableId
        mReferenceTableIsMaintainable = dtoFieldMetadata.ReferenceTableIsMaintainable
        mEditorFieldType = GetEnumValue(Of EditorFieldType)(dtoFieldMetadata.EditorFieldType)
        mRelevanceFieldId = dtoFieldMetadata.RelevanceFieldId
        mRelevanceValueId = dtoFieldMetadata.RelevanceValueId
        mAffectsVisibility = dtoFieldMetadata.AffectsVisibility
        mSourceOfDataReplication = dtoFieldMetadata.SourceOfDataReplication
        mTargetFieldList = dtoFieldMetadata.TargetFieldList

        mDataType = GlobalCommon.GetDataFieldType(mDataTypeName)
    End Sub

#End Region

End Class

