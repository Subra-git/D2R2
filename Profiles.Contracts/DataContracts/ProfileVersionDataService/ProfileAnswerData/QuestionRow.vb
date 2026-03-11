Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class QuestionRow

        Private mId As Guid
        Private mProfileQuestionId As Guid
        Private mSequenceNumber As Integer

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
        Public Property ProfileQuestionId() As Guid
            Get
                Return mProfileQuestionId
            End Get
            Set(ByVal value As Guid)
                mProfileQuestionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SequenceNumber() As Integer
            Get
                Return mSequenceNumber
            End Get
            Set(ByVal value As Integer)
                mSequenceNumber = value
            End Set
        End Property

    End Class
End Namespace
