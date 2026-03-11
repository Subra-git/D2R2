Imports ProfilesLibrary

Partial Class StaticReports
    Inherits System.Web.UI.Page

    Private Const mHistoryColumnIndex As Integer = 3
    Private mCurrentStaticReportList As StaticReportList

    Protected Sub dsStaticReportList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsStaticReportList.SelectObject
        e.BusinessObject = mCurrentStaticReportList
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim masterPage As ProfilesPublicTemplate = DirectCast(Master, ProfilesPublicTemplate)
            masterPage.AddBreadCrumb("Home.aspx", "Surveillance profiles")
            masterPage.AddBreadCrumb("StaticReports.aspx", "View reports")
            If Request.QueryString("StaticReportId") Is Nothing OrElse Not IsValidGuid(Request.QueryString("StaticReportId")) Then
                mCurrentStaticReportList = StaticReportList.GetCurrentPublicStaticReportList()
            Else
                RefreshGridInHistoryMode()
            End If

            grdReports.DataBind()
        End If

    End Sub

    Protected Sub RefreshGridInHistoryMode()

        Dim staticReportId As Guid = New Guid(Request.QueryString("StaticReportId"))
        mCurrentStaticReportList = StaticReportList.GetStaticReportPublicHistoryList(staticReportId)
        grdReports.Columns(mHistoryColumnIndex).Visible = False
        If mCurrentStaticReportList.Count > 0 Then
            DirectCast(Me.Master, ProfilesPublicTemplate).AddBreadCrumb("StaticReports.aspx?StaticReportId=" & staticReportId.ToString(), "History for " & mCurrentStaticReportList(0).Title)
            Page.Title = "History for " & mCurrentStaticReportList(0).Title
        End If

    End Sub

End Class
