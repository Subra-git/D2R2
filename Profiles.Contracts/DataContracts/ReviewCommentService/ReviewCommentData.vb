Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReviewCommentData

        Private mId As Guid
        Private mCommentDate As DateTime
        Private mCommentSubject As String
        Private mCommentReference As String
        Private mCommentText As String
        Private mUserName As String
        Private mUserFullName As String
        Private mProfileVersionId As Guid
        Private mParentId As Guid
        Private mLevel As Integer
        Private mRowCode As String
        Private mChildCount As Integer
        Private mLastUpdated(7) As Byte

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
        Public Property UserFullName() As String
            Get
                Return mUserFullName
            End Get
            Set(ByVal value As String)
                mUserFullName = value
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

        <DataMember()> _
        Public Property Level() As Integer
            Get
                Return mLevel
            End Get
            Set(ByVal value As Integer)
                mLevel = value
            End Set
        End Property

        <DataMember()> _
        Public Property RowCode() As String
            Get
                Return mRowCode
            End Get
            Set(ByVal value As String)
                mRowCode = value
            End Set
        End Property

        <DataMember()> _
        Public Property ChildCount() As Integer
            Get
                Return mChildCount
            End Get
            Set(ByVal value As Integer)
                mChildCount = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace