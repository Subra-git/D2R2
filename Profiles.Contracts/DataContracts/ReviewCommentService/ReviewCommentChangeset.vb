Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ReviewCommentChangeset

        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid
        Private mDeleteList As List(Of ReviewCommentDelete)
        Private mInsertList As List(Of ReviewCommentInsert)
        Private mUpdateList As List(Of ReviewCommentUpdate)

        <DataMember()> _
       Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property DeleteList() As List(Of ReviewCommentDelete)
            Get
                Return mDeleteList
            End Get
            Set(ByVal value As List(Of ReviewCommentDelete))
                mDeleteList = value
            End Set
        End Property

        <DataMember()> _
        Public Property InsertList() As List(Of ReviewCommentInsert)
            Get
                Return mInsertList
            End Get
            Set(ByVal value As List(Of ReviewCommentInsert))
                mInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property UpdateList() As List(Of ReviewCommentUpdate)
            Get
                Return mUpdateList
            End Get
            Set(ByVal value As List(Of ReviewCommentUpdate))
                mUpdateList = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
            mDeleteList = New List(Of ReviewCommentDelete)
            mInsertList = New List(Of ReviewCommentInsert)
            mUpdateList = New List(Of ReviewCommentUpdate)
        End Sub

    End Class

End Namespace

