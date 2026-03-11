Imports ProfilesLibrary

Partial Class Home
    Inherits System.Web.UI.Page

    Private Enum PageMode
        Normal
        History
        Scenario
    End Enum

    Private mCurrentProfileList As ProfileVersionInfoList


    Private ReadOnly Property CurrentPageMode() As PageMode
        Get
            If IsValidGuid(Request.QueryString("HistoryId")) Then
                Return PageMode.History
            ElseIf IsValidGuid(Request.QueryString("ScenarioId")) Then
                Return PageMode.Scenario
            Else
                Return PageMode.Normal
            End If
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim masterPage As ProfilesPublicTemplate = DirectCast(Master, ProfilesPublicTemplate)

        masterPage.AddBreadCrumb("Home.aspx", "Surveillance profiles")

        If Not IsPostBack Then
            If Not Request.QueryString("HistoryId") Is Nothing AndAlso IsValidGuid(Request.QueryString("HistoryId")) Then
                pnlCurrentPageText.Visible = False
                pnlHistoryPageText.Visible = True
                Dim historyId As String = Request.QueryString("HistoryId")
                mCurrentProfileList = ProfileVersionInfoList.GetPublicHistory(New Guid(historyId))
                If mCurrentProfileList(0).IsWhatIfScenario Then
                    masterPage.AddBreadCrumb("Home.aspx?ScenarioId=" & mCurrentProfileList(0).ParentProfileId.ToString(), "Scenarios for " & mCurrentProfileList(0).Title)
                    masterPage.AddBreadCrumb("Home.aspx?HistoryId=" & historyId, "History for " & mCurrentProfileList(0).ScenarioTitle)
                    grdProfiles.Columns(0).HeaderText = "Scenario title"
                    DirectCast(grdProfiles.Columns(0), BoundField).DataField = "ScenarioTitle"
                    Page.Title = "History for " & mCurrentProfileList(0).ScenarioTitle
                Else
                    masterPage.AddBreadCrumb("Home.aspx?HistoryId=" & historyId, "History for " & mCurrentProfileList(0).Title)
                    Page.Title = "History for " & mCurrentProfileList(0).Title
                End If
            ElseIf Not Request.QueryString("ScenarioId") Is Nothing AndAlso IsValidGuid(Request.QueryString("ScenarioId")) Then
                Dim scenarioId As String = Request.QueryString("ScenarioId")
                mCurrentProfileList = ProfileVersionInfoList.GetCurrentPublicWhatIfScenario(New Guid(scenarioId))
                grdProfiles.Columns(0).HeaderText = "Scenario title"
                DirectCast(grdProfiles.Columns(0), BoundField).DataField = "ScenarioTitle"
                masterPage.AddBreadCrumb("Home.aspx?ScenarioId=" & scenarioId, "Scenarios for " & mCurrentProfileList(0).Title)
                Page.Title = "Scenarios for " & mCurrentProfileList(0).Title
            Else
                mCurrentProfileList = ProfileVersionInfoList.GetCurrentPublicCurrentSituation()
            End If
        End If

        grdProfiles.DataBind()
    End Sub

    Protected Sub dsProfileVersionList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileVersionList.SelectObject
        e.BusinessObject = mCurrentProfileList
    End Sub

    Protected Sub grdProfiles_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdProfiles.DataBound
        If CurrentPageMode = PageMode.History Then
            grdProfiles.Columns(4).Visible = False
            grdProfiles.Columns(5).Visible = False
        ElseIf CurrentPageMode = PageMode.Scenario Then
            grdProfiles.Columns(5).Visible = False
        End If
    End Sub

    Protected Sub grdProfiles_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdProfiles.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(5).Controls(1).Visible = DirectCast(e.Row.DataItem, ProfileVersionInfo).HasRelevantPublicScenarios
        End If
    End Sub
End Class
