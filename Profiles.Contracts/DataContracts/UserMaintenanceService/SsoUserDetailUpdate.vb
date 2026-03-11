Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserDetailUpdate

        Private mUserName As String
        Private mFullName As String
        Private mEmail As String
        Private mOrganisation As String
        Private mSubscribedToEmails As Boolean
        Private mSsoUserId As Guid

        <DataMember()> _
        Public Property UserName() As String
            Get
                Return mUserName
            End Get
            Set(ByVal value As String)
                mUserName = value
            End Set
        End Property

        <DataMember()> _
        Public Property FullName() As String
            Get
                Return mFullName
            End Get
            Set(ByVal value As String)
                mFullName = value
            End Set
        End Property

        <DataMember()> _
        Public Property Email() As String
            Get
                Return mEmail
            End Get
            Set(ByVal value As String)
                mEmail = value
            End Set
        End Property

        <DataMember()> _
        Public Property Organisation() As String
            Get
                Return mOrganisation
            End Get
            Set(ByVal value As String)
                mOrganisation = value
            End Set
        End Property
        
        <DataMember()> _
        Public Property SubscribedToEmails() As Boolean
            Get
                Return mSubscribedToEmails
            End Get
            Set(ByVal value As Boolean)
                mSubscribedToEmails = value
            End Set
        End Property

        <DataMember()> _
        Public Property SsoUserId() As Guid
            Get
                Return mSsoUserId
            End Get
            Set(ByVal value As Guid)
                mSsoUserId = value
            End Set
        End Property

    End Class

End Namespace




