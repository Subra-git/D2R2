Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class GetProfileDiseaseReviewsReportCommand
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
    Private mRequest As DataContracts.DiseaseReviewsData

    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

    Public Property Request() As DataContracts.DiseaseReviewsData
        Get
            Return mRequest
        End Get
        Set(ByVal value As DataContracts.DiseaseReviewsData)
            mRequest = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileRankingReport(ByVal request As DataContracts.DiseaseReviewsData) As Byte()

        If Not CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get the profile ranking report")
        End If

        Dim cmd As New GetProfileDiseaseReviewsReportCommand
        cmd.Request = request
        cmd = DataPortal.Execute(Of GetProfileDiseaseReviewsReportCommand)(cmd)

        Return cmd.Result

    End Function

    Public Shared Function GetProfileRankingReport() As Byte()
        Return GetProfileRankingReport(New DataContracts.DiseaseReviewsData())
    End Function

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetProfileDiseaseReviewsReport(Request).PdfData

    End Sub

#End Region
End Class
