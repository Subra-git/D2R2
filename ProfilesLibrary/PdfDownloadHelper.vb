Imports System.Runtime.CompilerServices
Imports System.Text.RegularExpressions

Public Module PdfDownloadHelper
	<Extension()>
	Public Sub DownloadPdfBytes(res As Web.HttpResponse, ByVal bytes As Byte(), fileName As String, Optional contentDispositionType As String = "attachment")
		If bytes Is Nothing Then
			Throw New ArgumentNullException("bytes must be supplied")
		End If

		If String.IsNullOrEmpty(fileName) Then
			Throw New ArgumentNullException("fileName must be supplied")
		End If

		Dim fileNamePdf As String = ToValidFileName($"{fileName}_{Now}.pdf")

		With res
			.Clear()
			.Charset = String.Empty
			.ContentType = "application/pdf"
			.AddHeader("Content-Disposition", $"{contentDispositionType}; filename={fileNamePdf}")
			.ContentEncoding = System.Text.Encoding.Default
		End With

		res.BinaryWrite(bytes)
	End Sub

	Private Function ToValidFileName(name As String) As String
		Dim invalidChars As String = Regex.Escape(New String(System.IO.Path.GetInvalidFileNameChars()))
		Dim invalidReg As String = $"[{invalidChars}]+"

		Dim result As String = Regex _
								.Replace(name.StripHtmlTags, invalidReg, "_") _
								.Replace(";", "") _
								.Replace("'", "") _
								.Replace(",", "") _
								.Replace(" ", "_")

		Return result
	End Function
End Module
