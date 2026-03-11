Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ProfileNote

        Private mId As Guid
        Private mNoteText As String
        Private mQuestionReferenceList As List(Of QuestionReference)
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

        <DataMember()>
        Public Property NoteText() As String
            Get
                Return mNoteText
            End Get
            Set(ByVal value As String)
                mNoteText = value
            End Set
        End Property

		Public ReadOnly Property NoteTextPlainText As String
			Get
				Return mNoteText.StripHtmlTags()
			End Get
		End Property

		<DataMember()>
		Public Property QuestionReferences() As List(Of QuestionReference)
			Get
				Return mQuestionReferenceList
			End Get
			Set(ByVal value As List(Of QuestionReference))
				mQuestionReferenceList = value
			End Set
		End Property

		<DataMember()>
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

