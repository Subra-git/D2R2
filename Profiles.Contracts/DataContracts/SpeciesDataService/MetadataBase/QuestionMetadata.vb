Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileQuestionMetadata))> _
    <KnownType(GetType(SpeciesQuestionMetadata))> _
    Public MustInherit Class QuestionMetadata

        Private mId As Guid
        Private mSectionId As Guid
        Private mName As String
        Private mShortName As String
        Private mNonTechnicalName As String
        Private mQuestionNumber As Integer
        Private mFieldMetadataList As List(Of FieldMetadata)

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
        Public Property SectionId() As Guid
            Get
                Return mSectionId
            End Get
            Set(ByVal value As Guid)
                mSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
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
        Public Property NonTechnicalName() As String
            Get
                Return mNonTechnicalName
            End Get
            Set(ByVal value As String)
                mNonTechnicalName = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
            Set(ByVal value As Integer)
                mQuestionNumber = value
            End Set
        End Property

        <DataMember()> _
        Public Property FieldMetadataList() As List(Of FieldMetadata)
            Get
                Return mFieldMetadataList
            End Get
            Set(ByVal value As List(Of FieldMetadata))
                mFieldMetadataList = value
            End Set
        End Property

    End Class

End Namespace

