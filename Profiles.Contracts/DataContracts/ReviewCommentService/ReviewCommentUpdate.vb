Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReviewCommentUpdate

        Private mId As Guid
        Private mCommentSubject As String
        Private mCommentReference As String
        Private mCommentText As String
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
        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

    End Class

End Namespace
