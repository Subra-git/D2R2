Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GetUserIdentityRequest

        Private mUserId As String
        Private mAuthenticationType As String

        'not passed to WCF (assume the logged on user when calling WCF)
        Public Property UserId() As String
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As String)
                mUserId = value
            End Set
        End Property

        'not passed to WCF (assume SSO when calling WCF)
        Public Property AuthenticationType() As String
            Get
                Return mAuthenticationType
            End Get
            Private Set(ByVal value As String)
                mAuthenticationType = value
            End Set
        End Property

        Public Sub New(ByVal userId As String, ByVal authenticationType As String)
            mUserId = userId
            mAuthenticationType = authenticationType
        End Sub

    End Class

End Namespace

