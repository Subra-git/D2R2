Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileNotesByVersionRequest

        Private mProfileVersionId As Guid
        Private mNoteTypeId As Guid

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
        Public Property NoteTypeId() As Guid
            Get
                Return mNoteTypeId
            End Get
            Set(ByVal value As Guid)
                mNoteTypeId = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal noteTypeId As Guid)
            mProfileVersionId = profileVersionId
            mNoteTypeId = noteTypeId
        End Sub

    End Class

End Namespace