Imports System.Text
Imports TallComponents.PDF.Layout.Paragraphs
Imports ProfilesLibrary

Public Class FormattedHtmlFragment
    Dim mFragment As String = ""

    Public Sub New(FragmentText As String, Optional ColorName As String = "", Optional UseItalics As Boolean = False, Optional UseBold As Boolean = False)
        Dim htmlFragment As New Fragment()
        Dim sb As New StringBuilder()

        sb.Append("<span style='font-family:Arial,Helvetica; font-size: " & htmlFragment.FontSize - 2 & ";")
        If ColorName <> "" Then
            sb.Append(" color: " & ColorName & ";")
        End If
        sb.Append("'>")

        If UseItalics Then
            sb.Append("<em>")
        End If
        If UseBold Then
            sb.Append("<strong>")
        End If
        sb.Append(FragmentText.SanitizeHtml)
        If UseBold Then
            sb.Append("</strong>")
        End If
        If UseItalics Then
            sb.Append("</em>")
        End If

        sb.Append("</span>")
        mFragment = sb.ToString

    End Sub

    Public ReadOnly Property Text As String
        Get
            Return mFragment
        End Get
    End Property

End Class
