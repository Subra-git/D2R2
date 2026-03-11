Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ProfileNoteInsert

        Private mId As Guid
        Private mNoteText As String
        Private mQuestionReferenceAddList As List(Of QuestionReference)

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
        Public Property NoteText() As String
            Get
                Return mNoteText
            End Get
            Set(ByVal value As String)
                mNoteText = value
            End Set
        End Property

        <DataMember()> _
            Public Property QuestionReferenceAddList() As List(Of QuestionReference)
            Get
                Return mQuestionReferenceAddList
            End Get
            Set(ByVal value As List(Of QuestionReference))
                mQuestionReferenceAddList = value
            End Set
        End Property

    End Class

End Namespace


