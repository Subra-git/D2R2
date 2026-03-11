Imports System.Runtime.Serialization

Namespace DataContracts

    Public Class ProfileQuestionInfo

        Private mId As Guid
        Private mName As String
        Private mQuestionNumber As Integer

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
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
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

        Public Sub New()
            '
        End Sub

    End Class

End Namespace

