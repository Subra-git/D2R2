Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class CommonAnswerData

        Private mId As Guid
        Private mProfileVersionId
        Private mAnswer As String

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
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Answer() As String
            Get
                Return mAnswer
            End Get
            Set(ByVal value As String)
                mAnswer = value
            End Set
        End Property

        Public Sub New()

        End Sub

    End Class

End Namespace
