Imports System.Configuration.ConfigurationManager

Public MustInherit Class ProfilePdfGenerator

    Public MustOverride Function GetProfilePdf(ByVal profileVersionId As Guid, ByVal reportName As String) As Byte()

    ''' <summary>
    ''' Returns a PDF report. If the test flag is set then a sample report is returned otherwise a Business Objects 
    ''' report is returned
    ''' </summary>
    ''' <param name="profileVersionId"></param>
    ''' <returns>Profile report PDF data</returns>    
    Public Shared Function CreateProfilePdf(ByVal profileVersionId As Guid, ByVal reportName As String) As Byte()

        Dim pdfCreator As ProfilePdfGenerator

        If AppSettings("UseBusinessObjectsForPublishing") = "1" Then
            pdfCreator = New BusinessObjectsProfilePdfGenerator()
        Else
            pdfCreator = New TestProfilePdfGenerator()
        End If

        Return pdfCreator.GetProfilePdf(profileVersionId, reportName)

    End Function


End Class
