Imports System.Runtime.CompilerServices
Imports System.Text.RegularExpressions
Imports Microsoft.Security.Application

Public Module StringExtensions

    <Extension()>
    Public Function StripHtmlTags(ByVal val As String) As String
        Return Regex.Replace(val, "<.*?>", "")
    End Function

    <Extension()>
    Public Function StripPTags(val As String) As String
        val = val.Replace("</p>", "").Replace("<p>", "")
        Return val
    End Function

    <Extension()>
    Public Function SanitizeHtml(ByVal val As String) As String
        Dim result As String = Sanitizer.GetSafeHtmlFragment(val)

        Return result
    End Function

End Module
