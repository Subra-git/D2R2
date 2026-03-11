Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
Public Class ReferenceTable

        Private mId As Guid
        Private mName As String

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

        Public Sub New(ByVal id As Guid, ByVal name As String)
            mId = id
            mName = name
        End Sub

    End Class

End Namespace

