Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(SpeciesFieldValueUpdate))> _
    <KnownType(GetType(ProfileFieldValueUpdate))> _
    Public MustInherit Class FieldValueUpdate

        Private mFieldId As Guid = Guid.Empty
        Private mBooleanValue As Boolean
        Private mListValue As Guid = Guid.Empty
        Private mTextValue As String = String.Empty
        Private mMultiValueList As List(Of Guid)
        Private mParameterName As String = String.Empty
        Private mQuestionId As Guid = Guid.Empty

        <DataMember()> _
        Public Property FieldId() As Guid
            Get
                Return mFieldId
            End Get
            Set(ByVal value As Guid)
                mFieldId = value
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
        Public Property MultiValueList() As List(Of Guid)
            Get
                Return mMultiValueList
            End Get
            Set(ByVal value As List(Of Guid))
                mMultiValueList = value
            End Set
        End Property

        <DataMember()> _
        Public Property ParameterName() As String
            Get
                Return mParameterName
            End Get
            Set(ByVal value As String)
                mParameterName = value
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

        Public Sub New()
            mMultiValueList = New List(Of Guid)
        End Sub

    End Class

End Namespace
