Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class VerifyDatabaseUserRequest

        Private mUserName As String

        <DataMember()> _
        Public Property UserName() As String
            Get
                Return mUserName
            End Get
            Private Set(ByVal value As String)
                mUserName = value
            End Set
        End Property

        Public Sub New(ByVal userName As String)
            mUserName = userName
        End Sub

    End Class

End Namespace


