Imports Profiles.Contracts
Imports Csla

<Serializable()> _
Friend Class CreateProfileReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanCreateProfileReport(ByVal profileVersionId As Guid) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
        Return CanCreateProfileReport(profileVersion)

    End Function

    Public Shared Function CanCreateProfileReport(ByVal profileVersion As ProfileVersionInfo) As Boolean

        'you can only create a profile report for a current profile version (UATD29: no historical versions)

        If Not profileVersion.IsCurrent Then
            Return False
        End If

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        If profileVersion.Status = ProfileVersionStatus.Published Then
            'you can only create a profile report if you are a profile editor
            If identity.IsProfileEditor Then
                Return True
            End If
        End If

        If profileVersion.Status = ProfileVersionStatus.Draft Then
            If identity.IsProfileEditor OrElse identity.IsPolicyProfileUser OrElse identity.IsProfileContributorOrReviewer(profileVersion.ProfileId) Then
                Return True
            End If
        End If

        Return False
    End Function

#End Region

#Region " Client-side Code "

    Private mProfileVersionId As Guid
    Private mProfileReportId As Guid
    Private mReportName As String

    Friend Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property

    Friend Property ProfileReportId() As Guid
        Get
            Return mProfileReportId
        End Get
        Set(ByVal value As Guid)
            mProfileReportId = value
        End Set
    End Property

    Friend Property ReportName() As String
        Get
            Return mReportName
        End Get
        Set(ByVal value As String)
            mReportName = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Protected Friend Shared Sub CreateProfileReport(ByVal profileVersionId As Guid, ByVal profileReportId As Guid, ByVal reportName As String)

        Dim profileInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        If Not CanCreateProfileReport(profileInfo) Then
            Throw New System.Security.SecurityException("You do not have permission to create a profile report.")
        End If

        Dim cmd As New CreateProfileReportCommand
        cmd.ProfileVersionId = profileVersionId
        cmd.ProfileReportId = profileReportId
        cmd.ReportName = reportName

        cmd = DataPortal.Execute(Of CreateProfileReportCommand)(cmd)

    End Sub


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        db.CreateProfileReport(New DataContracts.CreateProfileReportRequest(mProfileVersionId, mProfileReportId, mReportName))

    End Sub

#End Region

End Class
