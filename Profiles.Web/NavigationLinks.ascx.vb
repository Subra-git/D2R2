Imports System.Configuration.ConfigurationManager
Imports ProfilesLibrary

Partial Class NavigationLinks
    Inherits System.Web.UI.UserControl

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim canGetReport = GetProfileRankingReportCommand.CanGetReport()

		litProfileSearch.Visible = ProfileInfoList.CanGetProfileInfoList()
		litCreateProfile.Visible = ProfilesLibrary.Profile.CanCreateProfile()
		litCompareProfileVersions.Visible = canGetReport

		SetupDiseaseRankingLink(canGetReport)

		litStaticReports.Visible = StaticReportList.CanGetList()
		litMaintainSpeciesData.Visible = SpeciesDataChange.CanAddSpeciesDataChange()
		litUserGuidance.Visible = ProfileQuestion.CanEditObject()
		litViewSpeciesData.Visible = SpeciesSectionList.CanGetSpeciesSectionList()
		litReviewTiming.Visible = DiseaseReviewsFilterInfo.CanGetObject()
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
