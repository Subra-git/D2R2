Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReviewCommentInsert

        Private mId As Guid
        Private mCommentDate As DateTime
        Private mCommentSubject As String
        Private mCommentReference As String
        Private mCommentText As String
        Private mUserName As String
        Private mParentId As Guid

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
        Public Property CommentDate() As DateTime
            Get
                Return mCommentDate
            End Get
            Set(ByVal value As DateTime)
                mCommentDate = value
            End Set
        End Property

        <DataMember()> _
        Public Property CommentSubject() As String
            Get
                Return mCommentSubject
            End Get
            Set(ByVal value As String)
                mCommentSubject = value
            End Set
        End Property

        <DataMember()> _
        Public Property CommentReference() As String
            Get
                Return mCommentReference
            End Get
            Set(ByVal value As String)
                mCommentReference = value
            End Set
        End Property

        <DataMember()> _
        Public Property CommentText() As String
            Get
                Return mCommentText
            End Get
            Set(ByVal value As String)
                mCommentText = value
            End Set
        End Property

        <DataMember()> _
        Public Property UserName() As String
            Get
                Return mUserName
            End Get
            Set(ByVal value As String)
                mUserName = value
            End Set
        End Property

        <DataMember()> _
        Public Property ParentId() As Guid
            Get
                Return mParentId
            End Get
            Set(ByVal value As Guid)
                mParentId = value
            End Set
        End Property

    End Class

End Namespace
