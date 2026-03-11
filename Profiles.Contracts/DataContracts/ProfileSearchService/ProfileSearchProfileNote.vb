Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()>
    Public Class ProfileSearchProfileNote

        Private mNoteId As Guid
        Private mProfileVersionId As Guid
        Private mScenarioId As Guid
        Private mProfileId As Guid
        Private mNote As String
        Private mIsReference As Boolean
        Private mNoteType As String

        <DataMember()>
        Public Property NoteId() As Guid
            Get
                Return mNoteId
            End Get
            Set(ByVal value As Guid)
                mNoteId = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()>
        Public Property ScenarioId() As Guid
            Get
                Return mScenarioId
            End Get
            Set(ByVal value As Guid)
                mScenarioId = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()>
        Public Property Note() As String
            Get
                Return mNote
            End Get
            Set(ByVal value As String)
                mNote = value
            End Set
        End Property

        <DataMember()>
        Public Property IsReference() As Boolean
            Get
                Return mIsReference
            End Get
            Set(ByVal value As Boolean)
                mIsReference = value
            End Set
        End Property

        <DataMember()>
        Public Property NoteType() As String
            Get
                Return mNoteType
            End Get
            Set(ByVal value As String)
                mNoteType = value
            End Set
        End Property


        Public Sub New(ByVal noteId As Guid,
                       ByVal profileVersionId As Guid,
                       ByVal scenarioId As Guid,
                       ByVal profileId As Guid,
                       ByVal note As String,
                       ByVal isReference As Boolean,
                       ByVal noteType As String)
            mNoteId = noteId
            mProfileVersionId = profileVersionId
            mScenarioId = scenarioId
            mProfileId = profileId
            mNote = note
            mIsReference = isReference
            mNoteType = noteType
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
