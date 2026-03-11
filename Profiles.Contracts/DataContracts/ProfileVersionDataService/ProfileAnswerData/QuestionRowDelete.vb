Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class QuestionRowDelete

        Private mId As Guid
        Private mQuestionId As Guid

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

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
