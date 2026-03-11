Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserDetailDelete

        Private mSsoUserId As Guid

        <DataMember()> _
        Public Property SsoUserId() As Guid
            Get
                Return mSsoUserId
            End Get
            Set(ByVal value As Guid)
                mSsoUserId = value
            End Set
        End Property

        Public Sub New(ByVal ssoUserId As Guid)
            mSsoUserId = ssoUserId
        End Sub

    End Class

End Namespace





