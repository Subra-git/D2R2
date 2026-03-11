Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class GetProfileGuidanceReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function CanGetReport() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Client-side Code "

    Private mReportType As ProfileGuidanceReportType
    Private mReportData As Byte()

    Friend Property ReportType() As ProfileGuidanceReportType
        Get
            Return mReportType
        End Get
        Set(ByVal value As ProfileGuidanceReportType)
            mReportType = value
        End Set
    End Property

    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

#End Region

#Region " Factory Methods "


    Friend Shared Function GetProfileGuidanceReport(ByVal reportType As ProfileGuidanceReportType) As Byte()

        If Not CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get a pdf of the profile guidance report")
        End If

        Dim cmd As New GetProfileGuidanceReportCommand
        cmd.ReportType = reportType
        cmd = DataPortal.Execute(Of GetProfileGuidanceReportCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileQuestionService = DataFactory.GetProfileQuestionService()
        mReportData = db.GetProfileGuidanceReport(New DataContracts.GetProfileQuestionReportRequest(mReportType)).PdfData

    End Sub

#End Region

End Class

