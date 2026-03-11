Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
        Public Class ProfileContributorInsert

        Private mId As Guid
        Private mUserName As String
        Private mFullName As String
        Private mOrganisation As String
        Private mRoleId As Guid
        Private mReviewEmail As Boolean
        Private mSectionAddList As List(Of Guid)
        Private mSectionRemoveList As List(Of Guid)
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
            Public Property SectionAddList() As List(Of Guid)
            Get
                Return mSectionAddList
            End Get
            Set(ByVal value As List(Of Guid))
                mSectionAddList = value
            End Set
        End Property

        <DataMember()> _
            Public Property SectionRemoveList() As List(Of Guid)
            Get
                Return mSectionRemoveList
            End Get
            Set(ByVal value As List(Of Guid))
                mSectionRemoveList = value
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
        Public Property ReviewEmail() As Boolean
            Get
                Return mReviewEmail
            End Get
            Set(ByVal value As Boolean)
                mReviewEmail = value
            End Set
        End Property
    End Class

End Namespace



