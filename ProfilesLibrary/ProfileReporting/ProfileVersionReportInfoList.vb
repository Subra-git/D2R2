Imports Csla
Imports System.Configuration.ConfigurationManager
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionReportInfoList
    Inherits ReadOnlyListBase(Of ProfileVersionReportInfoList, ProfileVersionReportInfo)

    Public Function GetById(ByVal profileReportId As Guid) As ProfileVersionReportInfo
        For Each currentReportInfo As ProfileVersionReportInfo In Me
            If currentReportInfo.Id.Equals(profileReportId) Then
                Return currentReportInfo
            End If
        Next
        Return Nothing
    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetList(ByVal profileVersionId As Guid) As Boolean

        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
        Return CanGetList(profileVersion)

    End Function

    Public Shared Function CanGetList(ByVal profileVersion As ProfileVersionInfo) As Boolean

        If profileVersion.Status = ProfileVersionStatus.Published Then
            'you can view a published profile report if it is public, or if you are an authenticated user
            Return profileVersion.IsPublic OrElse Csla.ApplicationContext.User.Identity.IsAuthenticated
        End If

        Return False

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetList(ByVal profileVersionId As Guid) As ProfileVersionReportInfoList

        If Not CanGetList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of profile reports for this profile version.")
        End If

        Dim isAuthenticated As Boolean = Csla.ApplicationContext.User.Identity.IsAuthenticated
        Return DataPortal.Fetch(Of ProfileVersionReportInfoList)(New Criteria(profileVersionId, isAuthenticated))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileVersionId As Guid
        Private mIsAuthenticated As Boolean

        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public ReadOnly Property IsAuthenticated() As Boolean
            Get
                Return mIsAuthenticated
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid, ByVal isAuthenticated As Boolean)

            mProfileVersionId = profileVersionId
            mIsAuthenticated = isAuthenticated
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim profileVersionId As Guid = criteria.ProfileVersionId

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        Dim reports As List(Of DataContracts.ProfileVersionReport)
        reports = db.GetProfileVersionReports(New DataContracts.GetProfileVersionReportsRequest(criteria.ProfileVersionId, criteria.IsAuthenticated))

        For Each report As DataContracts.ProfileVersionReport In reports
            Dim reportInfo As ProfileVersionReportInfo = ProfileVersionReportInfo.GetProfileVersionReportInfo(report, criteria.ProfileVersionId)
            Add(reportInfo)
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class



