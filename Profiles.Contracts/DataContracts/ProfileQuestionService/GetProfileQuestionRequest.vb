Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetProfileQuestionRequest

        Private mId As Guid

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        Public Sub New(ByVal id As Guid)
            mId = Id
        End Sub

    End Class

End Namespace
