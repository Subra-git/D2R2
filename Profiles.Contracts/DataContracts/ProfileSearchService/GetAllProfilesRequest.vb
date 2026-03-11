Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetAllProfilesRequest

        Private mUserId As Guid
        Private mReturnQuestionAnswers As Boolean
        Private mReturnNotes As Boolean
        Private mSearchWords As String
        Private mPerformSqlWordSearch As Boolean
        Private mSectionSelection As List(Of Integer)

        <DataMember()>
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

        <DataMember()>
        Public Property ReturnQuestionAnswers() As Boolean
            Get
                Return mReturnQuestionAnswers
            End Get
            Private Set(ByVal value As Boolean)
                mReturnQuestionAnswers = value
            End Set
        End Property

        <DataMember()>
        Public Property ReturnNotes() As Boolean
            Get
                Return mReturnNotes
            End Get
            Private Set(ByVal value As Boolean)
                mReturnNotes = value
            End Set
        End Property

        <DataMember()>
        Public Property SearchWords() As String
            Get
                Return mSearchWords
            End Get
            Private Set(ByVal value As String)
                mSearchWords = value
            End Set
        End Property

        <DataMember()>
        Public Property PerformSqlWordSearch() As Boolean
            Get
                Return mPerformSqlWordSearch
            End Get
            Private Set(ByVal value As Boolean)
                mPerformSqlWordSearch = value
            End Set
        End Property

        <DataMember()>
        Public Property SectionSelection() As List(Of Integer)
            Get
                Return mSectionSelection
            End Get
            Set(value As List(Of Integer))
                mSectionSelection = value
            End Set
        End Property

        Public Sub New(ByVal userId As Guid, ByVal returnQuestionAnswers As Boolean, ByVal returnNotes As Boolean, ByVal words As String, ByVal performSqlSearch As Boolean, ByVal sectionSelection As List(Of Integer))
            mUserId = userId
            mReturnQuestionAnswers = returnQuestionAnswers
            mReturnNotes = returnNotes
            mSearchWords = words
            mPerformSqlWordSearch = performSqlSearch
            mSectionSelection = sectionSelection
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace