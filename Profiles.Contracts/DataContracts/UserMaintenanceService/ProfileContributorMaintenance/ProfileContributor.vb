Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileContributor

        Private mId As Guid
        Private mUserName As String
        Private mFullName As String
        Private mOrganisation As String
        Private mRoleId As Guid
        Private mRole As String
        Private mIsContributor As Boolean
        Private mIsSsoUser As Boolean
        Private mLastUpdated(7) As Byte
        Private mSectionPermissions As New List(Of Guid)

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
        Public Property RoleId() As Guid
            Get
                Return mRoleId
            End Get
            Set(ByVal value As Guid)
                mRoleId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Role() As String
            Get
                Return mRole
            End Get
            Set(ByVal value As String)
                mRole = value
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
        Public Property IsSsoUser() As Boolean
            Get
                Return mIsSsoUser
            End Get
            Set(ByVal value As Boolean)
                mIsSsoUser = value
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
            Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

    End Class

End Namespace



