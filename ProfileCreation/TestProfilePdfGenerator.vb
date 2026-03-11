Imports System.Configuration.ConfigurationManager
Imports System.IO

Public Class TestProfilePdfGenerator
    Inherits ProfilePdfGenerator

    Private mTestProfilePath As String

    Sub New()
        MyBase.New()
        mTestProfilePath = AppSettings("TestProfilePdfPath")
    End Sub

    ''' <summary>
    ''' Return a sample profile report
    ''' </summary>
    ''' <param name="profileVersionId"></param>
    ''' <returns>Test PDF data</returns>    
    Public Overrides Function GetProfilePdf(ByVal profileVersionId As Guid, ByVal reportName As String) As Byte()

        Dim info As New FileInfo(mTestProfilePath)
        Dim byteCount As Long = info.Length
        Dim profileData As Byte() = Nothing

        'load report data into a byte array for display
        Using stream As FileStream = New FileStream(mTestProfilePath, FileMode.Open, FileAccess.Read)
            Using reader As New BinaryReader(stream)
                profileData = reader.ReadBytes(Convert.ToInt32(byteCount))
            End Using
        End Using

        System.Threading.Thread.Sleep(1000 * 5)

        Return profileData

    End Function

End Class
