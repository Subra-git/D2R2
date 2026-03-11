Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileAnswerDataChangeResult
        Inherits AnswerDataChangeResult

        Private mQuestionRowIdInsertList As List(Of Guid)

        <DataMember()> _
        Public Property QuestionRowIdInsertList() As List(Of Guid)
            Get
                Return mQuestionRowIdInsertList
            End Get
            Set(ByVal value As List(Of Guid))
                mQuestionRowIdInsertList = value
            End Set
        End Property

        Public Sub New()
            MyBase.New()
            mQuestionRowIdInsertList = New List(Of Guid)
        End Sub

    End Class

End Namespace

