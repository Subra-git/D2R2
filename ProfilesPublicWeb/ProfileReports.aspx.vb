Imports ProfilesLibrary

Partial Class ProfileReports
    Inherits System.Web.UI.Page

    Private mReportInfoList As ProfileVersionReportInfoList

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Request.QueryString("ProfileVersionId") Is Nothing AndAlso IsValidGuid(Request.QueryString("ProfileVersionId")) Then
                mReportInfoList = ProfileVersionReportInfoList.GetList(New Guid(Request.QueryString("ProfileVersionId")))
                Dim masterPage As ProfilesPublicTemplate = DirectCast(Master, ProfilesPublicTemplate)
                Dim pv As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(New Guid(Request.QueryString("ProfileVersionId")))
                masterPage.AddBreadCrumb("Home.aspx", "Surveillance profiles")
                masterPage.AddBreadCrumb("ProfileReports.aspx", "Profile reports for " & pv.Title)
                Page.Title = "Profile reports for " & pv.Title & "  v" & pv.Version
            Else
                Response.Redirect("Home.aspx")
            End If
        End If

        rptReportsList.DataBind()
    End Sub

    Protected Sub dsProfileVersionReportList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileVersionReportList.SelectObject
        e.BusinessObject = mReportInfoList
    End Sub

End Class
