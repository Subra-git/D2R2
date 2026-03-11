Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileContributionData

        Private mProfileVersionId As Guid
        Private mUserId As Guid
        Private mProfileSectionId As Guid
        Private mUserName As String = String.Empty
        Private mOrganisationName As String = String.Empty
        Private mFullName As String = String.Empty
        Private mLastContributionDate As DateTime

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
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
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
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
        Public Property OrganisationName() As String
            Get
                Return mOrganisationName
            End Get
            Set(ByVal value As String)
                mOrganisationName = value
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
        Public Property LastContributionDate() As DateTime
            Get
                Return mLastContributionDate
            End Get
            Set(ByVal value As DateTime)
                mLastContributionDate = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
