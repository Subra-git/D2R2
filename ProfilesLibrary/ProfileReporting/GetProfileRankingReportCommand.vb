Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class GetProfileRankingReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Public Shared Function CanGetReport() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mRequest As DataContracts.GetProfileRankingReportRequest

    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

    Public Property Request() As DataContracts.GetProfileRankingReportRequest
        Get
            Return mRequest
        End Get
        Set(ByVal value As DataContracts.GetProfileRankingReportRequest)
            mRequest = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileRankingReport(ByVal request As DataContracts.GetProfileRankingReportRequest) As Byte()

        If Not CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get the profile ranking report")
        End If

        Dim cmd As New GetProfileRankingReportCommand
        cmd.Request = request
        cmd = DataPortal.Execute(Of GetProfileRankingReportCommand)(cmd)

        Return cmd.Result

    End Function

    Public Shared Function GetProfileRankingReport() As Byte()
        Return GetProfileRankingReport(New DataContracts.GetProfileRankingReportRequest())
    End Function

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetProfileRankingReport(Request).PdfData

    End Sub

#End Region

End Class


