Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class StaticReportService
    Implements IStaticReportService

    Public Function GetCurrentPublicStaticReports(ByVal request As DataContracts.GetCurrentPublicStaticReportsRequest) As List(Of DataContracts.StaticReportVersion) Implements IStaticReportService.GetCurrentPublicStaticReports


        Dim staticReportVersions As New List(Of DataContracts.StaticReportVersion)
        'Try
        Dim reports As StaticReportList = StaticReportList.GetCurrentPublicStaticReportList()
        For Each report As StaticReport In reports
            staticReportVersions.Add(New DataContracts.StaticReportVersion( _
                                     report.Id, _
                                     report.StaticReportId, _
                                     report.Title, _
                                     report.VersionMajor, _
                                     report.EffectiveDateFrom, _
                                     report.EffectiveDateTo, _
                                     report.IsCurrent, _
                                     report.IsUserManual, _
                                     report.IsPublic, _
                                     report.FileSize))

        Next

        Return staticReportVersions

    End Function

    Public Function GetCurrentStaticReports(ByVal request As DataContracts.GetCurrentStaticReportsRequest) As List(Of DataContracts.StaticReportVersion) Implements IStaticReportService.GetCurrentStaticReports

        Dim staticReportVersions As New List(Of DataContracts.StaticReportVersion)

        Dim reports As StaticReportList = StaticReportList.GetCurrentStaticReportList(request.IsUserManual)
        For Each report As StaticReport In reports
            staticReportVersions.Add(New DataContracts.StaticReportVersion( _
                                     report.Id, _
                                     report.StaticReportId, _
                                     report.Title, _
                                     report.VersionMajor, _
                                     report.EffectiveDateFrom, _
                                     report.EffectiveDateTo, _
                                     report.IsCurrent, _
                                     report.IsUserManual, _
                                     report.IsPublic, _
                                     report.FileSize))

        Next

        Return staticReportVersions

    End Function

    Public Function GetStaticReportPublicHistory(ByVal request As DataContracts.GetStaticReportPublicHistoryRequest) As List(Of DataContracts.StaticReportVersion) Implements IStaticReportService.GetStaticReportPublicHistory

        Dim staticReportVersions As New List(Of DataContracts.StaticReportVersion)
        Dim reports As StaticReportList = StaticReportList.GetStaticReportPublicHistoryList(request.StaticReportId)
        For Each report As StaticReport In reports
            staticReportVersions.Add(New DataContracts.StaticReportVersion( _
                                     report.Id, _
                                     report.StaticReportId, _
                                     report.Title, _
                                     report.VersionMajor, _
                                     report.EffectiveDateFrom, _
                                     report.EffectiveDateFrom, _
                                     report.IsCurrent, _
                                     report.IsUserManual, _
                                     report.IsPublic, _
                                     report.FileSize))

        Next

        Return staticReportVersions

    End Function

    Public Function GetStaticReportHistory(ByVal request As DataContracts.GetStaticReportHistoryRequest) As List(Of DataContracts.StaticReportVersion) Implements IStaticReportService.GetStaticReportHistory

        Dim staticReportVersions As New List(Of DataContracts.StaticReportVersion)
        Dim reports As StaticReportList = StaticReportList.GetStaticReportHistoryList(request.StaticReportId)
        For Each report As StaticReport In reports
            staticReportVersions.Add(New DataContracts.StaticReportVersion( _
                                     report.Id, _
                                     report.StaticReportId, _
                                     report.Title, _
                                     report.VersionMajor, _
                                     report.EffectiveDateFrom, _
                                     report.EffectiveDateFrom, _
                                     report.IsCurrent, _
                                     report.IsUserManual, _
                                     report.IsPublic, _
                                     report.FileSize))

        Next

        Return staticReportVersions

    End Function

    Public Function GetStaticReportData(ByVal request As DataContracts.GetStaticReportDataRequest) As DataContracts.StaticReportData Implements IStaticReportService.GetStaticReportData

        Dim data As StaticReportData = StaticReportData.GetStaticReportData(request.StaticReportVersionId)
        Return New DataContracts.StaticReportData(data.PdfData, data.IsPublic, data.Title)

    End Function

    Public Sub DeleteStaticReportVersion(ByVal request As DataContracts.DeleteStaticReportVersionRequest) Implements IStaticReportService.DeleteStaticReportVersion

        Throw New InvalidOperationException("You cannot delete a static report version via the web service.")

        'this is the code we would need to use if we did allow deletion via the web service
        'Dim reportList As StaticReportList = StaticReportList.GetCurrentStaticReportList(False)
        'Dim report As StaticReport = reportList.GetById(request.StaticReportVersionId)
        'If report Is Nothing Then
        '    Throw New InvalidOperationException("The static report version does not exist.")
        'End If
        'reportList.Remove(report)
        'reportList.Save()

    End Sub

    Public Sub SetStaticReportPublicAccess(ByVal request As DataContracts.SetStaticReportPublicAccessRequest) Implements IStaticReportService.SetStaticReportPublicAccess
        Throw New InvalidOperationException("You cannot set the public access of a static report via the web service.")
    End Sub

    Public Sub UploadStaticReport(ByVal request As DataContracts.UploadStaticReportRequest) Implements IStaticReportService.UploadStaticReport
        Throw New InvalidOperationException("You cannot upload a static report via the web service.")
    End Sub

End Class
