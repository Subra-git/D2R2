Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class SsoUserProfile

        Private mUserId As Guid
        Private mProfileId As Guid
        Private mTitle As String
        Private mRoleId As Guid
        Private mRoleName As String
        Private mIsContributor As Boolean
        Private mSectionPermissions As List(Of Guid)
        Private mReviewEmails As List(Of Boolean)

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
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()> _
        Public Property RoleId() As Guid
            Get
                Return mRoleId
            End Get
            Set(ByVal value As Guid)
                mRoleId = value
            End Set
        End Property

        <DataMember()> _
        Public Property RoleName() As String
            Get
                Return mRoleName
            End Get
            Set(ByVal value As String)
                mRoleName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsContributor() As Boolean
            Get
                Return mIsContributor
            End Get
            Set(ByVal value As Boolean)
                mIsContributor = value
            End Set
        End Property

        <DataMember()> _
        Public Property SectionPermissions() As List(Of Guid)
            Get
                Return mSectionPermissions
            End Get
            Set(ByVal value As List(Of Guid))
                mSectionPermissions = value
            End Set
        End Property

        <DataMember()> _
        Public ReadOnly Property ReviewEmail() As Boolean
            Get
                For Each mReviewEmail As Boolean In mReviewEmails
                    If mReviewEmail = True Then
                        Return mReviewEmail
                    End If
                Next
                Return False
            End Get
        End Property

        Public Sub New()
            mSectionPermissions = New List(Of Guid)
            mReviewEmails = New List(Of Boolean)
        End Sub

    End Class

End Namespace