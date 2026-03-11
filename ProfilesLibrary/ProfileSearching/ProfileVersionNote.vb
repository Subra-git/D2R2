Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class ProfileVersionNote
    Inherits ReadOnlyBase(Of ProfileVersionNote)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileId As Guid
    Private mScenarioId As Guid
    Private mProfileVersionId As Guid
    Private mNote As String
    Private mIsReference As Boolean
    Private mNoteType As String

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ScenarioId() As Guid
        Get
            Return mScenarioId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property Note() As String
        Get
            Return mNote
        End Get
    End Property

    Public ReadOnly Property IsReference() As Boolean
        Get
            Return mIsReference
        End Get
    End Property

    Public ReadOnly Property NoteType() As String
        Get
            Return mNoteType
        End Get
    End Property

    Public Function NoteContainsWords(ByVal words As List(Of String), ByVal searchReference As Boolean, ByVal useExactWordMatch As Boolean) As Boolean
        If useExactWordMatch AndAlso words.Count > 0 AndAlso Not words.ElementAt(0).Trim().Contains(" ") Then
            Dim notesWords As List(Of String) = WordProcessor.ProcessWords(mNote)

            Return words.All(Function(word) notesWords.Contains(word.ToLower) AndAlso mIsReference = searchReference)
        Else
            Return words.All(Function(word) mNote.ToLower.Contains(word.ToLower) AndAlso mIsReference = searchReference)
        End If
    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mId.ToString
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionNote(ByVal note As DataContracts.ProfileSearchProfileNote) As ProfileVersionNote
        Return New ProfileVersionNote(note)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal note As DataContracts.ProfileSearchProfileNote)
        Fetch(note)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal note As DataContracts.ProfileSearchProfileNote)
        mId = note.NoteId
        mProfileId = note.ProfileId
        mScenarioId = note.ScenarioId
        mProfileVersionId = note.ProfileVersionId
        mNote = note.Note
        mIsReference = note.IsReference
        mNoteType = note.NoteType
    End Sub

#End Region

End Class



