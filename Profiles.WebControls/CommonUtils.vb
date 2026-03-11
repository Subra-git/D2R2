Imports Microsoft.VisualBasic

Namespace Profiles.WebControls

    Public Class CommonUtils

        Public Shared Function FormatFileSize(ByVal bytes As Integer) As String

            Dim kiloBytes As Double = 1024
            Dim megaBytes As Double = kiloBytes * 1024

            If bytes > megaBytes Then
                Return (bytes / megaBytes).ToString("0.0 MB")
            End If

            If bytes > kiloBytes Then
                Return (bytes / kiloBytes).ToString("0 KB")
            End If

            Return bytes.ToString("0 bytes")

        End Function

    End Class

End Namespace