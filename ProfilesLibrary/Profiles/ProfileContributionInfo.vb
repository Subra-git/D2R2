Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileContributionInfo
    Inherits ReadOnlyBase(Of ProfileContributionInfo)

#Region " Business Methods "

    Private mProfileVersionId As Guid
    Private mUserId As Guid
    Private mProfileSectionId As Guid
    Private mUserName As String = String.Empty
    Private mOrganisationName As String = String.Empty
    Private mFullName As String = String.Empty
    Private mLastContributionDate As DateTime

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property
    Public ReadOnly Property UserId() As Guid
        Get
            Return mUserId
        End Get
    End Property
    Public ReadOnly Property ProfileSectionId() As Guid
        Get
            Return mProfileSectionId
        End Get
    End Property
    Public ReadOnly Property UserName() As String
        Get
            Return mUserName
        End Get
    End Property
    Public ReadOnly Property OrganisationName() As String
        Get
            Return mOrganisationName
        End Get
    End Property
    Public ReadOnly Property FullName() As String
        Get
            Return mFullName
        End Get
    End Property
    Public ReadOnly Property LastContributionDate() As DateTime
        Get
            Return mLastContributionDate
        End Get
    End Property
    Protected Overrides Function GetIdValue() As Object
        Return mProfileVersionId.ToString + "_" + mProfileSectionId.ToString + "_" + mUserId.ToString
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetProfileContributionInfo(ByVal profileContribution As DataContracts.ProfileContributionData) As ProfileContributionInfo

        Return New ProfileContributionInfo(profileContribution)

    End Function

    ''' <summary>
    ''' Private constructor to disallow direct creation of this object
    ''' </summary>
    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal profileContribution As DataContracts.ProfileContributionData)
        Fetch(profileContribution)
    End Sub

    

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileContribution As DataContracts.ProfileContributionData)
        mProfileVersionId = profileContribution.ProfileVersionId
        mUserId = profileContribution.UserId
        mProfileSectionId = profileContribution.ProfileSectionId
        mUserName = profileContribution.UserName
        mOrganisationName = profileContribution.OrganisationName
        mFullName = profileContribution.FullName
        mLastContributionDate = profileContribution.LastContributionDate
    End Sub

#End Region

End Class

