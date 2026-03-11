Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class CustomWordInsert

        Private mId As Guid
        Private mWord As String

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
        Public Property Word() As String
            Get
                Return mWord
            End Get
            Set(ByVal value As String)
                mWord = value
            End Set
        End Property

    End Class

End Namespace


