Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ProfileNoteChangeset

        Private mUserId As Guid
        Private mProfileVersionId As Guid
        Private mNoteTypeId As Guid
        Private mDeleteList As List(Of ProfileNoteDelete)
        Private mInsertList As List(Of ProfileNoteInsert)
        Private mUpdateList As List(Of ProfileNoteUpdate)

        'not a DataMember - not passed across the WCF interface
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

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
        Public Property NoteTypeId() As Guid
            Get
                Return mNoteTypeId
            End Get
            Set(ByVal value As Guid)
                mNoteTypeId = value
            End Set
        End Property

        <DataMember()> _
        Public Property DeleteList() As List(Of ProfileNoteDelete)
            Get
                Return mDeleteList
            End Get
            Set(ByVal value As List(Of ProfileNoteDelete))
                mDeleteList = value
            End Set
        End Property

        <DataMember()> _
        Public Property InsertList() As List(Of ProfileNoteInsert)
            Get
                Return mInsertList
            End Get
            Set(ByVal value As List(Of ProfileNoteInsert))
                mInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property UpdateList() As List(Of ProfileNoteUpdate)
            Get
                Return mUpdateList
            End Get
            Set(ByVal value As List(Of ProfileNoteUpdate))
                mUpdateList = value
            End Set
        End Property

        Public Sub New(ByVal userId As Guid, ByVal profileVersionId As Guid, ByVal noteTypeId As Guid)
            mUserId = userId
            mProfileVersionId = profileVersionId
            mNoteTypeId = noteTypeId
            mDeleteList = New List(Of ProfileNoteDelete)
            mInsertList = New List(Of ProfileNoteInsert)
            mUpdateList = New List(Of ProfileNoteUpdate)
        End Sub

    End Class

End Namespace


