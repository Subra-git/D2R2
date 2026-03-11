Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileFieldMetadata))> _
    <KnownType(GetType(SpeciesFieldMetadata))> _
    Public MustInherit Class FieldMetadata

        Private mId As Guid
        Private mQuestionId As Guid
        Private mSectionId As Guid
        Private mShortName As String
        Private mFieldNumber As Integer
        Private mDataFieldTypeId As Guid
        Private mDataTypeName As String
        Private mIsMandatory As Boolean
        Private mReferenceTableId As Guid
        Private mReferenceTableIsMaintainable As Boolean
        Private mIncludeInSummary As Boolean
        Private mEditorFieldType As Integer
        Private mRelevanceFieldId As Guid
        Private mRelevanceValueId As Guid
        Private mAffectsVisibility As Boolean
        Private mSourceOfDataReplication As Boolean
        Private mTargetFieldList As List(Of Guid) = New List(Of Guid)

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionId() As Guid
            Get
                Return mQuestionId
            End Get
            Set(ByVal value As Guid)
                mQuestionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SectionId() As Guid
            Get
                Return mSectionId
            End Get
            Set(ByVal value As Guid)
                mSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ShortName() As String
            Get
                Return mShortName
            End Get
            Set(ByVal value As String)
                mShortName = value
            End Set
        End Property

        <DataMember()> _
        Public Property FieldNumber() As Integer
            Get
                Return mFieldNumber
            End Get
            Set(ByVal value As Integer)
                mFieldNumber = value
            End Set
        End Property

        <DataMember()> _
      Public Property DataFieldTypeId() As Guid
            Get
                Return mDataFieldTypeId
            End Get
            Set(ByVal value As Guid)
                mDataFieldTypeId = value
            End Set
        End Property

        <DataMember()> _
        Public Property DataTypeName() As String
            Get
                Return mDataTypeName
            End Get
            Set(ByVal value As String)
                mDataTypeName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsMandatory() As Boolean
            Get
                Return mIsMandatory
            End Get
            Set(ByVal value As Boolean)
                mIsMandatory = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
            Set(ByVal value As Guid)
                mReferenceTableId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReferenceTableIsMaintainable() As Boolean
            Get
                Return mReferenceTableIsMaintainable
            End Get
            Set(ByVal value As Boolean)
                mReferenceTableIsMaintainable = value
            End Set
        End Property

         <DataMember()> _
        Public Property EditorFieldType() As Integer
             Get
                Return mEditorFieldType
            End Get
            Set(ByVal value As Integer)
                mEditorFieldType = value
            End Set
        End Property

        <DataMember()> _
        Public Property IncludeInSummary() As Boolean
            Get
                Return mIncludeInSummary
            End Get
            Set(ByVal value As Boolean)
                mIncludeInSummary = value
            End Set
        End Property

        <DataMember()>
        Public Property RelevanceFieldId() As Guid
            Get
                Return mRelevanceFieldId
            End Get
            Set(ByVal value As Guid)
                mRelevanceFieldId = value
            End Set
        End Property

        <DataMember()>
        Public Property RelevanceValueId() As Guid
            Get
                Return mRelevanceValueId
            End Get
            Set(ByVal value As Guid)
                mRelevanceValueId = value
            End Set
        End Property

        <DataMember()>
        Public Property AffectsVisibility() As Boolean
            Get
                Return mAffectsVisibility
            End Get
            Set(ByVal value As Boolean)
                mAffectsVisibility = value
            End Set
        End Property

        <DataMember()>
        Public Property SourceOfDataReplication() As Boolean
            Get
                Return mSourceOfDataReplication
            End Get
            Set(ByVal value As Boolean)
                mSourceOfDataReplication = value
            End Set
        End Property

        <DataMember()>
        Public Property TargetFieldList() As List(Of Guid)
            Get
                Return mTargetFieldList
            End Get
            Set(ByVal value As List(Of Guid))
                mTargetFieldList = value
            End Set
        End Property

    End Class

End Namespace

