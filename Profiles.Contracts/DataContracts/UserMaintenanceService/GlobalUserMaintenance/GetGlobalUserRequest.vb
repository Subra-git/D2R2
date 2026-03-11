Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetGlobalUserRequest

        Private mUserId As Guid

        <DataMember()> _
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

        Public Sub New(ByVal userId As Guid)
            mUserId = userId
        End Sub

    End Class

End Namespace




