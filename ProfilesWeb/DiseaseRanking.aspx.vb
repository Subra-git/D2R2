Imports ProfilesLibrary
Imports Telerik.WebControls
Imports System.Collections.Generic
Imports System

Partial Class DiseaseRanking
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not GetProfileRankingReportCommand.CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get the disease ranking. ")
        End If
        'btnDiseaseRankingFish.Attributes.Add("onclick", "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');")
        'btnDiseaseRankingTerrestrial.Attributes.Add("onclick", "window.open('ShowDiseaseRankingReport.aspx?Filter=Terrestrial&Time=" & Guid.NewGuid().ToString() & "');")
    End Sub

    Protected Sub ddlDiseaseRankingReport_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDiseaseRankingReport.SelectedIndexChanged
        If (ddlDiseaseRankingReport.SelectedItem.Text = "Disease ranking report: Aquatic diseases") Then
            'ddlDiseaseRankingReport.Attributes.Add("onselect", "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');")
            Dim objAquatic As String = "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objAquatic, True)

        ElseIf (ddlDiseaseRankingReport.SelectedItem.Text = "Disease ranking report: Terrestrial diseases") Then
            'ddlDiseaseRankingReport.Attributes.Add("onselect", "window.open('ShowDiseaseRankingReport.aspx?Filter=Terrestrial&Time=" & Guid.NewGuid().ToString() & "');")
            Dim objTerrestrial As String = "window.open('ShowDiseaseRankingReport.aspx?Filter=Terrestrial&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objTerrestrial, True)

        ElseIf (ddlDiseaseRankingReport.SelectedIndex > 2) Then
            Dim objTerrestrial As String = "window.open('ShowDiseaseRankingReport.aspx?Filter=All&FilterValue=" + ddlDiseaseRankingReport.SelectedItem.Text + "&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objTerrestrial, True)
        Else
            'Console.WriteLine("Please select any record.")
            'Dim obj As String = "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');"
            'Response.Write(obj)
        End If

    End Sub

    Protected Sub ddlDiseaseRankingRFIReport_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDiseaseRankingRFIReport.SelectedIndexChanged
        If (ddlDiseaseRankingRFIReport.SelectedItem.Text = "Disease ranking report: Aquatic diseases") Then
            'ddlDiseaseRankingReport.Attributes.Add("onselect", "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');")
            Dim objAquatic As String = "window.open('ShowDiseaseRankingRFIReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objAquatic, True)

        ElseIf (ddlDiseaseRankingRFIReport.SelectedItem.Text = "Disease ranking report: Terrestrial diseases") Then
            'ddlDiseaseRankingReport.Attributes.Add("onselect", "window.open('ShowDiseaseRankingReport.aspx?Filter=Terrestrial&Time=" & Guid.NewGuid().ToString() & "');")
            Dim objTerrestrial As String = "window.open('ShowDiseaseRankingRFIReport.aspx?Filter=Terrestrial&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objTerrestrial, True)

        ElseIf (ddlDiseaseRankingRFIReport.SelectedIndex > 2) Then
            Dim objTerrestrial As String = "window.open('ShowDiseaseRankingRFIReport.aspx?Filter=All&FilterValue=" + ddlDiseaseRankingRFIReport.SelectedItem.Text + "&Time=" & Guid.NewGuid().ToString() & "');"
            ScriptManager.RegisterStartupScript(Me, Page.GetType(), "newWindow", objTerrestrial, True)
        Else
            'Console.WriteLine("Please select any record.")
            'Dim obj As String = "window.open('ShowDiseaseRankingReport.aspx?Filter=Fish&Time=" & Guid.NewGuid().ToString() & "');"
            'Response.Write(obj)
        End If

    End Sub

    Protected Sub dsDiseaseReferenceTableInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsDiseaseReferenceTableInfoList.SelectObject
        e.BusinessObject = CommonUI.GetDiseaseReferenceTableInfoList()
    End Sub


    Protected Sub btnEditFilters_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditFilters.Click
        Response.Redirect("EditDiseaseRankingFilters.aspx")
    End Sub

    Protected Sub btnEditRFIFilters_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditRFIFilters.Click
        Response.Redirect("EditDiseaseRankingFilters.aspx")
    End Sub
End Class


