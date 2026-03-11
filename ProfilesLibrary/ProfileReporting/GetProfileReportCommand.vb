Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Friend Class GetProfileReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanGetReport(ByVal profileVersionReport As ProfileVersionReportInfo) As Boolean

        Return ProfileVersionReportInfo.CanGetProfileReport(profileVersionReport.ProfileVersionId)

    End Function

#End Region

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mProfileVersionId As Guid
    Private mProfileReportId As Guid


    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

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

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileReport(ByVal profileVersionReport As ProfileVersionReportInfo) As Byte()

        If Not CanGetReport(profileVersionReport) Then
            Throw New System.Security.SecurityException("You do not have permission to get a profile report")
        End If

        Dim cmd As New GetProfileReportCommand
        cmd.ProfileVersionId = profileVersionReport.ProfileVersionId
        cmd.ProfileReportId = profileVersionReport.Id
        cmd = DataPortal.Execute(Of GetProfileReportCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetProfileReportData(New DataContracts.GetProfileReportDataRequest(mProfileReportId, mProfileVersionId)).PdfData

    End Sub

#End Region

End Class
