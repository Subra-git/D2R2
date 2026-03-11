Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUser

        Private mId As Guid
        Private mUserName As String
        Private mFullName As String
        Private mEmailAddress As String
        Private mOrganisation As String
        Private mSubscribedToEmails As Boolean
        Private mSsoUserId As Guid
        Private mSsoUserProfileList As List(Of SsoUserProfile)
        Private mLastUpdated(7) As Byte

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
        Public Property EmailAddress() As String
            Get
                Return mEmailAddress
            End Get
            Set(ByVal value As String)
                mEmailAddress = value
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

        <DataMember()>
        Public Property SubscribedToEmails As Boolean
            Get
                Return mSubscribedToEmails
            End Get
            Set(ByVal value As Boolean)
                mSubscribedToEmails = value
            End Set
        End Property

        Public Property SsoUserId As Guid
            Get
                Return mSsoUserId
            End Get
            Set(ByVal value As Guid)
                mSsoUserId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SsoUserProfileList() As List(Of SsoUserProfile)
            Get
                Return mSsoUserProfileList
            End Get
            Set(ByVal value As List(Of SsoUserProfile))
                mSsoUserProfileList = value
            End Set
        End Property

        <DataMember()> _
        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Sub New()
            mSsoUserProfileList = New List(Of SsoUserProfile)
        End Sub

    End Class

End Namespace