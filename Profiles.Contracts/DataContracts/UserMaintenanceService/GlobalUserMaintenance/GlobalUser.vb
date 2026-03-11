Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class GlobalUser

        Private mId As Guid
        Private mUserName As String
        Private mFullName As String
        Private mOrganisation As String
        Private mIsProfileEditor As Boolean
        Private mIsPolicyProfileUser As Boolean
        Private mLastUpdated(7) As Byte
        Private mSubscribedToReviewEmails As Boolean

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
        Public Property Organisation() As String
            Get
                Return mOrganisation
            End Get
            Set(ByVal value As String)
                mOrganisation = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsProfileEditor() As Boolean
            Get
                Return mIsProfileEditor
            End Get
            Set(ByVal value As Boolean)
                mIsProfileEditor = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPolicyProfileUser() As Boolean
            Get
                Return mIsPolicyProfileUser
            End Get
            Set(ByVal value As Boolean)
                mIsPolicyProfileUser = value
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

        <DataMember()> _
        Public Property SubscribedToReviewEmails() As Boolean
            Get
                Return mSubscribedToReviewEmails
            End Get
            Set(ByVal value As Boolean)
                mSubscribedToReviewEmails = value
            End Set
        End Property

    End Class

End Namespace




