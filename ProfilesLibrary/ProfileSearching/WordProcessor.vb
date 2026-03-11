Public Class WordProcessor
    Public Shared Function ProcessWords(ByVal answer As String) As List(Of String)
        Dim stripPunctuationRegex As String = "^[\p{P}\p{S}]+|[\p{P}\p{S}]+$"
        Dim cleanAnswer As String = Text.RegularExpressions.Regex.Replace(answer, "<[^>]+>", "") ' Remove HTML tags
        Dim delimiters As String() = {vbCrLf, vbLf}
        Dim splitAnswer As List(Of String) = cleanAnswer.Split(delimiters, StringSplitOptions.RemoveEmptyEntries) _
                                    .SelectMany(Function(line) line.Split(New Char() {" "c}, StringSplitOptions.RemoveEmptyEntries)) _
                                    .Select(Function(w)
                                                If IsDate(w) OrElse (Uri.TryCreate(w, UriKind.Absolute, Nothing) AndAlso (w.StartsWith("http://") OrElse w.StartsWith("https://"))) Then
                                                    Return System.Text.RegularExpressions.Regex.Replace(w.TrimEnd(), stripPunctuationRegex, "").ToLower()

                                                Else
                                                    Return System.Text.RegularExpressions.Regex.Replace(w.TrimEnd(), stripPunctuationRegex, "").ToLower()
                                                End If
                                            End Function) _
                                    .ToList()
        Return splitAnswer
    End Function

End Class
