Imports Profiles.WebControls
Imports ProfilesLibrary

Partial Class Home
    Inherits System.Web.UI.Page
    Private Sub Home_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim master = CType(Page.Master, ProfilesTemplate)

		master.PageTitle = "D2R2"

        Breadcrumb.RemoveBreadcrumbItem(master, 0)
    End Sub

    Protected Sub Homepage_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        searchPage.Visible = ProfileInfoList.CanGetProfileInfoList()
        staticReportPage.Visible = StaticReportList.CanGetList()
        viewSpeciesDataPage.Visible = SpeciesSectionList.CanGetSpeciesSectionList()
        helpPage.Visible = StaticReportList.CanGetList()
        maintainProfileVersionPage.Visible = SpeciesDataChange.CanAddSpeciesDataChange()
        SetupDiseaseRankingLink(GetProfileRankingReportCommand.CanGetReport())
        diseaseRankingFilterPage.Visible = DiseaseFilterValues.CanGetList()
    End Sub

    Private Sub SetupDiseaseRankingLink(canGetReport As Boolean)
		diseaseRankingLink.Visible = True

		If canGetReport Then
			diseaseRankingLink.Attributes.Remove("href")
			diseaseRankingLink.Attributes.Add("href", "DiseaseRanking.aspx")
		Else
			Dim rankingReportUrl = StaticReportWebHelper.GetDownloadUrl("DiseaseRankingReport", False)

			diseaseRankingLink.Attributes.Add("onclick", $"window.open('{rankingReportUrl}');return false;")
			diseaseRankingLink.Attributes.Add("href", "#")
		End If
	End Sub

End Class
