Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileSectionMetadata))> _
    <KnownType(GetType(SpeciesSectionMetadata))> _
    Public MustInherit Class SectionMetadata

        Private mId As Guid
        Private mName As String
        Private mShortName As String
        Private mSectionNumber As Integer
        Private mQuestionMetadataList As List(Of QuestionMetadata)

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
        Public Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
            Set(ByVal value As Integer)
                mSectionNumber = value
            End Set
        End Property

        <DataMember()> _
         Public Property QuestionMetadataList() As List(Of QuestionMetadata)
            Get
                Return mQuestionMetadataList
            End Get
            Set(ByVal value As List(Of QuestionMetadata))
                mQuestionMetadataList = value
            End Set
        End Property

    End Class

End Namespace

