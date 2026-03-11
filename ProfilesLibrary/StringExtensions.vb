Imports System.Runtime.CompilerServices
Imports System.Text.RegularExpressions
Imports System.Xml
Imports Microsoft.Security.Application

Public Module StringExtensions

    <Extension()>
    Public Function StripHtmlTags(ByVal val As String) As String
        val = val.Replace("<!--StartFragment-->", "")
        val = val.Replace("<!-- x-tinymce/html -->", "")
        val = val.Replace("<!--EndFragment-->", "")
        Return Regex.Replace(val, "<.*?>", "")
    End Function

    <Extension()>
    Public Function SanitizeHtml(ByVal val As String) As String
        Dim result As String = Sanitizer.GetSafeHtmlFragment(val)

        Return result
    End Function

    Function StripTagsExceptItalics(input As String) As String
        Dim pattern As String = "<(?!\/?(i|em)\s*>)\/?[^>]+>"

        Dim strippedString As String = Regex.Replace(input, pattern, String.Empty)

        Return strippedString
    End Function

    <Extension()>
    Public Function StripParagraphTags(val As String) As String
        val = val.Replace("</p>", "<br/>")
        Return val.Replace("<p>", "")
    End Function

	 <Extension()>
    Public Function StripPTags(val As String) As String
        val = val.Replace("</p>", "").Replace("<p>", "")
        Return val
    End Function

    <Extension()>
    Public Function StripBreakTags(val As String) As String
        Return Regex.Replace(val, "<br\s*\/?>", "")
    End Function

    <Extension()>
    Public Function HasHtmlOpeningTags(val As String) As Boolean
        Return Regex.IsMatch(val, "<([a-z]+)(?![^>]*\/>)[^>]*>")
    End Function

    <Extension()>
    Public Function HasHtmlTags(val As String) As Boolean
        Return Regex.IsMatch(val, "<.*?>")
    End Function

    <Extension()>
    Public Function HasHtmlClosingTags(val As String) As Boolean
        Return Regex.IsMatch(val, "<\/[a-z]*\s*>")
    End Function
End Module
