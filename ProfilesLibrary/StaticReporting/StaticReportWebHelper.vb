Public Class StaticReportWebHelper

	Public Shared ReadOnly Property GetDownloadUrl(title As String, Optional userManual As Boolean = True) As String
		Get
			Dim report As StaticReport = StaticReportList _
										.GetCurrentStaticReportList(userManual) _
										.GetByTitle(title)

			Dim result As String = If(report Is Nothing, "", $"ShowStaticReport.aspx?StaticReportVersionId={report.Id}")

			Return result
		End Get
	End Property
End Class
