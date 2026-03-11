Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class UserIdentityData

        Private mIsAuthenticated As Boolean
        Private mUserId As Guid
        Private mUserName As String
        Private mFullName As String
        Private mOrganisation As String
        Private mIsProfileEditor As Boolean
        Private mIsPolicyProfileUser As Boolean
        Private mIsSsoUser As Boolean
        Private mIsUserManagementSystem As Boolean
        Private mContributorRoles As List(Of ProfileRoleData)
        Private mReviewerRoles As List(Of ProfileRoleData)

        <DataMember()> _
        Public Property IsAuthenticated() As Boolean
            Get
                Return mIsAuthenticated
            End Get
            Set(ByVal value As Boolean)
                mIsAuthenticated = value
            End Set
        End Property

        <DataMember()> _
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Set(ByVal value As Guid)
                mUserId = value
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
        Public Property IsSsoUser() As Boolean
            Get
                Return mIsSsoUser
            End Get
            Set(ByVal value As Boolean)
                mIsSsoUser = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsUserManagementSystem() As Boolean
            Get
                Return mIsUserManagementSystem
            End Get
            Set(ByVal value As Boolean)
                mIsUserManagementSystem = value
            End Set
        End Property

        <DataMember()> _
        Public Property ContributorRoles() As List(Of ProfileRoleData)
            Get
                Return mContributorRoles
            End Get
            Set(ByVal value As List(Of ProfileRoleData))
                mContributorRoles = value
            End Set
        End Property

        <DataMember()> _
        Public Property ReviewerRoles() As List(Of ProfileRoleData)
            Get
                Return mReviewerRoles
            End Get
            Set(ByVal value As List(Of ProfileRoleData))
                mReviewerRoles = value
            End Set
        End Property

    End Class

End Namespace


