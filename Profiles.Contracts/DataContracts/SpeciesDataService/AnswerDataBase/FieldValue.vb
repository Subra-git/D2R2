Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(SpeciesFieldValue))> _
    <KnownType(GetType(ProfileFieldValue))> _
    Public MustInherit Class FieldValue

        Private mId As Guid
        Private mBooleanValue As Boolean
        Private mListValue As Guid = Guid.Empty
        Private mTextValue As String = String.Empty
        Private mQuestionId As Guid
        Private mQuestionNumber As Integer
        Private mFieldNumber As Integer

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
        Public Property QuestionId() As Guid
            Get
                Return mQuestionId
            End Get
            Set(ByVal value As Guid)
                mQuestionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property BooleanValue() As Boolean
            Get
                Return mBooleanValue
            End Get
            Set(ByVal value As Boolean)
                mBooleanValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property ListValue() As Guid
            Get
                Return mListValue
            End Get
            Set(ByVal value As Guid)
                mListValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property TextValue() As String
            Get
                Return mTextValue
            End Get
            Set(ByVal value As String)
                mTextValue = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
            Set(ByVal value As Integer)
                mQuestionNumber = value
            End Set
        End Property

        <DataMember()> _
        Public Property FieldNumber() As Integer
            Get
                Return mFieldNumber
            End Get
            Set(ByVal value As Integer)
                mFieldNumber = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
